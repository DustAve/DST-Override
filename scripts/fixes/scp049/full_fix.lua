--------------------------------------------------------------------------
-- DustAve Override - SCP-049 full compatibility / bug fix
-- Target mod: workshop-1847716441 (SCP-049 v3.0.2)
--
-- Fixes in this file:
--   * SCP-049-2 / SCP-035 host invalid DoTaskInTime callbacks
--   * Cure Meter zero-state cleanup on death / ghost / respawn
--   * safer Cure Meter save/load/set/delta handling
--   * Cure Meter effects no longer leak through respawn
--   * expensive 0.5s full Ents scan replaced with a small target registry
--   * pet-limit cleanup and SCP-035-host despawn mask handling
--   * fire/ice staff typo compatibility (prefabs -> prefab)
--   * old bundled skins_api is neutralized when [API] Modded Skins is present
--   * Modded Skins prefab IDs are repaired (ms_ prefix)
--   * Cure Meter widget reads netvars directly and survives missed dirty events
--
-- This is intentionally a post-init patch. The original Workshop mod remains
-- untouched, so Steam updates cannot overwrite this file.
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local KnownModIndex = GLOBAL.KnownModIndex
local SpawnPrefab = GLOBAL.SpawnPrefab
local AllPlayers = GLOBAL.AllPlayers

-- DST's mod environment does not expose every Lua standard global directly.
-- Always bind the standard helpers we use from GLOBAL to avoid sandbox/strict
-- errors such as "attempt to call global 'tonumber' (a nil value)".
local tonumber = GLOBAL.tonumber
local tostring = GLOBAL.tostring
local type = GLOBAL.type
local pairs = GLOBAL.pairs
local ipairs = GLOBAL.ipairs
local unpack = GLOBAL.unpack
local math = GLOBAL.math
local table = GLOBAL.table
local print = GLOBAL.print
local error = GLOBAL.error
local debuglib = GLOBAL.debug
local pcall = GLOBAL.pcall

local DEBUG_ENABLED = false

if pcall == nil then
    print("[DustAve Override][SCP049] GLOBAL.pcall is unavailable; SCP-049 patch skipped.")
    return
end

local function DEBUG(...)
    if DEBUG_ENABLED then
        print("[DustAve Override][SCP049]", ...)
    end
end

--------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------

local function IsValid(inst)
    return inst ~= nil and inst.IsValid ~= nil and inst:IsValid()
end

local function IsMasterSim()
    return GLOBAL.TheWorld ~= nil and GLOBAL.TheWorld.ismastersim
end

local function Clamp(value, minvalue, maxvalue)
    value = tonumber(value) or minvalue
    if value < minvalue then
        return minvalue
    elseif value > maxvalue then
        return maxvalue
    end
    return value
end

local function GetLoadedModDirByName(name)
    if KnownModIndex == nil or KnownModIndex.GetModsToLoad == nil then
        return nil
    end

    for _, moddir in ipairs(KnownModIndex:GetModsToLoad()) do
        local info = KnownModIndex:GetModInfo(moddir)
        if info ~= nil and info.name == name then
            return moddir
        end
    end

    return nil
end

local SCP049_MODDIR = GetLoadedModDirByName("SCP-049")
if SCP049_MODDIR == nil then
    DEBUG("SCP-049 is not loaded; patch skipped")
    return
end

local MODDED_SKINS_MODDIR = GetLoadedModDirByName("[API] Modded Skins")

local function GetFunctionSource(fn)
    if type(fn) ~= "function" or debuglib == nil or debuglib.getinfo == nil then
        return ""
    end

    local ok, info = pcall(debuglib.getinfo, fn, "S")
    if ok and info ~= nil and type(info.source) == "string" then
        return info.source
    end

    return ""
end

local function GetUpvalueByName(fn, wanted)
    if type(fn) ~= "function" or debuglib == nil or debuglib.getupvalue == nil then
        return nil
    end

    for i = 1, 64 do
        local name, value = debuglib.getupvalue(fn, i)
        if name == nil then
            break
        end
        if name == wanted then
            return value
        end
    end

    return nil
end

local function CancelTask(task)
    if task ~= nil and task.Cancel ~= nil then
        task:Cancel()
    end
end

--------------------------------------------------------------------------
-- Capture the exact broken periodic tasks created inside SCP-049 prefabs.
--
-- These tasks are anonymous locals, so a normal PrefabPostInit cannot see
-- their handles. We capture only callbacks whose debug source is one of the
-- SCP-049 prefab files. This avoids touching vanilla/other-mod periodic tasks.
--------------------------------------------------------------------------

local EntityScript = GLOBAL.EntityScript
if EntityScript ~= nil
    and EntityScript.DoPeriodicTask ~= nil
    and not EntityScript._dustave_scp049_periodic_capture then

    EntityScript._dustave_scp049_periodic_capture = true

    local _DoPeriodicTask = EntityScript.DoPeriodicTask

    EntityScript.DoPeriodicTask = function(inst, period, fn, initialdelay, ...)
        local task = _DoPeriodicTask(inst, period, fn, initialdelay, ...)

        if inst ~= nil
            and not inst._dustave_scp049_installing_task
            and type(fn) == "function" then

            local source = GetFunctionSource(fn)

            if inst.prefab == "plaguedoctor"
                and period == 0.5
                and source:find("prefabs/plaguedoctor.lua", 1, true) ~= nil then

                -- The original 0.5s task scans the entire Ents table.
                inst._dustave_scp049_original_mainttask = task

            elseif inst.prefab == "scpzombie"
                and period == 0.5
                and source:find("prefabs/scpzombie.lua", 1, true) ~= nil then

                -- Contains DoTaskInTime(delay, health:Kill()) / Remove().
                inst._dustave_scp049_original_lifetask = task

            elseif inst.prefab == "scp035host"
                and period == 0.5
                and initialdelay == nil
                and source:find("prefabs/scp035host.lua", 1, true) ~= nil then

                -- The second 0.5s task is the broken leader-loss cleanup.
                -- The mask speech/heal timer has initialdelay = 0.5 and is kept.
                inst._dustave_scp049_original_leadertask = task
            end
        end

        return task
    end
