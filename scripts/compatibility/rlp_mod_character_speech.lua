-- Compatibility bridge for the Russian Language Pack (RLP).
--
-- RLP translates speech received from the server on the client.  Its
-- GetFromSpeechesHash() has a GENERIC/Wilson fallback, but that fallback only
-- runs when SpeechHashTbl already contains an entry for the speaking
-- character.  Old Workshop characters such as SOLDAT are unknown to RLP, so
-- their current vanilla fallback lines remain in English.
--
-- Registering an EMPTY character table is intentional: RLP then executes its
-- normal character lookup and falls through to SpeechHashTbl.GENERIC.  We do
-- not alias/replace GENERIC and we preserve any native RLP table if a future
-- version adds first-class support for one of these characters.

local GLOBAL = GLOBAL
local rawget = GLOBAL.rawget
local type = GLOBAL.type
local pairs = GLOBAL.pairs

local TARGETS =
{
    SOLDAT       = "SOLDAT_RUSSIAN_LOCALIZATION",
    SCP035PLAYER = "SCP035_RUSSIAN_LOCALIZATION",
    PLAGUEDOCTOR = "SCP049_RUSSIAN_LOCALIZATION",
    KRIS_M       = "RUSSIAN_LOCALIZATION",
    SUSIE_M      = "RUSSIAN_LOCALIZATION",
    RALSEI_M     = "RUSSIAN_LOCALIZATION",
}

local function ConfigEnabled(name)
    if GetModConfigData == nil then
        return true
    end
    local ok, value = GLOBAL.pcall(GetModConfigData, name)
    return not ok or value == true
end

local function ApplyRLPCharacterFallbacks()
    local mods = rawget(GLOBAL, "mods")
    local rlp = mods ~= nil and mods.RussianLanguagePack or nil
    local hashes = rlp ~= nil and rlp.SpeechHashTbl or nil

    if type(hashes) ~= "table" or type(hashes.GENERIC) ~= "table" then
        return false
    end

    for character, config_name in pairs(TARGETS) do
        if ConfigEnabled(config_name) and type(hashes[character]) ~= "table" then
            hashes[character] = {}
        end
    end

    return true
end

-- With our low priority RLP is normally ready already.  The later passes are
-- defensive against different client/server mod-load ordering.
ApplyRLPCharacterFallbacks()

if AddSimPostInit ~= nil then
    AddSimPostInit(function()
        ApplyRLPCharacterFallbacks()

        if GLOBAL.TheWorld ~= nil and GLOBAL.TheWorld.DoTaskInTime ~= nil then
            GLOBAL.TheWorld:DoTaskInTime(0, ApplyRLPCharacterFallbacks)
            GLOBAL.TheWorld:DoTaskInTime(1, ApplyRLPCharacterFallbacks)
        end
    end)
end

return ApplyRLPCharacterFallbacks
