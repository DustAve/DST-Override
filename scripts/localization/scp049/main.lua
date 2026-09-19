local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
local type = GLOBAL.type
local pairs = GLOBAL.pairs

local L10N = require("shared/localization_utils")

if not TUNING.SCP049_RUSSIAN_LOCALIZATION then
    return
end

local speech = require("localization/scp049/speech_ru")
local modern = require("localization/scp049/modern_content_ru")

-- Replace the legacy character table instead of merging into it.  Merging
-- leaves newer English vanilla keys from the old Workshop mod intact, which
-- prevents a Russian GENERIC fallback from ever being used for those keys.
local doctor_early = speech ~= nil and L10N.DeepCopy(speech, type, pairs) or {}
if modern ~= nil then
    L10N.DeepMerge(doctor_early, modern, type, pairs, true)
end
STRINGS.CHARACTERS.PLAGUEDOCTOR = doctor_early

-- Canonical Russian SCP terminology.
STRINGS.CHARACTER_TITLES.plaguedoctor = "Чумной доктор"
STRINGS.CHARACTER_NAMES.plaguedoctor = "SCP-049"
STRINGS.CHARACTER_DESCRIPTIONS.plaguedoctor = "*Смертельное прикосновение; некоторые существа невосприимчивы\n*Может возвращать мёртвых к жизни\n*Неустанно борется с Поветрием\n*Не умеет быстро бегать"
STRINGS.CHARACTER_QUOTES.plaguedoctor = "\"Поветрие здесь, и я его чую.\""
STRINGS.CHARACTER_SURVIVABILITY.plaguedoctor = "[УДАЛЕНО]"
STRINGS.NAMES.PLAGUEDOCTOR = "SCP-049"

STRINGS.SKIN_NAMES.plaguedoctor_none = "SCP-049"
STRINGS.SKIN_NAMES.plaguedoctor_survivor = "Выживший"
STRINGS.SKIN_NAMES.plaguedoctor_old = "Старая школа"
STRINGS.SKIN_QUOTES.plaguedoctor_survivor = "\"Прекратите сопротивляться.\""
STRINGS.SKIN_QUOTES.plaguedoctor_old = "\"Оглядываясь назад, этот облик кажется нелепым...\""
STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_none = "Он избавит вас от болезни — хотите вы того или нет."
STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_survivor = "SCP-049 потратил не одну жизнь, совершенствуя своё Лекарство, и потратит ещё столько же, сколько потребуется."
STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_old = "SCP-049 утверждает, что присутствовал ещё во времена средневековых крестовых походов в Европе и живёт уже очень, очень давно."

STRINGS.NAMES.SCPZOMBIE = "SCP-049-2"
STRINGS.NAMES.CUSTOM_PIGCORPSE_FX = "Труп"
STRINGS.NAMES.SCP035HOST = "Носитель SCP-035"

local SCP049_ACTION_STRINGS =
{
    SPAWN049_2 = "Провести операцию над",
    USESCP035 = "Использовать",
}

local function ApplySCP049ActionStrings()
    L10N.ApplyActionStrings(GLOBAL, STRINGS, SCP049_ACTION_STRINGS, pairs)
end

ApplySCP049ActionStrings()
if AddSimPostInit ~= nil then
    AddSimPostInit(ApplySCP049ActionStrings)
end

local D = STRINGS.CHARACTERS
if D.GENERIC and D.GENERIC.DESCRIBE then
    D.GENERIC.DESCRIBE.SCPZOMBIE = "Мне очень, очень не нравится, как оно постоянно на меня смотрит."
    D.GENERIC.DESCRIBE.SCP035HOST = "Это ужасает!"
end
if D.WILLOW and D.WILLOW.DESCRIBE then
    D.WILLOW.DESCRIBE.SCPZOMBIE = "Фу-у, как же он воняет!"
end
if D.WOLFGANG and D.WOLFGANG.DESCRIBE then
    D.WOLFGANG.DESCRIBE.SCPZOMBIE = "А-а-а! Свинья-зомби!"
