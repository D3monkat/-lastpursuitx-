Config = {
	Debug = false,  -- True to show debug boxes and messages

	--https://i.imgur.com/NIFOsYf.jpeg
	--Info To load depends on chosen MLO's
	Lan = "en", -- Pick your language here
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)

	Core = "qb-core", -- set this to your core folder
	Inv = "ox", -- set to "ox" if using OX Inventory
	Menu = "ox", -- set to "ox" if using OX Lib Context
	Notify = "ox",
	ProgressBar = "ox", -- set to "ox" if using ox_lib progressbar

	MultiCraft = true,
	MultiCraftAmounts = { [1], [5], [10] },

	JimConsumables = true, -- Enable this to disable this scripts control of food/drink items
	JimShop = false, 		-- Enable this to use jim-shops for buying ingredients

	craftCam = true,		-- Disable this to stop crafting cameras

	--Simple Toy Reward Support
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
		"",
	},

	AtomIngredients = {
		label = "Ingredients Storage",
		slots = 16,
		items = {
			{ name = "burgerpatty", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "cheddar", 	price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "lettuce", 	price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "tomato", 		price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "burgerbun", 	price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "hotdogbun", 	price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "rawbacon", 	price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "rawhotdog", 	price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "chillimince",	price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "butter",		price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "potato", 		price = 0, amount = 50, info = {}, type = "item", slot = 11, },
            { name = "chickenbreast",price = 0, amount = 50, info = {}, type = "item", slot = 12, },
		},
	},
	HornyIngredients = {
		label = "Ingredients Storage",
		slots = 16,
		items = {
			{ name = "burgerpatty", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "egg", 		price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "breadslice", 	price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "chickenbreast",price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "cheddar", 	price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "lettuce", 	price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "tomato", 		price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "burgerbun", 	price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "rawbacon", 	price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "chillimince",	price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "butter",		price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "potato", 		price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "rawsausage", 	price = 0, amount = 50, info = {}, type = "item", slot = 13, },
		},
	},
	IceCream = {
		label = "Ice Cream Storage",
		slots = 5,
		items = {
			{ name = "milk", 		price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "cream", 		price = 0, amount = 50, info = {}, type = "item", slot = 2, },
		},
	},

	Locations = { -- Vinewood
		{	zoneEnable = true,
			job = "upnatom", -- Set this to the required job
			label = "Up 'n' Atom",
			autoClock = { enter = false, exit = true, },
			zones = {
				vector2(89.025741577148, 268.51943969727),
				vector2(69.195907592773, 275.88619995117),
				vector2(78.70369720459, 302.80987548828),
				vector2(99.422744750977, 295.80908203125)
			},
			blip = vec3(85.88, 285.61, 110.22), blipcolor = 1, blipsprite = 76, blipscale = 0.7, blipdisp = 6, blipcat = nil,
			garage = {
				spawn = vector4(92.36, 309.87, 110.02, 160.82),
				out = vector4(86.99, 299.58, 110.21, 340.09),
				list = { "panto", "burrito3", }
			},
			MLO = "GABZ",     	--use "GN" if you are using GN Mod's Up N' Atom MLO
								--use "GABZ" if you are using GN Mod's Up N' Atom MLO
		},
		{ -- Mirror Park
			zoneEnable = true,
			job = "hornys",
			label = "Hornys",
			autoClock = { enter = false, exit = true, },
			zones = {
				vec2(1222.93, -369.51),
				vec2(1225.09, -326.21),
				vec2(1269.28, -332.18),
				vec2(1283.12, -365.41),
				vec2(1263.98, -389.72),
				vec2(1248.82, -379.71)
			},
			blip = vec3(1243.58, -359.92, 69.21), blipcolor = 31, blipsprite = 80, blipscale = 0.7, blipdisp = 6, blipcat = nil,
			garage = {
				spawn = vec4(1235.45, -337.55, 68.89, 89.71),
				out = vec4(1233.54, -333.55, 69.21, 181.12),
				list = { "panto", "burrito3", }
			},
			MLO = "GABZ",     --use "GABZ" if you are using Gabz Horbys MLO
		},
	},
}

