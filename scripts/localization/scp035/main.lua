local GLOBAL = GLOBAL
local TUNING = GLOBAL.TUNING
local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
local type = GLOBAL.type
local pairs = GLOBAL.pairs

local L10N = require("shared/localization_utils")

if not TUNING.SCP035_RUSSIAN_LOCALIZATION then
    return
end

local speech = require("localization/scp035/speech_ru")

-- Start from the Russian SCP-035 table only.  This deliberately discards the
-- legacy mod's English copies of vanilla speech keys; they are restored later
-- from the game's current localized GENERIC table instead.
STRINGS.CHARACTERS.SCP035PLAYER =
    speech ~= nil and L10N.DeepCopy(speech, type, pairs) or {}

-- Canonical object terminology: SCP-035 — «Маска одержимости».
STRINGS.NAMES.SCP035ITEM = "SCP-035"
STRINGS.NAMES.SCP035EQUIPMENT = "SCP-035"
STRINGS.NAMES.SCP035CRYPT = "Древний склеп"
STRINGS.NAMES.SCP035CRYPT_OPEN = "Древний склеп"

--------------------------------------------------------------------------
-- SCP-035 action / UI strings
--
-- AddAction() copies Action.str into STRINGS.ACTIONS at registration time.
-- BufferedAction:GetActionString() later reads STRINGS.ACTIONS, so changing
-- only ACTIONS[id].str is not enough: the UI would keep showing the original
-- English text ("Use", "Discard Host", "Equip").
--------------------------------------------------------------------------

local SCP035_ACTION_STRINGS =
{
    SCP035FAKEEQUIP = "Надеть",
    UNEQUIPSCP035 = "Покинуть носителя",
    EQUIPSCP035 = "Использовать",
}

local function ApplySCP035ActionStrings()
    L10N.ApplyActionStrings(GLOBAL, STRINGS, SCP035_ACTION_STRINGS, pairs)
end

ApplySCP035ActionStrings()
if AddSimPostInit ~= nil then
    AddSimPostInit(ApplySCP035ActionStrings)
end

local D = STRINGS.CHARACTERS

-- Lines appended by SCP-035's modmain after the base speech table is loaded.
-- Keep them here because they are not present in speech_scp035player.lua itself.
if D.SCP035PLAYER ~= nil then
    D.SCP035PLAYER.DESCRIBE = D.SCP035PLAYER.DESCRIBE or {}
    D.SCP035PLAYER.DESCRIBE.SCP035ITEM = "Что?"
    D.SCP035PLAYER.DESCRIBE.SCP035EQUIPMENT = "Это я."
    D.SCP035PLAYER.DESCRIBE.SCPZOMBIE = "Он не даёт мне ими пользоваться. И я его понимаю..."
    D.SCP035PLAYER.DESCRIBE.SCP035CRYPT = "Не хочу смотреть на это ни секунды дольше."
    D.SCP035PLAYER.DESCRIBE.SCP035CRYPT_OPEN = "Не хочу смотреть на это ни секунды дольше."
    D.SCP035PLAYER.DESCRIBE_GENERIC = "Что-то."
    D.SCP035PLAYER.DESCRIBE_TOODARK = "О, сладкий-сладкий аромат роз!"
    D.SCP035PLAYER.DESCRIBE_SMOLDERING = "Обратный отсчёт до небытия!"
    D.SCP035PLAYER.EAT_FOOD = D.SCP035PLAYER.EAT_FOOD or {}
    D.SCP035PLAYER.EAT_FOOD.TALLBIRDEGG_CRACKED = "Фу."
end
if D.GENERIC and D.GENERIC.DESCRIBE then
    D.GENERIC.DESCRIBE.SCP035ITEM = "Мне хочется... надеть её..."
    D.GENERIC.DESCRIBE.SCP035CRYPT = "Если взорвать эти двери, внутри могут быть сокровища!"
    D.GENERIC.DESCRIBE.SCP035CRYPT_OPEN = "Что мы выпустили на свободу?!"
end
if D.WILLOW and D.WILLOW.DESCRIBE then
    D.WILLOW.DESCRIBE.SCP035ITEM = "О-о-о... Какая красивая..."
    D.WILLOW.DESCRIBE.SCP035CRYPT = "Фу-у-у, что это за слизь?"
    D.WILLOW.DESCRIBE.SCP035CRYPT_OPEN = "Никаких сокровищ, только дурацкая маска..."
