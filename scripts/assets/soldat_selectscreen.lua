--------------------------------------------------------------------------
-- DustAve Override - A.T.P. Soldat character-select assets
--------------------------------------------------------------------------

local GLOBAL = GLOBAL
local type = GLOBAL.type

-- IMPORTANT: snapshot the config while this file is being modimported.
-- Calling GetModConfigData later from resolvefilepath() is invalid because
-- that callback runs outside modmain/modworldgenmain and DST no longer knows
-- which mod owns the request.
local USE_RUSSIAN = GetModConfigData("SOLDAT_RUSSIAN_LOCALIZATION") == true

Assets = Assets or {}

local function AddAsset(kind, path)
    Assets[#Assets + 1] = Asset(kind, path)
end

local function UseRussian()
    return USE_RUSSIAN
end

AddAsset("ATLAS", "images/soldat_fix/names_soldat.xml")
AddAsset("IMAGE", "images/soldat_fix/names_soldat.tex")
AddAsset("ATLAS", "images/soldat_fix/names_gold_soldat.xml")
AddAsset("IMAGE", "images/soldat_fix/names_gold_soldat.tex")

AddAsset("ATLAS", "images/soldat_fix_ru/names_soldat.xml")
AddAsset("IMAGE", "images/soldat_fix_ru/names_soldat.tex")
AddAsset("ATLAS", "images/soldat_fix_ru/names_gold_soldat.xml")
AddAsset("IMAGE", "images/soldat_fix_ru/names_gold_soldat.tex")

AddAsset("ATLAS", "bigportraits/soldat_fix/soldat.xml")
AddAsset("IMAGE", "bigportraits/soldat_fix/soldat.tex")
AddAsset("ATLAS", "bigportraits/soldat_none.xml")
AddAsset("IMAGE", "bigportraits/soldat_none.tex")
AddAsset("ATLAS", "images/selectscreen_portraits/soldat_none.xml")
AddAsset("IMAGE", "images/selectscreen_portraits/soldat_none.tex")

local old_resolvefilepath = GLOBAL.resolvefilepath
GLOBAL.resolvefilepath = function(filepath, ...)
    if type(filepath) == "string" then
        local use_ru = UseRussian()

        if filepath:find("images/names_gold_soldat.xml", 1, true) ~= nil then
            return MODROOT .. (use_ru and "images/soldat_fix_ru/names_gold_soldat.xml" or "images/soldat_fix/names_gold_soldat.xml")
        elseif filepath:find("images/names_gold_soldat.tex", 1, true) ~= nil then
            return MODROOT .. (use_ru and "images/soldat_fix_ru/names_gold_soldat.tex" or "images/soldat_fix/names_gold_soldat.tex")
        elseif filepath:find("images/names_soldat.xml", 1, true) ~= nil then
            return MODROOT .. (use_ru and "images/soldat_fix_ru/names_soldat.xml" or "images/soldat_fix/names_soldat.xml")
        elseif filepath:find("images/names_soldat.tex", 1, true) ~= nil then
            return MODROOT .. (use_ru and "images/soldat_fix_ru/names_soldat.tex" or "images/soldat_fix/names_soldat.tex")
        elseif filepath:find("bigportraits/soldat_none.xml", 1, true) ~= nil then
            return MODROOT .. "bigportraits/soldat_none.xml"
        elseif filepath:find("bigportraits/soldat_none.tex", 1, true) ~= nil then
            return MODROOT .. "bigportraits/soldat_none.tex"
        elseif filepath:find("images/selectscreen_portraits/soldat_none.xml", 1, true) ~= nil then
            return MODROOT .. "images/selectscreen_portraits/soldat_none.xml"
        elseif filepath:find("images/selectscreen_portraits/soldat_none.tex", 1, true) ~= nil then
            return MODROOT .. "images/selectscreen_portraits/soldat_none.tex"
        elseif filepath:find("bigportraits/soldat.xml", 1, true) ~= nil then
            return MODROOT .. "bigportraits/soldat_fix/soldat.xml"
        elseif filepath:find("bigportraits/soldat.tex", 1, true) ~= nil then
            return MODROOT .. "bigportraits/soldat_fix/soldat.tex"
        end
    end
    return old_resolvefilepath(filepath, ...)
end

print("[DustAve Override][Soldat] Character-select assets loaded")
