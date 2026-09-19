--------------------------------------------------------------------------
-- The Fun Gang - Ralsei night vision + darkness immunity
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING

--------------------------------------------------------------------------
-- Night vision
--------------------------------------------------------------------------

local NIGHTVISION_COLOURCUBES =
{
    day = "images/colour_cubes/ruins_light_cc.tex",
    dusk = "images/colour_cubes/ruins_dim_cc.tex",
    night = "images/colour_cubes/purple_moon_cc.tex",
    full_moon = "images/colour_cubes/purple_moon_cc.tex",
}

local function SetRalseiNightVision(inst)
    if inst == nil or not inst:IsValid() then
        return
    end

    if inst.components.playervision == nil then
        return
    end

    if GLOBAL.TheWorld.state.isnight or GLOBAL.TheWorld:HasTag("cave") then
        inst.components.playervision:ForceNightVision(true)
        inst.components.playervision:SetCustomCCTable(NIGHTVISION_COLOURCUBES)
    else
        inst.components.playervision:ForceNightVision(false)
        inst.components.playervision:SetCustomCCTable(nil)
    end
end

--------------------------------------------------------------------------
-- Grue immunity
--------------------------------------------------------------------------

local function SetRalseiDarknessImmunity(inst)
    if inst == nil or not inst:IsValid() then
        return
    end

    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    if inst.components.grue == nil then
        return
    end

    if TUNING.RALSEI_M_NIGHTVISION then
        inst.goatplayer = true
        inst.components.grue:AddImmunity("goatplayer")
    else
        inst.goatplayer = false
        inst.components.grue:RemoveImmunity("goatplayer")
    end
end

--------------------------------------------------------------------------
-- Client-side night vision
--------------------------------------------------------------------------

AddPlayerPostInit(function(inst)
    if inst.prefab ~= "ralsei_m" then
        return
    end

    if not TUNING.RALSEI_M_NIGHTVISION then
        return
    end

    inst:WatchWorldState("isday", SetRalseiNightVision)
    inst:WatchWorldState("isdusk", SetRalseiNightVision)
    inst:WatchWorldState("isnight", SetRalseiNightVision)

    inst:WatchWorldState("iscaveday", SetRalseiNightVision)
    inst:WatchWorldState("iscavedusk", SetRalseiNightVision)
    inst:WatchWorldState("iscavenight", SetRalseiNightVision)

    SetRalseiNightVision(inst)
end)

--------------------------------------------------------------------------
-- Server-side Grue immunity
--------------------------------------------------------------------------

AddPrefabPostInit("ralsei_m", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    SetRalseiDarknessImmunity(inst)

    inst:ListenForEvent("respawnfromghost", function()
        SetRalseiDarknessImmunity(inst)

        inst:DoTaskInTime(10, function()
            SetRalseiDarknessImmunity(inst)
        end)
    end)
end)