end
if D.WOLFGANG and D.WOLFGANG.DESCRIBE then
    D.WOLFGANG.DESCRIBE.SCP035ITEM = "Вольфганг хочет надеть маленькую маску..."
    D.WOLFGANG.DESCRIBE.SCP035CRYPT = "Это старый дом?"
    D.WOLFGANG.DESCRIBE.SCP035CRYPT_OPEN = "Старый дом взорван!"
end
if D.WENDY and D.WENDY.DESCRIBE then
    D.WENDY.DESCRIBE.SCP035ITEM = "Маска... чтобы скрыть... слёзы...?"
    D.WENDY.DESCRIBE.SCP035CRYPT = "Дом для мёртвых и забытых."
    D.WENDY.DESCRIBE.SCP035CRYPT_OPEN = "Какой ужас мы выпустили в этот мир?"
end
if D.WX78 and D.WX78.DESCRIBE then
    D.WX78.DESCRIBE.SCP035ITEM = "ОБНАРУЖЕН... ВИРУС..."
    D.WX78.DESCRIBE.SCP035CRYPT = "ОШИБКА: НЕ УДАЁТСЯ ОТКРЫТЬ"
    D.WX78.DESCRIBE.SCP035CRYPT_OPEN = "СОКРОВИЩ НЕ ОБНАРУЖЕНО"
end
if D.WICKERBOTTOM and D.WICKERBOTTOM.DESCRIBE then
    D.WICKERBOTTOM.DESCRIBE.SCP035ITEM = "Какая... прекрасная... комедийная маска..."
    D.WICKERBOTTOM.DESCRIBE.SCP035CRYPT = "Склеп, судя по всему, греческой архитектуры."
    D.WICKERBOTTOM.DESCRIBE.SCP035CRYPT_OPEN = "Именно здесь мы нашли тот... прекрасный... древний артефакт."
end
if D.WOODIE and D.WOODIE.DESCRIBE then
    D.WOODIE.DESCRIBE.SCP035ITEM = "Симпатичная маска... Правда, Люси?"
    D.WOODIE.DESCRIBE.SCP035CRYPT = "Не стоит тревожить мёртвых, а?"
    D.WOODIE.DESCRIBE.SCP035CRYPT_OPEN = "Плохая была идея, а?"
end
if D.WAXWELL and D.WAXWELL.DESCRIBE then
    D.WAXWELL.DESCRIBE.SCP035ITEM = "Я... должен... сопротивляться...!"
    D.WAXWELL.DESCRIBE.SCP035CRYPT = "Я этого не помню..."
    D.WAXWELL.DESCRIBE.SCP035CRYPT_OPEN = "О нет..."
end
if D.WATHGRITHR and D.WATHGRITHR.DESCRIBE then
    D.WATHGRITHR.DESCRIBE.SCP035ITEM = "Дар... от Талии...?"
    D.WATHGRITHR.DESCRIBE.SCP035CRYPT = "Сокровища ждут достойного!"
    D.WATHGRITHR.DESCRIBE.SCP035CRYPT_OPEN = "То, что мы получили, сокровищем не было..."
end
if D.WEBBER and D.WEBBER.DESCRIBE then
    D.WEBBER.DESCRIBE.SCP035ITEM = "Мы хотим... её надеть..."
    D.WEBBER.DESCRIBE.SCP035CRYPT = "Ух ты, как старо!.. А что это за слизь?"
    D.WEBBER.DESCRIBE.SCP035CRYPT_OPEN = "Может, маска уникальная! Это уже сокровище!"
end
if D.WINONA and D.WINONA.DESCRIBE then
    D.WINONA.DESCRIBE.SCP035ITEM = "Это... нечто особенное..."
    D.WINONA.DESCRIBE.SCP035CRYPT = "Только мощный взрыв заставит его открыться."
    D.WINONA.DESCRIBE.SCP035CRYPT_OPEN = "Внутри ничего не осталось."
end
if D.WORTOX and D.WORTOX.DESCRIBE then
    D.WORTOX.DESCRIBE.SCP035ITEM = "Какой... милый... розыгрыш... Хи-хи..."
    D.WORTOX.DESCRIBE.SCP035CRYPT = "Хороший бабах — и откроется прах!"
    D.WORTOX.DESCRIBE.SCP035CRYPT_OPEN = "Ни золота, ни золота!"
