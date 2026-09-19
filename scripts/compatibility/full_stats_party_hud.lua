--------------------------------------------------------------------------
-- Full Stats Party HUD compatibility
-- Stable userid-based badge mapping and join/leave reconciliation.
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local string = GLOBAL.string
local table = GLOBAL.table
local ipairs = GLOBAL.ipairs
local pairs = GLOBAL.pairs
local tostring = GLOBAL.tostring

local DEBUG_ENABLED = false
local function DEBUG(...)
    if DEBUG_ENABLED then
        GLOBAL.print("[DustAve Override][Full Stats Party HUD]", ...)
    end
end

--------------------------------------------------------------------------
-- Full Stats Party HUD fixes
-- workshop-2507838386
--
-- Original problems:
--  * identifies the local player by display name instead of userid;
--  * assigns badges by the current AllPlayers array index;
--  * relies only on stat dirty events, so a join/leave can be missed;
--  * stale slots are not always cleared.
--
-- Keep its existing widgets/layout and replace only player-to-slot mapping.
--------------------------------------------------------------------------

local function Utf8Prefix(str, maxchars)
    if str == nil then
        return ""
    end

    local out = {}
    local count = 0

    for ch in string.gmatch(str, "[%z\1-\127\194-\244][\128-\191]*") do
        count = count + 1
        if count > maxchars then
            break
        end
        out[#out + 1] = ch
    end

    if #out == 0 and #str > 0 then
        return string.sub(str, 1, maxchars)
    end

    return table.concat(out)
end

local function GetPlayerId(player)
    if player == nil then
        return nil
    end

    if player.userid ~= nil and player.userid ~= "" then
        return tostring(player.userid)
    end

    if player.GUID ~= nil then
        return "GUID:" .. tostring(player.GUID)
    end

    return nil
end

AddClassPostConstruct("widgets/controls", function(self)
    -- Full Stats Party HUD creates badgearray before our lower-priority patch.
    if self.badgearray == nil or self.owner == nil then
        return
    end

    if self._dustave_partyhud_fixed then
        return
    end
    self._dustave_partyhud_fixed = true

    local slot_by_userid = {}
    local userid_by_slot = {}

    local maxplayers = GLOBAL.TheNet:GetDefaultMaxPlayers()
    local slotcount = #self.badgearray

    -- Full Stats creates maxplayers-1 slots when its "Show Self" is No.
    local hide_self = slotcount < maxplayers

    local function IsLocalPlayer(player)
        local localplayer = GLOBAL.ThePlayer or self.owner
        if localplayer == nil or player == nil then
            return false
        end

        if player == localplayer then
            return true
        end

        local a = GetPlayerId(player)
        local b = GetPlayerId(localplayer)
        return a ~= nil and b ~= nil and a == b
    end

    local function FindFreeSlot()
        for i = 1, slotcount do
            if userid_by_slot[i] == nil then
                return i
            end
        end
        return nil
    end

    local function NetValue(netvar, fallback)
        if netvar ~= nil then
            return netvar:value()
        end
        return fallback or 0
    end

    local function RefreshPartyHUD()
        if GLOBAL.ThePlayer == nil or self.badgearray == nil then
            return
        end

        local present = {}
        local players_by_id = {}

        for _, player in ipairs(GLOBAL.AllPlayers or {}) do
            if player ~= nil
                and player:IsValid()
                and not (hide_self and IsLocalPlayer(player)) then

                local userid = GetPlayerId(player)
                if userid ~= nil then
                    present[userid] = true
                    players_by_id[userid] = player
                end
            end
        end

        -- Release slots from players that left.
        for userid, slot in pairs(slot_by_userid) do
            if not present[userid] then
                slot_by_userid[userid] = nil
                userid_by_slot[slot] = nil

                local badge = self.badgearray[slot]
                if badge ~= nil then
                    badge:HideBadge()
                    badge:SetName("--")
                    badge.isdead = false
                end
            end
        end

        -- Give every visible player one stable userid-bound slot.
        for _, player in ipairs(GLOBAL.AllPlayers or {}) do
            if player ~= nil
                and player:IsValid()
                and not (hide_self and IsLocalPlayer(player)) then

                local userid = GetPlayerId(player)
                if userid ~= nil and slot_by_userid[userid] == nil then
                    local slot = FindFreeSlot()
                    if slot ~= nil then
                        slot_by_userid[userid] = slot
                        userid_by_slot[slot] = userid
                        DEBUG("Party HUD slot", slot, "->", userid, player:GetDisplayName())
                    end
                end
            end
        end

        -- Update each slot from the exact player bound to that userid.
        for slot = 1, slotcount do
            local badge = self.badgearray[slot]
            local userid = userid_by_slot[slot]
            local player = userid ~= nil and players_by_id[userid] or nil

            if badge ~= nil then
                if player == nil then
                    badge:HideBadge()
                else
                    local sanitypercent = NetValue(player.customsanitypercent, 0) / 100
                    local sanitymax = NetValue(player.customsanitymax, 0)

                    local hungerpercent = NetValue(player.customhungerpercent, 0) / 100
                    local hungermax = NetValue(player.customhungermax, 0)

                    local healthpercent = NetValue(player.customhealthpercent, 0) / 100
                    local healthmax = NetValue(player.customhealthmax, 0)
                    local healthpenalty = NetValue(player.customhealthpenalty, 0) / 100

                    badge:SanitySetPercent(sanitypercent, sanitymax)
                    badge:HungerSetPercent(hungerpercent, hungermax)
                    badge:HealthSetPercent(healthpercent, healthmax, healthpenalty)

                    local name = player:GetDisplayName() or "Player"
                    badge:SetName(Utf8Prefix(name, 12))

                    badge.isdead = player.customisdead ~= nil
                        and player.customisdead:value()
                        or false

                    if self.Toggled then
                        badge:Refresh()
                    else
                        badge:HideBadge()
                    end
                end
            end
        end
    end

    -- Full Stats' netvar callbacks call these names, so keep them pointing at
    -- its own refresh. TP no longer depends on owner.UpdateBadges.
    self.owner.UpdateBadges = RefreshPartyHUD
    self.owner.UpdateBadgeVisibility = RefreshPartyHUD

    self.owner.ToggleAllBadges = function()
        self.Toggled = not self.Toggled
        RefreshPartyHUD()
    end

    -- Reconcile joins/leaves even if no dirty event happens at the right time.
    if self.inst ~= nil then
        self._dustave_partyhud_task = self.inst:DoPeriodicTask(1, RefreshPartyHUD)
        self.inst:DoTaskInTime(0, RefreshPartyHUD)
    else
        RefreshPartyHUD()
    end

    DEBUG("Full Stats Party HUD compatibility patch installed")
end)