end
if D.WENDY and D.WENDY.DESCRIBE then
    D.WENDY.DESCRIBE.SCPZOMBIE = "Из него вырвали саму жизнь. Возможно, это и есть Лекарство."
end
if D.WX78 and D.WX78.DESCRIBE then
    D.WX78.DESCRIBE.SCPZOMBIE = "РЕАНИМИРОВАННАЯ СВИНЬЯ"
end
if D.WICKERBOTTOM and D.WICKERBOTTOM.DESCRIBE then
    D.WICKERBOTTOM.DESCRIBE.SCPZOMBIE = "Боже мой, доктор реанимировал эту свинью!"
end
if D.WOODIE and D.WOODIE.DESCRIBE then
    D.WOODIE.DESCRIBE.SCPZOMBIE = "Неправильно это всё."
end
if D.WAXWELL and D.WAXWELL.DESCRIBE then
    D.WAXWELL.DESCRIBE.SCPZOMBIE = "Этот доктор сотворил настоящее противоестественное чудовище!"
end
if D.WATHGRITHR and D.WATHGRITHR.DESCRIBE then
    D.WATHGRITHR.DESCRIBE.SCPZOMBIE = "Оно вновь живо и готово к битве!"
end
if D.WEBBER and D.WEBBER.DESCRIBE then
    D.WEBBER.DESCRIBE.SCPZOMBIE = "Ой! Зомби!"
end
if D.WINONA and D.WINONA.DESCRIBE then
    D.WINONA.DESCRIBE.SCPZOMBIE = "Оно всё время на меня смотрит..."
end
if D.WORTOX and D.WORTOX.DESCRIBE then
    D.WORTOX.DESCRIBE.SCPZOMBIE = "Настоящее проклятие: душа заперта в теле, которым не может управлять."
end
if D.WORMWOOD and D.WORMWOOD.DESCRIBE then
    D.WORMWOOD.DESCRIBE.SCPZOMBIE = "Хвостик-круть снова жив?"
end
if D.WARLY and D.WARLY.DESCRIBE then
    D.WARLY.DESCRIBE.SCPZOMBIE = "Я не позволю этому приблизиться к моей кухне!"
end
if D.WURT and D.WURT.DESCRIBE then
    D.WURT.DESCRIBE.SCPZOMBIE = "Глурп, свинолюд пахнет хуже обычного."
end

D.PLAGUEDOCTOR.DESCRIBE.SCPZOMBIE = "Вы исцелены."
D.PLAGUEDOCTOR.DESCRIBE.SCP035HOST = "Полагаю, всё почти как в старые времена, старый друг."
D.PLAGUEDOCTOR.DESCRIBE.SCP035ITEM = "Как поживаете, старый друг?"
D.PLAGUEDOCTOR.DESCRIBE.SCP035CRYPT = "Знакомое ощущение...! Мне нужно открыть эту дверь."
D.PLAGUEDOCTOR.DESCRIBE.SCP035CRYPT_OPEN = "Боже, сколько же времени вы там провели?"

