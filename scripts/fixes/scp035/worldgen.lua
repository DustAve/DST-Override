--------------------------------------------------------------------------
-- SCP-035 Worldgen Fix
-- Fixes workshop-2011916582
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING

-- SCP-035 sets this from its own modworldgenmain.lua.
-- If it is nil, SCP-035 is not enabled.
local spawnmode = TUNING.SCP035SPAWN

if spawnmode == nil then
    return
end

--------------------------------------------------------------------------
-- Fix crypt/spawner disappearing after a failed worldgen attempt.
--
-- Original SCP-035 keeps:
--
--     local cryptspawned = false
--
-- outside AddRoomPreInit, so it survives worldgen retries.
--
-- We replace its count function with a new closure each time the room
-- definition is rebuilt. Therefore the flag resets on every attempt.
--------------------------------------------------------------------------

local roomname

if spawnmode == 0 then
    roomname = "LichenMeadow"
else
    roomname = "Graveyard"
end

AddRoomPreInit(roomname, function(room)
    room.contents = room.contents or {}
    room.contents.countstaticlayouts =
        room.contents.countstaticlayouts or {}

    local spawned_this_attempt = false

    room.contents.countstaticlayouts["Scp035crypt"] = function()
        if spawned_this_attempt then
            return 0
        end

        spawned_this_attempt = true
        return 1
    end
end)

--------------------------------------------------------------------------
-- Fix required_prefabs check.
--
-- Original mod uses:
--
--     not TUNING.SCP035SPAWN == 0
--
-- which is not equivalent to:
--
--     TUNING.SCP035SPAWN ~= 0
--------------------------------------------------------------------------

local function Contains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end

    return false
end

local function AddRequiredPrefab(tasksetdata, prefab)
    tasksetdata.required_prefabs =
        tasksetdata.required_prefabs or {}

    if not Contains(tasksetdata.required_prefabs, prefab) then
        table.insert(tasksetdata.required_prefabs, prefab)
    end
end

AddLevelPreInitAny(function(tasksetdata)
    if spawnmode == 0 then

        -- Underground
        if tasksetdata.location == "cave" then
            AddRequiredPrefab(tasksetdata, "scp035crypt")
        end

    elseif spawnmode == 1 then

        -- Aboveground
        if tasksetdata.location == "forest" then
            AddRequiredPrefab(tasksetdata, "scp035crypt")
        end

    elseif spawnmode == 2 then

        -- Florid Postern mode uses scp035spawner
        if tasksetdata.location == "forest" then
            AddRequiredPrefab(tasksetdata, "scp035spawner")
        end
    end
end)

print("[DustAve Override][SCP-035] Worldgen fixes loaded.")