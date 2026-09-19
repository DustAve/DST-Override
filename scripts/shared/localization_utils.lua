--------------------------------------------------------------------------
-- Shared localization helpers
-- Pure helper module: it intentionally does not access GLOBAL directly.
--------------------------------------------------------------------------

local M = {}

function M.DeepCopy(value, typefn, pairsfn)
    if typefn(value) ~= "table" then
        return value
    end

    local out = {}
    for k, v in pairsfn(value) do
        out[k] = M.DeepCopy(v, typefn, pairsfn)
    end
    return out
end

function M.DeepMerge(dst, src, typefn, pairsfn, copy_values)
    if typefn(dst) ~= "table" or typefn(src) ~= "table" then
        return dst
    end

    for k, v in pairsfn(src) do
        if typefn(v) == "table" and typefn(dst[k]) == "table" then
            M.DeepMerge(dst[k], v, typefn, pairsfn, copy_values)
        elseif copy_values then
            dst[k] = M.DeepCopy(v, typefn, pairsfn)
        else
            dst[k] = v
        end
    end

    return dst
end


-- Recursively copy only keys that are absent in dst.
-- Localization uses this after DST's final TranslateStringTable pass so
-- newly-added vanilla keys inherit the active localized GENERIC strings.
function M.DeepFillMissing(dst, fallback, typefn, pairsfn)
    if typefn(dst) ~= "table" or typefn(fallback) ~= "table" then
        return dst
    end

    for k, v in pairsfn(fallback) do
        if dst[k] == nil then
            dst[k] = M.DeepCopy(v, typefn, pairsfn)
        elseif typefn(dst[k]) == "table" and typefn(v) == "table" then
            M.DeepFillMissing(dst[k], v, typefn, pairsfn)
        end
    end

    return dst
end


-- Rebuild a mod character from the current vanilla GENERIC speech table while
-- preserving the override's translated/custom layer.  Vanilla keys that a
-- legacy character mod later reintroduces in English are intentionally NOT
-- copied back.  Keys that do not exist in GENERIC at all (true mod-only
-- speech keys) are retained from the previous table as a compatibility net.
function M.DeepPreserveExtraKeys(dst, src, fallback, typefn, pairsfn)
    if typefn(dst) ~= "table" or typefn(src) ~= "table" then
        return dst
    end

    local fallback_is_table = typefn(fallback) == "table"

    for k, v in pairsfn(src) do
        local fallback_v = fallback_is_table and fallback[k] or nil

        if fallback_v == nil then
            if dst[k] == nil then
                dst[k] = M.DeepCopy(v, typefn, pairsfn)
            elseif typefn(dst[k]) == "table" and typefn(v) == "table" then
                -- The translated overlay already owns this custom branch;
                -- only retain extra children it did not translate explicitly.
                M.DeepFillMissing(dst[k], v, typefn, pairsfn)
            end
        elseif typefn(v) == "table"
            and typefn(fallback_v) == "table"
            and typefn(dst[k]) == "table" then
            M.DeepPreserveExtraKeys(dst[k], v, fallback_v, typefn, pairsfn)
        end
    end

    return dst
end

-- Build a copy of GENERIC while explicitly resolving each leaf through DST's
-- path-based LanguageTranslator.  This is intentionally different from simply
-- copying STRINGS.CHARACTERS.GENERIC: translations are keyed by a path such as
-- "STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHTREE_MOON".  A copied English value
-- under a mod character path will NOT be translated automatically.
function M.DeepTranslatedCopy(value, basepath, translator, typefn, pairsfn)
    if typefn(value) ~= "table" then
        if translator ~= nil
            and typefn(translator.GetTranslatedString) == "function" then
            local translated = translator:GetTranslatedString(basepath)
            if translated ~= nil and translated ~= "" then
                return translated
            end
        end
        return value
    end

    local out = {}
    for k, v in pairsfn(value) do
        local path = basepath .. "." .. k
        out[k] = M.DeepTranslatedCopy(v, path, translator, typefn, pairsfn)
    end
    return out
end

function M.RebuildCharacterFromGeneric(STRINGS, character, localized_overlay, typefn, pairsfn, translator)
    if STRINGS == nil or STRINGS.CHARACTERS == nil then
        return false
    end

    local generic = STRINGS.CHARACTERS.GENERIC
    if typefn(generic) ~= "table" or typefn(localized_overlay) ~= "table" then
        return false
    end

    local previous = STRINGS.CHARACTERS[character]

    -- Ask the active PO translator for the GENERIC path explicitly.  This
    -- makes the fallback work with Russification Pack / current DST PO data
    -- even when GENERIC itself was copied before its final translation pass.
    local rebuilt = M.DeepTranslatedCopy(
        generic,
        "STRINGS.CHARACTERS.GENERIC",
        translator,
        typefn,
        pairsfn
    )

    -- The authored Russian/custom layer always wins over GENERIC.
    M.DeepMerge(rebuilt, localized_overlay, typefn, pairsfn, true)

    -- Retain only genuinely mod-specific keys from whatever the original mod
    -- may have appended after our modmain ran.  Do not retain its vanilla-key
    -- English strings: the translated GENERIC tree above is authoritative.
    if typefn(previous) == "table" then
        M.DeepPreserveExtraKeys(rebuilt, previous, generic, typefn, pairsfn)
    end

    STRINGS.CHARACTERS[character] = rebuilt
    return true
end

function M.InstallTalkerTranslation(inst, translations, marker, typefn)
    if inst == nil or translations == nil or marker == nil then
        return
    end

    local function TryInstall()
        if inst == nil or not inst:IsValid()
            or inst.components == nil
            or inst.components.talker == nil
            or inst.components.talker[marker] then
            return false
        end

        local talker = inst.components.talker
        local old_Say = talker.Say
        if old_Say == nil then
            return false
        end

        talker[marker] = true
        talker.Say = function(self, script, ...)
            if typefn(script) == "string" and translations[script] ~= nil then
                script = translations[script]
            end
            return old_Say(self, script, ...)
        end
        return true
    end

    -- Install synchronously whenever possible. This is required for SCP-035,
    -- whose first possession line can be spoken immediately after AddComponent.
    if not TryInstall() and inst.DoTaskInTime ~= nil then
        inst:DoTaskInTime(0, TryInstall)
    end
end

function M.ApplyActionStrings(GLOBAL, STRINGS, mapping, pairsfn)
    STRINGS.ACTIONS = STRINGS.ACTIONS or {}

    for action_id, text in pairsfn(mapping) do
        STRINGS.ACTIONS[action_id] = text

        if GLOBAL.ACTIONS ~= nil
            and GLOBAL.ACTIONS[action_id] ~= nil then
            GLOBAL.ACTIONS[action_id].str = text
        end
    end
end

return M
