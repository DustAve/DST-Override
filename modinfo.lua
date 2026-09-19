name = "DustAve's Override - Organized"
description = "Fixes, compatibility patches and optional Russian localization for The Fun Gang, SCP-035, SCP-049 and A.T.P. Soldat."
author = "DustAve"
version = "1.2.0-organized"

api_version = 10
priority = -1001

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
hamlet_compatible = false

-- No hard Workshop dependency here: every feature is written to no-op when
-- its target mod is absent. The split/publication versions have exact deps.
all_clients_require_mod = true
client_only_mod = false

server_filter_tags = { "override", "fix", "compatibility" }

configuration_options =
{
    {
        name = "RALSEI_M_NIGHTVISION",
        label = "Ralsei: Night Vision + Darkness Immunity",
        hover = "Enables night vision and immunity to darkness for Ralsei.",
        options =
        {
            { description = "Enabled", data = true },
            { description = "Disabled", data = false },
        },
        default = true,
    },
    {
        name = "RUSSIAN_LOCALIZATION",
        label = "The Fun Gang: Russian Localization",
        hover = "Enables Russian translation and localized visual assets for The Fun Gang.",
        options =
        {
            { description = "Enabled", data = true },
            { description = "Disabled", data = false },
        },
        default = true,
    },
    {
        name = "SCP035_RUSSIAN_LOCALIZATION",
        label = "SCP-035: Русская локализация",
        hover = "Включает русскую локализацию контента SCP-035.",
        options =
        {
            { description = "Включено", data = true },
            { description = "Выключено", data = false },
        },
        default = true,
    },
    {
        name = "SCP049_RUSSIAN_LOCALIZATION",
        label = "SCP-049: Русская локализация",
        hover = "Включает русскую локализацию контента SCP-049.",
        options =
        {
            { description = "Включено", data = true },
            { description = "Выключено", data = false },
        },
        default = true,
    },
    {
        name = "SOLDAT_RUSSIAN_LOCALIZATION",
        label = "A.T.P. Soldat: Русская локализация",
        hover = "Включает русскую локализацию A.T.P. Soldat.",
        options =
        {
            { description = "Включено", data = true },
            { description = "Выключено", data = false },
        },
        default = true,
    },
}
