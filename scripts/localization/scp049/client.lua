local GLOBAL = GLOBAL
local STRINGS = GLOBAL.STRINGS

if GetModConfigData("SCP049_RUSSIAN_LOCALIZATION") ~= true then
    return
end

STRINGS.NAMES.plaguedoctor = "SCP-049"
STRINGS.SKIN_NAMES.plaguedoctor_none = "SCP-049"
STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_none = "Он избавит вас от болезни — хотите вы того или нет."
STRINGS.CHARACTER_TITLES.plaguedoctor = "Чумной доктор"
STRINGS.CHARACTER_NAMES.plaguedoctor = "SCP-049"
STRINGS.CHARACTER_DESCRIPTIONS.plaguedoctor = "*Смертельное прикосновение; некоторые существа невосприимчивы\n*Может возвращать мёртвых к жизни\n*Неустанно борется с Поветрием\n*Не умеет быстро бегать"
STRINGS.CHARACTER_QUOTES.plaguedoctor = "\"Поветрие здесь, и я его чую.\""
STRINGS.CHARACTER_ABOUTME.plaguedoctor = "SCP-049 — врач, чей возраст исчисляется столетиями. Его прикосновение смертельно, а воля непреклонна. Его единственная цель — избавить мир от таинственного Поветрия."
STRINGS.CHARACTER_BIOS.plaguedoctor =
{
    { title = "День рождения", desc = "20 января" },
    { title = "Любимая еда", desc = "Запечённая индейка" },
    { title = "Его прошлое...", desc = "[ДАННЫЕ УДАЛЕНЫ]" },
}
STRINGS.CHARACTER_SURVIVABILITY.plaguedoctor = "[УДАЛЕНО]"