end
if D.WORMWOOD and D.WORMWOOD.DESCRIBE then
    D.WORMWOOD.DESCRIBE.SCP035ITEM = "Хочу... новое... лицо..."
    D.WORMWOOD.DESCRIBE.SCP035CRYPT = "Старый дом?"
    D.WORMWOOD.DESCRIBE.SCP035CRYPT_OPEN = "Дом для лица?"
end
if D.WARLY and D.WARLY.DESCRIBE then
    D.WARLY.DESCRIBE.SCP035ITEM = "Какая... прекрасная... маска..."
    D.WARLY.DESCRIBE.SCP035CRYPT = "Что это за слизь? Отвратительно."
    D.WARLY.DESCRIBE.SCP035CRYPT_OPEN = "У меня нехорошее предчувствие."
end
if D.WURT and D.WURT.DESCRIBE then
    D.WURT.DESCRIBE.SCP035ITEM = "Что... происходит?.."
    D.WURT.DESCRIBE.SCP035CRYPT = "Не нравится страшный дом, флорп."
    D.WURT.DESCRIBE.SCP035CRYPT_OPEN = "Мне страшно, флорп!"
end
if D.WALTER and D.WALTER.DESCRIBE then
    D.WALTER.DESCRIBE.SCP035ITEM = "Я слышал... истории об этом..."
    D.WALTER.DESCRIBE.SCP035CRYPT = "Я помню историю о маске, которая захватывает тело того, кто её наденет!"
    D.WALTER.DESCRIBE.SCP035CRYPT_OPEN = "Ну, просто не надевайте её!"
end

-- Hard-coded lines spoken by possessed players / the SCP-035 host.
-- Capture all Russian SCP-035 speech, including the custom lines appended
-- above, before the original Workshop mod gets another chance to write English
-- strings into the global table.
local SCP035_LOCALIZED_SPEECH = L10N.DeepCopy(STRINGS.CHARACTERS.SCP035PLAYER, type, pairs)

local function RebuildSCP035FromCurrentGeneric()
    return L10N.RebuildCharacterFromGeneric(
        STRINGS,
        "SCP035PLAYER",
        SCP035_LOCALIZED_SPEECH,
        type,
        pairs,
        GLOBAL.LanguageTranslator
    )
end

if AddSimPostInit ~= nil then
    AddSimPostInit(RebuildSCP035FromCurrentGeneric)
end

-- SCP-035 can take over an already-created survivor, so refresh the global
-- speech table whenever a player is initialized as well as once after Sim init.
if AddPlayerPostInit ~= nil then
    AddPlayerPostInit(function(inst)
        RebuildSCP035FromCurrentGeneric()
        if inst ~= nil and inst.DoTaskInTime ~= nil then
            inst:DoTaskInTime(0, RebuildSCP035FromCurrentGeneric)
        end
    end)
end