-- How other survivors describe SCP-049. These tables are appended by
-- SCP-049's modmain and therefore are not part of speech_plaguedoctor.lua.
D.GENERIC.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "%s выглядит весьма тревожно...",
    ATTACKER = "Я буду держаться от %s как можно, можно дальше.",
    MURDERER = "Н-не приближайся ко мне!!",
    REVIVER = "Ты обязан рассказать мне, %s, как ты оживляешь мёртвых?",
    GHOST = "%s выглядит ещё аномальнее обычного.",
    FIRESTARTER = "Ты собираешься выжечь Поветрие огнём, %s?",
}
D.WILLOW.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "О-ой... привет, %s...",
    ATTACKER = "Мне не нравится взгляд %s.",
    MURDERER = "Не поймаешь меня — не превратишь в зомби!",
    REVIVER = "Я всё равно не доверяю %s.",
    GHOST = "Похоже, твоё прикосновение тебя подвело, %s!",
    FIRESTARTER = "Я почти начинаю к тебе теплеть, %s. Почти.",
}
D.WOLFGANG.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "П-привет, страшный п-птичий доктор!",
    ATTACKER = "Н-не подходи к Вольфгангу!",
    MURDERER = "Нет!! Пожалуйста!! Не делай Вольфганга зомби!",
    REVIVER = "Страшный птичий доктор не злой?",
    GHOST = "Страшный птичий доктор умер?",
    FIRESTARTER = "Страшный птичий доктор разводит огонь!",
}
D.WENDY.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "%s, предвестник смерти.",
    ATTACKER = "Я встречу тебя с распростёртыми объятиями, %s.",
    MURDERER = "Нет смысла оттягивать неизбежное. Забери меня, %s.",
    REVIVER = "Ты мне нравишься, %s.",
    GHOST = "Как тебе удалось умереть, %s?",
    FIRESTARTER = "%s начинает апокалипсис.",
}
D.WX78.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "ОШИБКА: ОБНАРУЖЕНА АНОМАЛИЯ",
    ATTACKER = "%s ЭФФЕКТИВНО ИСПОЛЬЗУЕТ СВОЮ СИЛУ.",
    MURDERER = "ТВОЁ ПРИКОСНОВЕНИЕ НА МЕНЯ НЕ ДЕЙСТВУЕТ. ХА ХА ХА.",
    REVIVER = "%s СПЕЦИАЛИЗИРУЕТСЯ НА УБИЙСТВЕ МЯСНЫХ МЕШКОВ.",
    GHOST = "ДАЖЕ С ТВОИМ ДАРОМ СМЕРТИ ТЫ НИЖЕ МЕНЯ",
    FIRESTARTER = "НА ТВОЁМ НАРЯДЕ ПЕПЕЛ, %s.",
}
D.WICKERBOTTOM.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Боже мой, руки %s испачканы кровью.",
    ATTACKER = "%s представляет опасность для окружающих.",
    MURDERER = "Сражаться с %s было бы самоубийством. Советую бежать.",
    REVIVER = "Несмотря на внешность, %s — прекрасно воспитанный джентльмен.",
    GHOST = "Возможно, так даже лучше.",
    FIRESTARTER = "%s представляет опасность для окружающих.",
}
D.WOODIE.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Я ему не доверяю.",
    ATTACKER = "Не хочу, чтобы он приближался ко мне или к Люси.",
    MURDERER = "Не смей трогать Люси своими руками!",
    REVIVER = "Может, я ошибался насчёт тебя, а, %s?",
    GHOST = "Хмф.",
    FIRESTARTER = "%s опасен!",
}
D.WAXWELL.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Что это за «Поветрие», о котором ты постоянно твердишь?!",
    ATTACKER = "Привести тебя сюда было ошибкой, %s.",
    MURDERER = "Нет! Я не позволю превратить себя в безмозглое чудовище!",
    REVIVER = "Так... эм... без обид?",
    GHOST = "Скатертью дорога.",
    FIRESTARTER = "Что, думаешь выжечь из нас болезнь?",
}
D.WATHGRITHR.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "На руках %s кровь!",
    ATTACKER = "%s не заслуживает доверия.",
    MURDERER = "В твоём способе сражаться нет чести, %s!",
    REVIVER = "Идём, я научу тебя сражаться как настоящий воин!",
    GHOST = "Мы благословлены тем, что сила %s на нашей стороне!",
    FIRESTARTER = "%s хочет сжечь нас заживо!",
}
D.WEBBER.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "П-привет... %s...",
    ATTACKER = "Мы не хотим быть рядом с ним.",
    MURDERER = "П-пожалуйста, не (всхлип) обижай нас!",
    REVIVER = "Мы не можем держаться за руки, но мы всё равно друзья! Правда, %s?",
    GHOST = "Ты всё равно нас пугаешь, %s!",
    FIRESTARTER = "%s разводит пожары!",
}
D.WINONA.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Ого, у тебя на руках многовато крови, %s.",
    ATTACKER = "Мне не нравится, как ты на меня смотришь, %s!",
    MURDERER = "Бежим!",
    REVIVER = "Ты всё ещё слегка жутковат, %s.",
    GHOST = "В таком виде он больше не сможет делать зомби.",
    FIRESTARTER = "%s пытается лечить нас огнём!",
}
D.WARLY.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Даже не приближай эти руки к моей еде, %s!",
    ATTACKER = "%s начинает меня пугать.",
    MURDERER = "%s нас всех убьёт!!",
    REVIVER = "%s, пожалуйста, перестань пускать своих «последователей» на мою кухню.",
    GHOST = "Если честно, это скорее облегчение.",
    FIRESTARTER = "О, не знал, что ты увлекаешься огнём, %s!",
}
D.WORTOX.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Прикосновение %s куда сильнее моего. Хмф.",
    ATTACKER = "%s шалит!",
    MURDERER = "Это уже не розыгрыш! Ты порабощаешь бедные души!",
    REVIVER = "Решил быть хорошим, %s?",
    GHOST = "Даже твоя смерть не освободила эти бедные души.",
    FIRESTARTER = "Я знал, что в душе ты проказник, %s! Хи-хи!",
}
D.WORMWOOD.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Доктор-клюв?",
    ATTACKER = "Доктор-клюв страшный.",
    MURDERER = "Доктор-клюв убивает нас!",
    REVIVER = "Доктор-клюв хороший?",
    GHOST = "Доктор-клюв умер.",
    FIRESTARTER = "Нет! Плохой доктор-клюв!",
}
D.WURT.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "Ты страшный!",
    ATTACKER = "Бежим! Бежим!",
    MURDERER = "М-моя чешуя защищает кожу!.. Ведь так?",
    REVIVER = "Ты всё равно страшный, флорп.",
    GHOST = "Теперь уже не такой страшный, флорп!",
    FIRESTARTER = "Нет! Хватит всё поджигать!",
}
D.PLAGUEDOCTOR.DESCRIBE.PLAGUEDOCTOR =
{
    GENERIC = "О, другая версия меня самого?",
    ATTACKER = "...",
    MURDERER = "Мы делаем то, что необходимо в борьбе с Поветрием.",
    REVIVER = "В конце концов, самый надёжный союзник — я сам.",
    GHOST = "Боже правый, весьма тревожное зрелище.",
    FIRESTARTER = "Я разочарован в себе.",
}
D.PLAGUEDOCTOR.DESCRIBE.ROSIE =
{
    GENERIC = "Говорите, вы прибыли со звёзд?",
    ATTACKER = "%s куда жестокее, чем может показаться.",
    MURDERER = "Королевская кровь или нет — вы больны и нуждаетесь в Лекарстве.",
    REVIVER = "Знания %s из-за пределов звёзд оказываются полезными.",
    GHOST = "Словно смотришь в бездну.",
    FIRESTARTER = "Если вы продолжите, мне придётся вмешаться, %s.",
}
D.PLAGUEDOCTOR.DESCRIBE.WURT =
{
    GENERIC = "О? Здравствуй, рыбье дитя.",
    ATTACKER = "...",
    MURDERER = "Твой вид не обладает иммунитетом к Поветрию. Иди сюда, дитя.",
    REVIVER = "%s — превосходный представитель своего вида.",
    GHOST = "Пустошь — не место для ребёнка.",
    FIRESTARTER = "Я не стану терпеть такое поведение.",
}

