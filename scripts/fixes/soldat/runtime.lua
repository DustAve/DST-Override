--------------------------------------------------------------------------
-- DustAve Override - A.T.P. Soldat compatibility / bug fix
-- Target mod: workshop-2883859223 (A.T.P Soldat v1.0.0)
--
-- Fixes:
--   * removes the mod's accidental equip listener from every player
--   * keeps that visual rule only for Soldat
--   * replaces the global fixed-argument combat wrapper with a Soldat-only,
--     vararg-safe dodge wrapper (and removes "Try me!" log spam)
--   * hardens Soldat's health/sanity and kill event callbacks
--   * replaces the unguarded night-vision flip callback with a safe one
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local type = GLOBAL.type
local pairs = GLOBAL.pairs
local math = GLOBAL.math
local debuglib = GLOBAL.debug
local pcall = GLOBAL.pcall
local print = GLOBAL.print
local TUNING = GLOBAL.TUNING

local DEBUG_ENABLED = false

local function DEBUG(...)
    if DEBUG_ENABLED and print ~= nil then
        print("[DustAve Override][Soldat]", ...)
    end
end

local function GetFunctionSource(fn)
    if type(fn) ~= "function"
        or debuglib == nil
        or debuglib.getinfo == nil
        or pcall == nil then
        return ""
    end

    local ok, info = pcall(debuglib.getinfo, fn, "S")
    if ok and info ~= nil and type(info.source) == "string" then
        return info.source
    end

    return ""
end

local function SourceMatches(fn, fragment_a, fragment_b)
    local source = GetFunctionSource(fn)
    return source ~= ""
        and source:find(fragment_a, 1, true) ~= nil
        and (fragment_b == nil or source:find(fragment_b, 1, true) ~= nil)
end

local function GetUpvalueByName(fn, wanted)
    if type(fn) ~= "function"
        or debuglib == nil
        or debuglib.getupvalue == nil then
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

