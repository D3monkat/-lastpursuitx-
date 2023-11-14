Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

-------------------------------------------------------------------------------------------------

# INSTALLATION

THESE GO IN YOUR SHARED .LUA IN qb-core:

Under the QBShared.Items

	-- Food
	["tripleburger"] 		= {["name"] = "tripleburger",  	    ["label"] = "The Triple Burger",		["weight"] = 100,["type"] = "item",["image"] = "tripleburger.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["baconcheesemelt"] 	= {["name"] = "baconcheesemelt",  	["label"] = "Bacon-Triple Cheese Melt", ["weight"] = 100,["type"] = "item",["image"] = "baconcheesemelt.png",	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["chillidog"] 			= {["name"] = "chillidog",  	    ["label"] = "Footlong Chili Dog",		["weight"] = 100,["type"] = "item",["image"] = "chillidog.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["atomfries"] 			= {["name"] = "atomfries",  	    ["label"] = "Atom Fries",				["weight"] = 100,["type"] = "item",["image"] = "atomfries.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },

	["chickenfillet"] 		= {["name"] = "chickenfillet",  	["label"] = "Chicken Fillets",			["weight"] = 100,["type"] = "item",["image"] = "chickenbreasts.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["chickenhorn"] 		= {["name"] = "chickenhorn",  	    ["label"] = "Chicken Hornstars",		["weight"] = 100,["type"] = "item",["image"] = "chickhornstars.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["grilledchicken"] 		= {["name"] = "grilledchicken",  	["label"] = "Chicken Sandwich",			["weight"] = 100,["type"] = "item",["image"] = "chickensandwich.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["chickensalad"] 		= {["name"] = "chickensalad",  	    ["label"] = "Chicken Salad",			["weight"] = 100,["type"] = "item",["image"] = "chickensalad.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["hunksohen"] 			= {["name"] = "hunksohen",  	    ["label"] = "Hunk o' Hen",				["weight"] = 100,["type"] = "item",["image"] = "chickenthighs.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },

	["chickentaco"] 		= {["name"] = "chickentaco",  	    ["label"] = "Chicken Taco",				["weight"] = 100,["type"] = "item",["image"] = "chickentaco.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["enchiladas"] 			= {["name"] = "enchiladas",  	    ["label"] = "Breakfast Enchiladas",		["weight"] = 100,["type"] = "item",["image"] = "enchi.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["gazpacho"] 			= {["name"] = "gazpacho",  	    	["label"] = "Guzpacho",					["weight"] = 100,["type"] = "item",["image"] = "gazpacho.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },

	["hornbreakfast"] 		= {["name"] = "hornbreakfast",  	["label"] = "Horny's Breakfast",		["weight"] = 100,["type"] = "item",["image"] = "bangers.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["eggsbenedict"] 		= {["name"] = "eggsbenedict",  	    ["label"] = "Eggs Benedict",			["weight"] = 100,["type"] = "item",["image"] = "eggbene.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["hashbrowns"] 			= {["name"] = "hashbrowns",  	    ["label"] = "Hash Browns",				["weight"] = 100,["type"] = "item",["image"] = "hashbrown.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["sausages"] 			= {["name"] = "sausages",  	    	["label"] = "Sausages",					["weight"] = 100,["type"] = "item",["image"] = "sausage.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["baconroll"] 			= {["name"] = "baconroll",  	    ["label"] = "Bacon Roll",				["weight"] = 100,["type"] = "item",["image"] = "baconroll.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["baconeggtoast"] 		= {["name"] = "baconeggtoast",  	["label"] = "Bacon & Egg on Toast",		["weight"] = 100,["type"] = "item",["image"] = "baconegg.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["frenchtoast"] 		= {["name"] = "frenchtoast",  	    ["label"] = "French Toast",				["weight"] = 100,["type"] = "item",["image"] = "frenchtoast.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["frenchtoastbacon"] 	= {["name"] = "frenchtoastbacon",  	["label"] = "French Toast Bacon",		["weight"] = 100,["type"] = "item",["image"] = "frenchbacon.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },

	["hornburger"] 			= {["name"] = "hornburger",  	    ["label"] = "HornBurger",				["weight"] = 100,["type"] = "item",["image"] = "hornburger.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["dblhornburger"] 	 	= {["name"] = "dblhornburger",  	["label"] = "DBL HornBurger",			["weight"] = 100,["type"] = "item",["image"] = "dblhornburger.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["baconhornburger"] 	= {["name"] = "baconhornburger",  	["label"] = "HornBurger Bacon",			["weight"] = 100,["type"] = "item",["image"] = "baconburger.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["picklehornburger"] 	= {["name"] = "picklehornburger",  	["label"] = "HornBurger Pickle",		["weight"] = 100,["type"] = "item",["image"] = "pickleburger.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["chickenhornburger"] 	= {["name"] = "chickenhornburger",  ["label"] = "Chicken HornBurger",		["weight"] = 100,["type"] = "item",["image"] = "chickenburger.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["dblchickenhornburger"]= {["name"] = "dblchickenhornburger",["label"] = "DBL Chicken HornBurger",	["weight"] = 100,["type"] = "item",["image"] = "dblchickenburger.png", 	["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },

	["icecone"] 			= {["name"] = "icecone",  	    	["label"] = "Ice Cone",					["weight"] = 100,["type"] = "item",["image"] = "cone.png", 				["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["icenugget"] 			= {["name"] = "icenugget",  	    ["label"] = "Ice Nugget",				["weight"] = 100,["type"] = "item",["image"] = "icenugget.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	["icecake"] 			= {["name"] = "icecake",  	    	["label"] = "Ice Cream Cake",			["weight"] = 100,["type"] = "item",["image"] = "icecake.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },

	-- Desert
	["creamyshake"] 		= {["name"] = "creamyshake",    	["label"] = "Extra Creamy Jumbo Shake",	["weight"] = 100,["type"] = "item",["image"] = "atomshake.png",			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['hunger'] = math.random(20, 30) },
	-- Drinks
	["atomsoda"] 			= {["name"] = "atomsoda",  	    	["label"] = "Atom Soda",				["weight"] = 100,["type"] = "item",["image"] = "atomsoda.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['thirst'] = math.random(20, 30) },
	["orangotang"] 			= {["name"] = "orangotang",  	    ["label"] = "Bacon",					["weight"] = 100,["type"] = "item",["image"] = "orangotang.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['thirst'] = math.random(20, 30) },
	["raine"] 				= {["name"] = "raine",  	    	["label"] = "Raine",					["weight"] = 100,["type"] = "item",["image"] = "raine.png", 			["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['thirst'] = math.random(20, 30) },
	["junkdrink"] 			= {["name"] = "junkdrink",  	    ["label"] = "Junk",						["weight"] = 100,["type"] = "item",["image"] = "junkdrink.png", 		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "", ['thirst'] = math.random(20, 30) },

	-- Ingredients
	["burgerpatty"] 		= {["name"] = "burgerpatty",		["label"] = "Patty",					["weight"] = 100,["type"] = "item",["image"] = "burgerpatty.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["breadslice"] 			= {["name"] = "breadslice",			["label"] = "Slice of Bread",			["weight"] = 100,["type"] = "item",["image"] = "breadslice.png",		["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "",['hunger'] = math.random(10, 20) },
	["cheddar"] 			= {["name"] = "cheddar",  	    	["label"] = "Cheese",					["weight"] = 100,["type"] = "item",["image"] = "cheddar.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["lettuce"] 			= {["name"] = "lettuce",  	    	["label"] = "Lettuce",					["weight"] = 100,["type"] = "item",["image"] = "lettuce.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["tomato"] 				= {["name"] = "tomato",  	    	["label"] = "Tomato",					["weight"] = 100,["type"] = "item",["image"] = "tomato.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["burgerbun"] 			= {["name"] = "burgerbun",  	    ["label"] = "Burger Bun",				["weight"] = 100,["type"] = "item",["image"] = "burgerbun.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["hotdogbun"] 			= {["name"] = "hotdogbun",  	    ["label"] = "Hotdog Bun",				["weight"] = 100,["type"] = "item",["image"] = "hotdogbun.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["chillimince"] 		= {["name"] = "chillimince",  	    ["label"] = "Chillimince",				["weight"] = 100,["type"] = "item",["image"] = "chillimince.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["butter"] 				= {["name"] = "butter",  	    	["label"] = "Butter",					["weight"] = 100,["type"] = "item",["image"] = "farming_butter.png", 	["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["milk"] 				= {["name"] = "milk",  	    		["label"] = "Milk",						["weight"] = 100,["type"] = "item",["image"] = "burger-milk.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "",['thirst'] = math.random(20, 30) },
	["cream"] 				= {["name"] = "cream",  	    	["label"] = "Cream",					["weight"] = 100,["type"] = "item",["image"] = "cream.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["burgermeat"] 			= {["name"] = "burgermeat",  	    ["label"] = "Burger Meat",				["weight"] = 100,["type"] = "item",["image"] = "burgermeat.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["hotdogmeat"] 			= {["name"] = "hotdogmeat",  	    ["label"] = "Hotdog Meat",				["weight"] = 100,["type"] = "item",["image"] = "hotdogmeat.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["slicedtomato"] 		= {["name"] = "slicedtomato",  	    ["label"] = "Sliced Tomato",			["weight"] = 100,["type"] = "item",["image"] = "slicedtomato.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["slicedpotato"] 		= {["name"] = "slicedpotato",  	    ["label"] = "Sliced Potato",			["weight"] = 100,["type"] = "item",["image"] = "burger-slicedpotato.png",["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["rawhotdog"] 			= {["name"] = "rawhotdog",  	    ["label"] = "Raw Hotdog",				["weight"] = 100,["type"] = "item",["image"] = "rawhotdog.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["potato"] 				= {["name"] = "potato",  	    	["label"] = "Potato",					["weight"] = 100,["type"] = "item",["image"] = "potato.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["egg"]       			= {["name"] = "egg",            	["label"] = "Egg",       				["weight"] = 100,["type"] = "item",["image"] = "farming_egg.png",   	["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "" },
	["bacon"] 				= {["name"] = "bacon",  	    	["label"] = "Bacon",					["weight"] = 100,["type"] = "item",["image"] = "bacon.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["rawbacon"] 			= {["name"] = "rawbacon",  	    	["label"] = "Raw Bacon",				["weight"] = 100,["type"] = "item",["image"] = "rawbacon.png", 			["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["rawsausage"] 			= {["name"] = "rawsausage",  	    ["label"] = "Raw Sausages",				["weight"] = 100,["type"] = "item",["image"] = "rawsausage.png", 		["unique"] = false,["useable"] = false,["shouldClose"] = true,["description"] = "", },
	["pickle"] 						= {["name"] = "pickle",  	     			["label"] = "Pickle",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "pickle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A jar of Pickles", ['hunger'] = math.random(40, 50) },

	["chickenbreast"]       = {["name"] = "chickenbreast",		["label"] = "Raw Chicken Breast",       ["weight"] = 100,["type"] = "item",["image"] = "farming_chickenbreast.png",["unique"] = false,["useable"] = true,["shouldClose"] = true,["description"] = "" },

	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },



Under the QBShared.Jobs = {

	['upnatom'] = {
		label = "Up n Atom",
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['hornys'] = {
		label = "Horny's",
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},


--------------------------------------------------------------------------------------------------

## QB-Management:

	Update to the latest github version
	Make sure the job "upnatom" has been added to the database
	Make sure the job "hornys" has been added to the database
	The menu's targets should be accessible to bosses in the offices

--------------------------------------------------------------------------------------------------

## Emotes

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)

These go in your `[standalone]` > `dpemotes` > `client` > `AnimationList.lua`

Place these under DP.PropEmotes = {

	["atomdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'ng_proc_sodacup_01c', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
	["atomhotdog"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_bs_burger2', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
	["atomfries"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_chips', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
	["breadslice"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Bread Slice", AnimationOptions = { Prop = 'v_res_fa_bread03', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, -10.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
	["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions = { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
	["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},

--------------------------------------------------------------------------------------------------

## Jim-Consumables item setup - (Optional) - (https://github.com/jimathy/jim-consumables)
- Support for new `Jim-Consumables` automated adding of items and emotes
- Start `jim-consumables` BEFORE this script and set `Config.JimConsumables` to `true` for it to work
- In Jim-UpNAtomHorny's `config.lua` set `JimConsumables` to true
- Restart/Ensure Jim-UpNAtomHorny

--------------------------------------------------------------------------------------------------

# Changelog

## v1.0.2
	- Tidy up and minor fixes
	- Fix incorrect variables in config making animations not work for some crafting
	- Readd server events for ox and hasItem events (sorry)
	- Better handling of adding jim-consumables items though server events
	- Improved startup event to detect missing jobs better
	- Improved Crafting Events
		- Handle missing items better
		- Inventory's now lock and unlock when crafting
		- Lock players in place when crafting
		- Make animation loop to get around animations ending before progressbars
	- Added crafting camera, toggle this in the config

## v1.0.1
	- Fix progressbars stopping movement
	- Fix install info missing drink items and broken formatting on the hornys job role
	- Pickle, ecola, sprunk, rawbacon + images
	- Add missing crafting recipes and shop items
	- Fix Hornys location bossroles for bossmenu not being found

## v1.0.0
	- Release