-- Full set of Uncompromising Mode compatibility inspect lines from SCP-049.
D.PLAGUEDOCTOR.DESCRIBE.TOAD = "С этим легко справиться."
D.PLAGUEDOCTOR.DESCRIBE.MUSHROOMSPROUT_OVERWORLD = "Мне не нужна эта помеха, отвлекающая от *настоящего* Поветрия."
D.PLAGUEDOCTOR.DESCRIBE.UNCOMPROMISING_RAT = "Обычные грызуны. В Европе я видел их в избытке."
D.PLAGUEDOCTOR.DESCRIBE.RATPOISON = "Я мог бы найти этому и другое применение."
D.PLAGUEDOCTOR.DESCRIBE.RATPOISONBOTTLE = "Любопытный ингредиент."
D.PLAGUEDOCTOR.DESCRIBE.GASMASK = "С воздушными токсинами я способен справиться без помощи."
D.PLAGUEDOCTOR.DESCRIBE.PLAGUEMASK = "Я польщён."
D.PLAGUEDOCTOR.DESCRIBE.SPIDERQUEENCORPSE = "Хм. Посмотрим, что я смогу с этим сделать."
D.PLAGUEDOCTOR.DESCRIBE.FLAMEGEYSER = "О, великолепно. Повсюду извергается лава."
D.PLAGUEDOCTOR.DESCRIBE.MOCK_DRAGONFLY = "Боже правый! Почему оно здесь?"
D.PLAGUEDOCTOR.DESCRIBE.SNOWPILE = "Моя лаборатория не сможет работать, если её засыплет снегом."
D.PLAGUEDOCTOR.DESCRIBE.SNOWBALL_THROWABLE = "Детская забава. Мне неинтересно."
D.PLAGUEDOCTOR.DESCRIBE.SNOWGOGGLES = "Способность видеть *может* оказаться полезной."
D.PLAGUEDOCTOR.DESCRIBE.SHOCKWORM = "И снова необъяснимая аномалия."
D.PLAGUEDOCTOR.DESCRIBE.ZASPBERRY = "Придаёт аномальную бодрость."
D.PLAGUEDOCTOR.DESCRIBE.SNOWMONG = "Словно мне и без того мало хищников, желающих моей смерти."
D.PLAGUEDOCTOR.DESCRIBE.ICEBOOMERANG = "Обоюдоострое оружие."
D.PLAGUEDOCTOR.DESCRIBE.MINOTAUR_BOULDER = "Что-то в этой конструкции меня заинтересовало."
D.PLAGUEDOCTOR.DESCRIBE.MINOTAUR_BOULDER_BIG = "Этого громилу, вероятно, можно перехитрить."
D.PLAGUEDOCTOR.DESCRIBE.BUSHCRAB = "О, здравствуйте."
D.PLAGUEDOCTOR.DESCRIBE.TOADLING = "Оно переносит заразу, но не Поветрие."
D.PLAGUEDOCTOR.DESCRIBE.DISEASECUREBOMB = "Позволяет сосредоточиться на Поветрии, а не на пустой работе во дворе."
D.PLAGUEDOCTOR.DESCRIBE.SHROOM_SKIN_FRAGMENT = "Боюсь, кусок такого размера... почти бесполезен."
D.PLAGUEDOCTOR.DESCRIBE.SCORPION = "До попадания сюда мне не доводилось видеть скорпиона вживую."
D.PLAGUEDOCTOR.DESCRIBE.AIR_CONDITIONER = "Я научился просто не обращать внимания на ужасные запахи."
D.PLAGUEDOCTOR.DESCRIBE.SPOREPACK = "Ах, сколько инструментов сюда поместится."
D.PLAGUEDOCTOR.DESCRIBE.SALTPACK = "Помогает держать операционный стол свободным от снега."
D.PLAGUEDOCTOR.DESCRIBE.TRAPDOOR = "Обычная кучка земли."
D.PLAGUEDOCTOR.DESCRIBE.SPIDER_TRAPDOOR = "Вы выбрали не ту цель для засады."
D.PLAGUEDOCTOR.DESCRIBE.RAT_TAIL = "И что, по-вашему, мне делать с подобной вещью?"
D.PLAGUEDOCTOR.DESCRIBE.MONSTERSMALLMEAT = "Я не планирую когда-либо проголодаться настолько сильно."
D.PLAGUEDOCTOR.DESCRIBE.COOKEDMONSTERSMALLMEAT = "Я не люблю рисковать без необходимости."
D.PLAGUEDOCTOR.DESCRIBE.MONSTERSMALLMEAT_DRIED = "Сомневаюсь, что все токсины исчезли."
D.PLAGUEDOCTOR.DESCRIBE.SKELETONMEAT = "В отличие от других существ, содержавшихся рядом со мной, я не дикарь."

