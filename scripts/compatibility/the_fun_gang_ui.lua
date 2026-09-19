--------------------------------------------------------------------------
-- UI compatibility fixes
-- The Fun Gang TP meter + Combined Status + Full Stats Party HUD
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local Badge = GLOBAL.require("widgets/badge")
local Widget = GLOBAL.require("widgets/widget")

local DEBUG_ENABLED = false

local function DEBUG(...)
    if DEBUG_ENABLED then
        print("[DustAve Override][UI Compat]", ...)
    end
end

--------------------------------------------------------------------------
-- The Fun Gang TP meter + Combined Status
--
-- Combined Status patches every Badge globally:
--   * scales it to 0.9;
--   * moves/rescales its number;
--   * appends max ("/100" if max is omitted).
--
-- delta_tp_badge inherits Badge, so all of that leaks into the TP meter.
-- Patch the TP badge itself instead of changing every custom Badge.
--------------------------------------------------------------------------

AddClassPostConstruct("widgets/delta_tp_badge", function(self)
    if self._dustave_tp_badge_fixed then
        return
    end
    self._dustave_tp_badge_fixed = true

    ----------------------------------------------------------------------
    -- Undo Combined Status' generic Badge presentation changes.
    ----------------------------------------------------------------------

    self:SetScale(1, 1, 1)

    -- Combined Status adds these to every Badge. They do not belong to TP.
    if self.bg ~= nil then
        self.bg:Hide()
    end

    if self.maxnum ~= nil then
        self.maxnum:Hide()
    end

    -- Restore the values used by the original delta_tp_badge.lua.
    if self.num ~= nil then
        self.num:SetFont(GLOBAL.BODYTEXTFONT)
        self.num:SetSize(33)
        self.num:SetPosition(-18, 0, 0)
        self.num:SetScale(.77, .77, 1)
        self.num:MoveToFront()
        self.num:Show()
    end

    ----------------------------------------------------------------------
    -- Combined Status replaces ScaleTo with a 0.9 multiplier.
    -- Bypass that wrapper for TP so focus/unfocus can't shrink the meter.
    ----------------------------------------------------------------------

    if Widget.ScaleTo ~= nil then
        self.ScaleTo = function(widget, from, to, time, ...)
            return Widget.ScaleTo(widget, from, to, time, ...)
        end
    end

    ----------------------------------------------------------------------
    -- Restore TP's own SetPercent.
    --
    -- Calling Badge.SetPercent directly bypasses Combined Status'
    -- instance wrapper, so it cannot append "/100" or reposition text.
    ----------------------------------------------------------------------

    self.SetPercent = function(badge, val, max)
        badge.val = val or 0

        Badge.SetPercent(badge, val)

        if badge.val == 1 then
            if badge.num ~= nil then
                badge.num:SetString("")
            end

            if badge.anim ~= nil then
                badge.anim:GetAnimState():PlayAnimation("max")
            end

            if badge.circleframe ~= nil then
                badge.circleframe:GetAnimState():PlayAnimation("framemax")
            end
        else
            if badge.num ~= nil then
                badge.num:SetScale(.77, .77, 1)
                badge.num:SetPosition(-18, 0, 0)
                badge.num:Show()
                badge.num:MoveToFront()
            end

            if badge.circleframe ~= nil then
                badge.circleframe:GetAnimState():PlayAnimation("frame")
            end
        end
    end

    DEBUG("TP badge compatibility patch installed")
end)

--------------------------------------------------------------------------
-- TP display update + position
--
-- Two separate conflicts exist here:
--
-- 1. The Fun Gang deliberately moves TP from y=-140 to y=-170 whenever
--    Combined Status is enabled. Restore the normal TP position.
--
-- 2. The Fun Gang and Full Stats Party HUD both use the generic method
--    name owner.UpdateBadges. Full Stats overwrites it, so tensiondirty
--    stops updating TP even though the actual TP value keeps changing.
--
-- Listen to tensiondirty directly and update only TP here.
--------------------------------------------------------------------------

AddClassPostConstruct("widgets/statusdisplays", function(self)
    if self.tpmeter == nil or self.owner == nil then
        return
    end

    if self._dustave_tp_display_fixed then
        return
    end
    self._dustave_tp_display_fixed = true

    -- Move TP lower and closer to the right edge to avoid other mod UI elements.
    self.tpmeter:SetPosition(70, -300, 0)
    self.tpmeter:SetScale(1, 1, 1)

    local function UpdateTPMeter()
        if self.tpmeter == nil
            or self.owner == nil
            or not self.owner:IsValid() then
            return
        end

        local max = TUNING.TENSION_POINT_MAX or 100
        if max <= 0 then
            max = 100
        end

        local current = 0
        if self.owner.currenttp ~= nil then
            current = self.owner.currenttp:value() or 0
        end

        local percent = current / max
        self.tpmeter:SetPercent(percent, max)

        if self.owner:HasTag("playerghost") then
            self.tpmeter:Hide()
        else
            self.tpmeter:Show()
        end

        DEBUG("TP update:", current, "/", max, "percent =", percent)
    end

    -- Use the widget's entity as listener and the player as event source.
    -- This avoids permanently attaching duplicate callbacks to the player
    -- when HUD widgets are rebuilt.
    if self.inst ~= nil then
        self.inst:ListenForEvent("tensiondirty", UpdateTPMeter, self.owner)
        self.inst:DoTaskInTime(0, UpdateTPMeter)
    else
        UpdateTPMeter()
    end

    DEBUG("TP display/update compatibility patch installed")
end)