Crafting = {
	AtomGrill = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "amb@prop_human_bbq@male@base", anim = "base", flag = 8 },
		{ ["burgermeat"] 			= { ["burgerpatty"] = 1, } },
		{ ["hotdogmeat"] 			= { ["rawhotdog"] = 1, } },
        { ["chickenfillet"]         = { ["chickenbreast"] = 1, }, },
        { ["bacon"]            		= { ["rawbacon"] = 1, }, },
	},
	AtomFryer = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "amb@prop_human_bbq@male@base", anim = "base", flag = 8 },
		{ ["atomfries"] 			= { ["slicedpotato"] = 1, } },
	},
	AtomChoppingBoard = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "mp_arresting", anim = "a_uncuff", flag = 8 },
		{ ["slicedtomato"] 			= { ["tomato"] = 1, }, },
		{ ["slicedpotato"] 			= { ["potato"] = 1, }, },
	},
	AtomPrepare = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle", flag = 3 },
		{ ["tripleburger"] 			= { ["burgermeat"] = 3, ["burgerbun"] = 1, ["cheddar"] = 1, ["lettuce"] = 1, ["slicedtomato"] = 1, } },
		{ ["baconcheesemelt"] 		= { ["bacon"] = 10, ["burgermeat"] = 1, ["lettuce"] = 1, ["burgerbun"] = 1, ["cheddar"] = 3, } },
		{ ["chillidog"] 			= { ["hotdogmeat"] = 1, ["hotdogbun"] = 1, ["cheddar"] = 1, ["chillimince"] = 1, } },
		{ ["grilledchicken"] 		= { ["chickenfillet"] = 1, ["breadslice"] = 1, ["slicedtomato"] = 1, }, },
	},
	Coffee = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_pour"], bartime = 4000, animDict = "mp_ped_interaction", anim = "handshake_guy_a", flag = 8 },
		{ ["coffee"] 				= { } },
	},
	AtomDrink = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_pour"], bartime = 4000, animDict = "mp_ped_interaction", anim = "handshake_guy_a", flag = 8 },
		{ ["water_bottle"] 			= { } },
		{ ["atomsoda"] 				= { } },
		{ ["ecola"] 				= { } },
		{ ["ecolalight"] 			= { } },
		{ ["sprunk"] 				= { } },
		{ ["sprunklight"] 			= { } },
		{ ["raine"] 				= { } },
		{ ["orangotang"] 			= { } },
		{ ["junkdrink"] 			= { } },
	},
	AtomShakes = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "mp_ped_interaction", anim = "handshake_guy_a", flag = 8 },
		{ ["creamyshake"] 			= { ["butter"] = 10, ["milk"] = 1, ["cream"] = 1, } },
	},
--Hornys--
	HornyGrill = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "amb@prop_human_bbq@male@base", anim = "base", flag = 8 },
		{ ["eggsbenedict"] 			= { ["egg"] = 2, }, },
		{ ["sausages"]				= { ["rawsausage"] = 1, }, },
		{ ["burgermeat"] 			= { ["burgerpatty"] = 1, } },
		{ ["bacon"]					= { ["rawbacon"] = 1, }}
	},
	HornyChoppingBoard = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "mp_arresting", anim = "a_uncuff", flag = 8 },
		{ ["frenchtoast"] 			= { ["breadslice"] = 2, ["egg"] = 1, }, },
		{ ["frenchtoastbacon"] 		= { ["breadslice"] = 2, ["egg"] = 1, ["bacon"] = 1, }, },
		{ ["chickensalad"] 			= { ["chickenfillet"] = 1, ["lettuce"] = 1, }, },
		{ ["hunksohen"] 			= { ["chickenbreast"] = 1, }, },
		{ ["slicedpotato"]			= { ["potato"] = 1, } },
	},
	HornyFryer = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "amb@prop_human_bbq@male@base", anim = "base", flag = 8 },
		{ ["chickenfillet"]			= { ["chickenbreast"] = 1, }, },
		{ ["chickenhorn"]			= { ["chickenfillet"] = 1, }, },
		{ ["hashbrowns"] 			= { ["slicedpotato"] = 1, }, },
	},
	HornyPrepare = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_make"], bartime = 4000, animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle", flag = 3 },
		{ ["hornburger"] 			= { ["burgerbun"] = 1, ["burgermeat"] = 1, ["cheddar"] = 1, ["lettuce"] = 1 }, },
		{ ["dblhornburger"] 		= { ["burgerbun"] = 1, ["burgermeat"] = 2, ["cheddar"] = 1, ["lettuce"] = 1 }, },
		{ ["baconhornburger"]		= { ["burgerbun"] = 1, ["burgermeat"] = 1, ["bacon"] = 1, ["cheddar"] = 1 }, },
		{ ["picklehornburger"] 		= { ["burgerbun"] = 1, ["burgermeat"] = 1, ["pickle"] = 1, ["cheddar"] = 1 }, },
		{ ["chickenhornburger"] 	= { ["burgerbun"] = 1, ["chickenfillet"] = 1, ["lettuce"] = 1 }, },
		{ ["dblchickenhornburger"] 	= { ["burgerbun"] = 1, ["chickenfillet"] = 2, ["lettuce"] = 1 }, },
		{ ["grilledchicken"] 		= { ["chickenfillet"] = 1, ["breadslice"] = 1, ["slicedtomato"] = 1, }, },

		{ ["chickentaco"] 			= { ["chickenfillet"] = 1, ["breadslice"] = 1 }, },
		{ ["gazpacho"]				= { ["tomato"] = 1 }, },

		{ ["hornbreakfast"] 		= { ["sausages"] = 1, }, },
		{ ["baconroll"] 			= { ["bacon"] = 1, ["burgerbun"] = 1, }, },
		{ ["baconeggtoast"] 		= { ["bacon"] = 1, ["egg"] = 1, ["breadslice"] = 2 }, },
	},
	HornyDrinks = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_pour"], bartime = 4000, animDict = "mp_ped_interaction", anim = "handshake_guy_a", flag = 8 },
		{ ["water_bottle"] 			= { } },
		{ ["ecola"] 				= { } },
		{ ["ecolalight"] 			= { } },
		{ ["sprunk"] 				= { } },
		{ ["sprunklight"] 			= { } },
		{ ["raine"] 				= { } },
		{ ["orangotang"] 			= { } },
		{ ["junkdrink"] 			= { } },
	},
	HornyDeserts = {
		["anim"] = { bartext = Loc[Config.Lan].progressbar["progress_grab"], bartime = 4000, animDict = "mp_ped_interaction", anim = "handshake_guy_a", flag = 8 },
		{ ["icecone"] 				= { }, },
		{ ["icenugget"]				= { }, },
		{ ["icecake"] 				= { }, },
	},
}