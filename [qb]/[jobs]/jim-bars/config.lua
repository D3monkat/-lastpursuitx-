-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = true, -- false to remove green boxes

	Lan = "en",
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder

	Inv = "qb", -- set to "ox" if using OX Inventory
	Menu = "qb", -- set to "ox" if using ox_lib context menus
	Notify = "qb",
	ProgressBar = "qb", -- set to "ox" if using ox_lib progressbar

	MultiCraft = true,
	MultiCraftAmounts = { [1], [5], [10] },

	JimShop = false, -- Enable this to use jim-shops for buying ingredients
	JimConsumables = false,

	craftCam = true,		-- Disable this to stop crafting cameras

	DrinkItems = {
		label = "Drinks Store",
		slots = 17,
		items = {
			{ name = "cranberry", 	price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "schnapps", 	price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "gin", 		price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "scotch", 		price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "rum", 		price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "icream", 		price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "amaretto", 	price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "curaco", 		price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "vodka", 		price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "sprunk",		price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "ecola", 		price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "ecolalight", 	price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "crisps", 		price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "orange", 		price = 0, amount = 50, info = {}, type = "item", slot = 15, },
			{ name = "lime",		price = 0, amount = 50, info = {}, type = "item", slot = 16, },
			{ name = "chocolate", 	price = 0, amount = 50, info = {}, type = "item", slot = 17, },
		},
	},

	Locations = { }, -- Leave empty, this is here to help grab info from files in /locations
}
Crafting = {
	Cocktails = {
		{ ['b52'] = {	['coffee'] = 1,	['icream'] = 1,	['orange'] = 1,	} },
		{ ['brussian'] = { ['coffee'] = 1, ['vodka'] = 1,	} },
		{ ['bkamikaze'] = { ['curaco'] = 1, ['lime'] = 1, ['vodka'] = 1, } },
		{ ['cappucc'] = {	['coffee'] = 1,	['chocolate'] = 1,	} },
		{ ['ccookie'] = { ['amaretto'] = 1, ['cranberry'] = 1, } },
		{ ['iflag'] = { ['icream'] = 1, ['orange'] = 1, } },
		{ ['kamikaze'] = { ['vodka'] = 1, ['orange'] = 1, ['lime'] = 1, } },
		{ ['sbullet'] = { ['gin'] = 1, ['lime'] = 1, ['scotch'] = 1, } },
		{ ['voodoo'] = {	['coffee'] = 1, ['rum'] = 1, } },
		{ ['woowoo'] = {	['cranberry'] = 1, ['schnapps'] = 1, ['vodka'] = 1, }, },
	},
	Beer = {
		{ ['ambeer'] = {} },
		{ ['dusche'] = {} },
		{ ['logger'] = {} },
		{ ['pisswasser'] = {} },
		{ ['pisswasser2'] = {} },
		{ ['pisswasser3'] = {} },
	},
	Coffee = {
		{ ['coffee'] = {} },
	},
}

QBCore = exports["qb-core"]:GetCoreObject()