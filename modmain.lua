--------------------------------------------------------------------------
-- DustAve Override - organized entrypoint
--------------------------------------------------------------------------

-- Configuration first: every feature file reads its own TUNING switch.
modimport("scripts/config/tuning.lua")

-- Fixes
modimport("scripts/fixes/scp035/runtime.lua")
modimport("scripts/fixes/scp049/full_fix.lua")
modimport("scripts/fixes/soldat/runtime.lua")
modimport("scripts/fixes/the_fun_gang/ralsei.lua")

-- Localization
modimport("scripts/localization/the_fun_gang/main.lua")
modimport("scripts/localization/scp035/main.lua")
modimport("scripts/localization/scp049/main.lua")
modimport("scripts/localization/soldat/main.lua")

-- Assets / frontend path fixes used in-world too
modimport("scripts/assets/soldat_selectscreen.lua")

-- RLP client-side speech fallback for mod characters
modimport("scripts/compatibility/rlp_mod_character_speech.lua")

-- UI compatibility
modimport("scripts/compatibility/the_fun_gang_ui.lua")
modimport("scripts/compatibility/full_stats_party_hud.lua")