-- EntityScript stores ListenForEvent callbacks in
-- inst.event_listening[event][source]. The Soldat mod added an anonymous
-- equip callback to *every* player, so remove only callbacks whose source is
-- that Workshop mod.
local function RemoveSelfListenersBySource(inst, event, fragment_a, fragment_b)
    if inst == nil
        or inst.event_listening == nil
        or inst.event_listening[event] == nil then
        return 0
    end

    local callbacks = inst.event_listening[event][inst]
    if type(callbacks) ~= "table" then
        return 0
    end

    local remove = {}
    for _, fn in pairs(callbacks) do
        if SourceMatches(fn, fragment_a, fragment_b) then
            remove[#remove + 1] = fn
        end
    end

    for _, fn in pairs(remove) do
        inst:RemoveEventCallback(event, fn, inst)
    end

    return #remove
end

--------------------------------------------------------------------------
-- Fix the accidental global equip visual override.
--------------------------------------------------------------------------

AddPlayerPostInit(function(inst)
    local removed = RemoveSelfListenersBySource(
        inst,
        "equip",
        "workshop-2883859223",
        "modmain.lua"
    )

    if removed > 0 then
        DEBUG("Removed global equip listener from", inst.prefab, removed)
    end

    if inst.prefab ~= "soldat" or inst._dustave_soldat_equip_fix then
        return
    end

    inst._dustave_soldat_equip_fix = true

    -- Keep the original author's intended visual rule, but only on Soldat.
    inst:ListenForEvent("equip", function(player)
        if player ~= nil and player.AnimState ~= nil then
            player.AnimState:ClearOverrideSymbol("swap_hat")
            player.AnimState:Show("hair")
            player.AnimState:ClearOverrideSymbol("swap_body")
        end
    end)
end)

--------------------------------------------------------------------------
-- Fix the global combat wrapper.
--------------------------------------------------------------------------

AddComponentPostInit("combat", function(self)
    if self == nil or self._dustave_soldat_combat_fix then
        return
    end

    local current = self.GetAttacked
    if type(current) ~= "function" then
        return
    end

    -- A.T.P. Soldat's mod wraps every combat component and captures the
    -- previous implementation in an upvalue named oldGetAttacked.
    if not SourceMatches(current, "workshop-2883859223", "modmain.lua") then
        return
    end

    local oldGetAttacked = GetUpvalueByName(current, "oldGetAttacked")
    if type(oldGetAttacked) ~= "function" then
        DEBUG("Could not recover pre-Soldat GetAttacked; leaving wrapper intact")
        return
    end

    self._dustave_soldat_combat_fix = true

    self.GetAttacked = function(component, attacker, damage, weapon, stimuli, ...)
        if component.inst ~= nil
            and component.inst.prefab == "soldat"
            and math ~= nil
            and math.random ~= nil
            and math.random() <= 0.55 then
            return false
        end

        -- Preserve any modern/other-mod arguments after stimuli.
        return oldGetAttacked(component, attacker, damage, weapon, stimuli, ...)
    end
end)

--------------------------------------------------------------------------
-- Soldat prefab runtime safety.
--------------------------------------------------------------------------

local NIGHTVISION_COLOURCUBES =
{
    day = "images/colour_cubes/mole_vision_off_cc.tex",
    dusk = "images/colour_cubes/mole_vision_on_cc.tex",
    night = "images/colour_cubes/mole_vision_on_cc.tex",
    full_moon = "images/colour_cubes/mole_vision_off_cc.tex",
}

local function SafeFlipVision(inst)
    if inst == nil
        or inst.nightvision == nil
        or inst.components == nil
        or inst.components.playervision == nil then
        return
    end

    local enabled = inst.nightvision:value() == true
    inst.components.playervision:ForceNightVision(enabled)
    inst.components.playervision:SetCustomCCTable(
        enabled and NIGHTVISION_COLOURCUBES or nil
    )
end

local function SafeHealthDelta(inst, data)
    if inst == nil
        or data == nil
        or data.amount == nil
        or data.amount >= 0
        or inst.components == nil
        or inst.components.sanity == nil
        or inst._sanity_damage_protection == nil then
        return
    end

    local rate
    if data.overtime then
        rate = TUNING.WALTER_SANITY_DAMAGE_OVERTIME_RATE
    else
        rate = TUNING.WALTER_SANITY_DAMAGE_RATE
    end

    rate = rate or 0

    local protection = 1
    if inst._sanity_damage_protection.Get ~= nil then
        protection = inst._sanity_damage_protection:Get() or 1
    end

    inst.components.sanity:DoDelta(data.amount * rate * protection)
end

local function SafeKilled(inst, data)
    if inst == nil
        or data == nil
        or data.victim == nil
        or inst.components == nil
        or inst.components.sanity == nil then
        return
    end

    local victim = data.victim
    if victim.components ~= nil
        and victim.components.health ~= nil
        and not victim:HasTag("structure")
        and not victim:HasTag("wall") then
        inst.components.sanity:DoDelta(10)
    end
end

AddPrefabPostInit("soldat", function(inst)
    if inst == nil or inst._dustave_soldat_prefab_fix then
        return
    end

    inst._dustave_soldat_prefab_fix = true

    -- Original flip callback directly dereferences playervision. Keep the
    -- phase/netvar logic, replace only the callback that consumes the event.
    RemoveSelfListenersBySource(
        inst,
        "flipvision",
        "workshop-2883859223",
        "modmain.lua"
    )
    inst:ListenForEvent("flipvision", SafeFlipVision)
    inst:DoTaskInTime(0, SafeFlipVision)

    if GLOBAL.TheWorld == nil or not GLOBAL.TheWorld.ismastersim then
        return
    end

    -- The original healthdelta callback dereferences data.amount before
    -- checking data and is registered before _sanity_damage_protection exists.
    RemoveSelfListenersBySource(
        inst,
        "healthdelta",
        "workshop-2883859223",
        "scripts/prefabs/soldat.lua"
    )
    inst:ListenForEvent("healthdelta", SafeHealthDelta)

    -- Same idea for the kill callback: guard malformed/edge-case event data.
    RemoveSelfListenersBySource(
        inst,
        "killed",
        "workshop-2883859223",
        "scripts/prefabs/soldat.lua"
    )
    inst:ListenForEvent("killed", SafeKilled)
end)

DEBUG("A.T.P. Soldat fixes loaded")
