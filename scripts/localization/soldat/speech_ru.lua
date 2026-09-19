--[[
	--- This is Wilson's speech file for Don't Starve Together ---
	Write your character's lines here.
	If you want to use another speech file as a base, or use a more up-to-date version, get them from data\databundles\scripts.zip\scripts\
	
	If you want to use quotation marks in a quote, put a \ before it.
	Example:
	"Like \"this\"."
]]
return {
	ACTIONFAIL =
	{
        REPAIR =
        {
            WRONGPIECE = "Я не инженер.",
        },
        BUILD =
        {
            MOUNTED = "Не дотянуться.",
            HASPET = "Занято.",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "Не-а.",
			GENERIC = "Нет.",
			NOBITS = "Тут нечего брить.",
            REFUSE = "only_used_by_woodie",
		},
		STORE =
		{
			GENERIC = "Не влезает.",
			NOTALLOWED = "Не-а.",
			INUSE = "Советую отойти.",
            NOTMASTERCHEF = "Я агент, а не грёбаный повар.",
		},
        CONSTRUCT =
        {
            INUSE = "Угх.",
            NOTALLOWED = "Не-а.",
            EMPTY = "Нужны материалы.",
            MISMATCH = "Я вообще-то не строитель.",
        },
		RUMMAGE =
		{	
			GENERIC = "Не могу.",
			INUSE = "Да ну же!",
            NOTMASTERCHEF = "Я агент, а не грёбаный повар.",
		},
		UNLOCK =
        {
        	WRONGKEY = "Чёрт.",
        },
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "Не то.",
        	KLAUS = "...",
			QUAGMIRE_WRONGKEY = "Это неправильно.",
        },
		ACTIVATE = 
		{
			LOCKED_GATE = "Заперто.",
		},
        COOK =
        {
            GENERIC = "Я не могу это сделать.",
            INUSE = "Подвинься.",
            TOOFAR = "Не дотянуться.",
        },
        
        --warly specific action
		DISMANTLE =
		{
			COOKING = "only_used_by_warly",
			INUSE = "only_used_by_warly",
			NOTEMPTY = "only_used_by_warly",
        },
        FISH_OCEAN =
		{
			TOODEEP = "Слишком глубоко.",
		},
        --wickerbottom specific action
        READ =
        {
            GENERIC = "only_used_by_wickerbottom",
            NOBIRDS = "only_used_by_wickerbottom"
        },

        GIVE =
        {
            GENERIC = "Не-а.",
            DEAD = "Им это всё равно уже не понадобится.",
            SLEEPING = "То, что я собираюсь тебе дать, куда важнее сна.",
            BUSY = "Да ну же!",
            ABIGAILHEART = "Хм.",
            GHOSTHEART = "О.",
            NOTGEM = "Очевидно, это сюда не подходит.",
            WRONGGEM = "Не тот камень.",
            NOTSTAFF = "Не-а.",
            MUSHROOMFARM_NEEDSSHROOM = "Похоже, сюда надо положить гриб.",
            MUSHROOMFARM_NEEDSLOG = "Может, закинуть сюда одно из тех уродливых брёвен.",
            SLOTFULL = "Заполнено.",
            FOODFULL = "Заполнено.",
            NOTDISH = "Это ему явно не покажется съедобным.",
            DUPLICATE = "Это мы уже знаем.",
            NOTSCULPTABLE = "Нет.",
            NOTATRIUMKEY = "Форма не та, похоже.",
            CANTSHADOWREVIVE = "Да чтоб тебя.",
            WRONGSHADOWFORM = "Я всё испортил.",
            NOMOON = "Нужна луна.",
			PIGKINGGAME_MESSY = "Ну и бардак. Надо прибраться.",
			PIGKINGGAME_DANGER = "Недостаточно безопасно. Я с этим разберусь.",
			PIGKINGGAME_TOOLATE = "Я опоздал.",
        },
        GIVETOPLAYER =
        {
            FULL = "Я не собираюсь таскать это за тебя. Освободи карманы.",
            DEAD = "Им это всё равно уже не понадобится.",
            SLEEPING = "То, что я собираюсь тебе дать, важнее сна.",
            BUSY = "Давай же, мне нужно тебе кое-что передать.",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Я не собираюсь таскать это за тебя. Освободи карманы.",
            DEAD = "Им это всё равно уже не понадобится.",
            SLEEPING = "То, что я собираюсь тебе дать, важнее сна.",
            BUSY = "Давай же, мне нужно тебе кое-что передать.",
        },
        WRITE =
        {
            GENERIC = "Мне нечего к этому добавить.",
            INUSE = "Подвинься.",
        },
        DRAW =
        {
            NOIMAGE = "Нужен образец.",
        },
        CHANGEIN =
        {
            GENERIC = "Нет.",
            BURNING = "Нет.",
            INUSE = "Нет.",
        },
        ATTUNE =
        {
            NOHEALTH = "Мне хреново.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "Не буду к нему лезть.",
            INUSE = "Занято.",
        },
        SADDLE =
        {
            TARGETINCOMBAT = "Он мне не даётся.",
        },
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "Кажется... да, я это знаю. Точно.",
            CANTLEARN = "Я этого не понимаю.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "Эм... по-моему, тут что-то не так.",
        },
        WRAPBUNDLE =
        {
            EMPTY = "В это можно что-нибудь завернуть.",
        },
        PICKUP =
        {
			RESTRICTION = "Я не знаю, как этим пользоваться.",
			INUSE = "Ага. Подвинься.",
        },
        SLAUGHTER =
        {
            TOOFAR = "Не спрячешься!",
        },
        REPLATE =
        {
            MISMATCH = "Вот привереда.", 
            SAMEDISH = "Похоже, теперь придётся готовить что-то другое.", 
        },
        SAIL =
        {
        	REPAIR = "Держится нормально. Ремонт не нужен.",
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "Чёрт.",
            BAD_TIMING1 = "Я облажался с моментом.",
            BAD_TIMING2 = "Да чтоб тебя!",
        },
        LOWER_SAIL_FAIL =
        {
            "...",
            "Не похоже, что мы замедляемся.",
            "Надо попробовать ещё раз.",
        },
        BATHBOMB =
        {
            GLASSED = "Я не могу бросить это туда.",
            ALREADY_BOMBED = "Не-а.",
        },
	},
	ACTIONFAIL_GENERIC = "Не могу.",
	ANNOUNCE_BOAT_LEAK = "Мы сейчас утонем.",
	ANNOUNCE_BOAT_SINK = "Ну вот и всё.",
	ANNOUNCE_DIG_DISEASE_WARNING = "Сойдёт.",
	ANNOUNCE_PICK_DISEASE_WARNING = "Мерзость.",
	ANNOUNCE_ADVENTUREFAIL = "Посмотрим, получится ли со второго раза.",
    ANNOUNCE_MOUNT_LOWHEALTH = "Оно вот-вот сдохнет.",

    --waxwell and wickerbottom specific strings
    ANNOUNCE_TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
    ANNOUNCE_WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",

    --wolfgang specific
    ANNOUNCE_NORMALTOMIGHTY = "only_used_by_wolfang",
    ANNOUNCE_NORMALTOWIMPY = "only_used_by_wolfang",
    ANNOUNCE_WIMPYTONORMAL = "only_used_by_wolfang",
    ANNOUNCE_MIGHTYTONORMAL = "only_used_by_wolfang",

	ANNOUNCE_BEES = "В бой!",
	ANNOUNCE_BOOMERANG = "Уф! Чёрт!",
	ANNOUNCE_CHARLIE = "...",
	ANNOUNCE_CHARLIE_ATTACK = "Уф!",
	ANNOUNCE_CHARLIE_MISSED = "only_used_by_winona", --winona specific 
	ANNOUNCE_COLD = "Температура тела понижена.",
	ANNOUNCE_HOT = "Зафиксирован перегрев.",
	ANNOUNCE_CRAFTING_FAIL = "Мне нужен инженер.",
	ANNOUNCE_DEERCLOPS = "Враждебная цель приближается!",
	ANNOUNCE_CAVEIN = "Всё разваливается!",
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"Мне это не нравится.",
		"...",
		"Только не снова.",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "Да забери уже это, чёрт возьми.",
        "Ты ведь понимаешь, что я могу уничтожить тебя в любой момент?",
        "На, бери и отвали.",
	},
	ANNOUNCE_SACREDCHEST_YES = "Ну ладно.",
	ANNOUNCE_SACREDCHEST_NO = "Хм.",
    ANNOUNCE_DUSK = "Код: закат.",
    
    --wx-78 specific
    ANNOUNCE_CHARGE = "only_used_by_wx78",
	ANNOUNCE_DISCHARGE = "only_used_by_wx78",

	ANNOUNCE_EAT =
	{
		GENERIC = "По моим меркам — вполне нормально.",
		PAINFUL = "Это было отравлено?",
		SPOILED = "На вкус как дерьмо.",
		STALE = "Не стоило мне это есть.",
		INVALID = "Я не стану тащить это в рот.",
        YUCKY = "...",
        
        --Warly specific ANNOUNCE_EAT strings
		COOKED = "only_used_by_warly",
		DRIED = "only_used_by_warly",
        PREPARED = "only_used_by_warly",
        RAW = "only_used_by_warly",
		SAME_OLD_1 = "only_used_by_warly",
		SAME_OLD_2 = "only_used_by_warly",
		SAME_OLD_3 = "only_used_by_warly",
		SAME_OLD_4 = "only_used_by_warly",
        SAME_OLD_5 = "only_used_by_warly",
		TASTY = "only_used_by_warly",
    },
    
    ANNOUNCE_ENCUMBERED =
    {
        "Бывало и похуже...",
        "Чёрт, я не грузчик.",
        "Никогда раньше ничего подобного не чувствовал...",
        "Кажется, это портит мой костюм.",
        "Угх...",
        "Так тяжело дышать, что я уже будто чувствую вкус собственных лёгких.",
        "Хнгх...!",
        "Хах... хах...",
        "Давай, давай...",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"Пора отступать!",
		"А?!",
		"Сектор не защищён.",
	},
    ANNOUNCE_RUINS_RESET = "Враждебная активность растёт.",
    ANNOUNCE_SNARED = "Острое.",
    ANNOUNCE_REPELLED = "Его защищает щит.",
	ANNOUNCE_ENTER_DARK = "Визуальный контакт: ноль.",
	ANNOUNCE_ENTER_LIGHT = "Визуальный контакт восстановлен.",
	ANNOUNCE_FREEDOM = "Сладкая свобода.",
	ANNOUNCE_HIGHRESEARCH = "Что это за чувство?",
	ANNOUNCE_HOUNDS = "Докладываю: возможно приближение противника.",
	ANNOUNCE_WORMS = "Будь начеку.",
	ANNOUNCE_HUNGRY = "Мне надо поесть. Я не собираюсь помирать от голода в этой дыре.",
	ANNOUNCE_HUNT_BEAST_NEARBY = "Оно близко...",
	ANNOUNCE_HUNT_LOST_TRAIL = "Цель потеряна.",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "Слишком мокро. След потерян.",
	ANNOUNCE_INV_FULL = "Места нет.",
	ANNOUNCE_KNOCKEDOUT = "Уф, как же больно!",
	ANNOUNCE_LOWRESEARCH = "Э-э-э...",
	ANNOUNCE_MOSQUITOS = "Посмотрим, понравится ли тебе, когда Я высосу твою кровь.",
    ANNOUNCE_NOWARDROBEONFIRE = "Чёрт, оно горит!",
    ANNOUNCE_NODANGERGIFT = "Сейчас небезопасно.",
    ANNOUNCE_NOMOUNTEDGIFT = "Сначала надо слезть с бифало.",
	ANNOUNCE_NODANGERSLEEP = "Сначала надо разобраться с враждебной активностью.",
	ANNOUNCE_NODAYSLEEP = "Днём спят только слабаки.",
	ANNOUNCE_NODAYSLEEP_CAVE = "Я не устал. Я НИКОГДА НЕ УСТАЮ!",
	ANNOUNCE_NOHUNGERSLEEP = "Надо поесть, тогда быстрее усну.",
	ANNOUNCE_NOSLEEPONFIRE = "Просто нет.",
	ANNOUNCE_NODANGERSIESTA = "Сначала надо разобраться с враждебной активностью.",
	ANNOUNCE_NONIGHTSIESTA = "Сейчас не лучшее время.",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "Здесь внизу мне не до отдыха.",
	ANNOUNCE_NOHUNGERSIESTA = "Мне нужна еда.",
	ANNOUNCE_NODANGERAFK = "Единственный выход — смерть!",
	ANNOUNCE_NO_TRAP = "Проще простого.",
	ANNOUNCE_PECKED = "Ай! Хватит!",
	ANNOUNCE_QUAKE = "...",
	ANNOUNCE_RESEARCH = "Мои познания ограничены.",
	ANNOUNCE_SHELTER = "Сойдёт.",
	ANNOUNCE_THORNS = "Агх!",
	ANNOUNCE_BURNT = "Уф! Жжётся!",
	ANNOUNCE_TORCH_OUT = "Ну вот, погасло.",
	ANNOUNCE_THURIBLE_OUT = "Курильница полностью выдохлась.",
	ANNOUNCE_FAN_OUT = "Сломалось.",
    ANNOUNCE_COMPASS_OUT = "Чёртова штука сломалась.",
	ANNOUNCE_TRAP_WENT_OFF = "Я облажался.",
	ANNOUNCE_UNIMPLEMENTED = "АЙ! Похоже, оно ещё не готово.",
	ANNOUNCE_WORMHOLE = "Что ЭТО вообще такое?",
	ANNOUNCE_TOWNPORTALTELEPORT = "Я не могу это объяснить.",
	ANNOUNCE_CANFIX = "\nПопробую что-нибудь с этим сделать...",
	ANNOUNCE_ACCOMPLISHMENT = "Приятное чувство.",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "Вот бы работодатель меня сейчас увидел...",	
	ANNOUNCE_INSUFFICIENTFERTILIZER = "Всё ещё голодное? Почему я вообще разговариваю с растением?",
	ANNOUNCE_TOOL_SLIP = "Да что ж такое — не поймаю!",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Получай, молния.",
	ANNOUNCE_TOADESCAPING = "Ты куда собралось?",
	ANNOUNCE_TOADESCAPED = "Сбежало. Пока что.",


	ANNOUNCE_DAMP = "Хм.",
	ANNOUNCE_WET = "Угх.",
	ANNOUNCE_WETTER = "Надо что-то с этим делать.",
	ANNOUNCE_SOAKED = "Хуже ощущения не придумаешь.",

	ANNOUNCE_WASHED_ASHORE = "Я в порядке.",

    ANNOUNCE_DESPAWN = "Так вот каково это... умирать?",
	ANNOUNCE_BECOMEGHOST = "oOooOooo!!",
	ANNOUNCE_GHOSTDRAIN = "Это тревожно.",
	ANNOUNCE_PETRIFED_TREES = "..Что?",
	ANNOUNCE_KLAUS_ENRAGE = "Ты будешь КРИЧАТЬ, когда я тебя прикончу?!",
	ANNOUNCE_KLAUS_UNCHAINED = "Ну давай!",
	ANNOUNCE_KLAUS_CALLFORHELP = "Неужели ты не понимаешь, что это уже не поможет?",

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "Внутри что-то есть...",
		GLASS_LOW = "Почти...",
		GLASS_REVEAL = "Свобода.",
		IDOL_MED = "Внутри что-то есть...",
		IDOL_LOW = "Почти...",
		IDOL_REVEAL = "Ты свободен!",
		SEED_MED = "Внутри что-то есть...",
		SEED_LOW = "Почти...",
		SEED_REVEAL = "Свобода.",
	},

    --hallowed nights
    ANNOUNCE_SPOOKED = "А?",
	ANNOUNCE_BRAVERY_POTION = "Я должен что-то почувствовать?",
	ANNOUNCE_MOONPOTION_FAILED = "О.",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "Я тебя не брошу.",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "В следующий раз не умирай, ладно?",
    ANNOUNCE_REVIVED_FROM_CORPSE = "Назад в мясорубку!",

    ANNOUNCE_FLARE_SEEN = "Кто это сделал?",
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "Ха-ха! Давай сюда!",

    --willow specific
	ANNOUNCE_LIGHTFIRE =
	{
		"only_used_by_willow",
    },

    --winona specific
    ANNOUNCE_HUNGRY_SLOWBUILD = 
    {
	    "only_used_by_winona",
    },
    ANNOUNCE_HUNGRY_FASTBUILD = 
    {
	    "only_used_by_winona",
    },

    --wormwood specific
    ANNOUNCE_KILLEDPLANT = 
    {
        "only_used_by_wormwood",
    },
    ANNOUNCE_GROWPLANT = 
    {
        "only_used_by_wormwood",
    },
    ANNOUNCE_BLOOMING = 
    {
        "only_used_by_wormwood",
    },

    --wortox specfic
    ANNOUNCE_SOUL_EMPTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_FEW =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_MANY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD =
    {
        "only_used_by_wortox",
    },

    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "Из этих ингредиентов ничего не вышло.",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "Я передержал.",
    QUAGMIRE_ANNOUNCE_LOSE = "У меня плохое предчувствие.",
    QUAGMIRE_ANNOUNCE_WIN = "Пора уходить!",

    ANNOUNCE_ROYALTY =
    {
        "Ваше Величество.",
        "Ваше Высочество.",
        "Мой господин!",
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "Меня прямо-таки переполняет электричество!",
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "Пустите меня к ним!",
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "Теперь я чувствую себя куда безопаснее.",
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "Производительность растёт!",
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "Я сухой, как лекции Викерботтом.",
    
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "Электричество ушло, а статика осталась.",
    ANNOUNCE_DETACH_BUFF_ATTACK            = "Похоже, сила была временной.",
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "Жаль, неплохо было, пока длилось.",
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "Желание бездельничать... возвращается...",
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "Похоже, сухие деньки закончились.",
    
    --Wurt announce strings
    ANNOUNCE_KINGCREATED = "only_used_by_wurt",
    ANNOUNCE_KINGDESTROYED = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_THRONE = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_HOUSE = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "only_used_by_wurt",
    ANNOUNCE_READ_BOOK = 
    {
        BOOK_SLEEP = "only_used_by_wurt",
        BOOK_BIRDS = "only_used_by_wurt",
        BOOK_TENTACLES =  "only_used_by_wurt",
        BOOK_BRIMSTONE = "only_used_by_wurt",
        BOOK_GARDENING = "only_used_by_wurt",
    },

	BATTLECRY =
	{
		GENERIC = "Драться или бежать!",
		PIG = "Не спрячешься!",
		PREY = "Не усложняй.",
		SPIDER = "Пора.",
		SPIDER_WARRIOR = "Я тебя ждал!",
		DEER = "Теперь они наши!",
	},
	COMBAT_QUIT =
	{
		GENERIC = "Контакт потерян.",
		PIG = "Не убежишь!",
		PREY = "Не удаётся обнаружить цель.",
		SPIDER = "Цель потеряна.",
		SPIDER_WARRIOR = "Визуальный контакт: ноль.",
	},
	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "Мне нельзя возвращаться, пока работодатели не будут довольны.",
        MULTIPLAYER_PORTAL_MOONROCK = "Теперь выглядит иначе...",
        MOONROCKIDOL = "Что-то здесь не так.",
        CONSTRUCTION_PLANS = "Штуки. Строительные штуки. Я не знаю.",

        ANTLION =
        {
            GENERIC = "Какого чёрта ТЕБЕ надо?",
            VERYHAPPY = "Выглядит достаточно довольным. Похоже, резать его не придётся.",
            UNHAPPY = "Ты чего, мать твою, так на меня смотришь?",
        },
        ANTLIONTRINKET = "Бесполезно.",
        SANDSPIKE = "Не хочу, чтобы эта штука меня проткнула.",
        SANDBLOCK = "Песок.",
        GLASSSPIKE = "Теперь оно ещё острее.",
        GLASSBLOCK = "Это всё ещё песок, только другой.",
        ABIGAIL_FLOWER =
        {
            GENERIC ="Обычный цветок.",
            LONG = "Обычный цветок.",
            MEDIUM = "Обычный цветок.",
            SOON = "Ладно, может, не совсем обычный цветок.",
            HAUNTED_POCKET = "Нет, спасибо.",
            HAUNTED_GROUND = "Неинтересно.",
        },

        BALLOONS_EMPTY = "Напоминает мне кое-кого...",
        BALLOON = "Выглядят раздражающе.",

        BERNIE_INACTIVE =
        {
            BROKEN = "Жаль.",
            GENERIC = "Выглядит старым.",
        },

        BERNIE_ACTIVE = "Как оно вообще живое?",
        BERNIE_BIG = "Размером с MAG-агента!",

        BOOK_BIRDS = "Они настоящие? И почему у нас в Неваде таких нет?",
        BOOK_TENTACLES = "Бесполезно.",
        BOOK_GARDENING = "Бесполезно.",
        BOOK_SLEEP = "Мне не нужен сон. Бесполезно.",
        BOOK_BRIMSTONE = "Бесполезно.",

        PLAYER =
        {
            GENERIC = "Просто не путайся у меня под ногами.",
            ATTACKER = "Я тебе не доверяю, %s...",
            MURDERER = "Диссидент!",
            REVIVER = "%s знает своё дело.",
            GHOST = "%s выбыл.",
            FIRESTARTER = "Знаешь, оно нам ещё было нужно, прежде чем ты это сжёг, %s.",
        },
        WILSON =
        {
            GENERIC = "О, смотрите-ка, умник.",
            ATTACKER = "Вот что наука с людьми делает.",
            MURDERER = "%s, вы назначены на немедленное устранение.",
            REVIVER = "Неплохо, %s.",
            GHOST = "Учёный выбыл.",
            FIRESTARTER = "Ты долбаный идиот, %s.",
        },
        WOLFGANG =
        {
            GENERIC = "Крепкий ты парень, да?",
            ATTACKER = "Размер не имеет значения.",
            MURDERER = "Обещаю, быстро не будет!",
            REVIVER = "Очень мило с твоей стороны, %s.",
            GHOST = "Чем они больше, тем громче падают.",
            FIRESTARTER = "Да ладно!",
        },
        WAXWELL =
        {
            GENERIC = "Теневой человек.",
            ATTACKER = "Ты правда хочешь испытать моё терпение?",
            MURDERER = "Я тебя разнесу!",
            REVIVER = "Как?",
            GHOST = "Оставайся мёртвым.",
            FIRESTARTER = "Ты вообще в своём уме?!",
        },
        WX78 =
        {
            GENERIC = "У нас есть кое-что общее. Мне нравится.",
            ATTACKER = "Что ты творишь, %s?!",
            MURDERER = "Я разберу тебя на части!",
            REVIVER = "Не знал, что ты так умеешь.",
            GHOST = "Что за..?",
            FIRESTARTER = "...",
        },
        WILLOW =
        {
            GENERIC = "%s.",
            ATTACKER = "И что ты собираешься делать с этой штукой, а, %s?",
            MURDERER = "Мне не жаль.",
            REVIVER = "Неплохо.",
            GHOST = "Поджигатель выбыл.",
            FIRESTARTER = "Ты серьёзно?",
        },
        WENDY =
        {
            GENERIC = "%s.",
            ATTACKER = "Ты выглядишь подозрительно.",
            MURDERER = "Ты же знаешь, мне без разницы, кого устранять.",
            REVIVER = "%s явно любит такие штуки.",
            GHOST = "Жуткая девчонка выбыла.",
            FIRESTARTER = "...",
        },
        WOODIE =
        {
            GENERIC = "%s.",
            ATTACKER = "%s ведёт себя как-то странно.",
            MURDERER = "Не волнуйся, топор похороним вместе с тобой.",
            REVIVER = "Хорошая работа.",
            GHOST = "Канадец выбыл.",
            BEAVER = "Хм.",
            BEAVERGHOST = "Бобр выбыл.",
            MOOSE = "Я почти впечатлён.",
            MOOSEGHOST = "Ну и ладно.",
            GOOSE = "И зачем вообще превращаться в гуся—",
            GOOSEGHOST = "Недостаточно быстро, да?",
            FIRESTARTER = "Поосторожнее, %s.",
        },
        WICKERBOTTOM =
        {
            GENERIC = "%s.",
            ATTACKER = "Что тебе нужно?",
            MURDERER = "Пора.",
            REVIVER = "Как мило.",
            GHOST = "Библиотекарь выбыла.",
            FIRESTARTER = "Зачем?",
        },
        WES =
        {
            GENERIC = "Ты мне уже не нравишься. Напоминаешь одного очень конкретного типа.",
            ATTACKER = "Этот чёртов клоун что-то задумал.",
            MURDERER = "Наконец-то.",
            REVIVER = "От тебя я такого не ожидал.",
            GHOST = "Клоун... мим выбыл.",
            FIRESTARTER = "Ты там не можешь воображаемый пожар устроить или вроде того?",
        },
        WEBBER =
        {
            GENERIC = "Ты умеешь стрелять паутиной?",
            ATTACKER = "Я за тобой слежу, мелкий.",
            MURDERER = "Умри!",
            REVIVER = "%s неплохо справляется.",
            GHOST = "Паук выбыл.",
            FIRESTARTER = "Это небезопасно.",
        },
        WATHGRITHR =
        {
            GENERIC = "%s.",
            ATTACKER = "Со мной тебе не тягаться.",
            MURDERER = "Давай разберёмся!",
            REVIVER = "Колдовство!",
            GHOST = "Актриса выбыла.",
            FIRESTARTER = "Ты делаешь только хуже.",
        },
        WINONA =
        {
            GENERIC = "Рукастый инженер — как раз то, что мне было нужно.",
            ATTACKER = "Чудик.",
            MURDERER = "ТЕБЕ КОНЕЦ!",
            REVIVER = "Ты довольно полезен, %s.",
            GHOST = "Инженер выбыл.",
            FIRESTARTER = "Скажи, что у тебя была хоть какая-то нормальная причина.",
        },
        WORTOX =
        {
            GENERIC = "Это что-то новенькое.",
            ATTACKER = "Ах ты мелкий—",
            MURDERER = "Никогда не убивал беса. Пора исправить.",
            REVIVER = "Спасибо.",
            GHOST = "Бес выбыл.",
            FIRESTARTER = "Я знал, что до этого дойдёт.",
        },
        WORMWOOD =
        {
            GENERIC = "Ты, знаешь ли, не очень полезно выглядишь.",
            ATTACKER = "Чёрт, у овоща есть руки!",
            MURDERER = "Я давно ждал этого момента.",
            REVIVER = "Ты раздражающе дружелюбный.",
            GHOST = "Овощ выбыл.",
            FIRESTARTER = "Иронично.",
        },
        WARLY =
        {
            GENERIC = "Приветствую, %s!",
            ATTACKER = "Ну, это прям рецепт катастрофы.",
            MURDERER = "Надеюсь, у тебя нет недопечённых планов меня прикончить.",
            REVIVER = "На %s всегда можно положиться — план он приготовит.",
            GHOST = "Может, он готовил с призрачным перцем.",
            FIRESTARTER = "Он сейчас всё тут фламбирует к чёрту!",
        },

        WURT =
        {
            GENERIC = "%s.",
            ATTACKER = "Мне не нравится твой взгляд.",
            MURDERER = "Ты ничем не отличаешься. Приготовься к устранению.",
            REVIVER = "Большое спасибо.",
            GHOST = "Мерм выбыл.",
            FIRESTARTER = "Ах ты мелкий засранец!",
        },

        MIGRATION_PORTAL =
        {
            GENERIC = "Если очень захочу, могу вызвать подкрепление.",
            OPEN = "Я ещё не закончил задание.",
            FULL = "Заполнено.",
        },
        GLOMMER = 
        {
            GENERIC = "Ещё одна бесполезная букашка.",
            SLEEPING = "Спит.",
        },
        GLOMMERFLOWER =
        {
            GENERIC = "Мне это ни к чему.",
            DEAD = "Завяло.",
        },
        GLOMMERWINGS = "Удивительно маленькие для такого жирного насекомого.",
        GLOMMERFUEL = "Годится разве что для костра.",
        BELL = "Бесполезно.",
        STATUEGLOMMER =
        {
            GENERIC = "И что оно сделало, чтобы заслужить статую?",
            EMPTY = "Невелика потеря.",
        },

        LAVA_POND_ROCK = "Горячо.",

		WEBBERSKULL = "Мне совершенно всё равно.",
		WORMLIGHT = "Выглядит съедобно.",
		WORMLIGHT_LESSER = "Хмм...",
		WORM =
		{
		    PLANT = "Выглядит достаточно неплохо.",
		    DIRT = "Просто грязь.",
		    WORM = "Тёмный червь.",
		},
        WORMLIGHT_PLANT = "Будь начеку.",
		MOLE =
		{
			HELD = "Я чувствую твой страх.",
			UNDERGROUND = "Работа, работа и ещё раз работа.",
			ABOVEGROUND = "Так и тянет расколоть ему череп.",
		},
		MOLEHILL = "Вот где он хранит всё добро.",
		MOLEHAT = "Бесполезно.",

		EEL = "Хм.",
		EEL_COOKED = "Пахнет многообещающе.",
		UNAGI = "Еда.",
		EYETURRET = "Наблюдатель.",
		EYETURRET_ITEM = "Неактивно.",
		MINOTAURHORN = "Не такое острое, как моё оружие.",
		MINOTAURCHEST = "Интересно посмотреть, что внутри.",
		THULECITE_PIECES = "Тулецит.",
		POND_ALGAE = "Водные растения.",
		GREENSTAFF = "Интересно, что оно делает?",
		GIFT = "Серьёзно?",
        GIFTWRAP = "Просто обмотать.",
		POTTEDFERN = "Растение.",
        SUCCULENT_POTTED = "Растение.",
		SUCCULENT_PLANT = "Просто растение. Симпатичное.",
		SUCCULENT_PICKED = "Хммм...",
		SENTRYWARD = "Выглядит бесполезно.",
        TOWNPORTAL =
        {
			GENERIC = "Я этой штуке не доверяю.",
			ACTIVE = "Похоже, полностью заряжено!",
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "Что-то мне не хочется... этим пользоваться.",
			ACTIVE = "Я и без этой штуки достаточно быстрый.",
		},
        WETPAPER = "Мне нужно, чтобы оно высохло.",
        WETPOUCH = "Вода всё только портит. Поэтому в Неваде её почти и нет.",
        MOONROCK_PIECES = "Может пригодиться, если разобрать на части.",
        MOONBASE =
        {
            GENERIC = "Похоже, сюда надо что-то вставить.",
            BROKEN = "Ну ладно.",
            STAFFED = "И что теперь?",
            WRONGSTAFF = "Хм.",
            MOONSTAFF = "...",
        },
        MOONDIAL = 
        {
			GENERIC = "Вода усиливает науку и позволяет измерять луну.",
			NIGHT_NEW = "Новолуние.",
			NIGHT_WAX = "Луна растёт.",
			NIGHT_FULL = "Полнолуние.",
			NIGHT_WANE = "Луна убывает.",
			CAVE = "Здесь внизу нет луны, которую можно измерить.",
			WEREBEAVER = "only_used_by_woodie", --woodie specific
        },
		THULECITE = "Мне нравится цвет.",
		ARMORRUINS = "Шикарно.",
		ARMORSKELETON = "Это в моём вкусе.",
		SKELETONHAT = "...",
		RUINS_BAT = "Отлично подходит, чтобы хорошенько кого-нибудь отделать.",
		RUINSHAT = "Шикарно.",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "Вроде стабильно.",
            WARN = "Угх.",
            WAXING = "Что, чёрт возьми, с этой штукой?!",
            STEADY = "Стабильно.",
            WANING = "Успокаивается.",
            DAWN = "Фаза безумия почти закончилась.",
            NOMAGIC = "Я больше не чувствую здесь... невероятности.",
		},
		BISHOP_NIGHTMARE = "С радостью избавлю тебя от страданий.",
		ROOK_NIGHTMARE = "Я разберу тебя на части!",
		KNIGHT_NIGHTMARE = "Я сотру тебя в порошок!",
		MINOTAUR = "Придётся постараться лучше!",
		SPIDER_DROPPER = "Думаешь, сможешь меня перехитрить?",
		NIGHTMARELIGHT = "Хм.",
		NIGHTSTICK = "О!",
		GREENGEM = "Зелёный камень.",
		MULTITOOL_AXE_PICKAXE = "Выглядит полезно.",
		ORANGESTAFF = "Я всё равно предпочитаю ходить пешком.",
		YELLOWAMULET = "Светится.",
		GREENAMULET = "Для инженера довольно полезная штука.",
		SLURPERPELT = "Слабак.",	

		SLURPER = "Будет легко.",
		SLURPER_PELT = "Слабак.",
		ARMORSLURPER = "Я всё равно предпочитаю свой костюм.",
		ORANGEAMULET = "Я и так достаточно быстрый, спасибо.",
		YELLOWSTAFF = "То есть это просто большая свеча.",
		YELLOWGEM = "Мне нравится цвет.",
		ORANGEGEM = "Оранжевое.",
        OPALSTAFF = "Самоцвет. На палке.",
        OPALPRECIOUSGEM = "Это не похоже на остальные.",
        TELEBASE = 
		{
			VALID = "Заряжено и готово.",
			GEMS = "Нужно топливо.",
		},
		GEMSOCKET = 
		{
			VALID = "Готово.",
			GEMS = "Нужно вставить самоцвет.",
		},
		STAFFLIGHT = "Огнемёт!",
        STAFFCOLDLIGHT = "Прямо как крио-пушки у ребят из Nexus Core.",

        ANCIENT_ALTAR = "Оно кажется... ненастоящим. В каком-то смысле буквально произведение фикции.",

        ANCIENT_ALTAR_BROKEN = "Сломано. Навсегда.",

        ANCIENT_STATUE = "Эхо прошлого.",

        LICHEN = "Я бы это не подбирал.",
		CUTLICHEN = "Прямо на глазах разваливается.",

		CAVE_BANANA = "М-м-м.",
		CAVE_BANANA_COOKED = "Сойдёт, наверное.",
		CAVE_BANANA_TREE = "Не самое подходящее место для дерева.",
		ROCKY = "Это... камни?",
		
		COMPASS =
		{
			GENERIC="Куда я сейчас смотрю?",
			N = "Север.",
			S = "Юг.",
			E = "Восток.",
			W = "Запад.",
			NE = "Северо-восток.",
			SE = "Юго-восток.",
			NW = "Северо-запад.",
			SW = "Юго-запад.",
		},

        HOUNDSTOOTH = "Острое.",
        ARMORSNURTLESHELL = "Крепкое.",
        BAT = "Уродливое.",
        BATBAT = "Не похоже на хорошее оружие, но работает.",
        BATWING = "Обожаю их отрывать.",
        BATWING_COOKED = "Не слишком питательно.",
        BATCAVE = "Обнаружена враждебная активность.",
        BEDROLL_FURRY = "В этом спят.",
        BUNNYMAN = "Я даже спрашивать не буду.",
        FLOWER_CAVE = "Светится.",
        GUANO = "Одна из причин истребить этих летающих тварей подчистую.",
        LANTERN = "Не то чтобы мне это нужно, но всё лучше примитивного факела.",
        LIGHTBULB = "Мне это... съесть?",
        MANRABBIT_TAIL = "Мягкое.",
        MUSHROOMHAT = "Я это не надену.",
        MUSHROOM_LIGHT2 =
        {
            ON = "Активно.",
            OFF = "Больше не работает.",
            BURNT = "Его больше нет.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "Светится.",
            OFF = "Света нет.",
            BURNT = "Одни угли.",
        },
        SLEEPBOMB = "Хотелось бы, чтобы оно было поубойнее.",
        MUSHROOMBOMB = "В итоге не такая уж полезная штука.",
        SHROOM_SKIN = "Гриб.",
        TOADSTOOL_CAP =
        {
            EMPTY = "Просто дыра. Под землёй. Посреди нигде.",
            INGROUND = "Я что-то вижу.",
            GENERIC = "Хм.",
        },
        TOADSTOOL =
        {
            GENERIC = "...",
            RAGE = "Он такой же злобный, как и я!",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "Интересно.",
            BURNT = "Теперь его нет.",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "Большой.",
            BLOOM = "Что это за запах?",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "Никогда раньше такого не видел.",
            BLOOM = "Выглядит раздражающе.",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "Гриб, только чуть побольше.",
            BLOOM = "Гриб, только чуть побольше.",
        },
        MUSHTREE_TALL_WEBBED = "Весь в паутине.",
        SPORE_TALL =
        {
            GENERIC = "Никого не трогает.",
            HELD = "Очень лёгкое.",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "Никого не трогает.",
            HELD = "Очень лёгкое.",
        },
        SPORE_SMALL =
        {
            GENERIC = "Никого не трогает.",
            HELD = "Очень лёгкое.",
        },
        RABBITHOUSE =
        {
            GENERIC = "Какая странная постройка.",
            BURNT = "Ну и ладно.",
        },
        SLURTLE = "На вид безобидное.",
        SLURTLE_SHELLPIECES = "Это уже не починить.",
        SLURTLEHAT = "Нет, мне и так нормально.",
        SLURTLEHOLE = "Вот откуда они появляются.",
        SLURTLESLIME = "О, взрывчатка!",
        SNURTLE = "И это тоже выглядит безобидно.",
        SPIDER_HIDER = "Ещё эти твари.",
        SPIDER_SPITTER = "Думаешь, попадёшь по мне?",
        SPIDERHOLE = "Логово.",
        SPIDERHOLE_ROCK = "Логово.",
        STALAGMITE = "Камень.",
        STALAGMITE_TALL = "Это камень. Как и всё вокруг.",
        TREASURECHEST_TRAP = "Как удобно!",

        TURF_CARPETFLOOR = "Надеюсь, под дождь не попадёт.",
        TURF_CHECKERFLOOR = "Звук под ногами... приятный.",
        TURF_DIRT = "Кусок земли.",
        TURF_FOREST = "Кусок земли.",
        TURF_GRASS = "Кусок земли.",
        TURF_MARSH = "Кусок земли.",
        TURF_METEOR = "Кусок лунной земли.",
        TURF_PEBBLEBEACH = "Кусок пляжа.",
        TURF_ROAD = "Кое-как уложенные камни.",
        TURF_ROCKY = "Кусок земли.",
        TURF_SAVANNA = "Кусок земли.",
        TURF_WOODFLOOR = "Доски для пола.",

		TURF_CAVE="Ещё один вид покрытия.",
		TURF_FUNGUS="Ещё один вид покрытия.",
		TURF_SINKHOLE="Ещё один вид покрытия.",
		TURF_UNDERROCK="Ещё один вид покрытия.",
		TURF_MUD="Ещё один вид покрытия.",

		TURF_DECIDUOUS = "Ещё один вид покрытия.",
		TURF_SANDY = "Ещё один вид покрытия.",
		TURF_BADLANDS = "Ещё один вид покрытия.",
		TURF_DESERTDIRT = "Кусок земли.",
		TURF_FUNGUS_GREEN = "Кусок земли.",
		TURF_FUNGUS_RED = "Кусок земли.",
		TURF_DRAGONFLY = "Хочешь проверить, правда ли оно огнеупорное?",

		POWCAKE = "Угх...",
        CAVE_ENTRANCE = "Под ним что-то есть.",
        CAVE_ENTRANCE_RUINS = "Под ним что-то есть.",
       
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "Интересно, куда это ведёт.",
            OPEN = "Дыра куда-то вниз.",
            FULL = "Не могу.",
        },
        CAVE_EXIT = 
        {
            GENERIC = "...",
            OPEN = "Пора обратно.",
            FULL = "Сейчас я вернуться не могу.",
        },

		MAXWELLPHONOGRAPH = "Тёмная песнь.",
		BOOMERANG = "Я бью без промаха.",
		PIGGUARD = "Упрямое. Раздражающее.",
		ABIGAIL = "Это... невероятно.",
		ADVENTURE_PORTAL = "Мне нужно оставаться здесь. Так сказал начальник.",
		AMULET = "Я освежился.",
		ANIMAL_TRACK = "След. Свежий.",
		ARMORGRASS = "Лёгкое и защищает достаточно хорошо.",
		ARMORMARBLE = "Это серьёзно ограничит мои возможности!",
		ARMORWOOD = "Надеюсь, я в этом не загорюсь.",
		ARMOR_SANITY = "В этой штуке я злюсь сильнее обычного.",
		ASH =
		{
			GENERIC = "Пепел. Остался после огня.",
			REMAINS_GLOMMERFLOWER = "Огонь с этим покончил.",
			REMAINS_EYE_BONE = "Ну и ладно, найду другое.",
			REMAINS_THINGIE = "Хм...",
		},
		AXE = "Вообще-то инструмент, но в моих руках — опасная штука.",
		BABYBEEFALO = 
		{
			GENERIC = "Маленькое. И уязвимое.",
		    SLEEPING = "Теперь ещё уязвимее.",
        },
        BUNDLE = "Всё добро внутри.",
        BUNDLEWRAP = "Удобно для переноски вещей.",
		BACKPACK = "Пригодится.",
		BACONEGGS = "Классика, можно сказать.",
		BANDAGE = "Я не доктор, но должно сработать.",
		BASALT = "Слишком сильное.",
		BEARDHAIR = "Представь себе — иметь волосы.",
		BEARGER = "Господи, как же ты орёшь!",
		BEARGERVEST = "Не так удобно, как мой костюм, но сойдёт.",
		ICEPACK = "Мех удерживает температуру внутри.",
		BEARGER_FUR = "Толстая меховая подстилка.",
		BEDROLL_STRAW = "Для сна сойдёт.",
		BEEQUEEN = "С этим я справлюсь!",
		BEEQUEENHIVE = 
		{
			GENERIC = "Фу, липкое!",
			GROWING = "Не помню, чтобы это здесь было.",
		},
        BEEQUEENHIVEGROWN = "Чёрт, оно огромное!",
        BEEGUARD = "Охраняет королеву.",
        HIVEHAT = "Кажется, оно прилипло к моей голове.",
        MINISIGN =
        {
            GENERIC = "Надо ещё немного доработать.",
            UNDRAWN = "Там должно что-то быть.",
        },
        MINISIGN_ITEM = "В таком виде толку мало. Надо установить.",
		BEE =
		{
			GENERIC = "Хороший работник.",
			HELD = "Такое маленькое, такое... хрупкое.",
		},
		BEEBOX =
		{
			READY = "Мёд готов.",
			FULLHONEY = "Заполнено.",
			GENERIC = "Пчёлы.",
			NOHONEY = "Нет, мёда пока нет.",
			SOMEHONEY = "Надо немного подождать.",
			BURNT = "Очень жаль. Впрочем...",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "Сколько грибов!",
			LOTS = "Грибы отлично прижились на бревне.",
			SOME = "Теперь должно расти дальше.",
			EMPTY = "Не помешала бы спора. Или пересадить гриб.",
			ROTTEN = "Бревно мёртвое. Надо заменить.",
			BURNT = "Одни угли.",
			SNOWCOVERED = "Не лучший для этого сезон.",
		},
		BEEFALO =
		{
			FOLLOWER = "Оно идёт за мной.",
			GENERIC = "Выглядит безобидно.",
			NAKED = "Неудачник.",
			SLEEPING = "Удачи разбудить их.",
            --Domesticated states:
            DOMESTICATED = "Теперь моё.",
            ORNERY = "Оно злится.",
            RIDER = "На нём можно ездить.",
            PUDGY = "Хмм, кажется, еды внутри многовато.",
		},

		BEEFALOHAT = "Зачем рога?",
		BEEFALOWOOL = "Полезно.",
		BEEHAT = "В этой штуке плохо видно.",
        BEESWAX = "Воск.",
		BEEHIVE = "Смотри на них — работают без остановки.",
		BEEMINE = "Оно живое.",
		BEEMINE_MAXWELL = "Комариная ярость в бутылке!",
		BERRIES = "Красное. Как кровь моих врагов.",
		BERRIES_COOKED = "Теперь они просто более жидкие.",
        BERRIES_JUICY = "М-м-м.",
        BERRIES_JUICY_COOKED = "Неплохо.",
		BERRYBUSH =
		{
			BARREN = "Нужно топливо.",
			WITHERED = "Жара его убила.",
			GENERIC = "Моё.",
			PICKED = "Скоро снова появятся.",
			DISEASED = "Оно вот-вот сдохнет.",
			DISEASING = "Э-э-э...",
			BURNING = "Ну вот, прощай еда.",
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "Нужно топливо.",
			WITHERED = "Жара его убила.",
			GENERIC = "Не возражаешь, если я...",
			PICKED = "Скоро снова появятся.",
			DISEASED = "Оно вот-вот сдохнет.",
			DISEASING = "Э-э-э...",
			BURNING = "Ну вот, прощай еда.",
		},
		BIGFOOT = "Вот это огромная ступня.",
		BIRDCAGE =
		{
			GENERIC = "Мне нужна птица.",
			OCCUPIED = "Внутри, наверное, не очень весело, да?",
			SLEEPING = "Неактивно.",
			HUNGRY = "Наверное, стоит его покормить.",
			STARVING = "Ты выглядишь слабым.",
			DEAD = "Ну и ладно, мне всё равно.",
			SKELETON = "Мертво.",
		},
		BIRDTRAP = "Давай же...",
		CAVE_BANANA_BURNT = "Жаль.",
		BIRD_EGG = "Яйцо.",
		BIRD_EGG_COOKED = "М-м-м.",
		BISHOP = "Я тебе глаз выколю!",
		BLOWDART_FIRE = "Зажигательный дротик.",
		BLOWDART_SLEEP = "Осторожно...",
		BLOWDART_PIPE = "Нужны боеприпасы.",
		BLOWDART_YELLOW = "Вот это точность.",
		BLUEAMULET = "Холодно.",
		BLUEGEM = "Кажется, от него у меня даже руки мокнут.",
		BLUEPRINT = 
		{ 
            COMMON = "Я не инженер.",
            RARE = "Я не инженер.",
        },
        SKETCH = "Образец для скульптуры.",
		BLUE_CAP = "Выглядит съедобно.",
		BLUE_CAP_COOKED = "Теперь выглядит ещё съедобнее.",
		BLUE_MUSHROOM =
		{
			GENERIC = "Гриб.",
			INGROUND = "Спит.",
			PICKED = "Интересно, вырастет снова?",
		},
		BOARDS = "Доски.",
		BONESHARD = "Острые кости.",
		BONESTEW = "Очень питательно.",
		BUGNET = "Для ловли насекомых.",
		BUSHHAT = "Немного колючее.",
		BUTTER = "Масло.",
		BUTTERFLY =
		{
			GENERIC = "Посмотри, какое хрупкое.",
			HELD = "Попалось!",
		},
		BUTTERFLYMUFFIN = "Какой странный вкус.",
		BUTTERFLYWINGS = "Интересно, для чего это пригодится?",
		BUZZARD = "Пир стервятника.",

		SHADOWDIGGER = "Так знакомо...",

		CACTUS = 
		{
			GENERIC = "Выживальщик пустыни.",
			PICKED = "Оно всё ещё способно защищаться.",
		},
		CACTUS_MEAT_COOKED = "Ну... не так уж плохо?",
		CACTUS_MEAT = "Для растения на удивление мясистое.",
		CACTUS_FLOWER = "Цветок. Как любой другой.",

		COLDFIRE =
		{
			EMBERS = "Вот-вот погаснет.",
			GENERIC = "Разве это не так работает?",
			HIGH = "Только посмотри.",
			LOW = "Кажется, нужно больше топлива.",
			NORMAL = "Сойдёт.",
			OUT = "Погасло.",
		},
		CAMPFIRE =
		{
			EMBERS = "Вот-вот погаснет.",
			GENERIC = "Тепло.",
			HIGH = "Только посмотри.",
			LOW = "Кажется, нужно больше топлива.",
			NORMAL = "Сойдёт.",
			OUT = "Погасло.",
		},
		CANE = "С этим я стану ещё быстрее!",
		CATCOON = "Кошачье создание.",
		CATCOONDEN = 
		{
			GENERIC = "Маленький домик.",
			EMPTY = "Какое печальное зрелище. Впрочем...",
		},
		CATCOONHAT = "Оно того стоит.",
		COONTAIL = "Какой гибкий.",
		CARROT = "На самом деле морковь не улучшает зрение.",
		CARROT_COOKED = "Мягкая, легко жуется.",
		CARROT_PLANTED = "Растёт.",
		CARROT_SEEDS = "Семечко моркови.",
		CARTOGRAPHYDESK =
		{
			GENERIC = "Полезно.",
			BURNING = "Ну и всё.",
			BURNT = "Теперь только пепел.",
		},
		WATERMELON_SEEDS = "Семечко арбуза.",
		CAVE_FERN = "Папоротник.",
		CHARCOAL = "Отличное топливо.",
        CHESSPIECE_PAWN = "Хм.",
        CHESSPIECE_ROOK =
        {
            GENERIC = "Почему ты такой большой?",
            STRUGGLE = "Это невероятно.",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "Рыцарь.",
            STRUGGLE = "Это невероятно.",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "Выглядит точь-в-точь как роботизированная версия.",
            STRUGGLE = "Это невероятно.",
        },
        CHESSPIECE_MUSE = "Хмм... знакомо выглядит.",
        CHESSPIECE_FORMAL = "Не очень-то по-королевски.",
        CHESSPIECE_HORNUCOPIA = "От одного вида желудок урчит.",
        CHESSPIECE_PIPE = "Это никогда особо не было моим.",
        CHESSPIECE_DEERCLOPS = "Такое чувство, будто его глаз следит за тобой.",
        CHESSPIECE_BEARGER = "Вблизи оно было куда больше.",
        CHESSPIECE_MOOSEGOOSE =
        {
            "Фу. Как живое.",
        },
        CHESSPIECE_DRAGONFLY = "А, сразу воспоминания нахлынули. Плохие.",
        CHESSPIECE_BUTTERFLY = "Красиво выглядит, да?",
        CHESSPIECE_ANCHOR = "Тяжёлое, как и выглядит.",
        CHESSPIECE_MOON = "Последнее время на меня что-то вдохновение напало.",
        CHESSJUNK1 = "Куча сломанных шахматных фигур.",
        CHESSJUNK2 = "Ещё куча сломанных шахматных фигур.",
        CHESSJUNK3 = "И ещё больше сломанных шахматных фигур.",
		CHESTER = "Странная штука, похожая на собаку.",
		CHESTER_EYEBONE =
		{
			GENERIC = "Хватит на меня смотреть.",
			WAITING = "Неактивно.",
		},
		COOKEDMANDRAKE = "По крайней мере, больше не издаёт этих раздражающих писков.",
		COOKEDMEAT = "Средней прожарки.",
		COOKEDMONSTERMEAT = "Эх.",
		COOKEDSMALLMEAT = "Оно настолько маленькое, что от еды толку не будет.",
		COOKPOT =
		{
			COOKING_LONG = "Надо подождать.",
			COOKING_SHORT = "Это ненадолго.",
			DONE = "Наконец-то.",
			EMPTY = "Странно: просто бросаешь ингредиенты внутрь, а оно само готовит.",
			BURNT = "Иронично.",
		},
		CORN = "Кукуруза.",
		CORN_COOKED = "Кукуруза.",
		CORN_SEEDS = "Семечко кукурузы.",
        CANARY =
		{
			GENERIC = "Красота-то какая.",
			HELD = "Такое крошечное...",
		},
        CANARY_POISONED = "Наверное, нормально.",

		CRITTERLAB = "Там внутри что-то есть?",
        CRITTER_GLOMLING = "Какое аэродинамичное создание!",
        CRITTER_DRAGONLING = "Этот червяк пробрался прямо мне в сердце.",
		CRITTER_LAMB = "Куда менее слизистое, чем его мамаша.",
        CRITTER_PUPPY = "Верный пёс.",
        CRITTER_KITTEN = "Ты не очень полезно выглядишь.",
        CRITTER_PERDLING = "Мой пернатый друг.",
		CRITTER_LUNARMOTHLING = "Я держу её рядом, потому что она хорошо разбирается в мотематике.",

		CROW =
		{
			GENERIC = "Знак смерти.",
			HELD = "Ты ведь жаждешь свободы, да?",
		},
		CUTGRASS = "Из этого можно сделать верёвку. В хозяйстве пригодится.",
		CUTREEDS = "Сырьё.",
		CUTSTONE = "Оказывается, я не только хороший боец, но и отличный каменотёс.",
		DEADLYFEAST = "Очень мощное блюдо.",
		DEER =
		{
			GENERIC = "Лесное создание.",
			ANTLER = "Внушительный размер.",
		},
        DEER_ANTLER = "Внушительный размер.",
        DEER_GEMMED = "То, что тобой управляют, от неминуемого конца не спасёт!",
		DEERCLOPS = "Попробуй меня достать!",
		DEERCLOPS_EYEBALL = "Мягкое.",
		EYEBRELLAHAT =	"Оно моргает?",
		DEPLETED_GRASS =
		{
			GENERIC = "Наверное, просто пучок травы.",
		},
        GOGGLESHAT = "У меня уже есть очки!",
        DESERTHAT = "Хорошо защищает глаза.",
		DEVTOOL = "Пахнет беконом!",
		DEVTOOL_NODEV = "Я недостаточно силён, чтобы этим нормально управляться.",
		DIRTPILE = "Куча земли... или НЕ куча?",
		DIVININGROD =
		{
			COLD = "Сигнал очень слабый.",
			GENERIC = "Какой-то маячок.",
			HOT = "Эта штука сходит с ума!",
			WARM = "Я иду в правильную сторону.",
			WARMER = "Должно быть, уже совсем близко.",
		},
		DIVININGRODBASE =
		{
			GENERIC = "Интересно, что оно делает.",
			READY = "Похоже, сюда нужен большой ключ.",
			UNLOCKED = "Теперь машина заработает!",
		},
		DIVININGRODSTART = "Этот стержень выглядит полезным.",
		DRAGONFLY = "Как блестит.",
		ARMORDRAGONFLY = "Кажется, я закипаю.",
		DRAGON_SCALES = "Твёрдое и тёплое.",
		DRAGONFLYCHEST = "Достаточно безопасно.",
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "Не думаю, что оно должно так выглядеть.",
			GENERIC = "Даёт много тепла, но мало света.", --no gems
			NORMAL = "Оно мне подмигивает?", --one gem
			HIGH = "Обжигает!", --two gems
		},
        
        HUTCH = "Хатч Рыбовис, частный детектив.",
        HUTCH_FISHBOWL =
        {
            GENERIC = "Всегда хотел такую штуку.",
            WAITING = "Может, ему нужна наука?",
        },
		LAVASPIT = 
		{
			HOT = "Горячий плевок!",
			COOL = "Я называю это «базаливой».",
		},
		LAVA_POND = "Магмолепно!",
		LAVAE = "Слишком горячее.",
		LAVAE_COCOON = "Остыло и успокоилось.",
		LAVAE_PET = 
		{
			STARVING = "Бедняга, наверное, голодает.",
			HUNGRY = "Слышу, как урчит маленький желудок.",
			CONTENT = "Похоже, оно довольно.",
			GENERIC = "О-о. Кто тут хороший монстр?",
		},
		LAVAE_EGG = 
		{
			GENERIC = "Изнутри идёт слабое тепло.",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "Думаю, яйцу недостаточно тепло.",
			COMFY = "Никогда не думал, что увижу счастливое яйцо.",
		},
		LAVAE_TOOTH = "Яичный зуб!",

		DRAGONFRUIT = "Колючее.",
		DRAGONFRUIT_COOKED = "Всё ещё колючее.",
		DRAGONFRUIT_SEEDS = "Семечко странного фрукта.",
		DRAGONPIE = "Драконий фрукт очень сытный.",
		DRUMSTICK = "Чёртова раздражающая птица.",
		DRUMSTICK_COOKED = "Ты заслуживаешь стать вкусным.",
		DUG_BERRYBUSH = "Теперь это можно унести куда угодно.",
		DUG_BERRYBUSH_JUICY = "Можно пересадить поближе к дому.",
		DUG_GRASS = "Теперь можно посадить где угодно.",
		DUG_MARSH_BUSH = "Это надо посадить.",
		DUG_SAPLING = "Это надо посадить.",
		DURIAN = "Фу, как пахнет!",
		DURIAN_COOKED = "Теперь пахнет ещё хуже!",
		DURIAN_SEEDS = "Семечко дуриана.",
		EARMUFFSHAT = "От него тепло и уютно внутри. И снаружи тоже.",
		EGGPLANT = "На яйцо не похоже.",
		EGGPLANT_COOKED = "Теперь ещё меньше похоже на яйцо.",
		EGGPLANT_SEEDS = "Семечко баклажана.",
		
		ENDTABLE = 
		{
			BURNT = "Сгоревшая ваза на сгоревшем столе.",
			GENERIC = "Цветок в вазе на столе.",
			EMPTY = "Стоит что-нибудь туда поставить.",
			WILTED = "Выглядит не очень свежо.",
			FRESHLIGHT = "Приятно иметь хоть немного света.",
			OLDLIGHT = "Мы точно не забыли взять новые лампочки?", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE = 
		{
			BURNING = "Уже поздно что-либо делать.",
			BURNT = "Как угодно.",
			CHOPPED = "Я должен испытывать раскаяние?",
			POISON = "А, так вот что они имели в виду, когда говорили, что деревья живые.",
			GENERIC = "В Неваде таких не особо много.",
		},
		ACORN = "Там определённо что-то внутри.",
        ACORN_SAPLING = "Скоро станет деревом!",
		ACORN_COOKED = "Идеально прожарено.",
		BIRCHNUTDRAKE = "Безумный маленький орешек.",
		EVERGREEN =
		{
			BURNING = "Уже поздно что-либо делать.",
			BURNT = "Как угодно.",
			CHOPPED = "Я должен испытывать раскаяние?",
			GENERIC = "В Неваде таких не особо много.",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "Уже поздно что-либо делать.",
			BURNT = "Как угодно.",
			CHOPPED = "Я должен испытывать раскаяние?",
			GENERIC = "В Неваде таких не особо много.",
		},
		TWIGGYTREE = 
		{
			BURNING = "Уже поздно что-либо делать.",
			BURNT = "Как угодно.",
			CHOPPED = "Я должен испытывать раскаяние?",
			GENERIC = "Вот теперь это выглядит печально.",			
			DISEASED = "Каким-то образом стало ещё уродливее.",
		},
		TWIGGY_NUT_SAPLING = "Ему не нужна помощь, чтобы расти.",
        TWIGGY_OLD = "Какое хилое дерево.",
		TWIGGY_NUT = "Орех.",
		EYEPLANT = "Кажется, за мной наблюдают.",
		INSPECTSELF = "Я ещё цел?",
		FARMPLOT =
		{
			GENERIC = "Надо попробовать что-нибудь вырастить.",
			GROWING = "Давайте, растения, растите!",
			NEEDSFERTILIZER = "Кажется, его надо удобрить.",
			BURNT = "Не думаю, что в куче пепла что-то вырастет.",
		},
		FEATHERHAT = "СТАНЬ ПТИЦЕЙ!",
		FEATHER_CROW = "Перо чёрной птицы.",
		FEATHER_ROBIN = "Перо красной птицы.",
		FEATHER_ROBIN_WINTER = "Перо снежной птицы.",
		FEATHER_CANARY = "Перо канарейки.",
		FEATHERPENCIL = "Перо повышает научные свойства письма.",
		FEM_PUPPET = "Она в ловушке!",
		FIREFLIES =
		{
			GENERIC = "Вот бы поймать их!",
			HELD = "От них у меня карман светится!",
		},
		FIREHOUND = "Эта светится.",
		FIREPIT =
		{
			EMBERS = "Надо что-нибудь подбросить в огонь, пока он не погас.",
			GENERIC = "Всё лучше темноты.",
			HIGH = "Хорошо, что огонь под контролем!",
			LOW = "Огонь слабеет.",
			NORMAL = "Тепло и уютно.",
			OUT = "Хотя бы можно снова разжечь.",
		},
		COLDFIREPIT =
		{
			EMBERS = "Надо что-нибудь подбросить в огонь, пока он не погас.",
			GENERIC = "Всё лучше темноты.",
			HIGH = "Хорошо, что огонь под контролем!",
			LOW = "Огонь слабеет.",
			NORMAL = "Тепло и уютно.",
			OUT = "Хотя бы можно снова разжечь.",
		},
		FIRESTAFF = "Я не хочу поджигать весь мир.",
		FIRESUPPRESSOR = 
		{	
			ON = "Поливай!",
			OFF = "На фронте полива всё спокойно.",
			LOWFUEL = "Топливо заканчивается.",
		},

		FISH = "Теперь еды хватит на день.",
		FISHINGROD = "Сойдёт.",
		FISHSTICKS = "Сытно.",
		FISHTACOS = "Как хрустит.",
		FISH_COOKED = "Лучшее, что я смог сделать.",
		FLINT = "Ключевой ингредиент.",
		FLOWER = 
		{
            GENERIC = "Цветок для Неё.",
            ROSE = "Чертовски красиво.",
        },
        FLOWER_WITHERED = "Не повезло.",
		FLOWERHAT = "Отлично пахнет.",
		FLOWER_EVIL = "Они сошли с ума.",
		FOLIAGE = "Немного зелени.",
		FOOTBALLHAT = "Никогда не занимался спортом.",
        FOSSIL_PIECE = "Костяной Доктор.",
        FOSSIL_STALKER =
        {
			GENERIC = "Не-а.",
			FUNNY = "Неправильный порядок.",
			COMPLETE = "Оно движется?",
        },
        STALKER = "Скелет сросся с тенями!",
        STALKER_ATRIUM = "Почему оно должно быть таким огромным?",
        STALKER_MINION = "Кусаки!",
        THURIBLE = "Пахнет химикатами.",
        ATRIUM_OVERGROWTH = "Что это всё такое?",
		FROG =
		{
			DEAD = "Мертво.",
			GENERIC = "Слизкое и мерзкое.",
			SLEEPING = "Неактивно.",
		},
		FROGGLEBUNWICH = "И какой смысл?",
		FROGLEGS = "Говорят, это деликатес.",
		FROGLEGS_COOKED = "На вкус как курица.",
		FRUITMEDLEY = "Фруктовое.",
		FURTUFT = "Чёрно-белый мех.", 
		GEARS = "Я не инженер.",
		GHOST = "Это невероятно.",
		GOLDENAXE = "Тяжёлое.",
		GOLDENPICKAXE = "Это мне хорошо послужит.",
		GOLDENPITCHFORK = "...",
		GOLDENSHOVEL = "Этого хватит надолго.",
		GOLDNUGGET = "МОЯ кровь тоже золотая?",
		GRASS =
		{
			BARREN = "Ему нужны удобрения.",
			WITHERED = "В такую жару оно не отрастёт.",
			BURNING = "Быстро горит!",
			GENERIC = "Пучок травы.",
			PICKED = "Срезано в самом расцвете сил.",
			DISEASED = "Выглядит больным.",
			DISEASING = "Эм, что-то тут не так.",
		},
		GRASSGEKKO = 
		{
			GENERIC = "Очень лиственная ящерица.",	
			DISEASED = "Выглядит совсем больной.",
		},
		GREEN_CAP = "Вроде вполне обычное.",
		GREEN_CAP_COOKED = "Теперь оно другое...",
		GREEN_MUSHROOM =
		{
			GENERIC = "Гриб.",
			INGROUND = "Спит.",
			PICKED = "Интересно, вырастет снова?",
		},
		GUNPOWDER = "Мне нравится взрывчатка.",
		HAMBAT = "Ладно?",
		HAMMER = "Помогает выпустить злость.",
		HEALINGSALVE = "Скучаю по нормальной медицине Агентства.",
		HEATROCK =
		{
			FROZEN = "Холоднее льда.",
			COLD = "Холодный камень.",
			GENERIC = "Я мог бы менять его температуру.",
			WARM = "Довольно тёплый и уютный... для камня.",
			HOT = "Приятно горячий.",
		},
		HOME = "Тут кто-то живёт.",
		HOMESIGN =
		{
			GENERIC = "Тут написано: «Вы здесь».",
            UNWRITTEN = "Табличка пока пустая.",
			BURNT = "«Не играй со спичками».",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "Тут написано: «Туда».",
            UNWRITTEN = "Табличка пока пустая.",
			BURNT = "«Не играй со спичками».",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "Тут написано: «Туда».",
            UNWRITTEN = "Табличка пока пустая.",
			BURNT = "«Не играй со спичками».",
		},
		HONEY = "Какое липкое.",
		HONEYCOMB = "Здесь когда-то жили пчёлы.",
		HONEYHAM = "Сладкое и солёное.",
		HONEYNUGGETS = "На вкус как курица, хотя, кажется, это не курица.",
		HORN = "Звучит так, будто внутри целое стадо бифало.",
		HOUND = "Тупая псина!",
		HOUNDCORPSE =
		{
			GENERIC = "Запах не самый приятный.",
			BURNING = "Теперь, кажется, безопасно.",
			REVIVING = "На этом этапе ты уже сам напрашиваешься на ещё одну взбучку.",
		},
		HOUNDBONE = "Хм.",
		HOUNDMOUND = "Так вот откуда они лезут.",
		ICEBOX = "Я подчинил силу холода!",
		ICEHAT = "Не перегревайся, парень.",
		ICEHOUND = "Интересно, можно ли его растопить.",
		INSANITYROCK =
		{
			ACTIVE = "ПОЛУЧАЙ, ЗДРАВЫЙ РАССУДОК!",
			INACTIVE = "Это скорее пирамида, чем обелиск.",
		},
		JAMMYPRESERVES = "Наверное, надо было взять банку.",

		KABOBS = "Обед на палочке.",
		KILLERBEE =
		{
			GENERIC = "О нет! Пчела-убийца!",
			HELD = "Выглядит опасно.",
		},
		KNIGHT = "Ты правда хочешь со мной драться без оружия?",
		KOALEFANT_SUMMER = "М-м-м.",
		KOALEFANT_WINTER = "Осталось только убрать всю шерсть перед едой.",
		KRAMPUS = "Кража наказуема.",
		KRAMPUS_SACK = "Будто дна нет.",
		LEIF = "Он огромный!",
		LEIF_SPARSE = "Он огромный!",
		LIGHTER  = "Её любимая зажигалка.",
		LIGHTNING_ROD =
		{
			CHARGED = "Я бы не трогал.",
			GENERIC = "Спасает меня от молний восстановления реальности.",
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "И зачем ТЫ вообще существуешь?",
			CHARGED = "Как?",
		},
		LIGHTNINGGOATHORN = "Как миниатюрный громоотвод.",
		GOATMILK = "Аж гудит от вкуса!",
		LITTLE_WALRUS = "Он не всегда будет таким милым и пушистым.",
		LIVINGLOG = "Уродливое.",
		LOG =
		{
			BURNING = "Ещё немного погорит.",
			GENERIC = "Дерево.",
		},
		LUCY = "Какое острое...",
		LUREPLANT = "Так и манит.",
		LUREPLANTBULB = "Теперь я могу завести собственную мясную ферму.",
		MALE_PUPPET = "Он в ловушке!",

		MANDRAKE_ACTIVE = "Если не заткнёшься, я тебя затопчу.",
		MANDRAKE_PLANTED = "Что это?",
		MANDRAKE = "Так мне нравится больше.",

        MANDRAKESOUP = "Ну, он больше не проснётся.",
        MANDRAKE_COOKED = "Теперь уже не кажется таким странным.",
        MAPSCROLL = "Пустая карта. Не очень-то полезно.",
        MARBLE = "Шикарно!",
        MARBLEBEAN = "Я обменял на это старую семейную корову.",
        MARBLEBEAN_SAPLING = "Выглядит вырезанным.",
        MARBLESHRUB = "Мне всё понятно.",
        MARBLEPILLAR = "Думаю, это мне пригодится.",
        MARBLETREE = "Не думаю, что топор тут поможет.",
        MARSH_BUSH =
        {
			BURNT = "Одной колючей зарослью меньше.",
            BURNING = "Быстро горит!",
            GENERIC = "Выглядит колючим.",
            PICKED = "Ай.",
        },
        BURNT_MARSH_BUSH = "Всё сгорело.",
        MARSH_PLANT = "Растение.",
        MARSH_TREE =
        {
            BURNING = "Колючки и огонь!",
            BURNT = "Теперь оно обгоревшее и колючее.",
            CHOPPED = "Теперь не такое колючее.",
            GENERIC = "Эти шипы выглядят острыми!",
        },
        MAXWELL = "Теневой человек.",
        MAXWELLHEAD = "Антигерой.",
        MAXWELLLIGHT = "Интересно, как они работают.",
        MAXWELLLOCK = "Похоже на замочную скважину.",
        MAXWELLTHRONE = "Не выглядит удобным.",
        MEAT = "Мне не жаль.",
        MEATBALLS = "Питательно.",
        MEATRACK =
        {
            DONE = "Время вяленого мяса!",
            DRYING = "Мясо сушится небыстро.",
            DRYINGINRAIN = "Под дождём мясо сушится ещё дольше.",
            GENERIC = "Надо бы насушить мяса.",
            BURNT = "Сушилка тоже высохла.",
            DONE_NOTMEAT = "В лабораторных терминах это называется «сухое».",
            DRYING_NOTMEAT = "Сушка — наука неточная.",
            DRYINGINRAIN_NOTMEAT = "Дождик, дождик, уходи. Намочи всё в другой раз.",
        },
        MEAT_DRIED = "Как раз достаточно сухое.",
        MERM = "Болотный зомби.",
        MERMHEAD =
        {
            GENERIC = "Наверное, заслужил.",
            BURNT = "Всё равно бы сгнило.",
        },
        MERMHOUSE =
        {
            GENERIC = "Это просто печально.",
            BURNT = "Ха!",
        },
        MINERHAT = "Освещает дорогу, а руки свободны.",
        MONKEY = "Что тебе от меня надо?",
        MONKEYBARREL = "Оно только что шевельнулось?",
        MONSTERLASAGNA = "Эм...",
        FLOWERSALAD = "Миска листвы.",
        ICECREAM = "Мороженое! Обожаю.",
        WATERMELONICLE = "Криогенный арбуз.",
        TRAILMIX = "Полезный натуральный перекус.",
        HOTCHILI = "Огонь во рту!",
        GUACAMOLE = "Любимое блюдо Авогадро.",
        MONSTERMEAT = "Фу. Не думаю, что это стоит есть.",
        MONSTERMEAT_DRIED = "Вяленое мясо со странным запахом.",
        MOOSE = "Ты меня не пугаешь.",
        MOOSE_NESTING_GROUND = "Там у него детёныши.",
        MOOSEEGG = "Так и тянет разбить, а потом пожарить.",
        MOSSLING = "Хватит издавать эти звуки.",
        FEATHERFAN = "Вниз, чтобы температура пошла вниз.",
        MINIFAN = "Каким-то образом сзади ветер выходит вдвое быстрее.",
        GOOSE_FEATHER = "Пушистое!",
        STAFF_TORNADO = "Вращающаяся погибель.",
        MOSQUITO =
        {
            GENERIC = "Мерзкий маленький кровосос.",
            HELD = "Из-за моей крови его брюшко теперь жёлтое.",
        },
        MOSQUITOSACK = "Наверное, это чья-то чужая кровь...",
        MOUND =
        {
            DUG = "Наверное, заслужил.",
            GENERIC = "Держу пари, там внизу полно полезного добра.",
        },
        NIGHTLIGHT = "Даёт жутковатый свет.",
        NIGHTMAREFUEL = "Босс?",
        NIGHTSWORD = "Так знакомо...",
        NITRE = "Ещё один вид камня.",
        ONEMANBAND = "Надо бы добавить колокольчик для бифало.",
        OASISLAKE =
		{
			GENERIC = "Это мираж?",
			EMPTY = "Сухо до последней капли.",
		},
        PANDORASCHEST = "Там может быть что-то потрясающее. Или ужасное.",
        PANFLUTE = "Чтобы серенады животным играть.",
        PAPYRUS = "Несколько листов бумаги.",
        WAXPAPER = "Несколько листов вощёной бумаги.",
        PENGUIN = "Наверное, сезон размножения.",
        PERD = "Хватит убегать, дай уже тебя поймать!",
        PEROGIES = "Вышло довольно неплохо.",
        PETALS = "Бесполезный мусор.",
        PETALS_EVIL = "От них веет безумием.",
        PHLEGM = "Густое, тягучее. И солёное.",
        PICKAXE = "Хорошо подходит, чтобы разбивать твёрдые вещи.",
        PIGGYBACK = "Выглядит крайне сомнительно.",
        PIGHEAD =
        {
            GENERIC = "О. Прекрасно. Оккультизм.",
            BURNT = "Пахнет беконом.",
        },
        PIGHOUSE =
        {
            FULL = "Запомни: даже внутри ты не в безопасности. Врываться я умею.",
            GENERIC = "До технологий Невады этому далеко.",
            LIGHTSOUT = "Это всё, на что ты способен?",
            BURNT = "Чёртов неудачник.",
        },
        PIGKING = "Вот это гора бекона.",
        PIGMAN =
        {
            DEAD = "Погиб в бою.",
            FOLLOWER = "Из меня не лучший командир.",
            GENERIC = "Почему они всё время такие счастливые?",
            GUARD = "Какая-то местная власть.",
            WEREPIG = "Вот теперь с тобой хотя бы интересно!",
        },
        PIGSKIN = "Хвост всё ещё на месте.",
        PIGTENT = "Пахнет беконом.",
        PIGTORCH = "Примитивно.",
        PINECONE = "Пахнет на удивление... успокаивающе.",
        PINECONE_SAPLING = "Пусть растёт.",
        LUMPY_SAPLING = "Как это дерево вообще размножилось?",
        PITCHFORK = "Вилка размером с MAG-агента.",
        PLANTMEAT = "Не очень аппетитно.",
        PLANTMEAT_COOKED = "По крайней мере теперь тёплое.",
        PLANT_NORMAL =
        {
            GENERIC = "Листики!",
            GROWING = "Угх! Как же медленно оно растёт!",
            READY = "М-м-м. Можно собирать.",
            WITHERED = "Жара его убила.",
        },
        POMEGRANATE = "Похоже на внутренности мозга пришельца.",
        POMEGRANATE_COOKED = "Высокая кухня!",
        POMEGRANATE_SEEDS = "Семечко граната... или как его там.",
        POND = "Вода грязная.",
        POOP = "Ждёшь от меня смешной комментарий?",
        FERTILIZER = "Это определённо ведро, полное навоза.",
        PUMPKIN = "Для растения размер впечатляющий.",
        PUMPKINCOOKIE = "Симпатичное тыквенное печенье.",
        PUMPKIN_COOKED = "Как оно не превратилось в пирог?",
        PUMPKIN_LANTERN = "Надо аккуратнее, чтобы не разбить.",
        PUMPKIN_SEEDS = "Семечко тыквы.",
        PURPLEAMULET = "Оно шепчет мне.",
        PURPLEGEM = "Внутри будто целый мир.",
        RABBIT =
        {
            GENERIC = "Добыча.",
            HELD = "Попалось.",
        },
        RABBITHOLE =
        {
            GENERIC = "Интересно, насколько глубоко уходит нора.",
            SPRING = "Как им там хватает воздуха?",
        },
        RAINOMETER =
        {
            GENERIC = "Приближается буря.",
            BURNT = "Измерительные части превратились в облако дыма.",
        },
        RAINCOAT = "Достаточно, чтобы защитить костюм от воды.",
        RAINHAT = "Мне не нравится звук дождя по этой шляпе.",
        RATATOUILLE = "Отличный источник клетчатки.",
        RAZOR = "Старомодно.",
        REDGEM = "Сверкает внутренним теплом.",
        RED_CAP = "Странно пахнет.",
        RED_CAP_COOKED = "Теперь оно другое...",
        RED_MUSHROOM =
        {
            GENERIC = "Гриб.",
            INGROUND = "Спит.",
            PICKED = "Интересно, вырастет снова?",
        },
        REEDS =
        {
            BURNING = "Вот это горит!",
            GENERIC = "Пучок камыша.",
            PICKED = "Всё полезное уже собрали.",
        },
        RELIC = "Древняя домашняя утварь.",
        RUINS_RUBBLE = "Это можно починить.",
        RUBBLE = "Просто обломки камня.",
        RESEARCHLAB =
        {
            GENERIC = "Помогает мне создавать вещи. Я не особо мастер, но работает.",
            BURNT = "Как оно вообще сгорело, если почти целиком из камня?",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "Странная наука.",
            BURNT = "Жаль.",
        },
        RESEARCHLAB3 =
        {
            GENERIC = "Это местный двигатель невероятности?",
            BURNT = "Магия от огня не спасла.",
        },
        RESEARCHLAB4 =
        {
            GENERIC = "Безумие Шляпника.",
            BURNT = "Зря потратили головной убор.",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "Пахнет мертвечиной.",
            BURNT = "Погасло.",
        },
        RESURRECTIONSTONE = "Какой-то алтарь.",
        ROBIN =
        {
            GENERIC = "Это значит, что зима закончилась?",
            HELD = "Ему нравится у меня в кармане.",
        },
        ROBIN_WINTER =
        {
            GENERIC = "Жизнь в ледяной пустоши.",
            HELD = "Такое мягкое.",
        },
        ROBOT_PUPPET = "Они в ловушке!",
        ROCK_LIGHT =
        {
            GENERIC = "Лавовая яма, покрытая коркой.",
            OUT = "Выглядит хрупко.",
            LOW = "Лава покрывается коркой.",
            NORMAL = "Тепло и уютно.",
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "Думаю, этот я смогу поднять.",
            RAISED = "Не дотянуться.",
        },
        ROCK = "Камень.",
        PETRIFIED_TREE = "Честно говоря, так выглядит лучше.",
        ROCK_PETRIFIED_TREE = "Честно говоря, так выглядит лучше.",
        ROCK_PETRIFIED_TREE_OLD = "Честно говоря, так выглядит лучше.",
        ROCK_ICE =
        {
            GENERIC = "Понадобится в следующем сезоне.",
            MELTED = "Пока снова не замёрзнет, толку не будет.",
        },
        ROCK_ICE_MELTED = "Пока снова не замёрзнет, толку не будет.",
        ICE = "Лёд. Рад знакомству.",
        ROCKS = "Пригодится для простых поделок.",
        ROOK = "Размер тебя не спасёт.",
        ROPE = "Крепко.",
        ROTTENEGG = "Угх.",
        ROYAL_JELLY = "Наполняет едока силой науки!",
        JELLYBEAN = "Одна часть желе, одна часть боба.",
        SADDLE_BASIC = "Теперь можно оседлать какое-нибудь вонючее животное.",
        SADDLE_RACE = "Это седло прямо летает!",
        SADDLE_WAR = "Главное — потом не натереть всё седлом.",
        SADDLEHORN = "Этим можно снять седло.",
        SALTLICK = "Сколько раз надо лизнуть, чтобы добраться до середины?",
        BRUSH = "Бифало это наверняка нравится.",
		SANITYROCK =
		{
			ACTIVE = "Бесит.",
			INACTIVE = "Куда делась остальная часть?",
		},
		SAPLING =
		{
			BURNING = "Быстро горит!",
			WITHERED = "Может, оправится, если станет прохладнее.",
			GENERIC = "Маленькое и жалкое.",
			PICKED = "Мне не жаль.",
			DISEASED = "Оно умирает.",
			DISEASING = "Эм, что-то тут не так.",
		},
   		SCARECROW = 
   		{
			GENERIC = "Нарядился, а каркать некому.",
			BURNING = "Кто-то заставил соломенного типа проглотить ворону.",
			BURNT = "Кто-то УБИЛ это пугало!",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "На этом можно делать каменные скульптуры.",
			BLOCK = "Готово к работе.",
			SCULPTURE = "Шедевр!",
			BURNT = "Сгорело дотла.",
   		},
        SCULPTURE_KNIGHTHEAD = "Где остальное?",
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "Странная мраморная статуя.",
			UNCOVERED = "Похоже, не выдержал давления.",
			FINISHED = "Хотя бы снова целый.",
			READY = "Внутри что-то движется.",
		},
        SCULPTURE_BISHOPHEAD = "Это голова?",
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "Выглядит старым, но ощущается новым.",
			UNCOVERED = "Не хватает большого куска.",
			FINISHED = "И что теперь?",
			READY = "Внутри что-то движется.",
		},
        SCULPTURE_ROOKNOSE = "Откуда это взялось?",
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "Какая-то мраморная статуя.",
			UNCOVERED = "Состояние не лучшее.",
			FINISHED = "Всё залатано.",
			READY = "Внутри что-то движется.",
		},
        GARGOYLE_HOUND = "Мне не нравится, как оно на меня смотрит.",
        GARGOYLE_WEREPIG = "Очень правдоподобно.",
		SEEDS = "Каждое — маленькая загадка.",
		SEEDS_COOKED = "Готовка выбила из них всю жизнь.",
		SEWING_KIT = "Чёрт! Да чтоб его!",
		SEWING_TAPE = "Подходит для починки.",
		SHOVEL = "Примитивный инструмент.",
		SILK = "Мозговая паутина.",
		SKELETON = "Как прискорбно.",
		SCORCHED_SKELETON = "Это всё была твоя вина.",
		SKULLCHEST = "Не уверен, что хочу это открывать.",
		SMALLBIRD =
		{
			GENERIC = "Довольно маленькая птица.",
			HUNGRY = "Выглядит голодной.",
			STARVING = "Наверное, умирает с голоду.",
			SLEEPING = "Почти не издаёт ни звука.",
		},
		SMALLMEAT = "Крошечный кусок мёртвого животного.",
		SMALLMEAT_DRIED = "Немного вяленого мяса.",
		SPAT = "Какое потрёпанное животное.",
		SPEAR = "Кремень на палке.",
		SPEAR_WATHGRITHR = "Очень колючее на вид.",
		WATHGRITHRHAT = "Довольно нарядная шляпа.",
		SPIDER =
		{
			DEAD = "Теперь выглядит ещё неприятнее.",
			GENERIC = "Я тебя просто раздавлю.",
			SLEEPING = "Просыпайся!",
		},
		SPIDERDEN = "Дёргается.",
		SPIDEREGGSACK = "Я могу просто раздавить это.",
		SPIDERGLAND = "Резкий антисептический запах.",
		SPIDERHAT = "Надеюсь, я вычистил из этого всю паучью слизь.",
		SPIDERQUEEN = "MAG-паук?",
		SPIDER_WARRIOR =
		{
			DEAD = "Это было легко.",
			GENERIC = "Хочешь попробовать?",
			SLEEPING = "Смотрите-ка, кто спит на посту.",
		},
		SPOILED_FOOD = "Пушистый комок протухшей еды.",
        STAGEHAND =
        {
			AWAKE = "Ну здравствуй.",
			HIDING = "Не думаю, что ты собираешься мне навредить.",
        },
        STATUE_MARBLE = 
        {
            GENERIC = "Нарядная мраморная статуя.",
            TYPE1 = "Голову не потеряй!",
            TYPE2 = "Весьма статно.",
            TYPE3 = "Интересно, кто скульптор.", --bird bath type statue
        },
		STATUEHARP = "Что случилось с головой?",
		STATUEMAXWELL = "Теневой человек.",
		STEELWOOL = "Колючие металлические волокна.",
		STINGER = "Выглядит острым!",
		STRAWHAT = "Мне подходит.",
		STUFFEDEGGPLANT = "Очень сытно!",
		SWEATERVEST = "Этот жилет чертовски элегантный.",
		REFLECTIVEVEST = "Прочь, злое солнце!",
		HAWAIIANSHIRT = "Для лаборатории не годится.",
		TAFFY = "Будь у меня стоматолог, он бы за такое меня отругал.",
		TALLBIRD = "Вот это высокая птица!",
		TALLBIRDEGG = "Вылупится?",
		TALLBIRDEGG_COOKED = "Вкусно и питательно.",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "Это оно дрожит или я?",
			GENERIC = "Похоже, скоро вылупится.",
			HOT = "Яйца вообще должны потеть?",
			LONG = "Чувствую, это займёт немало времени...",
			SHORT = "Должно вылупиться совсем скоро.",
		},
		TALLBIRDNEST =
		{
			GENERIC = "Вот это яйцо!",
			PICKED = "Гнездо пустое.",
		},
		TEENBIRD =
		{
			GENERIC = "Не такая уж высокая птица.",
			HUNGRY = "Тебе срочно нужна еда, да?",
			STARVING = "У него опасный взгляд.",
			SLEEPING = "Немного поспит.",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "С этим я точно смогу пройти сквозь пространство и время!",
			GENERIC = "Похоже на узел, ведущий в другой мир.",
			LOCKED = "Чего-то всё ещё не хватает.",
			PARTIAL = "Скоро изобретение будет закончено!",
		},
		TELEPORTATO_BOX = "Возможно, этим можно управлять полярностью всей вселенной.",
		TELEPORTATO_CRANK = "Достаточно прочное для самых суровых экспериментов.",
		TELEPORTATO_POTATO = "В этой металлической картофелине скрыта огромная и страшная сила...",
		TELEPORTATO_RING = "Кольцо, способное фокусировать межпространственную энергию.",
		TELESTAFF = "С этим можно открыть мир.",
		TENT = 
		{
			GENERIC = "Без сна я начинаю слегка сходить с ума.",
			BURNT = "Спать больше негде.",
		},
		SIESTAHUT = 
		{
			GENERIC = "Неплохое место отдохнуть днём и спрятаться от жары.",
			BURNT = "Теперь тени от него мало.",
		},
		TENTACLE = "Какая гибкая штука.",
		TENTACLESPIKE = "Сойдёт.",
		TENTACLESPOTS = "Интересно, для чего это пригодится?",
		TENTACLE_PILLAR = "Слизкий столб.",
        TENTACLE_PILLAR_HOLE = "Пахнет плохо, но исследовать стоит.",
		TENTACLE_PILLAR_ARM = "Маленькие скользкие отростки.",
		TENTACLE_GARDEN = "Ещё один слизкий столб.",
		TOPHAT = "Старомодно.",
		TORCH = "Что-то, что отгоняет ночь.",
		TRANSISTOR = "Гудит от электричества.",
		TRAP = "Я сплёл это очень туго.",
		TRAP_TEETH = "Неприятный сюрприз.",
		TRAP_TEETH_MAXWELL = "Лучше туда не наступать.",
		TREASURECHEST = 
		{
			GENERIC = "Сундук с сюрпризом!",
			BURNT = "От сундука почти ничего не осталось.",
		},
		TREASURECHEST_TRAP = "Как удобно!",
		SACRED_CHEST = 
		{
			GENERIC = "Слышу шёпот. Оно чего-то хочет.",
			LOCKED = "Оно выносит свой вердикт.",
		},
		TREECLUMP = "Будто кто-то специально не хочет меня куда-то пускать.",
		
		TRINKET_1 = "Зачем вообще это плавить?", --Melted Marbles
		TRINKET_2 = "Подделка.", --Fake Kazoo
		TRINKET_3 = "Узел застрял. Навсегда.", --Gord's Knot
		TRINKET_4 = "Чомпски.", --Gnome
		TRINKET_5 = "Базово.", --Toy Rocketship
		TRINKET_6 = "Электричество они больше не проводят.", --Frazzled Wires
		TRINKET_7 = "Сейчас не время для игр!", --Ball and Cup
		TRINKET_8 = "Отлично. Теперь все мои потребности в пробках для ванны закрыты.", --Rubber Bung
		TRINKET_9 = "Шикарно.", --Mismatched Buttons
		TRINKET_10 = "Они быстро стали любимым реквизитом Уэса.", --Dentures
		TRINKET_11 = "Пятое поколение.", --Lying Robot
		TRINKET_12 = "Эта штука прямо просится в эксперимент.", --Dessicated Tentacle
		TRINKET_13 = "Чомпски, только женского пола.", --Gnomette
		TRINKET_14 = "Теперь бы ещё чаю...", --Leaky Teacup
		TRINKET_15 = "...Максвелл опять разбросал свои вещи.", --Pawn
		TRINKET_16 = "...Максвелл опять разбросал свои вещи.", --Pawn
		TRINKET_17 = "Ужасающее слияние столовых приборов. Пожалуй, наука и правда может зайти слишком далеко.", --Bent Spork
		TRINKET_18 = "Интересно, что оно прячет?", --Trojan Horse
		TRINKET_19 = "Крутится не очень хорошо.", --Unbalanced Top
		TRINKET_20 = "Вигфрид постоянно выскакивает и бьёт меня этим?!", --Backscratcher
		TRINKET_21 = "Венчик совсем погнулся.", --Egg Beater
		TRINKET_22 = "У меня есть несколько теорий насчёт этой нитки.", --Frayed Yarn
		TRINKET_23 = "Спасибо, обуваться я умею сам.", --Shoehorn
		TRINKET_24 = "Кажется, у Викерботтом была кошка.", --Lucky Cat Jar
		TRINKET_25 = "Пахнет немного залежавшимся.", --Air Unfreshener
		TRINKET_26 = "Еда и кружка! Идеальный контейнер для выживания.", --Potato Cup
		TRINKET_27 = "Если размотать, получится очень длинная штука.", --Coat Hanger
		TRINKET_28 = "Как по-макиавеллиевски.", --Rook
        TRINKET_29 = "Как по-макиавеллиевски.", --Rook
        TRINKET_30 = "Честно говоря, он просто бросает их где попало.", --Knight
        TRINKET_31 = "Честно говоря, он просто бросает их где попало.", --Knight
        TRINKET_32 = "Знаю кое-кого, кому это очень понравится.", --Cubic Zirconia Ball
        TRINKET_33 = "Надеюсь, пауков это не привлечёт.", --Spider Ring
        TRINKET_34 = "Загадаем желание.", --Monkey Paw
        TRINKET_35 = "Здесь трудно найти нормальную флягу.", --Empty Elixir
        TRINKET_36 = "После всей этой сладости они мне ещё пригодятся.", --Faux fangs
        TRINKET_37 = "Я не верю в сверхъестественное.", --Broken Stake
        TRINKET_38 = "Мои очки и так отлично увеличивают.", -- Binoculars Griftlands trinket
        TRINKET_39 = "Интересно, где вторая?", -- Lone Glove Griftlands trinket
        TRINKET_40 = "Когда держу это, так и тянет торговаться.", -- Snail Scale Griftlands trinket
        TRINKET_41 = "На ощупь немного тёплое.", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "Внутри чьи-то детские воспоминания.", -- Toy Cobra Hot Lava trinket
        TRINKET_43= "Прыгает не очень хорошо.", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "Какой-то образец растения.", -- Broken Terrarium ONI trinket
        TRINKET_45 = "Ловит частоты из другого мира.", -- Odd Radio ONI trinket
        TRINKET_46 = "Может, инструмент для проверки аэродинамики?", -- Hairdryer ONI trinket
        
        HALLOWEENCANDY_1 = "Наверное, кариес того стоит, да?",
        HALLOWEENCANDY_2 = "Какое извращение науки породило это?",
        HALLOWEENCANDY_3 = "Это... кукуруза.",
        HALLOWEENCANDY_4 = "По пути вниз они шевелятся.",
        HALLOWEENCANDY_5 = "Завтра мои зубы мне всё выскажут.",
        HALLOWEENCANDY_6 = "Я... это есть не буду.",
        HALLOWEENCANDY_7 = "Все поднимут шум из-за этого изюма.",
        HALLOWEENCANDY_8 = "Только простофиля такое не полюбит.",
        HALLOWEENCANDY_9 = "Липнет к зубам.",
        HALLOWEENCANDY_10 = "Только простофиля такое не полюбит.",
        HALLOWEENCANDY_11 = "Гораздо вкуснее настоящего.",
        HALLOWEENCANDY_12 = "Эта конфета только что шевельнулась?", --ONI meal lice candy
        HALLOWEENCANDY_13 = "Ох, моя челюсть.", --Griftlands themed candy
        HALLOWEENCANDY_14 = "Острое я переношу плохо.", --Hot Lava pepper candy
        CANDYBAG = "Какое-то вкусное карманное измерение для сладостей.",

		HALLOWEEN_ORNAMENT_1 = "Призрачное украшение для дерева.",
		HALLOWEEN_ORNAMENT_2 = "Совершенно летучее украшение.",
		HALLOWEEN_ORNAMENT_3 = "Из дерева получится хорошее украшение.", 
		HALLOWEEN_ORNAMENT_4 = "Почти щупальце как настоящее.",
		HALLOWEEN_ORNAMENT_5 = "Восьмирукое украшение.",
		HALLOWEEN_ORNAMENT_6 = "Сейчас все просто помешались на украшениях для деревьев.", 

		HALLOWEENPOTION_DRINKS_WEAK = "Я надеялся на что-нибудь побольше.",
		HALLOWEENPOTION_DRINKS_POTENT = "Сильное зелье.",
        HALLOWEENPOTION_BRAVERY = "Полно храбрости... то есть твёрдости.",
		HALLOWEENPOTION_MOON = "Пропитано какой-то там силой превращения.",
		HALLOWEENPOTION_FIRE_FX = "Кристаллизованный ад.", 
		MADSCIENCE_LAB = "Рассудок — небольшая цена за науку!",
		LIVINGTREE_ROOT = "Там что-то есть! Придётся выкопать.", 
		LIVINGTREE_SAPLING = "Вырастет большим и ужасным.",

        DRAGONHEADHAT = "И кто будет головой?",
        DRAGONBODYHAT = "К средней части у меня среднее отношение.",
        DRAGONTAILHAT = "Кто-то должен замыкать процессию.",
        PERDSHRINE =
        {
            GENERIC = "Кажется, оно чего-то хочет.",
            EMPTY = "Надо что-нибудь туда посадить.",
            BURNT = "Так не пойдёт.",
        },
        REDLANTERN = "Этот фонарь ощущается особенным.",
        LUCKY_GOLDNUGGET = "Вот это удачная находка!",
        FIRECRACKERS = "Наполнено взрывной наукой!",
        PERDFAN = "Непомерно большое.",
        REDPOUCH = "Там что-то внутри?",
        WARGSHRINE = 
        {
            GENERIC = "Надо сделать что-нибудь весёлое.",
            EMPTY = "Надо вставить туда факел.",
            BURNING = "Надо сделать что-нибудь весёлое.", --for willow to override
            BURNT = "Сгорело.",
        },
        CLAYWARG = 
        {
        	GENERIC = "Терракотовый монстр-ужас!",
        	STATUE = "Оно только что шевельнулось?",
        },
        CLAYHOUND = 
        {
        	GENERIC = "Его выпустили!",
        	STATUE = "Выглядит совсем как настоящее.",
        },
        HOUNDWHISTLE = "Такое и пса остановит.",
        CHESSPIECE_CLAYHOUND = "Эта штука волнует меня меньше всего.",
        CHESSPIECE_CLAYWARG = "И меня даже не съели!",

		PIGSHRINE =
		{
            GENERIC = "Ещё материалы для поделок.",
            EMPTY = "Оно жаждет мяса.",
            BURNT = "Перегорело.",
		},
		PIG_TOKEN = "Выглядит важным.",
		PIG_COIN = "В драке это окупится.",
		YOTP_FOOD1 = "Пир, достойный меня.",
		YOTP_FOOD2 = "Такое блюдо понравится только зверю.",
		YOTP_FOOD3 = "Ничего особенного.",

		PIGELITE1 = "На что смотришь?", --BLUE
		PIGELITE2 = "У него золотая лихорадка!", --RED
		PIGELITE3 = "Вот тебе грязь прямо в глаз!", --WHITE
		PIGELITE4 = "Может, ударишь кого-нибудь другого?", --GREEN

		PIGELITEFIGHTER1 = "На что смотришь?", --BLUE
		PIGELITEFIGHTER2 = "У него золотая лихорадка!", --RED
		PIGELITEFIGHTER3 = "Вот тебе грязь прямо в глаз!", --WHITE
		PIGELITEFIGHTER4 = "Может, ударишь кого-нибудь другого?", --GREEN

		BISHOP_CHARGE_HIT = "Чёрт!",
		TRUNKVEST_SUMMER = "Повседневный стиль дикой природы.",
		TRUNKVEST_WINTER = "Зимний комплект выживальщика.",
		TRUNK_COOKED = "Каким-то образом ещё более носатое.",
		TRUNK_SUMMER = "Лёгкий летний хобот.",
		TRUNK_WINTER = "Толстый волосатый хобот.",
		TUMBLEWEED = "Кто знает, чего этот перекати-поле нахватал.",
		TURKEYDINNER = "М-м-м.",
		TWIGS = "Ветки.",
		UMBRELLA = "Без оружия в руках я чувствую себя слишком открытым.",
		GRASS_UMBRELLA = "Без оружия в руках я чувствую себя слишком открытым.",
		UNIMPLEMENTED = "Выглядит незаконченным! Может быть опасно.",
		WAFFLES = "Не могу решить, не добавить ли ещё сиропа.",
		WALL_HAY = 
		{	
			GENERIC = "Хммм. Думаю, сойдёт.",
			BURNT = "Так не пойдёт.",
		},
		WALL_HAY_ITEM = "Похоже на плохую идею.",
		WALL_STONE = "Хорошая стена.",
		WALL_STONE_ITEM = "С ними я чувствую себя в безопасности.",
		WALL_RUINS = "Древний кусок стены.",
		WALL_RUINS_ITEM = "Крепкий кусок истории.",
		WALL_WOOD = 
		{
			GENERIC = "Остро!",
			BURNT = "Сгорело!",
		},
		WALL_WOOD_ITEM = "Штакетины!",
		WALL_MOONROCK = "Гладко и просторно!",
		WALL_MOONROCK_ITEM = "Очень лёгкое, но удивительно прочное.",
		FENCE = "Просто деревянный забор.",
        FENCE_ITEM = "Всё, что нужно для хорошего крепкого забора.",
        FENCE_GATE = "Открывается. А иногда ещё и закрывается.",
        FENCE_GATE_ITEM = "Всё, что нужно для хороших крепких ворот.",
		WALRUS = "О, думаешь, хорошо попадаешь?",
		WALRUSHAT = "Ай!",
		WALRUS_CAMP =
		{
			EMPTY = "Похоже, кто-то здесь разбивал лагерь.",
			GENERIC = "Внутри выглядит тепло и уютно.",
		},
		WALRUS_TUSK = "Почему он не использовал это против меня?",
		WARDROBE = 
		{
			GENERIC = "Хранит тёмные запретные секреты...",
            BURNING = "Быстро горит!",
			BURNT = "Теперь это уже не в моде.",
		},
		WARG = "Я скормлю твоё сердце другим гончим.",
		WASPHIVE = "Кажется, эти пчёлы злятся.",
		WATERBALLOON = "Какое научное чудо!",
		WATERMELON = "Липкая сладость.",
		WATERMELON_COOKED = "Сочно и тепло.",
		WATERMELONHAT = "Какое липкое.",
		WAXWELLJOURNAL = "Хм.",
		WETGOOP = "На вкус как ничего.",
        WHIP = "Ничто так не поддерживает мир, как громкий шум.",
		WINTERHAT = "Тепло.",
		WINTEROMETER = 
		{
			GENERIC = "Переменчивое.",
			BURNT = "Его измерительные дни закончены.",
		},

        WINTER_TREE =
        {
            BURNT = "Это немного портит праздник.",
            BURNING = "Кажется, это была ошибка.",
            CANDECORATE = "Счастливого Зимнего пира!",
            YOUNG = "Зимний пир уже скоро!",
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "Для этого нужна шишка.",
            BURNT = "Это немного портит праздник.",
		},
        WINTER_ORNAMENT = "Любой учёный ценит хорошую безделушку.",
        WINTER_ORNAMENTLIGHT = "Какое же дерево без электричества.",
        WINTER_ORNAMENTBOSS = "Этот особенно впечатляет.",
		WINTER_ORNAMENTFORGE = "Этот стоит повесить над огнём.",
		WINTER_ORNAMENTGORGE = "Почему-то от него хочется есть.",

        WINTER_FOOD1 = "С анатомией тут беда, но закрою глаза.", --gingerbread cookie
        WINTER_FOOD2 = "Я съем сорок штук. Ради науки.", --sugar cookie
        WINTER_FOOD3 = "Праздничная зубная боль только и ждёт своего часа.", --candy cane
        WINTER_FOOD4 = "Возможно, тот эксперимент был самую малость неэтичным.", --fruitcake
        WINTER_FOOD5 = "Приятно хоть раз поесть чего-нибудь кроме ягод.", --yule log cake
        WINTER_FOOD6 = "Этот пудинг сразу отправится мне в рот!", --plum pudding
        WINTER_FOOD7 = "Полое яблоко, наполненное вкусным соком.", --apple cider
        WINTER_FOOD8 = "Как оно остаётся тёплым? Термодинамическая кружка?", --hot cocoa
        WINTER_FOOD9 = "Может ли наука объяснить, почему это так вкусно?", --eggnog

        KLAUS = "Ты будешь КРИЧАТЬ, когда я тебя прикончу?!",
        KLAUS_SACK = "Внутри точно есть что-то полезное. Иначе зачем его запирать, верно?",
		KLAUSSACKKEY = "Умно.",
		WORMHOLE =
		{
			GENERIC = "Угх.",
			OPEN = "Угх.",
		},
		WORMHOLE_LIMITED = "Угх.",
		ACCOMPLISHMENT_SHRINE = "Я хочу это использовать, и хочу, чтобы весь мир об этом узнал.",        
		LIVINGTREE = "На что смотришь?",
		ICESTAFF = "На ощупь холодное.",
		REVIVER = "Биение этого жуткого сердца вернёт призрака к жизни!",
		SHADOWHEART = "Пульсирует.",
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "Здесь изображена древняя цивилизация. Люди выглядят голодными и испуганными.",
			LINE_2 = "Табличка слишком стёрта, ничего не разобрать.",
			LINE_3 = "Что-то тёмное наползает на город и его жителей.",
			LINE_4 = "Люди сбрасывают кожу. Под ней они выглядят иначе.",
			LINE_5 = "Здесь изображён огромный технологически развитый город.",
		},
        ATRIUM_STATUE = "Выглядит не до конца настоящим.",
        ATRIUM_LIGHT = 
        {
			ON = "По-настоящему тревожный свет.",
			OFF = "Что-то должно его питать.",
		},
        ATRIUM_GATE =
        {
			ON = "Снова работает.",
			OFF = "Главные детали всё ещё целы.",
			CHARGING = "Набирает мощность.",
			DESTABILIZING = "Врата теряют стабильность.",
			COOLDOWN = "Ему нужно время восстановиться. Мне тоже.",
        },
        ATRIUM_KEY = "От него исходит сила.",
		LIFEINJECTOR = "Научный прорыв! Лекарство!",
		SKELETON_PLAYER =
		{
			MALE = "%s, должно быть, погиб во время эксперимента с %s.",
			FEMALE = "%s, должно быть, погиб во время эксперимента с %s.",
			ROBOT = "%s, должно быть, погиб во время эксперимента с %s.",
			DEFAULT = "%s, должно быть, погиб во время эксперимента с %s.",
		},
		HUMANMEAT = "Плоть есть плоть. Где проводить черту?",
		HUMANMEAT_COOKED = "Хорошо приготовлено, розовое внутри, но с моралью всё серо.",
		HUMANMEAT_DRIED = "Если высушить, оно ведь уже не человеческое, да?",
		ROCK_MOON = "Откуда это взялось?",
		MOONROCKNUGGET = "Как часто такие штуки сюда падают?",
		MOONROCKCRATER = "Надо вставить что-нибудь блестящее.",
		MOONROCKSEED = "Хм.",

        REDMOONEYE = "Оно видит на многие километры, и его тоже видно издалека.",
        PURPLEMOONEYE = "Неплохой ориентир, но лучше бы оно перестало на меня пялиться.",
        GREENMOONEYE = "Будет присматривать за этим местом.",
        ORANGEMOONEYE = "С таким наблюдателем никто не потеряется.",
        YELLOWMOONEYE = "Это я.",
        BLUEMOONEYE = "Всегда полезно смотреть по сторонам.",

        --Arena Event
        LAVAARENA_BOARLORD = "Вот кто здесь главный.",
        BOARRIOR = "Ну ты и здоровенный!",
        BOARON = "Я с ним справлюсь!",
        PEGHOOK = "Этот плевок едкий!",
        TRAILS = "Рука у него сильная.",
        TURTILLUS = "Какой колючий панцирь!",
        SNAPPER = "Этот кусается.",
		RHINODRILL = "У него нюх на такую работу.",
		BEETLETAUR = "Я его отсюда чую!",

        LAVAARENA_PORTAL = 
        {
            ON = "Ну, я тогда пойду.",
            GENERIC = "Так мы сюда попали. Надеюсь, так же и выберемся.",
        },
        LAVAARENA_KEYHOLE = "Нужен ключ.",
		LAVAARENA_KEYHOLE_FULL = "Должно сработать.",
        LAVAARENA_BATTLESTANDARD = "Все, ломайте боевой штандарт!",
        LAVAARENA_SPAWNER = "Вот откуда появляются эти противники.",

        HEALINGSTAFF = "Проводит восстанавливающую энергию.",
        FIREBALLSTAFF = "Призывает метеор сверху.",
        HAMMER_MJOLNIR = "Тяжёлый молот.",
        SPEAR_GUNGNIR = "С этим можно сделать быстрый рывок.",
        BLOWDART_LAVA = "Подходит для боя на расстоянии.",
        BLOWDART_LAVA2 = "Использует мощный поток воздуха.",
        LAVAARENA_LUCY = "Эту штуку бросают.",
        WEBBER_SPIDER_MINION = "Похоже, теперь они сражаются за нас.",
        BOOK_FOSSIL = "Это ненадолго задержит монстров.",
		LAVAARENA_BERNIE = "Из него получится неплохое отвлечение.",
		SPEAR_LANCE = "Очень метко выражается.",
		BOOK_ELEMENTAL = "Текст не разобрать.",
		LAVAARENA_ELEMENTAL = "Каменный монстр!",

   		LAVAARENA_ARMORLIGHT = "Лёгкое, но не очень прочное.",
		LAVAARENA_ARMORLIGHTSPEED = "Лёгкое и рассчитано на подвижность.",
		LAVAARENA_ARMORMEDIUM = "Даёт приличную защиту.",
		LAVAARENA_ARMORMEDIUMDAMAGER = "С этим мои удары будут немного сильнее.",
		LAVAARENA_ARMORMEDIUMRECHARGER = "В таком снаряжении сил хватит на пару дополнительных трюков.",
		LAVAARENA_ARMORHEAVY = "Лучше уже не бывает.",
		LAVAARENA_ARMOREXTRAHEAVY = "Эта броня окаменела и стала максимально прочной.",

		LAVAARENA_FEATHERCROWNHAT = "От этих пушистых перьев так и тянет бежать!",
        LAVAARENA_HEALINGFLOWERHAT = "Цветок хорошо взаимодействует с лечебной магией.",
        LAVAARENA_LIGHTDAMAGERHAT = "В этом мои удары будут немного сильнее.",
        LAVAARENA_STRONGDAMAGERHAT = "Выглядит внушительно.",
        LAVAARENA_TIARAFLOWERPETALSHAT = "Похоже, усиливает лечебные способности.",
        LAVAARENA_EYECIRCLETHAT = "В его взгляде полно науки.",
        LAVAARENA_RECHARGERHAT = "Эти кристаллы ускорят мои способности.",
        LAVAARENA_HEALINGGARLANDHAT = "Эта гирлянда немного восстановит силы.",
        LAVAARENA_CROWNDAMAGERHAT = "С этим можно устроить серьёзный разгром.",

		LAVAARENA_ARMOR_HP = "Должно защитить меня.",

		LAVAARENA_FIREBOMB = "Пахнет серой.",
		LAVAARENA_HEAVYBLADE = "Выглядит острым.",

        --Quagmire
        QUAGMIRE_ALTAR = 
        {
        	GENERIC = "Лучше начинать готовить подношения.",
        	FULL = "Оно сейчас переваривает.",
    	},
		QUAGMIRE_ALTAR_STATUE1 = "Старая статуя.",
		QUAGMIRE_PARK_FOUNTAIN = "Давно здесь не было воды.",
		
        QUAGMIRE_HOE = "Сельскохозяйственный инструмент.",
        
        QUAGMIRE_TURNIP = "Сырая репа.",
        QUAGMIRE_TURNIP_COOKED = "Готовка — наука на практике.",
        QUAGMIRE_TURNIP_SEEDS = "Горсть странных семян.",
        
        QUAGMIRE_GARLIC = "Главный усилитель дыхания.",
        QUAGMIRE_GARLIC_COOKED = "Идеально подрумянено.",
        QUAGMIRE_GARLIC_SEEDS = "Горсть странных семян.",
        
        QUAGMIRE_ONION = "Выглядит хрустящим.",
        QUAGMIRE_ONION_COOKED = "Успешная химическая реакция.",
        QUAGMIRE_ONION_SEEDS = "Горсть странных семян.",
        
        QUAGMIRE_POTATO = "Земляные яблоки.",
        QUAGMIRE_POTATO_COOKED = "Успешный температурный эксперимент.",
        QUAGMIRE_POTATO_SEEDS = "Горсть странных семян.",
        
        QUAGMIRE_TOMATO = "Красный, потому что внутри полно науки.",
        QUAGMIRE_TOMATO_COOKED = "Готовить легко, если понимаешь химию.",
        QUAGMIRE_TOMATO_SEEDS = "Горсть странных семян.",
        
        QUAGMIRE_FLOUR = "Готово к выпечке.",
        QUAGMIRE_WHEAT = "Выглядит немного зернистым.",
        QUAGMIRE_WHEAT_SEEDS = "Горсть странных семян.",
        --NOTE: raw/cooked carrot uses regular carrot strings
        QUAGMIRE_CARROT_SEEDS = "Горсть странных семян.",
        
        QUAGMIRE_ROTTEN_CROP = "Не думаю, что алтарю это понравится.",
        
		QUAGMIRE_SALMON = "М-м, свежая рыба.",
		QUAGMIRE_SALMON_COOKED = "Можно подавать к столу.",
		QUAGMIRE_CRABMEAT = "Без подделок.",
		QUAGMIRE_CRABMEAT_COOKED = "Я могу быстро собрать из этого блюдо.",
        QUAGMIRE_POT = "В этот помещается больше ингредиентов.",
        QUAGMIRE_POT_SMALL = "За готовку!",
        QUAGMIRE_POT_HANGER_ITEM = "Для подвесной готовки.",
		QUAGMIRE_SUGARWOODTREE = 
		{
			GENERIC = "Полно вкусного-вкусного сока.",
			STUMP = "Куда делось дерево? Я в пень встал.",
			TAPPED_EMPTY = "Иди сюда, сок, сок, сок.",
			TAPPED_READY = "Сладкий золотистый сок.",
			TAPPED_BUGS = "Вот так и заводятся муравьи.",
			WOUNDED = "Выглядит больным.",
		},
		QUAGMIRE_SPOTSPICE_SHRUB = 
		{
			GENERIC = "Напоминает тех щупальцевых монстров.",
			PICKED = "Больше из этого куста ничего не выжать.",
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "Можно размолоть и сделать приправу.",
		QUAGMIRE_SPOTSPICE_GROUND = "Ароматное.",
		QUAGMIRE_SAPBUCKET = "С этим можно собирать сок с деревьев.",
		QUAGMIRE_SAP = "Сладкое на вкус.",
		QUAGMIRE_SALT_RACK =
		{
			READY = "На верёвке накопилась соль.",
			GENERIC = "Наука требует времени.",
		},
		
		QUAGMIRE_POND_SALT = "Маленький солёный источник.",
		QUAGMIRE_SALT_RACK_ITEM = "Для сбора соли из пруда.",

		QUAGMIRE_SAFE = 
		{
			GENERIC = "Сейф. Чтобы вещи были в безопасности.",
			LOCKED = "Без ключа не откроется.",
		},

		QUAGMIRE_KEY = "Наверняка пригодится.",
		QUAGMIRE_KEY_PARK = "Уберу в карман, пока не дойду до парка.",
        QUAGMIRE_PORTAL_KEY = "Выглядит по-научному.",

		
		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "Это грибы? Я в тупике.",
			PICKED = "Не думаю, что оно снова вырастет.",
		},
		QUAGMIRE_MUSHROOMS = "Эти грибы съедобны.",
        QUAGMIRE_MEALINGSTONE = "Ежедневная рутина.",
		QUAGMIRE_PEBBLECRAB = "Этот камень живой!",

		
		QUAGMIRE_RUBBLE_CARRIAGE = "Дорога в никуда.",
        QUAGMIRE_RUBBLE_CLOCK = "Кто-то победил часы. Буквально.",
        QUAGMIRE_RUBBLE_CATHEDRAL = "Стало добычей.",
        QUAGMIRE_RUBBLE_PUBDOOR = "Теперь эта дверь уже не милая.",
        QUAGMIRE_RUBBLE_ROOF = "Кто-то снёс крышу.",
        QUAGMIRE_RUBBLE_CLOCKTOWER = "Этим часам досталось.",
        QUAGMIRE_RUBBLE_BIKE = "Наверное, оговорился.",
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "Никого нет.",
            "Кто-то уничтожил этот город.",
            "Интересно, кого они разозлили.",
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "Что-то заглушило этот дымоход.",
        QUAGMIRE_RUBBLE_CHIMNEY2 = "Что-то заглушило этот дымоход.",
        QUAGMIRE_MERMHOUSE = "Какой уродливый домик.",
        QUAGMIRE_SWAMPIG_HOUSE = "Он видел времена и получше.",
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "Чей-то свиной дом разрушен.",
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "Полагаю, ты здесь главный?",
            SLEEPING = "Пока что спит.",
        },
        QUAGMIRE_SWAMPIG = "Очень волосатая свинья.",
        
        QUAGMIRE_PORTAL = "Ещё один тупик.",
        QUAGMIRE_SALTROCK = "Соль. Самый вкусный минерал.",
        QUAGMIRE_SALT = "Полно соли.",
        --food--
        QUAGMIRE_FOOD_BURNT = "Это был эксперимент.",
        QUAGMIRE_FOOD =
        {
        	GENERIC = "Стоит отнести на Алтарь Грызи.",
            MISMATCH = "Он хочет не этого.",
            MATCH = "Наука говорит, что это умилостивит небесного бога.",
            MATCH_BUT_SNACK = "Скорее лёгкая закуска.",
        },
        
        QUAGMIRE_FERN = "Наверняка полно витаминов.",
        QUAGMIRE_FOLIAGE_COOKED = "Мы приготовили листву.",
        QUAGMIRE_COIN1 = "За мои мысли я бы попросил больше монетки.",
        QUAGMIRE_COIN2 = "Приличная сумма.",
        QUAGMIRE_COIN3 = "Выглядит ценным.",
        QUAGMIRE_COIN4 = "С этим можно снова открыть Врата.",
        QUAGMIRE_GOATMILK = "Неплохо, если не думать, откуда это взялось.",
        QUAGMIRE_SYRUP = "Добавляет смеси сладости.",
        QUAGMIRE_SAP_SPOILED = "Можно и в огонь бросить.",
        QUAGMIRE_SEEDPACKET = "Ну и сей?",
        
        QUAGMIRE_POT = "В этот горшок помещается больше ингредиентов.",
        QUAGMIRE_POT_SMALL = "За готовку!",
        QUAGMIRE_POT_SYRUP = "Надо подсластить содержимое.",
        QUAGMIRE_POT_HANGER = "Есть за что подвесить.",
        QUAGMIRE_POT_HANGER_ITEM = "Для подвесной готовки.",
        QUAGMIRE_GRILL = "Теперь осталось найти задний двор.",
        QUAGMIRE_GRILL_ITEM = "Придётся кого-нибудь расспросить об этом гриле.",
        QUAGMIRE_GRILL_SMALL = "Любопытно-барбекюшно.",
        QUAGMIRE_GRILL_SMALL_ITEM = "Для жарки небольших кусков еды.",
        QUAGMIRE_OVEN = "Нужны ингредиенты, чтобы наука заработала.",
        QUAGMIRE_OVEN_ITEM = "Для научного сжигания вещей.",
        QUAGMIRE_CASSEROLEDISH = "Блюдо для любых приправ.",
        QUAGMIRE_CASSEROLEDISH_SMALL = "Для приготовления миниатюрных блюд.",
        QUAGMIRE_PLATE_SILVER = "Посеребрённая тарелка.",
        QUAGMIRE_BOWL_SILVER = "Яркая миска.",
        QUAGMIRE_CRATE = "Кухонные принадлежности.",
        
        QUAGMIRE_MERM_CART1 = "Там есть хоть какая-нибудь наука?", --sammy's wagon
        QUAGMIRE_MERM_CART2 = "Мне бы пригодились материалы.", --pipton's cart
        QUAGMIRE_PARK_ANGEL = "Получай, тварь!",
        QUAGMIRE_PARK_ANGEL2 = "Как настоящее.",
        QUAGMIRE_PARK_URN = "Пепел к пеплу.",
        QUAGMIRE_PARK_OBELISK = "Монументальный монумент.",
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "Оказывается, ключ и правда был ключом к входу.",
            LOCKED = "Заперто намертво.",
        },
        QUAGMIRE_PARKSPIKE = "Научный термин: «острая штука».",
        QUAGMIRE_CRABTRAP = "Ловушка для крабов.",
        QUAGMIRE_TRADER_MERM = "Может, они согласятся поторговаться.",
        QUAGMIRE_TRADER_MERM2 = "Может, они согласятся поторговаться.",
        
        QUAGMIRE_GOATMUM = "Напоминает мою старую няню.",
        QUAGMIRE_GOATKID = "Этот козёл намного меньше.",
        QUAGMIRE_PIGEON =
        {
            DEAD = "Они мертвы.",
            GENERIC = "Импровизирует на ходу.",
            SLEEPING = "Пока что спит.",
        },
        QUAGMIRE_LAMP_POST = "Хм. Напоминает дом.",

        QUAGMIRE_BEEFALO = "По науке оно уже должно было умереть.",
        QUAGMIRE_SLAUGHTERTOOL = "Лабораторные инструменты для разделки.",

        QUAGMIRE_SAPLING = "Больше отсюда ничего не получить.",
        QUAGMIRE_BERRYBUSH = "Ягод больше нет.",

        QUAGMIRE_ALTAR_STATUE2 = "На что смотришь?",
        QUAGMIRE_ALTAR_QUEEN = "Монументальный монумент.",
        QUAGMIRE_ALTAR_BOLLARD = "Для столба вполне нормально.",
        QUAGMIRE_ALTAR_IVY = "Немного навязчивое.",

        QUAGMIRE_LAMP_SHORT = "Просветляет.",

        --v2 Winona
        WINONA_CATAPULT = 
        {
        	GENERIC = "Она собрала что-то вроде автоматической системы защиты.",
        	OFF = "Нужно немного электричества.",
        	BURNING = "Оно горит!",
        	BURNT = "Даже наука не смогла его спасти.",
        },
        WINONA_SPOTLIGHT = 
        {
        	GENERIC = "Какая гениальная идея!",
        	OFF = "Нужно немного электричества.",
        	BURNING = "Оно горит!",
        	BURNT = "Даже наука не смогла его спасти.",
        },
        WINONA_BATTERY_LOW = 
        {
        	GENERIC = "Выглядит научно. Как оно работает?",
        	LOWPOWER = "Энергия заканчивается.",
        	OFF = "Если Вайнона занята, я и сам смогу запустить.",
        	BURNING = "Оно горит!",
        	BURNT = "Даже наука не смогла его спасти.",
        },
        WINONA_BATTERY_HIGH = 
        {
        	GENERIC = "Эй! Это не наука!",
        	LOWPOWER = "Скоро отключится.",
        	OFF = "Наука всегда побеждает магию.",
        	BURNING = "Оно горит!",
        	BURNT = "Даже наука не смогла его спасти.",
        },

        --Wormwood
        COMPOSTWRAP = "Вормвуд предложил мне кусочек, но я вежливо отказался.",
        ARMOR_BRAMBLE = "Лучшая атака — хорошая защита.",
        TRAP_BRAMBLE = "Тому, кто наступит, будет очень неприятно.",

        BOATFRAGMENT03 = "От него почти ничего не осталось.",
        BOATFRAGMENT04 = "От него почти ничего не осталось.",
        BOATFRAGMENT05 = "От него почти ничего не осталось.",
		BOAT_LEAK = "Надо залатать, пока мы не утонули.",
        MAST = "Полундра! Мачта!",
        SEASTACK = "Камень.",
        FISHINGNET = "Чистое попадание.",
        ANTCHOVIES = "Уф. Можно выбросить обратно?",
        STEERINGWHEEL = "В другой жизни я мог бы стать моряком.",
        ANCHOR = "Не хотелось бы, чтобы лодка уплыла.",
        BOATPATCH = "На случай катастрофы.",
        DRIFTWOOD_TREE = 
        {
            BURNING = "Эта коряга горит!",
            BURNT = "Теперь выглядит совсем бесполезно.",
            CHOPPED = "Там всё ещё может быть что-нибудь, что стоит выкопать.",
            GENERIC = "Мёртвое дерево, выброшенное на берег.",
        },

        DRIFTWOOD_LOG = "Плавает по воде.",

        MOON_TREE = 
        {
            BURNING = "Дерево горит!",
            BURNT = "Дерево сгорело.",
            CHOPPED = "Дерево было довольно толстым.",
            GENERIC = "Не знал, что на луне растут деревья.",
        },
		MOON_TREE_BLOSSOM = "Упало с лунного дерева.",

        MOONBUTTERFLY = 
        {
        	GENERIC = "Мои обширные научные знания подсказывают: это... лунная бабочка.",
        	HELD = "Теперь ты попалось.",
        },
		MOONBUTTERFLYWINGS = "Вот теперь у нас всё на крыльях держится.",
        MOONBUTTERFLY_SAPLING = "Моль превратилась в дерево? Безумие!",
        ROCK_AVOCADO_FRUIT = "Об это я себе зубы расколю.",
        ROCK_AVOCADO_FRUIT_RIPE = "Сырой каменный фрукт — та ещё косточка.",
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "Теперь достаточно мягкий, чтобы есть.",
        ROCK_AVOCADO_FRUIT_SPROUT = "Растёт.",
        ROCK_AVOCADO_BUSH = 
        {
        	BARREN = "Плодов от него больше не будет.",
			WITHERED = "На улице довольно жарко.",
			GENERIC = "Это куст... с луны!",
			PICKED = "Новые плоды вырастут не сразу.",
			DISEASED = "Выглядит больным.",
            DISEASING = "Эм, что-то тут не так.",
			BURNING = "Горит!",
		},
        DEAD_SEA_BONES = "Вот что бывает, когда выбираешься на сушу.",
        HOTSPRING = 
        {
        	GENERIC = "Вот бы вымочить уставшие кости.",
        	BOMBED = "Простая химическая реакция.",
        	GLASS = "Под луной вода превращается в стекло. Просто наука.",
			EMPTY = "Остаётся подождать, пока снова наполнится.",
        },
        MOONGLASS = "Очень острое.",
        MOONGLASS_ROCK = "Кристальные разумы.",
        BATHBOMB = "Химия по учебнику.",
        TRAP_STARFISH =
        {
            GENERIC = "Ой, какая милая морская звезда!",
            CLOSED = "Она попыталась меня укусить!",
        },
        DUG_TRAP_STARFISH = "Теперь уже никого не обманет.",
        SPIDER_MOON = 
        {
        	GENERIC = "Прекрасно. Луна его мутировала.",
        	SLEEPING = "Слава науке, оно перестало двигаться.",
        	DEAD = "Оно точно мёртвое?",
        },
        MOONSPIDERDEN = "Это не обычное паучье логово.",
		FRUITDRAGON =
		{
			GENERIC = "Милое, но ещё не созрело.",
			RIPE = "Теперь, кажется, созрело.",
			SLEEPING = "Дремлет.",
		},
        PUFFIN =
        {
            GENERIC = "Никогда раньше не видел живого тупика!",
            HELD = "Поймать одного — не повод раздуваться от гордости.",
            SLEEPING = "Мирно сопит.",
        },

		MOONGLASSAXE = "Я сделал это ещё эффективнее.",
		GLASSCUTTER = "Вообще-то драки — не совсем моё.",

        ICEBERG =
        {
            GENERIC = "Лучше держаться подальше.",
            MELTED = "Полностью растаяло.",
        },
        ICEBERG_MELTED = "Полностью растаяло.",

        MINIFLARE = "Можно зажечь и показать всем, где я.",

		MOON_FISSURE = 
		{
			GENERIC = "Мозг пульсирует от спокойствия и ужаса.", 
			NOLIGHT = "Трещины этого места становятся всё заметнее.",
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "Оно хочет, чтобы его закончили.",
            GENERIC = "Хм? Что ты сказал?",
        },

        MOON_ALTAR_IDOL = "Меня будто тянет куда-то это отнести.",
        MOON_ALTAR_GLASS = "Оно не хочет лежать на земле.",
        MOON_ALTAR_SEED = "Хочет, чтобы я дал ему дом.",

        MOON_ALTAR_ROCK_IDOL = "Внутри что-то заперто.",
        MOON_ALTAR_ROCK_GLASS = "Внутри что-то заперто.",
        MOON_ALTAR_ROCK_SEED = "Внутри что-то заперто.",

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "Похоже, нужны баки.",
            BURNT = "Наука ушла на морское дно.",
        },
        BOAT_ITEM = "Было бы неплохо провести пару экспериментов на воде.",
        STEERINGWHEEL_ITEM = "Это станет штурвалом.",
        ANCHOR_ITEM = "Теперь можно сделать якорь.",
        MAST_ITEM = "Теперь можно сделать мачту.",
        MUTATEDHOUND = 
        {
        	DEAD = "Теперь можно вздохнуть спокойно.",
        	GENERIC = "Уродливое.",
        	SLEEPING = "Давай разберёмся!",
        },

        MUTATED_PENGUIN = 
        {
			DEAD = "С этим покончено.",
			GENERIC = "Эта штука ужасает!",
			SLEEPING = "Слава богу. Оно спит.",
		},
        CARRAT = 
        {
        	DEAD = "С этим покончено.",
        	GENERIC = "У моркови вообще должны быть ноги?",
        	HELD = "Вблизи ты довольно уродливое.",
        	SLEEPING = "Почти милое.",
        },

		BULLKELP_PLANT = 
        {
            GENERIC = "Ну вот. Ламинария.",
            PICKED = "Не смог удержаться.",
        },
		BULLKELP_ROOT = "Можно посадить на глубокой воде.",
        KELPHAT = "Иногда, чтобы стало лучше, сначала должно стать хуже.",
		KELP = "От неё карманы мокрые и противные.",
		KELP_COOKED = "Это скорее жидкость, чем твёрдая пища.",
		KELP_DRIED = "Натрия многовато.",

		GESTALT = "Они обещают мне... знания.",

		COOKIECUTTER = "Мне не нравится, как оно смотрит на мою лодку...",
		COOKIECUTTERSHELL = "Лишь оболочка прежнего себя.",
		COOKIECUTTERHAT = "Хотя бы волосы останутся сухими.",
		SALTSTACK =
		{
			GENERIC = "Это природные образования?",
			MINED_OUT = "Всё добыто... всё до последнего!",
			GROWING = "Наверное, оно просто так растёт.",
		},
		SALTROCK = "Выглядит аппетитно.",
		SALTBOX = "Отличное средство от порчи еды!",

        MALBATROSS = "И правда мерзкая птица!",
        MALBATROSS_FEATHER = "Выдернуто у знатного пернатого чудища.",
        MALBATROSS_BEAK = "Пахнет рыбой.",
        MAST_MALBATROSS_ITEM = "Легче, чем выглядит.",
        MAST_MALBATROSS = "Расправлю крылья и уплыву!",
		MALBATROSS_FEATHERED_WEAVE = "Делаю перьевое полотно!",

        WALKINGPLANK = "Разве нельзя было просто сделать спасательную шлюпку?",
        OAR = "Ручное ускорение судна.",
		OAR_DRIFTWOOD = "Ручное ускорение судна.",

		----------------------- ROT STRINGS GO ABOVE HERE ------------------

        --Wortox
        WORTOX_SOUL = "only_used_by_wortox", --only wortox can inspect souls

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "Ну вот, готовим!",
            DONE = "Ну вот, приготовили!",

			COOKING_LONG = "Это блюдо будет готовиться долго.",
			COOKING_SHORT = "Будет готово в два счёта!",
			EMPTY = "Держу пари, там ничего нет.",
        },
        
        PORTABLEBLENDER_ITEM = "Смешивает всю еду.",
        PORTABLESPICER_ITEM =
        {
            GENERIC = "Добавит остроты.",
            DONE = "Должно стать чуть вкуснее.",
        },
        SPICEPACK = "Прорыв в кулинарной науке!",
        SPICE_GARLIC = "Мощный ароматный порошок.",
        SPICE_SUGAR = "Сладко! И правда сладко!",
        SPICE_CHILI = "Флакон огненной жидкости.",
        SPICE_SALT = "Немного натрия сердцу не повредит.",
        MONSTERTARTARE = "Здесь же должно быть что-нибудь ещё съедобное.",
        FRESHFRUITCREPES = "Сладкие фрукты! Часть сбалансированного завтрака.",
        FROGFISHBOWL = "Это что... лягушки, набитые внутрь рыбы?",
        POTATOTORNADO = "Картошка, научно пропитанная силой торнадо!",
        DRAGONCHILISALAD = "Надеюсь, выдержу такую остроту.",
        GLOWBERRYMOUSSE = "Варли точно умеет готовить.",
        VOLTGOATJELLY = "Потрясающе вкусно.",
        NIGHTMAREPIE = "Немного жутковато.",
        BONESOUP = "Без сомнений: Варли умеет готовить.",
        MASHEDPOTATOES = "Слышал, готовка — это почти химия. Надо попробовать.",
        POTATOSOUFFLE = "Я уже забыл, какая на вкус нормальная еда.",
        MOQUECA = "Он такой же талантливый повар, как я учёный.",
        GAZPACHO = "Как, во имя науки, это может быть настолько вкусным?",
        ASPARAGUSSOUP = "Пахнет так же, как и на вкус.",
        VEGSTINGER = "Можно использовать сельдерей как трубочку?",
        BANANAPOP = "Только не заморозка мозга! Он мне нужен для науки!",
        CEVICHE = "Можно миску побольше? Эта какая-то мелковатая.",
        SALSA = "Так... остро...!",
        PEPPERPOPPER = "Вот это порция!",

        TURNIP = "Сырая репа.",
        TURNIP_COOKED = "Готовка — наука на практике.",
        TURNIP_SEEDS = "Горсть странных семян.",
        
        GARLIC = "Главный усилитель дыхания.",
        GARLIC_COOKED = "Идеально подрумянено.",
        GARLIC_SEEDS = "Горсть странных семян.",
        
        ONION = "Выглядит хрустящим.",
        ONION_COOKED = "Успешная химическая реакция.",
        ONION_SEEDS = "Горсть странных семян.",
        
        POTATO = "Земляные яблоки.",
        POTATO_COOKED = "Успешный температурный эксперимент.",
        POTATO_SEEDS = "Горсть странных семян.",
        
        TOMATO = "Красный, потому что внутри полно науки.",
        TOMATO_COOKED = "Готовить легко, если понимаешь химию.",
        TOMATO_SEEDS = "Горсть странных семян.",

        ASPARAGUS = "Овощ.", 
        ASPARAGUS_COOKED = "Наука говорит, что это полезно.",
        ASPARAGUS_SEEDS = "Семена спаржи.",

        PEPPER = "Приятно острое.",
        PEPPER_COOKED = "Оно и так было горячим.",
        PEPPER_SEEDS = "Горсть семян.",

        WEREITEM_BEAVER = "Похоже, на севере наука работает иначе.",
        WEREITEM_GOOSE = "От этой штуки у МЕНЯ мурашки!",
        WEREITEM_MOOSE = "Совершенно обычная проклятая лосиная штука.",

        MERMHAT = "Наконец-то можно показываться на людях.",
        MERMTHRONE =
        {
            GENERIC = "Подходит болотному королю!",
            BURNT = "С этим троном всё равно было что-то подозрительное.",
        },        
        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "И что она задумала?",
            BURNT = "Похоже, теперь уже не узнаем, зачем это было.",
        },        
        MERMHOUSE_CRAFTED = 
        {
            GENERIC = "Вообще-то довольно мило.",
            BURNT = "Фу, запах!",
        },

        MERMWATCHTOWER_REGULAR = "Кажется, они рады, что нашли короля.",
        MERMWATCHTOWER_NOKING = "Королевский страж без короля.",
        MERMKING = "Ваше Величество!",
        MERMGUARD = "Рядом с этими ребятами я чувствую себя очень... охраняемым.",
        MERM_PRINCE = "У них кто первый пришёл, тот и государь.",

    },

    DESCRIBE_GENERIC = "Это... штука.",
    DESCRIBE_TOODARK = "Слишком темно, ничего не видно!",
    DESCRIBE_SMOLDERING = "Эта штука вот-вот загорится.",
    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "М-м-м. Клювасто.",
    },
}
