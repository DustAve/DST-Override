local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
local type = GLOBAL.type
local pairs = GLOBAL.pairs

if not TUNING.SOLDAT_RUSSIAN_LOCALIZATION then
    return
end

local L10N = require("shared/localization_utils")

local translated = require("localization/soldat/speech_ru")
local modern = require("localization/soldat/modern_content_ru")

-- Install the hand-written Soldat translation immediately so the character
-- never starts with an empty speech table.  Do NOT use GENERIC as the base at
-- this stage: DST can still be in the middle of applying its PO translation.
local function BuildEarlySpeech()
    if translated == nil then
        return
    end

    local speech = L10N.DeepCopy(translated, type, pairs)
    if modern ~= nil then
        L10N.DeepMerge(speech, modern, type, pairs, true)
    end
    STRINGS.CHARACTERS.SOLDAT = speech
end

-- Rebuild Soldat from the *current* vanilla GENERIC table after localization
-- has finished.  GENERIC is maintained by Klei and contains the complete key
-- layout for the current DST version (including caves and newly added content).
-- The old Workshop Soldat speech is then layered over it, so every old custom
-- Russian line is kept while every new key receives the game's localized
-- vanilla fallback instead of an English/missing string.
local SOLDAT_LOCALIZED_SPEECH = {}
if translated ~= nil then
    SOLDAT_LOCALIZED_SPEECH = L10N.DeepCopy(translated, type, pairs)
end
if modern ~= nil then
    L10N.DeepMerge(SOLDAT_LOCALIZED_SPEECH, modern, type, pairs, true)
end

local function RebuildFromCurrentGeneric()
    return L10N.RebuildCharacterFromGeneric(
        STRINGS,
        "SOLDAT",
        SOLDAT_LOCALIZED_SPEECH,
        type,
        pairs,
        GLOBAL.LanguageTranslator
    )
end

BuildEarlySpeech()

-- SimPostInit is normally late enough for the PO translation pass.
if AddSimPostInit ~= nil then
    AddSimPostInit(RebuildFromCurrentGeneric)
end

-- More importantly, rebuild again when Soldat actually spawns.  This makes
-- the override independent of Workshop mod load order and fixes cave/new-DST
-- strings even if another mod rewrites STRINGS.CHARACTERS.SOLDAT after our
-- initial modmain execution.
if AddPrefabPostInit ~= nil then
    AddPrefabPostInit("soldat", function(inst)
        RebuildFromCurrentGeneric()

        -- One zero-delay refresh also catches late frontend/world init work
        -- performed during the same spawn tick.
        if inst ~= nil and inst.DoTaskInTime ~= nil then
            inst:DoTaskInTime(0, RebuildFromCurrentGeneric)
        end
    end)
end

-- Madness Combat terminology: keep the character's proper name, localize the
-- Agency title/description around it.
STRINGS.CHARACTER_TITLES.soldat = "Элита А.П.Х.У."
STRINGS.CHARACTER_NAMES.soldat = "Солдат У.П.О."
STRINGS.CHARACTER_DESCRIPTIONS.soldat =
    "*Проворный!\n*Агрессивный!\n*Ум — не его сильная сторона."
STRINGS.CHARACTER_QUOTES.soldat =
    "\"Вершина подготовки Агентства: отточенные разум, тело и убийственный инстинкт.\""
STRINGS.CHARACTER_SURVIVABILITY.soldat = "БЕЗУМНО ВЫСОКИЕ"

STRINGS.NAMES.SOLDAT = "Солдат У.П.О."
STRINGS.SKIN_NAMES.soldat_none = "Солдат У.П.О."