end

local function SchedulePeriodic(inst, period, fn, initialdelay)
    inst._dustave_scp049_installing_task = true
    local task = inst:DoPeriodicTask(period, fn, initialdelay)
    inst._dustave_scp049_installing_task = nil
    return task
end

--------------------------------------------------------------------------
-- Fallback guard for the original malformed calls:
--
--   DoTaskInTime(math.random(), inst.components.health:Kill())
--   DoTaskInTime(math.random(), inst:Remove())
--
-- Lua evaluates Kill()/Remove() before DoTaskInTime receives its callback,
-- so the original passes nil as the callback. If task capture ever fails due
-- to another mod wrapping DoPeriodicTask, this guard at least prevents the
-- nil-callback crash.
--------------------------------------------------------------------------

local function InstallSafeDoTaskInTime(inst)
    if inst == nil or inst._dustave_scp049_safe_dotask then
        return
    end

    inst._dustave_scp049_safe_dotask = true
    local _DoTaskInTime = inst.DoTaskInTime

    if type(_DoTaskInTime) ~= "function" then
        return
    end

    inst.DoTaskInTime = function(entity, delay, fn, ...)
        if type(fn) ~= "function" then
            DEBUG("Blocked invalid DoTaskInTime callback on", entity.prefab)
            return nil
        end
        return _DoTaskInTime(entity, delay, fn, ...)
    end
end

--------------------------------------------------------------------------
-- Cure Meter zero-state helpers
--------------------------------------------------------------------------

local ZERO_DAPPERNESS = -20 / 60
local SCP035_DAPPER_BONUS = 3.33 / 54

local function HasScp035Mask(inst)
    if inst == nil
        or inst.components == nil
        or inst.components.inventory == nil
        or inst.components.inventory.Has == nil then
        return false
    end

    return inst.components.inventory:Has("scp035item", 1) == true
end

local function SyncZeroMeterScp035MaskBonus(component)
    if component == nil
        or not component._dustave_zero_effect_active
        or component.inst == nil then
        return
    end

    local hasmask = HasScp035Mask(component.inst)
    local hadmask = component._dustave_zero_scp035_mask

    if hadmask == nil then
        component._dustave_zero_scp035_mask = hasmask
        return
    end

    if hasmask ~= hadmask then
        local saved = tonumber(component._dustave_pre_zero_dapperness) or 0

        if hasmask then
            saved = saved + SCP035_DAPPER_BONUS
        else
            saved = saved - SCP035_DAPPER_BONUS
        end

        component._dustave_pre_zero_dapperness = saved
        component._dustave_zero_scp035_mask = hasmask
    end
end

local function IsLivingHuman(inst)
    return IsValid(inst)
        and not inst:HasTag("playerghost")
        and inst.components ~= nil
        and inst.components.health ~= nil
        and not inst.components.health:IsDead()
end

local function ApplyZeroMeterEffects(component)
    local inst = component ~= nil and component.inst or nil
    if not IsLivingHuman(inst) then
        return
    end

    local newly_active = not component._dustave_zero_effect_active

    if newly_active then
        component._dustave_zero_effect_active = true

        if inst.components.sanity ~= nil then
            component._dustave_pre_zero_dapperness = inst.components.sanity.dapperness
        end

        if inst.components.grogginess ~= nil then
            component._dustave_pre_zero_grog = inst.components.grogginess.grog_amount or 0
        end

        -- SCP-035 gives SCP-049 a small dapperness bonus while the mask is
        -- carried. Remember whether that bonus was present when Cure Meter
        -- reached zero, then track inventory changes while the zero-state is
        -- active so the correct value is restored later.
        component._dustave_zero_scp035_mask = HasScp035Mask(inst)
    end

    SyncZeroMeterScp035MaskBonus(component)

    if inst.components.sanity ~= nil then
        inst.components.sanity.dapperness = ZERO_DAPPERNESS
    end

    if inst.components.grogginess ~= nil then
        if newly_active and inst.components.grogginess.AddGrogginess ~= nil then
            inst.components.grogginess:AddGrogginess(0.5, 0)
        else
            local oldgrog = inst.components.grogginess.grog_amount or 0
            inst.components.grogginess.grog_amount = math.max(oldgrog, 0.5)
        end
    end

    if inst.components.locomotor ~= nil
        and inst.components.locomotor.SetExternalSpeedMultiplier ~= nil then

        -- Preserve the original mod's counter-grogginess multiplier.
        local minmod = TUNING.MIN_GROGGY_SPEED_MOD or 1
        local counterspeedmod = minmod ~= 0 and (1 / minmod) or 1
        inst.components.locomotor:SetExternalSpeedMultiplier(
            inst,
            "countergrogginess",
            counterspeedmod
        )
    end
