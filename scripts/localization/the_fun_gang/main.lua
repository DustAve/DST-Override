local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
local type = GLOBAL.type
local pairs = GLOBAL.pairs
local ipairs = GLOBAL.ipairs
local L10N = require("shared/localization_utils")

if TUNING.RUSSIAN_LOCALIZATION then
    local function InstallCharacterSpeech(character, module_name)
        local translated = require(module_name)
        -- Do not merge into the original mod's table: its newer vanilla keys
        -- may still be English and would block the localized GENERIC fallback.
        STRINGS.CHARACTERS[character] =
            translated ~= nil and L10N.DeepCopy(translated, type, pairs) or {}
    end

    InstallCharacterSpeech("KRIS_M", "localization/the_fun_gang/speech_kris_ru")
    InstallCharacterSpeech("SUSIE_M", "localization/the_fun_gang/speech_susie_ru")
    InstallCharacterSpeech("RALSEI_M", "localization/the_fun_gang/speech_ralsei_ru")


    STRINGS.DELTA_UNLOCKNAME = {
        SOMEONE = "чью-то",
        YOURSELF = "твою"
    }

    STRINGS.DELTA_UNLOCKTEXT = {
        SUSIE_M = "Сьюзи разблокировала Алый Взмах!",
        RALSEI_M = "Ральзей разблокировал Парное Исцеление!",
        KRIS_M = "Крис разблокировал X-Разрез!",
        YOURSELF = "Ты разблокировал X-Разрез!",
    }

    STRINGS.ACTIONS.KRIS_HEADBAND = "Подумать о Крисе"
    STRINGS.ACTIONS.LANCER_PICKUP = "Поднять"
    STRINGS.ACTIONS.LANCER_STARTWORKING = "Собирать ресурсы"
    STRINGS.ACTIONS.LANCER_STOPWORKING = "Взять перерыв"
    STRINGS.ACTIONS.RALSEI_PET = "Погладить"
    STRINGS.ACTIONS.KRIS_SAVEPOINT = "Использовать"
    STRINGS.ACTIONS.DELTA_UPGRADE = "Улучшить"


    STRINGS.SPELLS.DELTA_DEFEND= "Защита"

    STRINGS.SPELLS.KRIS_SOUL= TUNING.KRIS_M_SOUL_COST and "Высвободить ("..TUNING.KRIS_M_SOUL_COST.."%)"
    STRINGS.SPELLS.KRIS_COURAGE= TUNING.KRIS_M_COURAGE_COST and "Мужество ("..TUNING.KRIS_M_COURAGE_COST.."%)"
    STRINGS.SPELLS.KRIS_XSLASH= TUNING.KRIS_M_XSLASH_COST and "X-Разрез ("..TUNING.KRIS_M_XSLASH_COST.."%)"

    STRINGS.SPELLS.SUSIE_RUDEBUSTER= TUNING.SUSIE_M_RUDEBUSTER_COST and "Ярый Взмах ("..TUNING.SUSIE_M_RUDEBUSTER_COST.."%)"
    STRINGS.SPELLS.SUSIE_REDBUSTER= TUNING.SUSIE_M_REDBUSTER_COST and "Алый Взмах ("..TUNING.SUSIE_M_REDBUSTER_COST.."%)"
    STRINGS.SPELLS.SUSIE_ULTIMATEHEAL= TUNING.SUSIE_M_ULTIMATEHEAL_COST and "Ультимативное исцеление ("..TUNING.SUSIE_M_ULTIMATEHEAL_COST.."%)"
    STRINGS.SPELLS.SUSIE_OKHEAL= TUNING.SUSIE_M_OKHEAL_COST and "Ок-исцеление ("..TUNING.SUSIE_M_OKHEAL_COST.."%)"
    STRINGS.SPELLS.SUSIE_BETTERHEAL= TUNING.SUSIE_M_BETTERHEAL_COST and "Лучшее исцеление ("..TUNING.SUSIE_M_BETTERHEAL_COST.."%)"

    STRINGS.SPELLS.RALSEI_HEALPRAYER= TUNING.RALSEI_M_HEALPRAYER_COST and "Молитва исцеления ("..TUNING.RALSEI_M_HEALPRAYER_COST.."%)"
    STRINGS.SPELLS.RALSEI_DUALHEAL= TUNING.RALSEI_M_DUALHEAL_COST and "Парное исцеление ("..TUNING.RALSEI_M_DUALHEAL_COST.."%)"
    STRINGS.SPELLS.RALSEI_PACIFY= TUNING.RALSEI_M_PACIFY_COST and "Умиротворение ("..TUNING.RALSEI_M_PACIFY_COST.."%)"

    STRINGS.ACTIONS.USESPELLBOOK.KRIS_SPELLBOOK = "Действие/Защита"
    STRINGS.ACTIONS.CLOSESPELLBOOK.DELTA_SPELLBOOK = "Отменить"
    STRINGS.ACTIONS.USESPELLBOOK.RALSUSIE_SPELLBOOK = "Магия/Защита"


    STRINGS.CHARACTERS.KRIS_M.KRIS_COURAGE = {
        "$$﹡ Ты использовал МУЖЕСТВО!",
        "$$﹡ Ты поддержал команду!",
    }
    STRINGS.CHARACTERS.KRIS_M.KRIS_SOLOCOURAGE = {
        "$$﹡ Ты использовал МУЖЕСТВО!",
        "$$﹡ Ты подбодрил сам себя!",
    }
    STRINGS.CHARACTERS.KRIS_M.ACTIONFAIL.CASTAOE.KRIS_COURAGE_FAILED = "$$﹡ Но это прошло так, будто бы тебя тут и не было..." 

    STRINGS.CHARACTERS.KRIS_M.KRIS_SOUL = {
        "$$﹡ Твоя ДУША сияет светом " 
    }	

    STRINGS.CHARACTERS.KRIS_M.ACTIONFAIL.CASTAOE.KRIS_SOUL_FAILED = {
        "$$﹡ Но твоя ДУША была отвергнута..." ,
        "$$﹡ Но твоя ДУША выглядит неполноценной..." ,
        "$$﹡ Но ничего не произошло..." ,
    }	
    STRINGS.CHARACTERS.KRIS_M.KRIS_XSLASH = {
        "$$﹡ Крис использует X-РАЗРЕЗ!",
    }

    STRINGS.CHARACTERS.KRIS_M.ACTIONFAIL.CASTAOE.KRIS_SOUL_NOTARGET = "$$﹡ Но тут никого нет..." 
    STRINGS.CHARACTERS.KRIS_M.ACTIONFAIL.CASTAOE.NOT_ENOUGH_TP = "$$﹡ Но твой ПН недостаточно высок..." 
    STRINGS.CHARACTERS.KRIS_M.ACTIONFAIL.CASTAOE.KRIS_XSLASH_NOTARGET = {
        "$$﹡ Твой меч режет воздух.",
    }
    STRINGS.CHARACTERS.KRIS_M.ACTIONFAIL.CASTAOE.DEFEND_COOLDOWN = {
        "$$﹡ Но твой меч остался похожим по форме на меч." 
    }	

    STRINGS.CHARACTERS.RALSEI_M.RALSEI_HEALPRAYER = {
        "Я помогу тебе почувствовать себя лучше!",
        "Ты в порядке?",
    }
    STRINGS.CHARACTERS.RALSEI_M.RALSEI_DUALHEAL= {
        "Я помогу тебе почувствовать себя лучше!",
        "Все, будьте здоровы!",
    }

    STRINGS.CHARACTERS.RALSEI_M.ACTIONFAIL.CASTAOE.RALSEI_M_HEALING_FAILED = {
        "Я усвоил урок о исцелении противников..." ,
        "Я, эм, не должен делать это." ,
        "Я исцелю тебя, как только ты пообещаешь стать нашим другом!" ,
    }	
    STRINGS.CHARACTERS.RALSEI_M.ACTIONFAIL.CASTAOE.RALSEI_M_NOTARGET = {
        "Эм, тут никто не нуждается в исцелении...",
    }	

    STRINGS.CHARACTERS.RALSEI_M.ACTIONFAIL.CASTAOE.DEFEND_COOLDOWN = {
        "Е-еще нет!",
        "Неподходящий момент!",
    }	

    STRINGS.CHARACTERS.RALSEI_M.ACTIONFAIL.CASTAOE.NOT_ENOUGH_TP = "У меня недостаточно ПН для этого!" 

    STRINGS.CHARACTERS.SUSIE_M.ACTIONFAIL.CASTAOE.NOT_ENOUGH_TP = "Сначала мне нужно больше ПН" 
    STRINGS.CHARACTERS.SUSIE_M.ACTIONFAIL.CASTAOE.DEFEND_COOLDOWN = {
        "Не сейчас!",
        "Меньше защиты, больше атаки!",	
    }	
    STRINGS.CHARACTERS.SUSIE_M.SUSIE_REFUSE = { 
        "Эй, руки прочь!",
        "Я не сниму это!",
        "Ага, не позволю.",
        "Неа.",
        "Это мое!",
        "Мне это нужно!",
        "Не сниму, пока не найду что-то получше.",
    }

    STRINGS.CHARACTERS.SUSIE_M.KRIS_HEADBAND = { 
        "Крис, подсоби!",
        "Э-э-э... Крис? Мне показалось я слышала их голос...",
        "Вот бы Крис был здесь...",
        "Эй, Крис... зацени!",
    }

    STRINGS.CHARACTERS.RALSEI_M.KRIS_HEADBAND = { 
        "Я ценю это!",
        "Спасибо, Крис!",
        "Я чувствую, будто я могу все с помощью Криса!",
        "Давай работать вместе!",
    }

    STRINGS.CHARACTERS.RALSEI_M.RALSEI_PET = { 
        "О-ох!",
        "Я... мягкий?",
        "(Это приятно...)",
        "Ха-ха, н-нормально ли, что мне уделяют столько внимания?!",
        "(Приятно, когда тебя гладят...)",
        "Ахахах! Щекотно!",
        "USER",
    }
    STRINGS.CHARACTERS.RALSEI_M.RALSEI_NOMOREPET = { 
        "Э-этого хватит пока что!",
        "Д-давай займемся чем-нибудь еще!",
        "...",
        "(... передозировка поглаживанием!)"
        
    }
    STRINGS.RALSEI_PET_SUSIE_M = { 
        "С-Сьюзи?!",
        "Сьюзи? Ты...",
    }

    STRINGS.RALSEI_PET_RALSEI_M = {
        "Т-ты можешь это делать??",
        "Я могу... гладить себя...?",
    }
    STRINGS.RALSEI_PET_KRIS_M = {
        "К... Крис!?",
        "Крис...?",
        "Это... то что ты должен делать...?",
    }

    STRINGS.RALSEI_PET_NONDELTA = {
        "А-ах?",
        "Хахахах!",
        
    }


    STRINGS.CHARACTER_ABOUTME.kris_m = "Никто не может выбрать кем быть в этом мире. Ты,\nname\,тоже..."
    STRINGS.CHARACTER_BIOS.kris_m = {
    { title = "День рождения", desc = "Неизвестно" },
    { title = "Любимая еда", desc = "Пирог их мамы, но в качестве альтернативы они согласятся и на ирисково-коричный пирог." },
    { title = "Их прошлое", desc = 
        "﹡ (Ты посмотрел на текст с закрытыми глазами.)\n﹡ (...)\n﹡ (... Ты ничего не увидел.)"
    },
    }
    STRINGS.CHARACTER_ABOUTME.susie_m = "Бывшая задира, а теперь - девушка, в чьем сердце живет надежда. Она сделает все от себя зависящее, чтобы убедиться в том, что эта история получит счастливую концовку.."
    STRINGS.CHARACTER_BIOS.susie_m = {
    { title = "День рождения", desc = "Неизвестно" },
    { title = "Любимая еда", desc = "Съест что угодно, но с котелковым тортом от Ральзея связаны тёплые воспоминания." },
    { title = "Ее прошлое...", desc = "Все еще предстоит узнать."},
    }

    STRINGS.CHARACTER_ABOUTME.ralsei_m = "Принц, как говорится в пророчестве. Он знает так много всего, что даже трудно знать, когда будет время поговорить о них.."
    STRINGS.CHARACTER_BIOS.ralsei_m = {
    { title = "Дата создания", desc = "Неизвестно" },
    { title = "Любимая еда", desc = "Нет (он все еще учится наслаждаться ради себя)" },
    { title = "Его прошлое...", desc = "Все еще предстоит узнать."},
    }


    -- kris
    STRINGS.CHARACTER_TITLES.kris_m = "Человек"
    STRINGS.CHARACTER_NAMES.kris_m = "Крис"
    STRINGS.CHARACTER_DESCRIPTIONS.kris_m = "*Тихая личность\n*Обучался оккультизму\n*Спит как убитый\n*Может многое, но не магию"
    STRINGS.CHARACTER_QUOTES.kris_m = "﹡ (Это то, что они называют \"тобой\".)"
    STRINGS.CHARACTER_SURVIVABILITY.kris_m = "Не говорит"

    STRINGS.NAMES.KRIS_M = "Крис"
    STRINGS.SKIN_NAMES.kris_m_none = "Крис"
    STRINGS.SKIN_NAMES.KRIS_M = "Крис"
    STRINGS.SKIN_DESCRIPTIONS.kris_m_none = "Тело, вмещающее человеческую ДУШУ."
    STRINGS.CHARACTER_QUOTES.kris_m_none =  "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_eye = "Крис"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_eye = "Тело, вмещающее человеческую ДУШУ."
    STRINGS.SKIN_QUOTES.ms_kris_m_eye ="﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_light = "Странный ребенок"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_light = "По какой-то причине ты решил снова лечь спать......"
    STRINGS.SKIN_QUOTES.ms_kris_m_light = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_light_eye = "Странный ребенок"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_light_eye = "По какой-то причине ты решил снова лечь спать..."
    STRINGS.SKIN_QUOTES.ms_kris_m_light_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_rock = "Гитарист"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_rock = "Готовься! Музыка это командный спорт!"
    STRINGS.SKIN_QUOTES.ms_kris_m_rock = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_rock_eye = "Гитарист"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_rock_eye = "Готовься! Музыка это командный спорт!"
    STRINGS.SKIN_QUOTES.ms_kris_m_rock_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_sharpshooter = "Меткий стрелок"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_sharpshooter = "Задай им жару!"
    STRINGS.SKIN_QUOTES.ms_kris_m_sharpshooter = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_sharpshooter_eye = "Меткий стрелок"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_sharpshooter_eye = "Задай им жару!!"
    STRINGS.SKIN_QUOTES.ms_kris_m_sharpshooter_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_cowboy = "Ковбой"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_cowboy = "Ни мальчик, ни корова. Название соответствует одежде."
    STRINGS.SKIN_QUOTES.ms_kris_m_cowboy = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_cowboy_eye = "Ковбой"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_cowboy_eye = "Ни мальчик, ни корова. Название соответствует одежде."
    STRINGS.SKIN_QUOTES.ms_kris_m_cowboy_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_doctor = "Доктор/Медсестра"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_doctor = "Все относились к врагам с нежной заботой и любовью!"
    STRINGS.SKIN_QUOTES.ms_kris_m_doctor = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_doctor_eye = "Доктор/Медсестра"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_doctor_eye = "Все относились к врагам с нежной заботой и любовью!"
    STRINGS.SKIN_QUOTES.ms_kris_m_doctor_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_halloween = "Хэллоуинский наряд"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_halloween = "В эту священную ночь можно притвориться кем-то нечеловеческим."
    STRINGS.SKIN_QUOTES.ms_kris_m_halloween = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_halloween_eye = "Хэллоуинский наряд"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_halloween_eye = "В эту священную ночь можно притвориться кем-то нечеловеческим."
    STRINGS.SKIN_QUOTES.ms_kris_m_halloween_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_animal = "Закулисный монстр"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_animal = "Крис и Ральзей контроллируют Сьюзи с помощью веревки как нежелательную марионетку."
    STRINGS.SKIN_QUOTES.ms_kris_m_animal = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_animal_eye = "Закулисный монстр"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_animal_eye = "Крис и Ральзей контроллируют Сьюзи с помощью веревки как нежелательную марионетку."
    STRINGS.SKIN_QUOTES.ms_kris_m_animal_eye = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_cooking = "Официант"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_cooking = "Лови еду головой, чтобы СЛОЖИТЬ ИХ В СТОПКУ!"
    STRINGS.SKIN_QUOTES.ms_kris_m_cooking = "﹡ (Это то, что они называют \"тобой\".)"

    STRINGS.SKIN_NAMES.ms_kris_m_cooking_eye = "Официант"
    STRINGS.SKIN_DESCRIPTIONS.ms_kris_m_cooking_eye = "Лови еду головой, чтобы СЛОЖИТЬ ИХ В СТОПКУ!"
    STRINGS.SKIN_QUOTES.ms_kris_m_cooking_eye = "﹡ (Это то, что они называют \"тобой\".)"

    -- susie

    STRINGS.CHARACTER_TITLES.susie_m = "Монстр"
    STRINGS.CHARACTER_NAMES.susie_m = "Сьюзи"
    STRINGS.CHARACTER_DESCRIPTIONS.susie_m = "*Съест почти все что угодно\n*Не заботят твои выборы\n*Плохиш\n*Может сотворять заклинания"
    STRINGS.CHARACTER_QUOTES.susie_m = "\"Я? Я по вашему какой-то герой или типа того?\""
    STRINGS.CHARACTER_SURVIVABILITY.susie_m = "Выбрала вечность"

    STRINGS.NAMES.SUSIE_M = "Сьюзи"
    STRINGS.SKIN_NAMES.susie_m_none = "Сьюзи"
    STRINGS.SKIN_NAMES.SUSIE_M = "Сьюзи"
    STRINGS.SKIN_DESCRIPTIONS.susie_m_none = "Последнее приключение Сьюзи было неплохим, и она в восторге от этого тоже! Но что-то в этом Темном Мире не то..."
    STRINGS.CHARACTER_QUOTES.susie_m_none =  "\"Я? Я по вашему какой-то герой или типа того?\""

    STRINGS.SKIN_NAMES.ms_susie_m_noeye = "Сьюзи"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_noeye = "Последнее приключение Сьюзи было неплохим, и она в восторге от этого тоже! Но что-то в этом Темном Мире не то..."
    STRINGS.SKIN_QUOTES.ms_susie_m_noeye = "\"Я? Я по вашему какой-то герой или типа того?\""

    STRINGS.SKIN_NAMES.ms_susie_m_light = "Задира"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_light = "Не будет ничего делать, кроме как драться."
    STRINGS.SKIN_QUOTES.ms_susie_m_light = "\"Тихие люди меня бесят.\""

    STRINGS.SKIN_NAMES.ms_susie_m_light_noeye = "Задира"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_light_noeye = "Не будет ничего делать, кроме как драться."
    STRINGS.SKIN_QUOTES.ms_susie_m_light_noeye = "\"Тихие люди меня бесят.\""

    STRINGS.SKIN_NAMES.ms_susie_m_rock = "Барабанщица"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_rock = "Сьюзи... будет делать все по своему."
    STRINGS.SKIN_QUOTES.ms_susie_m_rock = "\"Нам РЕАЛЬНО надо создать собственную группу!\""

    STRINGS.SKIN_NAMES.ms_susie_m_rock_noeye = "Барабанщица"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_rock_noeye = "Сьюзи... будет делать все по своему."
    STRINGS.SKIN_QUOTES.ms_susie_m_rock_noeye = "\"Нам РЕАЛЬНО надо создать собственную группу!\""

    STRINGS.SKIN_NAMES.ms_susie_m_sharpshooter = "Меткий стрелок"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_sharpshooter = "Все готовятся сразить врагов наповал!"
    STRINGS.SKIN_QUOTES.ms_susie_m_sharpshooter = "\"Наконец, хоть какой-то чертов ГЕЙМПЛЕЙ.\""

    STRINGS.SKIN_NAMES.ms_susie_m_sharpshooter_noeye = "Меткий стрелок"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_sharpshooter_noeye = "Все готовятся сразить врагов наповал!"
    STRINGS.SKIN_QUOTES.ms_susie_m_sharpshooter_noeye = "\"Наконец, хоть какой-то чертов ГЕЙМПЛЕЙ.\""

    STRINGS.SKIN_NAMES.ms_susie_m_cowboy = "Ковбой"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_cowboy = "У Сьюзи такое чувство, что эта игра будет хорошей."
    STRINGS.SKIN_QUOTES.ms_susie_m_cowboy = "\"Дикий запад, хм...\""

    STRINGS.SKIN_NAMES.ms_susie_m_cowboy_noeye = "Ковбой"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_cowboy_noeye = "У Сьюзи такое чувство, что эта игра будет хорошей.."
    STRINGS.SKIN_QUOTES.ms_susie_m_cowboy_noeye = "\"Дикий запад, хм...\""

    STRINGS.SKIN_NAMES.ms_susie_m_doctor = "Доктор"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_doctor = "Все относились к врагам с нежной заботой и любовью!"
    STRINGS.SKIN_QUOTES.ms_susie_m_doctor = "\"Неотложка? Черта с два. Как будто врачи меня вообще ПОНИМАЮТ!\""

    STRINGS.SKIN_NAMES.ms_susie_m_doctor_noeye = "Доктор"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_doctor_noeye = "Все относились к врагам с нежной заботой и любовью!"
    STRINGS.SKIN_QUOTES.ms_susie_m_doctor_noeye = "\"Неотложка? Черта с два. Как будто врачи меня вообще ПОНИМАЮТ!\""

    STRINGS.SKIN_NAMES.ms_susie_m_halloween = "Хэллоуинский наряд"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_halloween = "Конфета будет все такой же вкусной после того как я ее раздавлю. Наверное."
    STRINGS.SKIN_QUOTES.ms_susie_m_halloween = "\"Это НАМНОГО лучше, чем одеваться коробкой на Хэллоуин.\""

    STRINGS.SKIN_NAMES.ms_susie_m_halloween_noeye = "Хэллоуинский наряд"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_halloween_noeye = "Конфета будет все такой же вкусной после того как я ее раздавлю. Наверное."
    STRINGS.SKIN_QUOTES.ms_susie_m_halloween_noeye = "\"Это НАМНОГО лучше, чем одеваться коробкой на Хэллоуин.\""

    STRINGS.SKIN_NAMES.ms_susie_m_animal = "Сьюзилла"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_animal = "Сьюзи станет нашей врагоразбивающей, сумашедше крутящейся звездой дня!"
    STRINGS.SKIN_QUOTES.ms_susie_m_animal = "\"Угадайте кто, идиоты.\""

    STRINGS.SKIN_NAMES.ms_susie_m_animal_noeye = "Сьюзилла"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_animal_noeye = "Сьюзи станет нашей врагоразбивающей, сумашедше крутящейся звездой дня!"
    STRINGS.SKIN_QUOTES.ms_susie_m_animal_noeye = "\"Угадайте кто, идиоты.\""

    STRINGS.SKIN_NAMES.ms_susie_m_cooking = "Шеф-повар(?)"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_cooking = "Сьюзи скорее всего приготовит ГОРЯЧИЙ ОГОНЬ."
    STRINGS.SKIN_QUOTES.ms_susie_m_cooking =  "\"Воу, уже все кончилось? Черт, мы только начали веселиться!!\""

    STRINGS.SKIN_NAMES.ms_susie_m_cooking_noeye = "Шеф-повар(?)"
    STRINGS.SKIN_DESCRIPTIONS.ms_susie_m_cooking_noeye = "Сьюзи скорее всего приготовит ГОРЯЧИЙ ОГОНЬ."
    STRINGS.SKIN_QUOTES.ms_susie_m_cooking_noeye = "\"Воу, уже все кончилось? Черт, мы только начали веселиться!!\""

    -- ralsei

    STRINGS.CHARACTER_TITLES.ralsei_m = "Принц из тьмы"
    STRINGS.CHARACTER_NAMES.ralsei_m = "Ральзей"
    STRINGS.CHARACTER_DESCRIPTIONS.ralsei_m = "*Хорошо знаком с тьмой\n*Хочет сделать Светлых счастливыми\n*Не любит сражаться\n*Может сотворять заклинания"
    STRINGS.CHARACTER_QUOTES.ralsei_m =  "\"Надеюсь мы можем быть хорошими друзьями!\""
    STRINGS.CHARACTER_SURVIVABILITY.ralsei_m = "Уже предрешено"

    STRINGS.NAMES.RALSEI_M = "Ральзей"
    STRINGS.SKIN_NAMES.ralsei_m_none = "Ральзей"
    STRINGS.SKIN_NAMES.RALSEI_M = "Ральзей"
    STRINGS.SKIN_DESCRIPTIONS.ralsei_m_none = "Это новый Темный Мир? Ральзей не уверен, но он верит, что Веселая банда разберется!"
    STRINGS.CHARACTER_QUOTES.ralsei_m_none =  "\"Надеюсь мы можем быть хорошими друзьями!\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_hat = "Пушистик"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_hat = "Сущность из Темного Мира. Не имеет подданых."
    STRINGS.SKIN_QUOTES.ms_ralsei_m_hat = "\"Это не тот мир, где доброта всегда побеждает, да?\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_rock = "Вокалист"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_rock = "Ральзей старается играть идеально."
    STRINGS.SKIN_QUOTES.ms_ralsei_m_rock = "\"Эм... м-может, выберем что-нибудь помягче?\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_sharpshooter = "Меткий стрелок"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_sharpshooter = "Все готовятся сбить шляпы врагов!"
    STRINGS.SKIN_QUOTES.ms_ralsei_m_sharpshooter = "\"Мои пули полны дружбы!\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_doctor = "Медбрат"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_doctor = "Все относились к врагам с нежной заботой и любовью!"
    STRINGS.SKIN_QUOTES.ms_ralsei_m_doctor = "\"Если ты заболел, разве не стоит съесть суп? Скажи 'ааа'~!\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_butler = "Дворецкий"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_butler = "Ральзей готов служить тебе."
    STRINGS.SKIN_QUOTES.ms_ralsei_m_butler = "\"Э-эмм, тебе не обязательно было кричать... Просто потому что тебе нравится мой внешний вид!\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_halloween = "Хэллоуинский наряд"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_halloween = "У Ральзея нет гадостей, запланированных на эту ночь."
    STRINGS.SKIN_QUOTES.ms_ralsei_m_halloween = "\"Конфет хватит на вас всех, хаха!\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_animal = "Закулисный монстр"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_animal = "Крис и Ральзей контроллируют Сьюзи с помощью веревки как нежелательную марионетку."
    STRINGS.SKIN_QUOTES.ms_ralsei_m_animal = "\"Ой! Сьюзи, твой костюм такой очаро... эм, страшный.\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_cooking = "Шеф-повар"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_cooking = "А теперь быстро переверните эти яичницы, а то они станут ТВЕРДЫМИ!"
    STRINGS.SKIN_QUOTES.ms_ralsei_m_cooking = "\"Увидимся в следующем эпизоде!!\""

    STRINGS.SKIN_NAMES.ms_ralsei_m_horse = "Лошадь"
    STRINGS.SKIN_DESCRIPTIONS.ms_ralsei_m_horse = "РАЛЬЗЕЙ С ПРЕРИЙ теперь разблокирован в Константе!"
    STRINGS.SKIN_QUOTES.ms_ralsei_m_horse = "\"Почему я должен быть лошадью...!?\""


    STRINGS.NAMES.KRIS_SWORD = "Деревянный клинок"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.KRIS_SWORD= "Розовый меч."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.KRIS_SWORD= {
        "Сильнее меча? Может быть равны, в лучшем случае.",
        "Деревянный тренировочный клинок с сердечником, усиленным углеволокном."	
    }
    STRINGS.RECIPE_DESC.KRIS_SWORD= "Потерял карандаш?"

    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.KRIS_SWORD= {
        "Че это!? ЗУБОЧИСТКА?",
        "Это следы от укусов? Крис, ты должен был поделиться!!",
    }

    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.KRIS_SWORD= {
        "Это твой, Крис...",
        "Мечи не такие уж страшные, если их держит Крис...",
    }

    STRINGS.NAMES.SUSIE_AX = "Гривистая секира"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUSIE_AX= "Это большая секира."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.SUSIE_AX= {
        "Выкована из гривы драконьего отпрыска",
        "Вам показалось, что вы заметили волосы, прилипшие к краю лезвия."
    }
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.SUSIE_AX= {
        "Хочешь увидеть что я могу сделать с этим?",
        "Стой смирно. Я оформлю тебе прическу.",
    }
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.SUSIE_AX= {
        "Э-э-э... она немного большевата.",
        "О-осторожнее, куда ты этим размахиваешь, Сьюзи!"
    }
    STRINGS.RECIPE_DESC.SUSIE_AX= "Потеряла свою расческу?"

    STRINGS.NAMES.RALSEI_SCARF = "Красный шарф"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.RALSEI_SCARF= "Красный шарф."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.RALSEI_SCARF= {
        "Сделано из легкого магического волокна.",
        "По ощущениям как теплые объятия.",
    }	
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.RALSEI_SCARF= {
        "Это вещь Ральзея, не моя.",
        "Никогда не узнаю, как он этим наносит урон.",
    }	
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.RALSEI_SCARF= {
        "Какой он мягкий! Потрогай, Крис!",
        "Эмм, если тебе холодно, то я могу поделиться своим шарфом...",
    }
    STRINGS.RECIPE_DESC.RALSEI_SCARF= "Потерял свой шарф?"

    STRINGS.CHARACTERS.GENERIC.DESCRIBE.RALSEI_CAULDRON= {
        BURNT = "Котелок отъехал.",
        COOKING_LONG = "Это займет время.",
        COOKING_SHORT = "Почти готово!",
        DONE = "Ммммм! Кушать подано!",
        EMPTY = "Я чувствую себя голодным просто смотря на него.",
    }
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.RALSEI_CAULDRON= {
        BURNT = "Похоже готовка вышал из-под контроля.",
        COOKING_LONG = "Может, тебе стоит пока помыть руки?.",
        COOKING_SHORT = "Если ты закроешь глаза, всего на секунду...",
        DONE = "Готово.",
        EMPTY = "Ты надеешься, что Ральзей планирует скоро приготовить пирог.",
    }

    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.RALSEI_CAULDRON= {
        BURNT = "А?! Как это произошло??",
        COOKING_LONG = "Может мы могли заняться чем-нибудь веселым пока что?",
        COOKING_SHORT = "(Я надеюсь Крису и Сьюзи это понравится!)",
        DONE = "(Я надеюсь Крису и Сьюзи это понравится!)",
        EMPTY = "Готовить в котле очень удобно!",
    }

    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.RALSEI_CAULDRON= {
        BURNT = "У меня такое ощущение, что эта штука должна быть огнеупорной.",
        COOKING_LONG = "(Ждать скучно...)",
        COOKING_SHORT = "Сейчас все будет, да?",
        DONE = "Ну наконец-то! Давайте жрать!",
        EMPTY = "Ральзей может нам что-нибудь приготовить",
    }

    STRINGS.NAMES.RALSEI_CAULDRON= "Котел для готовки"
    STRINGS.RECIPE_DESC.RALSEI_CAULDRON= "Удобство приготовления пищи в котле, даже в Константе!"

    STRINGS.NAMES.RALSEI_CAKE = "Котелковый торт"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.RALSEI_CAKE= "Выглядит вкусно."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.RALSEI_CAKE= {
        "Тебе лучше съесть это как можно быстрее, пока Сьюзи не приложила свои руки.",
        "Ты съедаешь это голыми руками.",
        "Ты думаешь оставить кусочек для Ральзея.",
    }	
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.RALSEI_CAKE= {
        "Прямо из котла!",
        "Как насчёт клубничного торта в следующий раз?",
    }	
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.RALSEI_CAKE= {
        "(Мне немного стыдно от того, насколько сильно мне это нравится...)",
        "Ох! Эт... Это действительно вкусно!",
        "Я... На самом деле я никогда не ел торт до этого...",
        "Я, эм, съем еще попозже!",
    }

    STRINGS.NAMES.RALSEI_BUTTERSCOTCH_CAKE = "Ирисково-коричный пирог"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.RALSEI_BUTTERSCOTCH_CAKE= "Это пахнет вкусно!"
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.RALSEI_BUTTERSCOTCH_CAKE= {
        "На вкус замечательно... На мгновение у тебя сдавило горло.",
        "Хорошо, что у тебя ещё остался нож для поедания пирогов",
        "Поделиться теплым, только что испеченным кусочком...",
    }	
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.RALSEI_BUTTERSCOTCH_CAKE= {
        "Окей, сейчас сделай шоколадный пирог!",
        "Всегда можешь положиться на Ральзея в деле выпекания пирогов.",
        "Черт, Я поняла, почему это тебе так нравится, Крис!",
    }	
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.RALSEI_BUTTERSCOTCH_CAKE= {
        "Надеюсь, тебе это понравится, Крис...",
        "Я сделал это для Криса! Но, эмм, кто угодно другой тоже может это съесть!",
        "Было реально трудно найти тут корицу, хаха.",
        "Я, эм, съем еще попозже!",
    }

    STRINGS.NAMES.KRIS_HEADBAND = "Ободок с рогами"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.KRIS_HEADBAND= "Похоже на дьявольские рога."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.KRIS_HEADBAND= {
        "Ободок с красными рогами.",
        "Содержит особую силу, когда ты был моложе.\n...Сейчас они ничего не делают.",
        "Это не оригинальный ободок. Если бы это был оригинал, он бы не подошел тебе.",
    }	
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.KRIS_HEADBAND= {
        "Это странно, но... такое чувство будто теперь Крис сражается вместе со мной, каким-то образом.",
        "Эй, разве не это надевал Крис...",
        "Не подходит."
    }	
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.KRIS_HEADBAND= {
        "Интересно, как сейчас дела у Криса...",
        "Держа это... Я чувствую тепло.",
        "У меня уже есть рога!\n...Было бы глупо, если бы я это надел. Правда?",
    }
    STRINGS.RECIPE_DESC.KRIS_HEADBAND= "Частичка Криса на память о нём."


    STRINGS.LANCER_TALK_FIGHT = {
        "Ну что, друганы!",
        "Хо-хо!",
        "Хахаха!!!",
        "Ты не сделаешь ни шагу дальше!!!",
        "Хохохо! Я крепыш!",
        "Шаг один. Я устраиваю тебе ВЗБУЧку.\nШаг два. Ты проиграл!",	
        "Я плохиш!",
        "Ой-ой.",
        "Ахахах!!! ",
        "Я тоже могу помочь!",
        "Дружба придаёт мне сил!",
    }

    STRINGS.LANCER_TALK_DIG = {
        "Копать, копать, копать!",
        "Л отметил точку!",
        "Я выкопаю сокровище для тебя!",
        "Копать, копать!",
        "Я продолжу копать дыры!",	
        "Хохохо!!!",
        "Я найду червячков для нашего пикника!",	
    }

    STRINGS.LANCER_TALK_GIVE = {
        "Глянь!",
        "Я нашел сокровище!",
        "Посмотри! Посмотри!",
        "Вау! Бесплатная штука!",
        "Хохохо!!!",
        "Засунь это себе в дырку на штанах!",
        "OWNER!",	
    }

    STRINGS.LANCER_TALK_HURT = {
        "*Кхе... кхе*",
        "Я... Я в норме! Просто... Очень... Холодно...",
        "Хаха... холодно..",
        "*Кха*",
    }

    STRINGS.NAMES.LANCER_M = "Лансер"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.LANCER_M = "Остроголовый мальчик."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.LANCER_M = {
        GENERIC = {
            "Не хочу называть вещи своими именами, но он именно такой",
        },
        SLEEPING = {
            "$$﹡ (Невинные мальчики быстро засыпают.)",
        },	
    }
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.LANCER_M = {
        GENERIC = {
            "Эй, Лансер!!",
            "Эй, Лансер! Как ты!?",
        },
        SLEEPING = {
            "...Походу он устал.",
            "Эй... Крис, ты, типа, окей?"
        },	
    }
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.LANCER_M= {
        GENERIC = {
            "Привет, Лансер!",
            "Эм, Лансер, может тебе не следует...",
        },	
        SLEEPING = {
            "...",
            "...Крис, почему бы нам не закрыть глаза...\n и не подумать, чем сейчас занимается Сьюзи?",
            "Крис, ты, эмм...",
        },		
    }

    STRINGS.NAMES.LANCER_M_ITEM = "Лансер"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.LANCER_M_ITEM = "Обычная игральная карта."
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.LANCER_M_ITEM = {
        GENERIC = {
            "Он хотел бы отдохнуть в твоей роскошной дырке в штанах.",
            "Это карта ЛАНСЕРА.",	
        },
        STONE = {
            "...Окаменел.",
        },
    }

    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.LANCER_M_ITEM = {
        GENERIC = {
            "Он решил подремать.",
            "Эй, тебе тут удобно?",
        },
        STONE = {
            "Лансер...",
            "Нам нужно поторопиться и решить это!",
        },	
    }
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.LANCER_M_ITEM= {
        GENERIC = {
            "Это Лансер.",
            "Он дремлет.",
        },
        STONE = {
            "Не волнуйся, он вернется в нормальное состояние, в конечном счете.",
            "Он... Не может сейчас выйти.",
        },
    }
    STRINGS.RECIPE_DESC.LANCER_M_ITEM= "Хохохо!\nНаслаждайтесь моей компанией пока я не окаменел!"

    STRINGS.LANCER_OWNER_SUSIE_M = { 
        "Сьюзи!",
        "Сьюзи! Сьюзи!",
    }

    STRINGS.LANCER_OWNER_RALSEI_M = {
        "Это для тебя, мальчик-зубная паста!",
        "Посмотри-ка на это, мой милый маленький персик!",
        "Персиковый мальчик! Персиковый мальчик!"
    }
    STRINGS.LANCER_OWNER_KRIS_M = {
        "Синий человек!",
        "Крис!",
        "Посмотри, синий человек, чье имя я знаю!"
    }

    STRINGS.LANCER_OWNER_NONDELTA = {
        "Посмотри, человек, которого я еще не встречал!",
        "Странный человек!",
        "Глянь-ка, человек, чьего имени я не знаю!"
    }

    STRINGS.NAMES.DRFRIEND = "ДРУГ"
    STRINGS.NAMES.KRIS_SAVEPOINT = "Точка СОХРАНЕНИЯ"
    STRINGS.RECIPE_DESC.KRIS_SAVEPOINT= "Порой ты видишь, как оно мерцает. Свет, который видишь только ты.."

    STRINGS.CHARACTERS.KRIS_M.KRIS_M_SAVEPOINT = {
        "Сила этого места сияет внутри тебя.",
        "Сила приключений сияет внутри тебя.",
        "В тебе сияет сила, пробивающаяся сквозь любую тьму.",
        "Ты наполнен особой силой.",
        "Вы инстинктивно начинаете обращаться за помощью, и...",
        "Ты омыл своё тело светом.",
        "Твоя рука задерживается в ярком свете.",	
        "Странное спокойствие охватывает тебя.",	
        "Боль, которую ты испытывал, растаяла...",
        "Свет успокаивает тебя...",
        "Вас переполняет энергия нового приключения.",
    }


    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.KRIS_M = {
        GENERIC = "Это не ты.",
        ATTACKER = "Ты чувствуешь, как холодный пот стекает по твоей шее.",
        MURDERER = "Твоя рука хватается за грудь.",
        REVIVER = "Тебе помогло нечто, носящее твоё лицо.",
        GHOST = "Призрак чего-то, что выглядит как ты.",
        FIRESTARTER = "Это не было частью твоего плана.",
    }
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.RALSEI_M = {
        GENERIC = "Это твой товарищ, Ральзей.",
        ATTACKER = "На секунду тебе показалось, что ты видишь не Ральзея.",
        MURDERER = "Ты всматриваешься, ничего не видя.",
        REVIVER = "Ральзей снова помог тебе встать на ноги.",
        GHOST = "Ральзей пал, а ты не знаешь магии исцеления...",
        FIRESTARTER = "Ты не думал что Ральзею нравится играть с огнем.",
    }
    STRINGS.CHARACTERS.KRIS_M.DESCRIBE.SUSIE_M = {
        GENERIC = "Это твоя сообщница, Сьюзи.",
        ATTACKER = "Тебе показалось, что Сьюзи холодно сверлит тебя взглядом...",
        MURDERER = "Ты всматриваешься, ничего не видя.",
        REVIVER = "Сьюзи вернула тебя назад.",
        GHOST = "Сьюзи пала. Ты оглядываешься на поиск того, что могло бы помочь.",
        FIRESTARTER = "Похоже, Сьюзи слишком заигралась с огнем.",
    }

    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.SUSIE_M = {
        GENERIC = "Почему... почему ты так похожа на меня?",
        ATTACKER = "(У меня плохое чувство...)",
        MURDERER = "Я... Я остановлю тебя САМА!!",
        REVIVER = "Спасибо, чувиха!",
        GHOST = "Ох $!?, что случилось?",
        FIRESTARTER = "Хех, у тебя верные идеи.",
    }

    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.KRIS_M = {
        GENERIC = "Эй, лузер.",
        ATTACKER = "Крис? Ты выглядишь...",
        MURDERER = "Типа, э-э, эй, возможно вещи сейчас пойдут по странному пути...",
        REVIVER = "Я тебе должна.",
        GHOST = "Сиди смирно, чувак. Я сейчас все улажу!",
        FIRESTARTER = "Эй, хватит веселиться без меня!",
    }
    STRINGS.CHARACTERS.SUSIE_M.DESCRIBE.RALSEI_M = {
        GENERIC = "Йоу, Ральзей!",
        ATTACKER = "Ральзей? Ты в порядке?",
        MURDERER = "Э-эй, эм, я думала мы не собирались СРАЖАТЬСЯ...?",
        REVIVER = "В следующий раз я помогу тебе!",
        GHOST = "Ральзей! Вот, дай мне исцелить это!",
        FIRESTARTER = "Воу, Ральзей перешел на темную сторону!",
    }

    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.RALSEI_M = {
        GENERIC = "Ох, приветик! Ты ужасно похож на меня...",
        ATTACKER = "Ч-что ты делаешь...?",
        MURDERER = "П-пожалуйста хватит! Мы не должны этим заниматься!",
        REVIVER = "Спасибо тебе большое!",
        GHOST = "Держись, Я помогу тебе!",
        FIRESTARTER = "Н-нам не следует...",
    }
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.KRIS_M = {
        GENERIC = "Крис!!",
        ATTACKER = "Крис..?",
        MURDERER = "К-Крис? Почему бы тебе не... закрыть глаза на секунду?",
        REVIVER = "Спасибо тебе, Крис!",
        GHOST = "О нет, Крис! Дай мне помочь тебе!",
        FIRESTARTER = "К-Крис? Что ты делаешь?!",
    }
    STRINGS.CHARACTERS.RALSEI_M.DESCRIBE.SUSIE_M = {
        GENERIC = "Сьюзи!!",
        ATTACKER = "С-Сьюзи? Почему ты...",
        MURDERER = "М-можем на следует... взять перерыв от СРАЖЕНИЙ на некоторое время...?",
        REVIVER = "Я тебя тоже юблю, Сюзи!",
        GHOST = "Я помогу тебе, Сьюзи! Не волнуйся!",
        FIRESTARTER = "Сьюзи!! Это опасно!!",
    }

    STRINGS.SKIN_TAG_CATEGORIES.COLLECTION.DELTARUNE_M = "Веселая банда (ДЕЛЬТАРУНА)"
    STRINGS.SKIN_NAMES.ms_delta_cauldron = "Готовка в котле"
    STRINGS.SKIN_DESCRIPTIONS.ms_delta_cauldron = "\"Мы сможем вернуться обратно сюда, после того как наше приключение кончится...\n... и тогда я вам испеку вкуснейший торт!\""


    -- Everything above this point is the authored Russian speech layer for the
    -- three characters.  Keep a clean snapshot so late Workshop writes cannot
    -- reintroduce English vanilla lines.
    local FUN_GANG_LOCALIZED_SPEECH =
    {
        KRIS_M = L10N.DeepCopy(STRINGS.CHARACTERS.KRIS_M, type, pairs),
        SUSIE_M = L10N.DeepCopy(STRINGS.CHARACTERS.SUSIE_M, type, pairs),
        RALSEI_M = L10N.DeepCopy(STRINGS.CHARACTERS.RALSEI_M, type, pairs),
    }

    local function RebuildFunGangCharacter(character)
        local overlay = FUN_GANG_LOCALIZED_SPEECH[character]
        if overlay == nil then
            return false
        end
        return L10N.RebuildCharacterFromGeneric(STRINGS, character, overlay, type, pairs, GLOBAL.LanguageTranslator)
    end

    local function RebuildAllFunGangSpeech()
        RebuildFunGangCharacter("KRIS_M")
        RebuildFunGangCharacter("SUSIE_M")
        RebuildFunGangCharacter("RALSEI_M")
    end

    if AddSimPostInit ~= nil then
        AddSimPostInit(RebuildAllFunGangSpeech)
    end

    local FUN_GANG_PREFAB_TO_CHARACTER =
    {
        kris_m = "KRIS_M",
        susie_m = "SUSIE_M",
        ralsei_m = "RALSEI_M",
    }

    if AddPlayerPostInit ~= nil then
        AddPlayerPostInit(function(inst)
            local character = inst ~= nil and FUN_GANG_PREFAB_TO_CHARACTER[inst.prefab] or nil
            if character == nil then
                return
            end

            RebuildFunGangCharacter(character)
            if inst.DoTaskInTime ~= nil then
                inst:DoTaskInTime(0, function()
                    RebuildFunGangCharacter(character)
                end)
            end
        end)
    end

    local fn = require("play_commonfn")

    local SCRIPT_RALSEI_M1 = {
        cast = {"ralsei_m"},
        lines = {
            {roles = {"ralsei_m"}, duration = "2", line = "Прошу, герои...", anim = "dial_loop"},
            {roles = {"ralsei_m"}, duration = "3.0", line = "Выслушайте мой рассказ...", anim = "dial_loop"},
            {actionfn = fn.crowdcomment, duration = "1.5", line = "Ага, да...", prefabs = {"susie_m"}},
            {actionfn = fn.crowdcomment, duration = "1.5", line = "Тебе следует устроиться поудобнее.", prefabs = {"kris_m"}, anim = {"acting_idle1",}},

            {roles = {"ralsei_m"}, duration = "3.0", line = "Давным-давно среди теней была сложена ЛЕГЕНДА."},
            {roles = {"ralsei_m"}, duration = "2", line = "Это была ЛЕГЕНДА о НАДЕЖДАХ.\nЭто была ЛЕГЕНДА о МЕЧТАХ."},
            {roles = {"ralsei_m"}, duration = "2", line = "Это была ЛЕГЕНДА о СВЕТЕ.\nЭто была ЛЕГЕНДА о ТЬМЕ."},
            {roles = {"ralsei_m"}, duration = "2", line = "Это легенда о ДЕЛЬТА-РУНЕ."},
            {roles = {"ralsei_m"}, duration = "2.5", line = "Тысячалетиями СВЕТ и ТЬМА жили в гармонии,"},		
            {roles = {"ralsei_m"}, duration = "2.3", line = "В МИРЕ царил порядок."},
            {roles = {"ralsei_m"}, duration = "2", line = "Но стоит эту гармонию нарушить..."},
            {roles = {"ralsei_m"}, duration = "2", anim = "emote_sad", line = "Произойдет ужасная катастрофа."},
            {roles = {"ralsei_m"}, duration = "2.5", line = "Небо покроется черным ужасом\nА земля разверзнется страхом.",},
            {roles = {"ralsei_m"}, duration = "2.3", line = "И затем, под биение своего сердца..."},
            {roles = {"ralsei_m"}, duration = "2.5", anim = "emote_sad", line = "ЗЕМЛЯ испустит свой последний вздох."},
            {roles = {"ralsei_m"}, duration = "2.5", line = "И только тогда, сияя надеждой...\nНа краю МИРА появятся три ГЕРОЯ."},
            {roles = {"ralsei_m"}, duration = "2", anim = "emote_swoon", line = "ЧЕЛОВЕК,"},
            {roles = {"ralsei_m"}, duration = "2", anim = "emoteXL_angry", line = "МОНСТР,"},
            {roles = {"ralsei_m"}, duration = "2.5", anim = "emoteXL_waving1", line = "и ПРИНЦ ИЗ ТЬМЫ."},
            {roles = {"ralsei_m"}, duration = "2.5", line = "И только они могут запечатать фонтаны\nИ изгнать НЕБЕСА АНГЕЛА."},
            {roles = {"ralsei_m"}, duration = "3", anim = "emoteXL_happycheer", line = "Только тогда равновесие восстановится,\nИ МИР будет спасен от разрушения."},
            
            {actionfn = fn.crowdcomment, duration = "0", anim = "emote_slowclap", prefabs = {"kris_m"}},		
            {actionfn = fn.crowdcomment, duration = "2", line = "Слушай, давай в следующий раз обсудим некоторые из наших приключений!", anim = "emote_laugh", prefabs = {"susie_m"}},		
        }
    }

    local SCRIPT_SUSIE_M1 = {
        cast = {"susie_m"},
        lines = {
            {roles = {"susie_m"}, duration = "2.5", line = "Эй, Крис...", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2", line = "Могу я рассказать тебе...", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.5", line = "... какая у меня тупая мечта?", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.7", line = "Я... хочу быть друзьями с тобой и Ральзеем.", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.5", line = "Когда солнце снова взойдет...", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.6", line = "Я хочу чтобы завтра было как вчера.", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.7", line = "И следующий день... будет таким же как этот.", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.5", line = "И что в конечном счете,", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "3", line = "Мы всегда можем вернуться к тому, как было раньше.", anim = "dial_loop"},
            {actionfn = fn.crowdcomment, duration = "1", line = "Сьюзи...", anim = "dial_loop", prefabs = {"ralsei_m"}},			
            {roles = {"susie_m"}, duration = "2", line = "...", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "3", line = "Тебе не обязательно ничего отвечать, Крис.", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2", line = "Я... я знаю...", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "2.5", line = "Ты ведь думаешь также,", anim = "dial_loop"},
            {roles = {"susie_m"}, duration = "3", line ="... не так ли, придурок?", anim = "emoteXL_waving1"},		
            {actionfn = fn.crowdcomment, duration = "2", line = "Улыбка Сьюзи...", anim = "acting_idle1", prefabs = {"kris_m"}},	
        }
    }
    local SCRIPT_KRIS_M1 = {
        cast = {"kris_m"},
        lines = {
            {roles = {"kris_m"}, duration = "2.5", line = "Ты знаешь несколько историй, но...", anim = "acting_idle1"},
            {roles = {"kris_m"}, duration = "2.5", line = "О них не хочется рассказывать.", anim = "acting_idle1"},
            {roles = {"kris_m"}, duration = "2.5", line = "Только не когда кто-то слушает.", anim = "acting_idle1"},

            {actionfn = fn.crowdcomment, duration = "2", line = "(У них странное выражение лица.)", anim = "acting_idle1", prefabs = {"susie_m"}},		
            {roles = {"kris_m"}, duration = "2.5", line = "Может быть если бы это были только Сьюзи и Ральзей...", anim = "acting_idle1"},
            
            {actionfn = fn.crowdcomment, duration = "2", line = "(Они смотрят на меня...?)", anim = "acting_idle1", prefabs = {"ralsei_m"}},			
            {roles = {"kris_m"}, duration = "2.5", line = "Ты мог бы рассказать им о том, что у тебя на уме.", anim = "acting_idle1"},
            {roles = {"kris_m"}, duration = "2.5", line = "... Но лучше не говорить им.", anim = "acting_idle1"},
            {actionfn = fn.crowdcomment, duration = "2", line = "... Что, у меня что-то на лице или типа того?", anim = "emote_shrug", prefabs = {"susie_m"}},				
            {roles = {"kris_m"}, duration = "2.5", line = "А пока вы будете исполнять свою роль, как и обещали,", anim = "acting_idle1"},
            {roles = {"kris_m"}, duration = "2.5", line = "И ждать, когда занавес опустится.", anim = "acting_idle1"},	
            {actionfn = fn.crowdcomment, duration = "2.5", line = "Эм, Крис, ты будешь что-нибудь говорить?", prefabs = {"ralsei_m"}},	
            {roles = {"kris_m"}, duration = "1", line = "",},		
            {actionfn = fn.crowdcomment, duration = "1.5", line = "...Крис.", prefabs = {"susie_m"}},		
            {actionfn = fn.crowdcomment, duration = "2", line = "Не вой.", anim = "emote_laugh", prefabs = {"susie_m"}},		
        }
    }

    AddComponentPostInit("stageactingprop", function(self)
        if self.inst == nil then
            return
        end

        self.inst:DoTaskInTime(0, function()
            if self.scripts then
                self.scripts["RALSEI_M1"] = SCRIPT_RALSEI_M1
                self.scripts["SUSIE_M1"] = SCRIPT_SUSIE_M1
                self.scripts["KRIS_M1"] = SCRIPT_KRIS_M1
            end
        end)
    end)

    Assets = Assets or {}
    local localized_assets = {
        Asset("ATLAS", "images/names_gold_kris_m.xml"),
        Asset("IMAGE", "images/names_gold_kris_m.tex"),
        
        Asset("ATLAS", "images/names_gold_ralsei_m.xml"),
        Asset("IMAGE", "images/names_gold_ralsei_m.tex"),
        
        Asset("ATLAS", "images/names_gold_susie_m.xml"),
        Asset("IMAGE", "images/names_gold_susie_m.tex"),
        
        Asset("ATLAS", "images/names_gold_cn_kris_m.xml"),
        Asset("IMAGE", "images/names_gold_cn_kris_m.tex"),
        
        Asset("ATLAS", "images/names_gold_cn_ralsei_m.xml"),
        Asset("IMAGE", "images/names_gold_cn_ralsei_m.tex"),
        
        Asset("ATLAS", "images/names_gold_cn_susie_m.xml"),
        Asset("IMAGE", "images/names_gold_cn_susie_m.tex"),
        
        Asset("ATLAS", "images/names_kris_m.xml"),
        Asset("IMAGE", "images/names_kris_m.tex"),
        
        Asset("ATLAS", "images/names_ralsei_m.xml"),
        Asset("IMAGE", "images/names_ralsei_m.tex"),
        
        Asset("ATLAS", "images/names_susie_m.xml"),
        Asset("IMAGE", "images/names_susie_m.tex"),
        
        Asset("ANIM", "anim/tp_meter.zip"),
    }

    for _, asset in ipairs(localized_assets) do
        Assets[#Assets + 1] = asset
    end

    local _resolvefilepath = GLOBAL.resolvefilepath
    GLOBAL.resolvefilepath = function(filepath, ...)
        if type(filepath) == "string" and (filepath:find("images/names_") or filepath:find("anim/tp_meter")) then
            local my_mod_filepath = MODROOT .. filepath
            if GLOBAL.kleifileexists(my_mod_filepath) then
                return my_mod_filepath
            end
        end
        return _resolvefilepath(filepath, ...)
    end
end