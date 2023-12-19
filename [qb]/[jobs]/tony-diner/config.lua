Config = {
	Debug = false,  -- false to remove green boxes
	Lan = "en", -- change the language
	img = "lj-inventory/html/images/", -- Change this to your inventory's name and image folder

	Core = "qb-core", -- set this to your core folder
	Inv = "qb", -- set to "ox" if using OX Inventory
	Menu = "qb", -- set to "ox" if using ox_lib context menus
	Notify = "qb",
	ProgressBar = "qb", -- set to "ox" if using ox_lib progressbar

	JimConsumables = true, -- Enable this to disable this scripts control of food/drink items
	JimShop = false, -- If true shops will open in jim-shops

	MultiCraft = true,
	MultiCraftAmounts = { [1], [5], [10] },

		--Simple Toy Reward Support - disabled if JimConsumables are true
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
	},

	FoodItems = {
		label = "Drinks Store",
		slots = 7,
		items = {
			{ name = "lemonade", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "orangejuice", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "blackcoffee", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "applejuice", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "hottea", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "sweettea", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "rootbeer", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
		},
	},
	DesertItems = {
		label = "Desert Store",
		slots = 6,
		items = {
			{ name = "beandonut", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "watermelon", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "cheesecake", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "tosti", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
		},
	},
	SodaItems = {
		label = "Soda Storage",
		slots = 4,
		items = {
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
		},
	},
	Locations = {
		["lasttrainlegion"] = {
			zoneEnable = true,
			label = "Last Train",
			job = "lasttrain",
			autoClock = { enter = false, exit = true, },
			zones = {
				vector2(-364.65151977539, 261.04135131836),
				vector2(-364.62350463867, 269.49090576172),
				vector2(-358.59716796875, 276.10601806641),
				vector2(-365.79208374023, 286.36499023438),
				vector2(-386.43316650391, 270.85073852539),
				vector2(-387.82250976562, 261.93301391602),
				vector2(-384.8532409668, 257.74197387695)
			},
			garage = { spawn = vec4(-392.14, 269.18, 84.62, 189.0),
						out = vec4(-392.14, 269.18, 84.62, 189.0),
						list = { "panto", } },
			blip = vec3(-368.41, 268.8, 84.84), blipcolor = 1, blipsprite = 77, blipdisp = 6, blipscale = 0.7, blipcat = nil,
		},
	},
}

Crafting = {
	Slush = {
		{ ['chocolatemilkshake'] = { ['milk'] = 1, ['chocolate'] = 1, }, },
		{ ['strawberrymilkshake'] = { ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['vanillamilkshake'] = { ['milk'] = 1, }, },
		{ ['birthdaycakemilkshake'] = { ['milk'] = 1, ['pancake'] = 1, }, },
	},
	Drinks = {
		{ ['chocolatechippancake'] = { ['flour'] = 1, ['water_bottle'] = 1, }, },
		{ ['birthdaycakewaffle'] = { ['flour'] = 1, ['water_bottle'] = 1, }, },
		{ ['3eggomelette'] = { ['egg'] = 3, ['ham'] = 1, ['cheddar'] = 1, }, },
		{ ['countryfriedsteak'] = { ['chickenbreast'] = 2, ['potato'] = 1, }, },
		{ ['pancakeset'] = { ['pancake'] = 1, ['bacon'] = 1, ['orange'] = 1, }, },
		{ ['chickencutletsandwich'] = { ['chickenbreast'] = 1, ['breadslice'] = 1, ['lettuce'] = 1, ['slicedtomato'] = 1, }, },
		{ ['greeksaladbowl'] = { ['lettuce'] = 1, ['cheddar'] = 2, ['tomato'] = 1, }, },
		{ ['ribeyesteak'] = { ['meat'] = 1, ['potato'] = 1, }, },
		{ ['chickentenderswfries'] = { ['chickenbreast'] = 1, ['slicedpotato'] = 2, }, },
		{ ['halfpoundcheeseburger'] = { ['burgerpatty'] = 1, ['cheddar'] = 2, ['lettuce'] = 1, ['pickle'] = 1, ['onion'] = 1, }, },
	},
}

Loc = {}