end

local function ClearZeroMeterEffects(component)
    local inst = component ~= nil and component.inst or nil
    if inst == nil then
        return
    end

    if component._dustave_zero_effect_active then
        -- Catch a mask pickup/use/drop that happened immediately before the
        -- meter recovered or the player changed state.
        SyncZeroMeterScp035MaskBonus(component)

        if inst.components ~= nil and inst.components.sanity ~= nil then
            local restore = component._dustave_pre_zero_dapperness
            if restore == nil then
                restore = 0
            end
            inst.components.sanity.dapperness = restore
        end

        if inst.components ~= nil and inst.components.grogginess ~= nil then
            local restore = component._dustave_pre_zero_grog
            if restore == nil then
                restore = 0
            end
            inst.components.grogginess.grog_amount = restore
        end
    end

    if inst.components ~= nil
        and inst.components.locomotor ~= nil
        and inst.components.locomotor.RemoveExternalSpeedMultiplier ~= nil then
        inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "countergrogginess")
    end

    component._dustave_zero_effect_active = false
    component._dustave_pre_zero_dapperness = nil
    component._dustave_pre_zero_grog = nil
    component._dustave_zero_scp035_mask = nil
end

local function UpdateThresholdSpeech(component)
    local inst = component.inst
    local percent = component.max > 0 and component.current / component.max or 0

    if not IsLivingHuman(inst) then
        return
    end

    local talker = inst.components ~= nil and inst.components.talker or nil

    if percent <= 0.10 and component.pestilencecheck < 3 then
        if talker ~= nil then
            talker:Say("I must advance my cure immediately.", 3)
        end
        component.pestilencecheck = 3

    elseif percent <= 0.33 and component.pestilencecheck < 2 then
        if talker ~= nil then
            talker:Say("I need a patient with human-like anatomy.", 3)
        end
        component.pestilencecheck = 2

    elseif percent <= 0.50 and component.pestilencecheck < 1 then
        if talker ~= nil then
            talker:Say("The Pestilence grows stronger.", 3)
        end
        component.pestilencecheck = 1
    end

    if percent > 0.50 then
        component.pestilencecheck = 0
    elseif percent > 0.33 then
        component.pestilencecheck = 1
    elseif percent > 0.10 then
        component.pestilencecheck = 2
    end
end

local function SetCounterValue(component, value, overtime, speak)
    local max = tonumber(component.max) or 100
    if max <= 0 then
        max = 100
        component.max = max
    end

    local old = tonumber(component.current) or max
    component.current = Clamp(value, 0, max)

    if speak then
        UpdateThresholdSpeech(component)
    end

    if component.current <= 0 then
        ApplyZeroMeterEffects(component)
    else
        ClearZeroMeterEffects(component)
    end

    if component.inst ~= nil then
        component.inst:PushEvent("pestilencedetla", {
            oldpercent = old / max,
            newpercent = component.current / max,
            overtime = overtime,
        })
    end
end

AddComponentPostInit("pestilencecounter", function(self)
    if self == nil or self.inst == nil or self._dustave_scp049_fixed then
        return
    end

    self._dustave_scp049_fixed = true

    self.DoDelta = function(component, delta, overtime)
        delta = tonumber(delta) or 0
        local current = tonumber(component.current) or 0
        SetCounterValue(component, current + delta, overtime, true)
    end

    self.SetPercent = function(component, percent)
        percent = Clamp(percent, 0, 1)
        SetCounterValue(component, percent * (component.max or 100), nil, true)
    end

    self.OnRespawn = function(component)
        ClearZeroMeterEffects(component)
        component.pestilencecheck = 0
        SetCounterValue(component, component.max or 100, nil, false)
    end

    self.OnLoad = function(component, data)
        if data ~= nil and data.pestilence ~= nil then
            SetCounterValue(component, data.pestilence, nil, false)
        else
            SetCounterValue(component, component.current or component.max or 100, nil, false)
        end
    end

    -- The original component listens for an old generic "respawn" event.
    -- Modern player flow uses these player events, so cover them explicitly.
    self._dustave_onbecameghost = function()
        ClearZeroMeterEffects(self)
    end

    self._dustave_onrespawn = function()
        self:OnRespawn()
    end

    self.inst:ListenForEvent("ms_becameghost", self._dustave_onbecameghost)
    self.inst:ListenForEvent("ms_respawnedfromghost", self._dustave_onrespawn)

    -- Convenience methods missing from the original component.
    self.GetMax = self.GetMax or function(component)
        return component.max
    end

    self.Max = self.Max or self.GetMax

    DEBUG("Patched pestilencecounter")
end)

--------------------------------------------------------------------------
-- Surgery / corpse interaction
--
-- The original hard-resets dapperness to 0 after restoring Cure Meter,
-- which can destroy another character/mod's dapperness contribution.
--------------------------------------------------------------------------

