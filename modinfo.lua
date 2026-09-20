name = "DST Override"
description = "Это мод, перезаписывающий моды в моей сборке. Он исправляет различные баги/логику, добавляет русскую локализацию и иногда фичи в используемых модах."
author = "DustAve"
version = "1.0"

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
        label = "Ральзей: Иммунитет к темноте",
        hover = "Включает ночное зрение и иммунитет к темноте у Ральзея.",
        options =
        {
            { description = "Enabled", data = true },
            { description = "Disabled", data = false },
        },
        default = true,
    },
    {
        name = "RUSSIAN_LOCALIZATION",
        label = "The Fun Gang: Русская локализация",
        hover = "Включает русскую локализацию The Fun Gang.",
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
        hover = "Включает русскую локализацию SCP-035.",
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
        hover = "Включает русскую локализацию SCP-049.",
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
