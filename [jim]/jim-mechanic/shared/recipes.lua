Crafting = {
	Nos = {
		{ ["nos"] = { ["noscan"] = 10, } },
		{ ["noscan"] = { ["aluminum"] = 10, } },
		{ ["noscolour"] = { ["plastic"] = 10, } },
	},
	Repairs = {
		{ ["mechanic_tools"] = { ["iron"] = 15, } },
		{ ["ducttape"] = { ["plastic"] = 25, } },
		{ ["newoil"] = { ["plastic"] = 20, } },
		{ ["sparkplugs"] = { ["copper"] = 15, } },
		{ ["carbattery"] = { ["copper"] = 15, ["plastic"] = 5 } },
		{ ["axleparts"] = { ["steel"] = 25, } },
		{ ["sparetire"] = { ["rubber"] = 15, } },
	},
	Tools = {
		{ ["toolbox"] = { ["metalscrap"] = 15, } },
		{ ["paintcan"] = { ["aluminum"] = 20, } },

		{ ["tint_supplies"] = { ["glass"] = 20, } },
		{ ["underglow_controller"] = { ["plastic"] = 15, } },
		{ ["cleaningkit"] = { ["plastic"] = 50, } },
	},
	Perform = {
		{ ["turbo"] = { ["steel"] = 25, } },
		{ ["car_armor"] = { ["iron"] = 100, } },
		{ ["engine1"] = { ["steel"] = 25, } },
		{ ["engine2"] = { ["steel"] = 35, } },
		{ ["engine3"] = { ["steel"] = 45, } },
		{ ["engine4"] = { ["steel"] = 50, } },
		{ ["engine5"] = { ["steel"] = 55, } },
		{ ["transmission1"] = { ["iron"] = 15, } },
		{ ["transmission2"] = { ["iron"] = 20, } },
		{ ["transmission3"] = { ["iron"] = 25, } },
		{ ["transmission4"] = { ["iron"] = 30, } },
		{ ["brakes1"] = { ["copper"] = 10, } },
		{ ["brakes2"] = { ["copper"] = 15, } },
		{ ["brakes3"] = { ["copper"] = 20, } },
		{ ["suspension1"] = { ["steel"] = 10, } },
		{ ["suspension2"] = { ["steel"] = 15, } },
		{ ["suspension3"] = { ["steel"] = 20, } },
		{ ["suspension4"] = { ["steel"] = 25, } },
		{ ["suspension5"] = { ["steel"] = 30, } },
		{ ["bprooftires"] = { ["rubber"] = 200, } },
		{ ["drifttires"] = { ["rubber"] = 100, } },

		{ ["oilp1"] = { ["steel"] = 1, } },
		{ ["oilp2"] = { ["steel"] = 1, } },
		{ ["oilp3"] = { ["steel"] = 1, } },
		{ ["drives1"] = { ["steel"] = 1, } },
		{ ["drives2"] = { ["steel"] = 1, } },
		{ ["drives3"] = { ["steel"] = 1, } },
		{ ["cylind1"] = { ["steel"] = 1, } },
		{ ["cylind2"] = { ["steel"] = 1, } },
		{ ["cylind3"] = { ["steel"] = 1, } },
		{ ["cables1"] = { ["steel"] = 1, } },
		{ ["cables2"] = { ["steel"] = 1, } },
		{ ["cables3"] = { ["steel"] = 1, } },
		{ ["fueltank1"] = { ["steel"] = 1, } },
		{ ["fueltank2"] = { ["steel"] = 1, } },
		{ ["fueltank3"] = { ["steel"] = 1, } },

		{ ["harness"] = { ["metalscrap"] = 35, } },
		{ ["antilag"] = { ["steel"] = 35, } },
	},
	Cosmetic = {
		{ ["hood"] = { ["plastic"] = 15, } },
		{ ["roof"] = { ["plastic"] = 20, } },
		{ ["spoiler"] = { ["plastic"] = 20, } },
		{ ["bumper"] = { ["plastic"] = 20, } },
		{ ["skirts"] = { ["plastic"] = 15, } },
		{ ["exhaust"] = { ["iron"] = 15, } },
		{ ["seat"] = { ["plastic"] = 15, } },
		{ ["livery"] = { ["plastic"] = 30, }, },
		{ ["tires"] = { ["rubber"] = 25, } },
		{ ["horn"] = { ["metalscrap"] = 20, } },
		{ ["internals"] = { ["plastic"] = 20, } },
		{ ["externals"] = { ["plastic"] = 20, } },
		{ ["customplate"] = { ["metalscrap"] = 15, } },
		{ ["headlights"] = { ["glass"] = 10, } },
		{ ["rims"] = { ["aluminum"] = 35, } },
		{ ["rollcage"] = { ["metalscrap"] = 20, } },
	},
}

Stores = {
	NosItems = {
		label = Loc[Config.Lan]["stores"].nos,
		items = {
			{ name = "nos", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	RepairItems = {
		label = Loc[Config.Lan]["stores"].repairs,
		items = {
			{ name = "mechanic_tools", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "sparetire", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "axleparts", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "carbattery", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "sparkplugs", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "newoil", price = 0, amount = 1000, info = {}, type = "item", },
		},
	},
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "toolbox", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", price = 0, amount = 100, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine5", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "car_armor", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension5", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bprooftires", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "oilp1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "oilp2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "oilp3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "drives1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drives2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drives3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "cylind1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cylind2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cylind3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "cables1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cables2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cables3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "fueltank1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "fueltank2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "fueltank3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "harness", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "antilag", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	CosmeticItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.CosmeticItems.slots = #Stores.CosmeticItems.items
for k in pairs(Stores.CosmeticItems.items) do Stores.CosmeticItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
Stores.RepairItems.slots = #Stores.RepairItems.items
for k in pairs(Stores.RepairItems.items) do Stores.RepairItems.items[k].slot = k end
Stores.NosItems.slots = #Stores.NosItems.items
for k in pairs(Stores.NosItems.items) do Stores.NosItems.items[k].slot = k end