AddComponentPostInit("scpinteractioncomponent", function(self)
    if self == nil or self.inst == nil or self._dustave_scp049_fixed then
        return
    end

    self._dustave_scp049_fixed = true

    self.DoSpawn = function(component, doer)
        if not IsValid(component.inst) or not IsValid(doer) then
            return
        end

        local x, y, z = component.inst.Transform:GetWorldPosition()

        local fx1 = SpawnPrefab("statue_transition")
        if fx1 ~= nil then
            fx1.Transform:SetPosition(x, y, z)
        end

        local fx2 = SpawnPrefab("statue_transition_2")
        if fx2 ~= nil then
            fx2.Transform:SetPosition(x, y, z)
        end

        if doer.components ~= nil and doer.components.scpcomponent ~= nil then
            doer.components.scpcomponent:SpawnPetAt(x, y, z, "scpzombie")
        end

        if doer.components ~= nil and doer.components.pestilencecounter ~= nil then
            doer.components.pestilencecounter:DoDelta(20)
        end

        component.inst:Remove()
    end

    DEBUG("Patched scpinteractioncomponent")
end)

--------------------------------------------------------------------------
-- SCP-049 <-> SCP-035 possession compatibility
--
-- SCP-035's PossessPig() is called only by SCP-049's USESCP035 action.
-- The original assumes every component exists and contains another malformed
-- DoTaskInTime(delay, talker:Say(...)) call. Replace it with a safe version.
--------------------------------------------------------------------------

AddComponentPostInit("scp035itemcomponent", function(self)
    if self == nil or self.inst == nil or self._dustave_scp049_possesspig_fixed then
        return
    end

    self._dustave_scp049_possesspig_fixed = true
    local old_PossessPig = self.PossessPig

    self.PossessPig = function(component, user, target)
        if not IsValid(user)
            or not IsValid(target)
            or not user:HasTag("scp049") then

            if old_PossessPig ~= nil then
                return old_PossessPig(component, user, target)
            end
            return false
        end

        if user.components == nil or user.components.scpcomponent == nil then
            return false
        end

        local x, y, z = target.Transform:GetWorldPosition()
        local host = user.components.scpcomponent:SpawnPetAt(x, y, z, "scp035host")

        -- Do not consume the pig/corpse or the mask if the host failed to spawn.
        if not IsValid(host) then
            return false
        end

        local fx = SpawnPrefab("custom_lavaarena_fx")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
        end

        if host.components ~= nil and host.components.follower ~= nil then
            if host.components.follower.SetLeader ~= nil then
                host.components.follower:SetLeader(user)
            end
            if host.components.follower.KeepLeaderOnAttacked ~= nil then
                host.components.follower:KeepLeaderOnAttacked()
            end
        end

        if host.components ~= nil and host.components.talker ~= nil then
            host:DoTaskInTime(GLOBAL.FRAMES or 0, function(h)
                if IsValid(h)
                    and h.components ~= nil
                    and h.components.talker ~= nil then
                    h.components.talker:Say("It's showtime!", 2.5, true)
                end
            end)
        end

        host.talkcd = 60 + math.random(-10, 10)

        if IsValid(target) then
            target:Remove()
        end

        if IsValid(component.inst) then
            component.inst:Remove()
        end

        DEBUG("SCP-049 successfully created SCP-035 host")
        return true
    end

    DEBUG("Patched SCP-035 PossessPig interaction")
end)

local function ReturnScp035Mask(host)
    if not IsValid(host) or host._dustave_scp035_mask_returned then
        return nil
    end

    host._dustave_scp035_mask_returned = true

    local x, y, z = host.Transform:GetWorldPosition()
    local mask = SpawnPrefab("scp035item")
    if mask ~= nil then
        mask.Transform:SetPosition(x, y, z)
    end

    return mask
end

--------------------------------------------------------------------------
-- SCP pet component
--------------------------------------------------------------------------