-- Snapshot the complete Russian SCP-049 layer after all synchronous custom
-- inspect lines above have been added.  Late rebuilds use the current localized
-- GENERIC table for every vanilla key and then put this SCP-specific layer back.
local SCP049_LOCALIZED_SPEECH = L10N.DeepCopy(STRINGS.CHARACTERS.PLAGUEDOCTOR, type, pairs)

local function RebuildSCP049FromCurrentGeneric()
    return L10N.RebuildCharacterFromGeneric(
        STRINGS,
        "PLAGUEDOCTOR",
        SCP049_LOCALIZED_SPEECH,
        type,
        pairs,
        GLOBAL.LanguageTranslator
    )
end

if AddSimPostInit ~= nil then
    AddSimPostInit(RebuildSCP049FromCurrentGeneric)
end

if AddPrefabPostInit ~= nil then
    AddPrefabPostInit("plaguedoctor", function(inst)
        RebuildSCP049FromCurrentGeneric()
        if inst ~= nil and inst.DoTaskInTime ~= nil then
            inst:DoTaskInTime(0, RebuildSCP049FromCurrentGeneric)
        end
    end)
end

local TALK =
{
    ["Something is wrong..."] = "Что-то не так...",
    ["It is resistant to my touch..."] = "Оно невосприимчиво к моему прикосновению...",
    ["I must advance my cure immediately."] = "Я должен немедленно усовершенствовать Лекарство.",
    ["I need a patient with human-like anatomy."] = "Мне нужен пациент с человекоподобной анатомией.",
    ["The Pestilence grows stronger."] = "Поветрие крепнет.",
    ["The world around me, fallen ill."] = "Мир вокруг меня охвачен болезнью.",
    ["Everyone is sick. Sick!"] = "Все больны. Больны!",
    ["I am doing this world a disservice, I can still save them."] = "Я подвожу этот мир. Я всё ещё могу их спасти.",
    ["The pestilence has taken over. Everyone will fall if I don't advance my cure."] = "Поветрие взяло верх. Все падут, если я не усовершенствую Лекарство.",
    ["J’ai échoué dans ce monde."] = "Я потерпел неудачу в этом мире.",
    ["La maladie... C’est autour de nous..."] = "Болезнь... Она окружает нас...",
    ["Ashes, ashes, we all fall down..."] = "Пепел, пепел — и все мы падём...",
    ["No! No. We are not doing that again."] = "Нет! Нет. Мы больше не станем это повторять.",
}

