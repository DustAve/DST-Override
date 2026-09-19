--------------------------------------------------------------------------
-- SCP-035 Runtime Fixes
-- Fixes / optimizes workshop-2011916582
--------------------------------------------------------------------------

local GLOBAL = GLOBAL

--------------------------------------------------------------------------
-- Debug
--
-- true  = write SCP-035 fix events into server_log.txt
-- false = no debug spam
--------------------------------------------------------------------------

local DEBUG_ENABLED = true

local function DEBUG(...)
    if DEBUG_ENABLED then
        print("[DustAve Override][SCP035]", ...)
    end
end

--------------------------------------------------------------------------
-- Patch SCP-035 host component
--------------------------------------------------------------------------

AddComponentPostInit("scp035hostcomponent", function(self)

    if self == nil or self.inst == nil then
        return
    end

    local inst = self.inst

    DEBUG("Patching host component:", inst.prefab)

    ----------------------------------------------------------------------
    -- FIX #1
    -- Sanity / dapperness
    --
    -- Original mod contains:
    --
    -- if dapperness ~= 5/60 or dapperness ~= 0 then
    --
    -- This condition is always true and causes original_dapperness
    -- to be overwritten while SCP-035 is active.
    --
    -- OnStart() already saved the real original dapperness before
    -- changing it, so we must NOT overwrite original_dapperness here.
    ----------------------------------------------------------------------

    self.DoSanChange2 = function(component)

        local player = component.inst

        if player == nil
            or not player:IsValid()
            or player.components.sanity == nil then
            return
        end

        local sanity = player.components.sanity

        sanity.neg_aura_mult = 4

        local current = sanity.current
        local maxsanity = sanity.max

        if current == nil
            or maxsanity == nil
            or maxsanity <= 0 then
            return
        end

        ------------------------------------------------------------------
        -- Keep sanity around 30%, same behaviour as original SCP-035.
        ------------------------------------------------------------------

        if current > maxsanity * 0.30 then
            local delta =
                -(current - (maxsanity * 0.30))

            sanity:DoDelta(delta)
        end

        ------------------------------------------------------------------
        -- Preserve changes from other mods while SCP-035 is active.
        ------------------------------------------------------------------

        if sanity.night_drain_mult ~= 0 then
            component.original_night_mult =
                sanity.night_drain_mult

            sanity.night_drain_mult = 0
        end

        ------------------------------------------------------------------
        -- IMPORTANT:
        --
        -- Do NOT change component.original_dapperness here.
        -- OnStart() already stored the value that existed before SCP-035.
        ------------------------------------------------------------------

        if current > maxsanity * 0.28 then
            sanity.dapperness = 0
        else
            sanity.dapperness = 5
        end

        DEBUG(
            "Sanity check:",
            "sanity =", current,
            "max =", maxsanity,
            "dapperness =", sanity.dapperness,
            "original_dapperness =", component.original_dapperness
        )
    end


    ----------------------------------------------------------------------
    -- FIX #2
    -- HP penalty dialogue
    --
    -- Original code:
    --
    -- 25% -> hpcheck = 1
    -- next check -> else -> hpcheck = 0
    -- next check -> says 25% line again
    --
    -- Keep hpcheck at the highest threshold already announced.
    ----------------------------------------------------------------------

    self.CheckHpPenalty = function(component)

        local player = component.inst

        if player == nil
            or not player:IsValid()
            or player.components.health == nil then
            return
        end

        local penalty =
            player.components.health:GetPenaltyPercent()

        local talker = player.components.talker

        DEBUG(
            "HP penalty check:",
            "penalty =", penalty,
            "hpcheck =", component.hpcheck
        )

        if penalty >= 0.75 then

            if component.hpcheck < 3 then

                DEBUG("HP threshold reached: 75%")

                if talker ~= nil then
                    talker:Say(
                        "I'm going to lose this body soon.",
                        2.5
                    )
                end

                component.hpcheck = 3
            end

        elseif penalty >= 0.50 then

            if component.hpcheck < 2 then

                DEBUG("HP threshold reached: 50%")

                if talker ~= nil then
                    talker:Say(
                        "This body is on it's way out.",
                        2.5
                    )
                end

                component.hpcheck = 2
            end

        elseif penalty >= 0.25 then

            if component.hpcheck < 1 then

                DEBUG("HP threshold reached: 25%")

                if talker ~= nil then
                    talker:Say(
                        "This body is starting to deteriorate.",
                        2.5
                    )
                end

                component.hpcheck = 1
            end

        else
            component.hpcheck = 0
        end
    end


    ----------------------------------------------------------------------
    -- OPTIMIZATION #1
    -- SCP-035 mask
    --
    -- Original:
    --     DoPeriodicTask(FRAMES, ...)
    --
    -- = checks the head slot every frame.
    --
    -- We instead check only after equipment changes.
    ----------------------------------------------------------------------

    if self.masktask ~= nil then
        self.masktask:Cancel()
        self.masktask = nil

        DEBUG("Cancelled original mask polling task")
    end

    self._dustave_maskchange = function(player, data)

        local item =
            data ~= nil
            and data.item ~= nil
            and data.item.prefab
            or "nil"

        local slot =
            data ~= nil
            and data.eslot ~= nil
            and tostring(data.eslot)
            or "nil"

        DEBUG(
            "Equipment event:",
            "item =", item,
            "slot =", slot,
            "HEAD =", tostring(GLOBAL.EQUIPSLOTS.HEAD)
        )

        --------------------------------------------------------------
        -- Not a head-slot change -> irrelevant for SCP-035.
        --------------------------------------------------------------

        if data ~= nil
            and data.eslot ~= nil
            and data.eslot ~= GLOBAL.EQUIPSLOTS.HEAD then

            DEBUG(
                "Ignored equipment event: not HEAD"
            )

            return
        end

        --------------------------------------------------------------
        -- Head slot changed.
        --
        -- It doesn't matter WHICH hat caused it.
        -- SCP-035 now checks what is currently equipped.
        --------------------------------------------------------------

        DEBUG(
            "HEAD changed -> scheduling DoMaskCheck2"
        )

        player:DoTaskInTime(0, function()

            if player:IsValid()
                and player.components.scp035hostcomponent == self then

                local hat =
                    player.components.inventory:GetEquippedItem(
                        GLOBAL.EQUIPSLOTS.HEAD
                    )

                DEBUG(
                    "Current HEAD item:",
                    hat ~= nil and hat.prefab or "nothing"
                )

                DEBUG("Running DoMaskCheck2")

                self:DoMaskCheck2()
            else
                DEBUG(
                    "DoMaskCheck2 skipped: SCP-035 component no longer active"
                )
            end
        end)
    end

    inst:ListenForEvent(
        "equip",
        self._dustave_maskchange
    )

    inst:ListenForEvent(
        "unequip",
        self._dustave_maskchange
    )

    ----------------------------------------------------------------------
    -- Initial mask check after component setup.
    ----------------------------------------------------------------------

    inst:DoTaskInTime(0, function()

        if inst:IsValid()
            and inst.components.scp035hostcomponent == self then

            DEBUG("Initial mask check")

            self:DoMaskCheck2()
        end
    end)


    ----------------------------------------------------------------------
    -- OPTIMIZATION #2
    -- Woodie
    --
    -- Original checks wereness every frame.
    --
    -- We react only when wereness actually changes.
    ----------------------------------------------------------------------

    if self.woodietask ~= nil then
        self.woodietask:Cancel()
        self.woodietask = nil

        DEBUG("Cancelled original Woodie polling task")
    end

    if inst.components.wereness ~= nil then

        self._dustave_werenessdelta = function(player)

            if player == nil
                or not player:IsValid()
                or player.components.wereness == nil then
                return
            end

            local percent =
                player.components.wereness:GetPercent()

            DEBUG(
                "Woodie wereness changed:",
                percent
            )

            ------------------------------------------------------------------
            -- Ignore the event generated when we ourselves set it to zero.
            ------------------------------------------------------------------

            if percent <= 0 then
                return
            end

            ------------------------------------------------------------------
            -- Preserve original SCP-035 dialogue at full wereness.
            ------------------------------------------------------------------

            if percent >= 1
                and player.components.talker ~= nil then

                player:DoTaskInTime(4, function()

                    if player:IsValid()
                        and player.components.scp035hostcomponent == self
                        and player.components.talker ~= nil then

                        player.components.talker:Say(
                            "I feel weird. Huh.",
                            2.5
                        )
                    end
                end)
            end

            ------------------------------------------------------------------
            -- SCP-035 prevents Woodie's transformation.
            ------------------------------------------------------------------

            player.components.wereness:SetPercent(
                0,
                true
            )
        end

        inst:ListenForEvent(
            "werenessdelta",
            self._dustave_werenessdelta
        )

        ------------------------------------------------------------------
        -- Initial reset in case Woodie already had wereness.
        ------------------------------------------------------------------

        inst:DoTaskInTime(0, function()

            if inst:IsValid()
                and inst.components.scp035hostcomponent == self
                and inst.components.wereness ~= nil
                and inst.components.wereness:GetPercent() > 0 then

                DEBUG(
                    "Initial Woodie wereness reset"
                )

                inst.components.wereness:SetPercent(
                    0,
                    true
                )
            end
        end)
    end


    ----------------------------------------------------------------------
    -- OPTIMIZATION #3
    -- Wolfgang
    --
    -- Original clears:
    --
    --     talksoundoverride
    --     hurtsoundoverride
    --
    -- every frame.
    --
    -- Wolfgang changes those values when his mightiness state changes,
    -- so react to that event instead.
    ----------------------------------------------------------------------

    if self.wolfgangtask ~= nil then
        self.wolfgangtask:Cancel()
        self.wolfgangtask = nil

        DEBUG("Cancelled original Wolfgang polling task")
    end

    if inst.prefab == "wolfgang" then

        self._dustave_mightinesschange =
            function(player)

                DEBUG(
                    "Wolfgang mightiness changed",
                    "talksound =",
                    tostring(player.talksoundoverride),
                    "hurtsound =",
                    tostring(player.hurtsoundoverride)
                )

                player.talksoundoverride = nil
                player.hurtsoundoverride = nil

                DEBUG(
                    "Wolfgang sound overrides cleared"
                )
            end

        inst:ListenForEvent(
            "mightiness_statechange",
            self._dustave_mightinesschange
        )

        ------------------------------------------------------------------
        -- Clear current Wolfgang overrides immediately after possession.
        ------------------------------------------------------------------

        inst:DoTaskInTime(0, function()

            if inst:IsValid()
                and inst.components.scp035hostcomponent == self then

                self._dustave_mightinesschange(inst)
            end
        end)
    end


    ----------------------------------------------------------------------
    -- CLEANUP
    --
    -- SCP-035's original OnRemoveFromEntity cancels its own periodic
    -- tasks. We additionally remove our event listeners.
    ----------------------------------------------------------------------

    local old_OnRemoveFromEntity =
        self.OnRemoveFromEntity

    self.OnRemoveFromEntity =
        function(component)

            local player = component.inst

            DEBUG(
                "Removing SCP-035 runtime patch from:",
                player ~= nil
                    and tostring(player.prefab)
                    or "unknown"
            )

            --------------------------------------------------------------
            -- Mask listeners
            --------------------------------------------------------------

            if player ~= nil
                and component._dustave_maskchange ~= nil then

                player:RemoveEventCallback(
                    "equip",
                    component._dustave_maskchange
                )

                player:RemoveEventCallback(
                    "unequip",
                    component._dustave_maskchange
                )

                component._dustave_maskchange = nil
            end

            --------------------------------------------------------------
            -- Woodie listener
            --------------------------------------------------------------

            if player ~= nil
                and component._dustave_werenessdelta ~= nil then

                player:RemoveEventCallback(
                    "werenessdelta",
                    component._dustave_werenessdelta
                )

                component._dustave_werenessdelta = nil
            end

            --------------------------------------------------------------
            -- Wolfgang listener
            --------------------------------------------------------------

            if player ~= nil
                and component._dustave_mightinesschange ~= nil then

                player:RemoveEventCallback(
                    "mightiness_statechange",
                    component._dustave_mightinesschange
                )

                component._dustave_mightinesschange = nil
            end

            --------------------------------------------------------------
            -- Run original SCP-035 cleanup.
            --------------------------------------------------------------

            if old_OnRemoveFromEntity ~= nil then
                old_OnRemoveFromEntity(component)
            end
        end


    DEBUG(
        "SCP-035 runtime fixes successfully installed for:",
        inst.prefab
    )
end)