AddComponentPostInit("scpcomponent", function(self)
    if self == nil or self.inst == nil or self._dustave_scp049_fixed then
        return
    end

    self._dustave_scp049_fixed = true

    -- The original can repeatedly kill the same already-selected oldest pet
    -- while iterating. Keep a strict maximum of seven living SCP-049-2 pets.
    self.KillExtraPets = function(component)
        local zombies = {}

        for pet in pairs(component.pets) do
            if IsValid(pet)
                and pet.prefab == "scpzombie"
                and (pet.lifetime or 0) > 0
                and pet.components ~= nil
                and pet.components.health ~= nil
                and not pet.components.health:IsDead() then
                zombies[#zombies + 1] = pet
            end
        end

        table.sort(zombies, function(a, b)
            return (a.lifetime or 0) < (b.lifetime or 0)
        end)

        local excess = #zombies - 7
        for i = 1, excess do
            local pet = zombies[i]
            if IsValid(pet)
                and pet.components ~= nil
                and pet.components.health ~= nil
                and not pet.components.health:IsDead() then
                pet.components.health:Kill()
            end
        end
    end

    -- The original loops over every pet and can spawn a mask for unrelated
    -- SCP-035 hosts when despawning only one pet.
    self.DespawnPet = function(component, pet)
        if pet == nil or component.pets[pet] == nil then
            return
        end

        if IsValid(pet) and pet.prefab == "scp035host" then
            ReturnScp035Mask(pet)
        end

        if component.ondespawnfn ~= nil then
            component.ondespawnfn(component.inst, pet)
        elseif IsValid(pet) then
            pet:Remove()
        end
    end

    self.DespawnAllPets = function(component)
        local pets = {}
        for pet in pairs(component.pets) do
            pets[#pets + 1] = pet
        end

        for _, pet in ipairs(pets) do
            component:DespawnPet(pet)
        end
    end

    -- Prune stale references before code such as the player's death handler
    -- iterates the pet table.
    self.GetPets = function(component)
        local count = 0
        for pet in pairs(component.pets) do
            if not IsValid(pet) then
                component.pets[pet] = nil
            else
                count = count + 1
            end
        end
        component.numpets = count
        return component.pets
    end

    DEBUG("Patched scpcomponent")
end)

--------------------------------------------------------------------------
-- Efficient SCP-035 map-target registry
--------------------------------------------------------------------------

-- A plain table is intentional here.
-- DST's mod sandbox used by this setup does not expose setmetatable directly,
-- and entries are already removed explicitly by the onremove listener below.
local SCP035_TARGETS = {}

local function RegisterScp035MapTarget(inst)
    SCP035_TARGETS[inst] = true

    inst:ListenForEvent("onremove", function(target)
        SCP035_TARGETS[target] = nil
    end)
end

AddPrefabPostInit("scp035crypt", RegisterScp035MapTarget)
AddPrefabPostInit("scp035item", RegisterScp035MapTarget)

local function RevealEntityTo049(inst, target)
    if not IsValid(inst) or not IsValid(target) or inst.player_classified == nil then
        return
    end

    local explorer = inst.player_classified.MapExplorer
    if explorer == nil or explorer.RevealArea == nil then
        return
    end

    -- If the mask is in an inventory, reveal its holder instead of (0,0,0).
    if target.components ~= nil and target.components.inventoryitem ~= nil then
        local owner = target.components.inventoryitem:GetGrandOwner()
        if IsValid(owner) then
            target = owner
        end
    end

    explorer:RevealArea(target.Transform:GetWorldPosition())
end

local function RevealScp035Targets(inst)
    if not IsLivingHuman(inst) then
        return
    end

    for target in pairs(SCP035_TARGETS) do
        if IsValid(target) then
            RevealEntityTo049(inst, target)
        else
            SCP035_TARGETS[target] = nil
        end
    end

    -- Possessed players gain the scp035 tag dynamically, so they cannot be
    -- fully handled by PrefabPostInit. AllPlayers is tiny compared with Ents.
    for _, player in ipairs(AllPlayers or {}) do
        if IsValid(player) and player:HasTag("scp035") then
            RevealEntityTo049(inst, player)
        end
    end
end

--------------------------------------------------------------------------
-- SCP-049 player maintenance
--------------------------------------------------------------------------

local NO_CURE_METER = {
    "The world around me, fallen ill.",
    "Everyone is sick. Sick!",
    "I am doing this world a disservice, I can still save them.",
    "The pestilence has taken over. Everyone will fall if I don't advance my cure.",
    "J’ai échoué dans ce monde.",
    "La maladie... C’est autour de nous...",
    "Ashes, ashes, we all fall down...",
}

local function CureMeterMaintenance(inst)
    if not IsValid(inst) or inst.components == nil then
        return
    end

    local counter = inst.components.pestilencecounter

    if counter ~= nil then
        if IsLivingHuman(inst) and counter:GetPercent() <= 0 then
            ApplyZeroMeterEffects(counter)

            inst.nocuretalkcd = tonumber(inst.nocuretalkcd) or 0
            if inst.nocuretalkcd <= 0 and inst.components.talker ~= nil then
                inst.components.talker:Say(
                    NO_CURE_METER[math.random(#NO_CURE_METER)],
                    3,
                    false
                )
                inst.nocuretalkcd = 80 + math.random(-20, 20)
            end
        else
            -- Also clears stale zero-meter state if another mod/script changes
            -- the counter directly instead of going through DoDelta().
            ClearZeroMeterEffects(counter)
        end
    end

    inst.nocuretalkcd = math.max(0, (tonumber(inst.nocuretalkcd) or 0) - 1)

    if inst.components.scpcomponent ~= nil then
        inst.components.scpcomponent:KillExtraPets()
    end
end

local function InstallStaffAttackCompatibility(inst)
    if inst._dustave_scp049_staffcompat or type(inst.PushEvent) ~= "function" then
        return
    end

    inst._dustave_scp049_staffcompat = true
    local _PushEvent = inst.PushEvent

    inst.PushEvent = function(entity, event, data, ...)
        if event == "onattackother"
            and data ~= nil
            and IsValid(data.weapon)
            and (data.weapon.prefab == "firestaff" or data.weapon.prefab == "icestaff") then

            -- The original checks w.prefabs (plural), so these staves fall
            -- through to lethal touch. Temporarily expose the rangedweapon
            -- tag only while SCP-049's onattackother listeners execute.
            local weapon = data.weapon
            local already_ranged = weapon:HasTag("rangedweapon")

            if not already_ranged then
                weapon:AddTag("rangedweapon")
            end

            local results = { pcall(_PushEvent, entity, event, data, ...) }

            if not already_ranged and IsValid(weapon) then
                weapon:RemoveTag("rangedweapon")
            end

            if not results[1] then
                error(results[2], 0)
            end

            return unpack(results, 2)
        end

        return _PushEvent(entity, event, data, ...)
    end
end

AddPrefabPostInit("plaguedoctor", function(inst)
    InstallStaffAttackCompatibility(inst)

    if not IsMasterSim() then
        return
    end

    -- Cancel the original 0.5s full-Ents scan/maintenance task if captured.
    CancelTask(inst._dustave_scp049_original_mainttask)
    inst._dustave_scp049_original_mainttask = nil

    inst._dustave_scp049_mainttask = SchedulePeriodic(
        inst,
        0.5,
        function()
            CureMeterMaintenance(inst)
        end,
        0.5
    )

    -- SCP-035 locator refresh does not need to walk every entity twice/sec.
    inst._dustave_scp049_revealtask = SchedulePeriodic(
        inst,
        2,
        function()
            RevealScp035Targets(inst)
        end,
        0
    )

    inst:ListenForEvent("onremove", function()
        CancelTask(inst._dustave_scp049_mainttask)
        CancelTask(inst._dustave_scp049_revealtask)
    end)

    DEBUG("Installed SCP-049 player maintenance fixes")
end)

--------------------------------------------------------------------------
-- SCP-049-2 lifetime / orphan cleanup
--------------------------------------------------------------------------

AddPrefabPostInit("scpzombie", function(inst)
    InstallSafeDoTaskInTime(inst)

    if not IsMasterSim() then
        return
    end

    CancelTask(inst._dustave_scp049_original_lifetask)
    inst._dustave_scp049_original_lifetask = nil

    inst._dustave_scp049_lifetask = SchedulePeriodic(inst, 0.5, function()
        if not IsValid(inst)
            or inst.sg == nil
            or inst.components == nil
            or inst.components.health == nil then
            return
        end

        inst.lifetime = (tonumber(inst.lifetime) or 0) - 1

        if inst.sg:HasStateTag("dead") or inst._killtask ~= nil then
            return
        end

        if inst.lifetime <= 0 then
            inst._killtask = inst:DoTaskInTime(math.random(), function(zombie)
                zombie._killtask = nil
                if IsValid(zombie)
                    and zombie.components ~= nil
                    and zombie.components.health ~= nil
                    and not zombie.components.health:IsDead() then
                    zombie.components.health:Kill()
                end
            end)

        elseif inst.components.follower ~= nil
            and inst.components.follower.leader == nil then

            inst._killtask = inst:DoTaskInTime(math.random(), function(zombie)
                zombie._killtask = nil
                if IsValid(zombie) then
                    zombie:Remove()
                end
            end)
        end
    end)

    DEBUG("Installed SCP-049-2 lifetime fix")
end)

--------------------------------------------------------------------------
-- SCP-035 host follower cleanup
--------------------------------------------------------------------------

AddPrefabPostInit("scp035host", function(inst)
    InstallSafeDoTaskInTime(inst)

    if not IsMasterSim() then
        return
    end

    CancelTask(inst._dustave_scp049_original_leadertask)
    inst._dustave_scp049_original_leadertask = nil

    inst._dustave_scp049_leadertask = SchedulePeriodic(inst, 0.5, function()
        if not IsValid(inst)
            or inst.sg == nil
            or inst.components == nil
            or inst.components.follower == nil
            or inst._killtask ~= nil then
            return
        end

        if inst.components.follower.leader == nil
            and not inst.sg:HasStateTag("dead")
            and not inst.sg:HasStateTag("hit") then

            inst._killtask = inst:DoTaskInTime(math.random(), function(host)
                host._killtask = nil
                if IsValid(host) then
                    -- Direct Remove() does not run lootdropper death loot.
                    -- Return SCP-035 explicitly so disconnects/leader loss
                    -- cannot permanently delete the unique mask.
                    ReturnScp035Mask(host)
                    host:Remove()
                end
            end)
        end
    end)

    DEBUG("Installed SCP-035 host cleanup fix")
end)

--------------------------------------------------------------------------
-- Cure Meter widget robustness / Combined Status compatibility
--------------------------------------------------------------------------

AddClassPostConstruct("widgets/plaguedoctorbadge", function(self)
    if self == nil or self._dustave_scp049_fixed then
        return
    end

    self._dustave_scp049_fixed = true

    -- Combined Status already decorates every Badge with its own status_bgs
    -- plate and max-number text. SCP-049 then manually adds the same pair a
    -- second time in StatusDisplays, producing the doubled plate seen in-game.
    -- Capture the Combined Status widgets now; after StatusDisplays finishes,
    -- hide the duplicate SCP-049 copies and restore these references.
    self._dustave_scp049_cs_bg = self.bg
    self._dustave_scp049_cs_maxnum = self.maxnum

    if self.owner ~= nil and self.owner.DoTaskInTime ~= nil then
        self.owner:DoTaskInTime(0, function()
            local badge = self

            local original_bg = badge._dustave_scp049_cs_bg
            if original_bg ~= nil
                and badge.bg ~= nil
                and badge.bg ~= original_bg then

                if badge.bg.Hide ~= nil then
                    badge.bg:Hide()
                end

                badge.bg = original_bg
                if original_bg.Show ~= nil then
                    original_bg:Show()
                end
            end

            local original_maxnum = badge._dustave_scp049_cs_maxnum
            if original_maxnum ~= nil
                and badge.maxnum ~= nil
                and badge.maxnum ~= original_maxnum then

                if badge.maxnum.Hide ~= nil then
                    badge.maxnum:Hide()
                end

                badge.maxnum = original_maxnum
            end
        end)
    end

    self.OnUpdate = function(widget, dt)
        local owner = widget.owner
        local max = widget.num ~= nil and tonumber(widget.num.max) or 100
        local current = widget.num ~= nil and tonumber(widget.num.current) or max

        if owner ~= nil and owner.counter_max ~= nil then
            max = tonumber(owner.counter_max:value()) or max
        end
        if owner ~= nil and owner.counter_current ~= nil then
            current = tonumber(owner.counter_current:value()) or current
        end

        if max <= 0 then
            max = 100
        end

        current = Clamp(current, 0, max)
        local percent = current / max

        if widget.num ~= nil then
            widget.num.max = max
            widget.num.current = current
            widget.num:SetString(tostring(math.floor(current)))
        end

        widget.percent = percent

        if widget.maxnum ~= nil then
            local maxtext = tostring(math.floor(max))
            if widget.showmaxonnumbers then
                maxtext = "Max:\n" .. maxtext
            end
            widget.maxnum:SetString(maxtext)
        end

        if widget.anim ~= nil and widget.anim.GetAnimState ~= nil then
            widget.anim:GetAnimState():SetPercent("anim", 1 - percent)
        end
    end

    DEBUG("Patched plaguedoctorbadge")
end)

--------------------------------------------------------------------------
-- Old bundled skins_api vs [API] Modded Skins
--
-- SCP-049 ships an obsolete skins_api.lua. Modern [API] Modded Skins 2.6
-- intentionally turns the old AddSkinnableCharacter() into a no-op, and its
-- CreatePrefabSkin wrapper renames non-default mod skins to:
--
--   ms_plaguedoctor_survivor
--   ms_plaguedoctor_old
--
-- SCP-049 still writes the old unprefixed names into PREFAB_SKINS. That is
-- why DST later tries to preload/unload undefined prefabs:
--
--   plaguedoctor_survivor
--   plaguedoctor_old
--
-- This patch is load-order independent:
--   * if SCP-049 has not loaded yet, hook its modimport("skins_api");
--   * if it has already loaded, repair it immediately;
--   * wrap CreatePrefabSkin as a final safety net before prefab registration.
--------------------------------------------------------------------------

local function RepairSCP049SkinTables()
    if MODDED_SKINS_MODDIR == nil then
        return
    end

    if GLOBAL.PREFAB_SKINS ~= nil then
        GLOBAL.PREFAB_SKINS.plaguedoctor = {
            "plaguedoctor_none",
            "ms_plaguedoctor_survivor",
            "ms_plaguedoctor_old",
        }
    end

    if GLOBAL.PREFAB_SKINS_IDS ~= nil then
        GLOBAL.PREFAB_SKINS_IDS.plaguedoctor = {
            plaguedoctor_none = 1,
            ms_plaguedoctor_survivor = 2,
            ms_plaguedoctor_old = 3,
        }
    end

    local ok, affinity = pcall(GLOBAL.require, "skin_affinity_info")
    if ok and type(affinity) == "table" then
        affinity.plaguedoctor = {
            "ms_plaguedoctor_survivor",
        }
    end

    DEBUG("Repaired SCP-049 skin tables for Modded Skins")
end

local function IsSCP049LegacySkinWrapper(fn)
    local source = GetFunctionSource(fn)
    return source:find("1847716441", 1, true) ~= nil
        and source:find("skins_api", 1, true) ~= nil
end

local function NeutralizeLegacySkinGlobals()
    if MODDED_SKINS_MODDIR == nil then
        return false
    end

    local changed = false

    local current_owned = GLOBAL.IsDefaultSkinOwned
    if IsSCP049LegacySkinWrapper(current_owned) then
        local old_skinnable_characters =
            GetUpvalueByName(current_owned, "SKINNABLE_CHARACTERS")

        -- Modern Modded Skins already owns SCP-049 skin handling.
        -- Keep the legacy UI/component hooks dormant.
        if type(old_skinnable_characters) == "table" then
            old_skinnable_characters.plaguedoctor = nil
        end

        local underlying =
            GetUpvalueByName(current_owned, "_IsDefaultSkinOwned")

        if type(underlying) == "function" then
            GLOBAL.IsDefaultSkinOwned = underlying
            changed = true
        end
    end

    local current_validate = GLOBAL.ValidateItemsLocal
    if IsSCP049LegacySkinWrapper(current_validate) then
        local underlying =
            GetUpvalueByName(current_validate, "_ValidateItemsLocal")

        if type(underlying) == "function" then
            GLOBAL.ValidateItemsLocal = underlying
            changed = true
        end
    end

    local current_spawn = GLOBAL.SpawnNewPlayerOnServerFromSim
    if IsSCP049LegacySkinWrapper(current_spawn) then
        local underlying =
            GetUpvalueByName(current_spawn, "_SpawnNewPlayerOnServerFromSim")

        if type(underlying) == "function" then
            GLOBAL.SpawnNewPlayerOnServerFromSim = underlying
            changed = true
        end
    end

    if changed then
        DEBUG("Neutralized SCP-049 bundled skins_api global wrappers")
    end

    return changed
end

local function InstallSCP049SkinImportHook()
    if MODDED_SKINS_MODDIR == nil then
        return
    end

    local ModManager = GLOBAL.ModManager
    if ModManager == nil or ModManager.GetMod == nil then
        return
    end

    local modenv = ModManager:GetMod(SCP049_MODDIR)
    if modenv == nil
        or type(modenv.modimport) ~= "function"
        or modenv._dustave_scp049_skin_import_hook then
        return
    end

    modenv._dustave_scp049_skin_import_hook = true

    local _modimport = modenv.modimport

    modenv.modimport = function(modulename, ...)
        local ret = { _modimport(modulename, ...) }

        local normalized =
            type(modulename) == "string"
            and modulename:gsub("\\", "/")
            or ""

        if normalized == "skins_api"
            or normalized == "skins_api.lua"
            or normalized:sub(-14) == "/skins_api.lua" then

            -- skins_api.lua has now installed its obsolete global wrappers.
            -- Restore the modern functions captured underneath them.
            NeutralizeLegacySkinGlobals()

            -- [API] Modded Skins replaces the old function with a warning
            -- no-op after modimport returns. Replace that no-op with our tiny
            -- compatibility bridge. SCP-049 calls it only AFTER writing its
            -- old PREFAB_SKINS entries, so this is the ideal point to repair
            -- those entries before prefab registration begins.
            local _AddSkinnableCharacter = modenv.AddSkinnableCharacter

            modenv.AddSkinnableCharacter = function(char, ...)
                if char == "plaguedoctor" then
                    RepairSCP049SkinTables()
                    DEBUG("Intercepted legacy AddSkinnableCharacter(plaguedoctor)")
                    return
                end

                if type(_AddSkinnableCharacter) == "function" then
                    return _AddSkinnableCharacter(char, ...)
                end
            end
        end

        return unpack(ret)
    end

    DEBUG("Installed pre-load SCP-049 skins_api hook")
end

local CREATE_PREFAB_SKIN_FIX_INSTALLED = false

local function InstallCreatePrefabSkinFix()
    if MODDED_SKINS_MODDIR == nil
        or GLOBAL.CreatePrefabSkin == nil
        or CREATE_PREFAB_SKIN_FIX_INSTALLED then
        return
    end

    CREATE_PREFAB_SKIN_FIX_INSTALLED = true

    local _CreatePrefabSkin = GLOBAL.CreatePrefabSkin

    GLOBAL.CreatePrefabSkin = function(skin_id, data, ...)
        local is_scp049_skin =
            type(data) == "table"
            and data.base_prefab == "plaguedoctor"

        if is_scp049_skin then
            -- The old mod marks both custom skins as official "Elegant".
            -- Modded Skins 2.6 explicitly rejects official rarities for mod
            -- skins and converts them with a warning. Give them the proper
            -- mod rarity before its wrapper sees them.
            if skin_id == "plaguedoctor_survivor"
                or skin_id == "plaguedoctor_old"
                or skin_id == "ms_plaguedoctor_survivor"
                or skin_id == "ms_plaguedoctor_old" then

                data.rarity = "ModMade"
            end

            -- Remove the stale unprefixed names before Modded Skins registers
            -- the prefabs. Its own RegisterNoneSkin will then see the correct
            -- ms_ names instead of leaving both old and new IDs around.
            RepairSCP049SkinTables()
        end

        local ret = { _CreatePrefabSkin(skin_id, data, ...) }

        if is_scp049_skin then
            -- Final cleanup after Modded Skins has transformed the skin id.
            RepairSCP049SkinTables()
        end

        return unpack(ret)
    end

    DEBUG("Installed SCP-049 CreatePrefabSkin compatibility wrapper")
end

local function InstallLegacyFallback()
    if MODDED_SKINS_MODDIR ~= nil then
        return
    end

    -- When the modern API is absent we keep the bundled system, but repair
    -- IsDefaultSkinOwned's nil-index bug. The original assumes every item key
    -- contains "_", then does item_key:sub(1, index - 1).
    local current_owned = GLOBAL.IsDefaultSkinOwned
    if IsSCP049LegacySkinWrapper(current_owned) then
        local underlying =
            GetUpvalueByName(current_owned, "_IsDefaultSkinOwned")
        local old_skinnable_characters =
            GetUpvalueByName(current_owned, "SKINNABLE_CHARACTERS")

        if type(old_skinnable_characters) == "table" then
            old_skinnable_characters.plaguedoctor = true
        end

        if type(underlying) == "function" then
            GLOBAL.IsDefaultSkinOwned = function(item_key, ...)
                if type(item_key) == "string"
                    and item_key:find("^plaguedoctor_") ~= nil then
                    return true
                end

                return underlying(item_key, ...)
            end
        end
    end
end

if MODDED_SKINS_MODDIR ~= nil then
    -- Covers the normal order in this modpack: Modded Skins -> Override ->
    -- SCP-049. The import hook fires when SCP-049 later imports skins_api.
    InstallSCP049SkinImportHook()

    -- Covers the opposite order and also fixes tables immediately if SCP-049
    -- has already executed its modmain.
    NeutralizeLegacySkinGlobals()
    RepairSCP049SkinTables()

    -- Last-resort safety net before actual prefab registration. This is also
    -- what fixes the official-rarity warnings from SCP-049's skin prefabs.
    InstallCreatePrefabSkinFix()
else
    InstallLegacyFallback()
end


--------------------------------------------------------------------------
-- SCP-049 / Bunnyman visual compatibility
--
-- SCP-049 ships an old copy of scripts/prefabs/bunnyman.lua. That copy
-- predates the current vanilla initialization which hides ARM_carry and
-- HAIR_HAT. If that stale prefab wins path resolution, those symbols remain
-- visible and look like a second pair of ears / dangling fur.
--------------------------------------------------------------------------

AddPrefabPostInit("bunnyman", function(inst)
    if inst == nil or inst.AnimState == nil then
        return
    end

    inst.AnimState:Hide("ARM_carry")
    inst.AnimState:Hide("HAIR_HAT")

    DEBUG("Applied current-vanilla bunnyman hidden-symbol fix")
end)

print("[DustAve Override] SCP-049 full fix loaded.")