AddPlayerPostInit(function(inst)
    if inst.prefab == "plaguedoctor" then
        L10N.InstallTalkerTranslation(inst, TALK, "_dustave_scp049_ru_wrapped", type)
    end
end)


--------------------------------------------------------------------------
-- Pig / Bunnyman reactions to SCP-049
--
-- The original mod hard-codes these lines inside pigbunnybrain_049.lua,
-- so they never pass through STRINGS.CHARACTERS.PLAGUEDOCTOR.
--------------------------------------------------------------------------

local PREY_TALK =
{
    ["SCARY BEAK MAN!"] = "СТРАШНЫЙ ЧЕЛОВЕК-КЛЮВ!",
    ["AAAAAHHH!!!"] = "А-А-А-А!!!",
    ["NO NO NO!!"] = "НЕТ! НЕТ! НЕТ!!",

    ["SCARY!"] = "СТРАШНО!",
    ["AAH!"] = "А-А!",
    ["NO!"] = "НЕТ!",
}

AddPrefabPostInit("pigman", function(inst)
    L10N.InstallTalkerTranslation(inst, PREY_TALK, "_dustave_scp049_prey_ru_wrapped", type)
end)

AddPrefabPostInit("bunnyman", function(inst)
    L10N.InstallTalkerTranslation(inst, PREY_TALK, "_dustave_scp049_prey_ru_wrapped", type)
end)

print("[DustAve Override] SCP-049 Russian localization loaded.")