local TALK =
{
    ["No! No. We are not doing that again."] = "Нет! Нет. Мы больше не станем это повторять.",
    ["It's showtime!"] = "Шоу начинается!",
    ["Hah, no."] = "Ха, нет.",
    ["VIRUS REMOVAL COMPLETE"] = "УДАЛЕНИЕ ВИРУСА ЗАВЕРШЕНО",
    ["I think I had a nightmare."] = "Кажется, мне приснился кошмар.",
    ["I feel weird. Huh."] = "Странное чувство. Хм.",
    ["I'm going to lose this body soon."] = "Скоро я потеряю это тело.",
    ["This body is on it's way out."] = "Это тело уже на исходе.",
    ["This body is starting to deteriorate."] = "Это тело начинает разрушаться.",
    ["Come here!"] = "Иди сюда!",
    ["Time to sing your swan song!"] = "Пора спеть свою лебединую песню!",
    ["It's time for your final act!"] = "Пора на твой последний акт!",
    ["Time for menial labor."] = "Время для чёрной работы.",
    ["Well, I suppose I got nothing else to do."] = "Что ж, полагаю, заняться мне больше нечем.",
    ["You're starting to become lazy, pal."] = "Ты начинаешь лениться, приятель.",
    ["It wont fit without corroding, that's annoying."] = "Не влезет, не разъев всё вокруг. Раздражает.",
    ["Did I ever thank you for finding me? Thank you."] = "Я вообще благодарил тебя за то, что ты меня нашёл? Спасибо.",
    ["I don't remember how I got in that crypt."] = "Не помню, как оказался в том склепе.",
    ["Doctor doctor, give me the news!"] = "Доктор, доктор, какие новости!",
    ["It feels good to have a body."] = "Как же приятно снова иметь тело.",
    ["Huh. This pig's mind is... extremely simple."] = "Хм. Разум этой свиньи... до крайности прост.",
    ["Oh, how I yearn to tap into the mind of a human again."] = "Ох, как же я тоскую по человеческому разуму.",
    ["I sort of miss the Foundation. How 'bout you?"] = "Я даже немного скучаю по Фонду. А ты?",
    ["Everything I once known feels so... far away..."] = "Всё, что я когда-то знал, кажется таким... далёким...",

    -- SCP-035 carried-mask / host chatter that is hard-coded in prefab files.
    ["I hope you dont cart me around for long."] = "Надеюсь, ты не собираешься долго таскать меня с собой.",
    ["Into your robes I go, I guess."] = "Что ж, похоже, отправляюсь к тебе под одежду.",
    ["Hey, the show must go on!"] = "Эй, шоу должно продолжаться!",
    ["Hey! Pick me back up!"] = "Эй! Подними меня обратно!",
    ["Ouch, that looks like it hurt."] = "Ох, похоже, было больно.",
    ["I'll be emotional support!"] = "Я окажу моральную поддержку!",
    ["You got this."] = "Ты справишься.",
    ["Hey! Listen to me! Those shadows aren't real!"] = "Эй! Послушай меня! Эти тени ненастоящие!",
    ["Buddy, you're scaring me!"] = "Приятель, ты меня пугаешь!",
    ["Woah, whats wrong? Something's not right with you."] = "Ого, что с тобой? С тобой явно что-то не так.",
    ["What's the matter, got a headache?"] = "Что такое, голова болит?",
    ["... Is something wrong? You don't look well."] = "...Что-то случилось? Выглядишь неважно.",
    ["Why do you look so paranoid, I don't see anything."] = "Чего ты такой параноик? Я ничего не вижу.",
    ["Hey buddy, I think you need to patch yourself up."] = "Эй, приятель, тебе бы подлататься.",
    ["Wow, you've seen better days."] = "Ого, бывало у тебя и получше.",
    ["Hey, you're making me worried with those wounds."] = "Эй, эти раны начинают меня беспокоить.",
    ["Man, I really wish I could stretch my legs... Wait, no."] = "Эх, вот бы ноги размять... Стоп, точно.",
    ["This place is... odd. I feel so far away from everything I know. Don't you?"] = "Это место... странное. Всё знакомое кажется таким далёким. Тебе нет?",
    ["No rush, but could you get me a face to latch on to?"] = "Не тороплю, но может найдёшь мне лицо, за которое можно зацепиться?",
    ["It's really cramped in here."] = "Здесь ужасно тесно.",
    ["Wow, I think a spring cleaning might be in order for your belongings."] = "Ого, твоим вещам явно не помешала бы генеральная уборка.",
    ["Hey, want to hear a story? No?"] = "Эй, хочешь историю? Нет?",
    ["Ya' know, it's peaceful in here."] = "Знаешь, здесь довольно спокойно.",
    ["Am I talking too much? I'm sorry."] = "Я слишком много говорю? Извини.",
    ["I always wondered what would happen if I was put onto that 173 thing. Ya know?"] = "Всегда было интересно, что случится, если надеть меня на эту штуку 173. Знаешь?",
    ["Hey there old pal! Fancy seeing you here."] = "Привет, старина! Вот уж не ожидал встретить тебя здесь.",

    ["Huh? Nothing, I just saw something out of the corner of my eye."] = "А? Ничего, просто краем глаза что-то заметил.",
    ["That valkrye girl, eh? Right up my alley."] = "Та девчонка-валькирия, а? Прямо в моём вкусе.",
    ["That scientist with the funny hair, we could use him."] = "Тот учёный со смешными волосами мог бы нам пригодиться.",
    ["If we're able, I'd love to have a few days on that \"Wolfgang\" guy."] = "Если получится, я бы с удовольствием провёл пару дней на этом «Вольфганге».",
    ["That spider kid is quite an odd case, huh?"] = "Этот паучий ребёнок — весьма странный случай, да?",
    ["Whatever lurks in the dark, it likes me in particular..."] = "Что бы ни таилось во тьме, меня оно почему-то особенно любит...",
    ["This \"Lunar\" magic seems cool, I wish I was able to feel it."] = "Эта «лунная» магия выглядит занятно. Жаль, я не могу её почувствовать.",
    ["Is that a body in the water?"] = "Это там тело в воде?",
    ["Remember, licking doorknobs is illegal on other planets."] = "Помни: на других планетах облизывать дверные ручки незаконно.",
    ["I wonder if the gods can see us from here."] = "Интересно, боги отсюда нас видят?",
    ["2 to the 1 to the 1 to the 3!"] = "Два к одному, к одному, к трём!",
    ["Did I just hear something?"] = "Мне только что что-то послышалось?",
    ["I have an urge to punch something, and I don't know why."] = "Мне внезапно хочется кого-нибудь ударить, и я не знаю почему.",
    ["This world is so... boring. Cmon pal, even you have to be bored here."] = "Этот мир такой... скучный. Да ладно, приятель, даже тебе здесь должно быть скучно.",
    ["You know what this place needs? More flair. Ya' know?"] = "Знаешь, чего этому месту не хватает? Больше шика. Понимаешь?",
    ["(Humming)"] = "(Напевает)",
    ["This place is so dark and dreary. Maybe more so than the Foundation, even."] = "Здесь так темно и уныло. Может, даже сильнее, чем в Фонде.",
    ["Did I leave the oven on?"] = "Я духовку выключил?",
    ["Hey, want to hear a joke? [DATA EXPUNGED]"] = "Эй, хочешь шутку? [ДАННЫЕ УДАЛЕНЫ]",
    ["... When was the last time we drank something?"] = "...Когда мы в последний раз что-нибудь пили?",
    ["\"To be, or not to be, that is the question...\" I'm bored..."] = "«Быть или не быть — вот в чём вопрос...» Мне скучно...",
    ["How has this body not corroded away yet? Odd."] = "Как это тело до сих пор не разъело? Странно.",
    ["I think this place is doing something to me. I feel... weird."] = "Кажется, это место как-то на меня влияет. Я чувствую себя... странно.",
    ["You look like you're having fun."] = "Похоже, тебе весело.",
    ["I wonder what that 079 thing is up to."] = "Интересно, чем сейчас занимается эта штука 079.",
    ["Hey, do you think your touch could kill, uh, 682?"] = "Эй, как думаешь, твоё прикосновение смогло бы убить, эм... 682?",
    ["Ahem. 2521... Hey, it works!"] = "Кхм. 2521... Эй, работает!",
    ["This place gives people more shit than the Peanut. Get it?"] = "Это место людям гадит сильнее, чем Арахис. Понял?",
    ["Hey, do you think you could ride those \"Beefalo\" things?"] = "Эй, как думаешь, на этих «бифало» можно ездить?",
}

AddPlayerPostInit(function(inst)
    -- SCP-035 can possess a player long after the player prefab was created.
    -- Wrap every player's talker once; only exact SCP-035 hard-coded strings
    -- are replaced, so normal character speech is untouched.
    L10N.InstallTalkerTranslation(inst, TALK, "_dustave_scp035_ru_wrapped", type)

    inst:ListenForEvent("respawnfromghost", function()
        L10N.InstallTalkerTranslation(inst, TALK, "_dustave_scp035_ru_wrapped", type)
    end)
end)

-- Extra safety for components added dynamically by SCP-035.
AddComponentPostInit("scp035hostcomponent", function(self)
    if self ~= nil and self.inst ~= nil then
        L10N.InstallTalkerTranslation(self.inst, TALK, "_dustave_scp035_ru_wrapped", type)
    end
end)

AddPrefabPostInit("scp035host", function(inst)
    L10N.InstallTalkerTranslation(inst, TALK, "_dustave_scp035_ru_wrapped", type)
end)

AddPrefabPostInit("scp035", function(inst)
    L10N.InstallTalkerTranslation(inst, TALK, "_dustave_scp035_ru_wrapped", type)
end)

print("[DustAve Override] SCP-035 Russian localization loaded.")
