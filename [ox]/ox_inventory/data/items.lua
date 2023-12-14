return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['atmrope'] = {
		label = 'Reinforced Rope',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["antilag"] = {
		label = "AntiLag",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "antiLag.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["rhinohorn"] = {
		label = "Rhino Horn",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rhinohorn.png",
		}
	},

	["atomsoda"] = {
		label = "Atom Soda",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 30,
			},
			image = "atomsoda.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["noodlebowl"] = {
		label = "Bowl of Noodles",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 41,
			},
			image = "noodlebowl.png",
		}
	},

	["suspension2"] = {
		label = "Tier 2 Suspension",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "suspension2.png",
		}
	},

	["bscoffee"] = {
		label = "BurgerShot Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "BurgerShot Coffee",
		client = {
			status = {
				thirst = 50,
			},
			image = "burger-coffee.png",
		}
	},

	["hornburger"] = {
		label = "HornBurger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 22,
			},
			image = "hornburger.png",
		}
	},

	["drill"] = {
		label = "Drill",
		weight = 20000,
		stack = true,
		close = false,
		description = "The real deal...",
		client = {
			image = "drill.png",
		}
	},

	["shotfries"] = {
		label = "Shot Fries",
		weight = 200,
		stack = true,
		close = true,
		description = "Shot Fries",
		client = {
			status = {
				hunger = 49,
			},
			image = "burger-fries.png",
		}
	},

	["red_sulfur"] = {
		label = "Red Sulfur",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["veh_suspension"] = {
		label = "Suspension",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle suspension",
		client = {
			image = "veh_suspension.png",
		}
	},

	["green_gelato_cannabis"] = {
		label = "Green Gelato Cannabis",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["egg"] = {
		label = "Egg",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farming_egg.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop",
		client = {
			image = "laptop.png",
		}
	},

	["hashbrowns"] = {
		label = "Hash Browns",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 27,
			},
			image = "hashbrown.png",
		}
	},

	["atomfries"] = {
		label = "Atom Fries",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "atomfries.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["bscoke"] = {
		label = "BurgerShot Coke",
		weight = 200,
		stack = true,
		close = true,
		description = "BurgerShot Cola",
		client = {
			status = {
				thirst = 38,
			},
			image = "burger-softdrink.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["lungs"] = {
		label = "Lungs",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "lungs.png",
		}
	},

	["spoiler"] = {
		label = "Vehicle Spoiler",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "spoiler.png",
		}
	},

	["chillimince"] = {
		label = "Chillimince",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chillimince.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 100,
		stack = true,
		close = true,
		description = "A baggie of Meth",
		client = {
			image = "meth_baggy.png",
		}
	},

	["engine3"] = {
		label = "Tier 3 Engine",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "engine3.png",
		}
	},

	["drum_attachment"] = {
		label = "Drum",
		weight = 1000,
		stack = true,
		close = true,
		description = "A drum for a weapon",
		client = {
			image = "drum_attachment.png",
		}
	},

	["cables1"] = {
		label = "Tier 1 Battery Cables",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "cables1.png",
		}
	},

	["seat"] = {
		label = "Seat Cosmetics",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "seat.png",
		}
	},

	["carbon"] = {
		label = "Carbon",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["transmission3"] = {
		label = "Tier 3 Transmission",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "transmission3.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more",
		client = {
			image = "evidence.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["ducttape"] = {
		label = "Duct Tape",
		weight = 0,
		stack = false,
		close = true,
		description = "Good for quick fixes",
		client = {
			image = "bodyrepair.png",
		}
	},

	["onion"] = {
		label = "Onion",
		weight = 500,
		stack = true,
		close = false,
		description = "An onion",
		client = {
			image = "burger-onion.png",
		}
	},

	["bmochi"] = {
		label = "Blue Mochi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 44,
			},
			image = "mochiblue.png",
		}
	},

	["sodium_hydroxide"] = {
		label = "Sodium hydroxide",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["chocolate"] = {
		label = "Chocolate",
		weight = 200,
		stack = true,
		close = false,
		description = "Chocolate Bar",
		client = {
			status = {
				hunger = 13,
			},
			image = "chocolate.png",
		}
	},

	["gmochi"] = {
		label = "Green Mochi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 46,
			},
			image = "mochigreen.png",
		}
	},

	["eggsbenedict"] = {
		label = "Eggs Benedict",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 24,
			},
			image = "eggbene.png",
		}
	},

	["cake"] = {
		label = "Strawberry Cake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 50,
			},
			image = "cake.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["bobatea"] = {
		label = "Boba Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 44,
			},
			image = "bubbletea.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["rice"] = {
		label = "Bowl of Rice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 41,
			},
			image = "rice.png",
		}
	},

	["comp_attachment"] = {
		label = "Compensator",
		weight = 1000,
		stack = true,
		close = true,
		description = "A compensator for a weapon",
		client = {
			image = "comp_attachment.png",
		}
	},

	["nvscope_attachment"] = {
		label = "Night Vision Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A night vision scope for a weapon",
		client = {
			image = "nvscope_attachment.png",
		}
	},

	["mtlion3"] = {
		label = "Mountain Lion Carcass",
		weight = 3800,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "mtlion3.png",
		}
	},

	["huntingbait"] = {
		label = "Animal Bait",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "huntingbait.png",
		}
	},

	["chickenbreast"] = {
		label = "Chicken Breast",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			status = {
				hunger = 17,
			},
			image = "chickenbreast.png",
		}
	},

	["sake"] = {
		label = "Sake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 40,
			},
			image = "sake.png",
		}
	},

	["pickle"] = {
		label = "Pickle",
		weight = 200,
		stack = true,
		close = true,
		description = "A jar of Pickles",
		client = {
			status = {
				hunger = 44,
			},
			image = "pickle.png",
		}
	},

	["frozennugget"] = {
		label = "Frozen Nuggets",
		weight = 500,
		stack = true,
		close = false,
		description = "Bag of Frozen Nuggets",
		client = {
			image = "burger-frozennugget.png",
		}
	},

	["creampie"] = {
		label = "Creampie",
		weight = 200,
		stack = true,
		close = true,
		description = "BurgerShot Apple Pie",
		client = {
			status = {
				hunger = 46,
			},
			image = "burger-creampie.png",
		}
	},

	["markedbills"] = {
		label = "Marked Money",
		weight = 1000,
		stack = false,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["engine4"] = {
		label = "Tier 4 Engine",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "engine4.png",
		}
	},

	["veh_engine"] = {
		label = "Engine",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle engine",
		client = {
			image = "veh_engine.png",
		}
	},

	["heartstopper"] = {
		label = "HeartStopper",
		weight = 200,
		stack = true,
		close = true,
		description = "Heartstopper",
		client = {
			status = {
				hunger = 54,
			},
			image = "burger-heartstopper.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["medscope_attachment"] = {
		label = "Medium Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A medium scope for a weapon",
		client = {
			image = "medscope_attachment.png",
		}
	},

	["10kgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["headlights"] = {
		label = "Xenon Headlights",
		weight = 0,
		stack = false,
		close = true,
		description = "8k HID headlights",
		client = {
			image = "headlights.png",
		}
	},

	["police_stormram"] = {
		label = "Stormram",
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["externals"] = {
		label = "Exterior Cosmetics",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "mirror.png",
		}
	},

	["bellend_muzzle_brake"] = {
		label = "Bellend Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "bellend_muzzle_brake.png",
		}
	},

	["sausages"] = {
		label = "Sausages",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 22,
			},
			image = "sausage.png",
		}
	},

	["beandonut"] = {
		label = "Donut",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 25,
			},
			image = "popdonut.png",
		}
	},

	["highnoon"] = {
		label = "Highnoon",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 21,
			},
			image = "highnoon.png",
		}
	},

	["pmochi"] = {
		label = "Pink Mochi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 41,
			},
			image = "mochipink.png",
		}
	},

	["tires"] = {
		label = "Drift Smoke Tires",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "tires.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["cakepop"] = {
		label = "Cat Cake-Pop",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 50,
			},
			image = "cakepop.png",
		}
	},

	["nos"] = {
		label = "NOS Bottle",
		weight = 0,
		stack = false,
		close = true,
		description = "A full bottle of NOS",
		client = {
			image = "nos.png",
		}
	},

	["ice"] = {
		label = "Ice",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["drives2"] = {
		label = "Tier 2 Drive Shaft",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "drives2.png",
		}
	},

	["veh_toolbox"] = {
		label = "Toolbox",
		weight = 1000,
		stack = true,
		close = true,
		description = "Check vehicle status",
		client = {
			image = "veh_toolbox.png",
		}
	},

	["hunterlicense"] = {
		label = "Hunting License",
		weight = 1,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "huntinglicense.png",
		}
	},

	["fueltank2"] = {
		label = "Tier 2 Fuel Tank",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "fueltank2.png",
		}
	},

	["drink_sprite"] = {
		label = "Sprite",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["baconroll"] = {
		label = "Bacon Roll",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 24,
			},
			image = "baconroll.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["orangotang"] = {
		label = "Bacon",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 24,
			},
			image = "orangotang.png",
		}
	},

	["frenchtoastbacon"] = {
		label = "French Toast Bacon",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 23,
			},
			image = "frenchbacon.png",
		}
	},

	["sprunklight"] = {
		label = "Sprunk Light",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 30,
			},
			image = "sprunklight.png",
		}
	},

	["crisps"] = {
		label = "Crisps",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "chips.png",
		}
	},

	["pseudoefedrine"] = {
		label = "Pseudoefedrine",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["brakes2"] = {
		label = "Tier 2 Brakes",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "brakes2.png",
		}
	},

	["brushcamo_attachment"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A brushstroke camo for a weapon",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["grilledchicken"] = {
		label = "Chicken Sandwich",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 29,
			},
			image = "chickensandwich.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["bbobatea"] = {
		label = "Blue Boba Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 43,
			},
			image = "bubbleteablue.png",
		}
	},

	["bprooftires"] = {
		label = "Bulletproof Tires",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "bprooftires.png",
		}
	},

	["engine1"] = {
		label = "Tier 1 Engine",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "engine1.png",
		}
	},

	["muriatic_acid"] = {
		label = "Muriatic Acid",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["mtlion4"] = {
		label = "Mountain Lion Carcass",
		weight = 4000,
		stack = true,
		close = false,
		description = "This looks like a protected mountain lion.",
		client = {
			image = "mtlion4.png",
		}
	},

	["brain"] = {
		label = "Brain",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "brain.png",
		}
	},

	["suspension1"] = {
		label = "Tier 1 Suspension",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "suspension1.png",
		}
	},

	["rims"] = {
		label = "Custom Wheel Rims",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "rims.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A microphone for the news",
		client = {
			image = "newsmic.png",
		}
	},

	["cables2"] = {
		label = "Tier 2 Battery Cables",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "cables2.png",
		}
	},

	["pbobatea"] = {
		label = "Pink Boba Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 42,
			},
			image = "bubbleteapink.png",
		}
	},

	["obobatea"] = {
		label = "Orange Boba Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 41,
			},
			image = "bubbleteaorange.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["tactical_muzzle_brake"] = {
		label = "Tactical Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brakee for a weapon",
		client = {
			image = "tactical_muzzle_brake.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["gbobatea"] = {
		label = "Green Boba Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 41,
			},
			image = "bubbleteagreen.png",
		}
	},

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 100,
		stack = false,
		close = true,
		description = "A camera for the news",
		client = {
			image = "newscam.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["tirerepairkit"] = {
		label = "Tire Repair Kit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A kit to repair your tires",
		client = {
			image = "tirerepairkit.png",
		}
	},

	["cylind3"] = {
		label = "Tier 3 Cylinder Head",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "cylind3.png",
		}
	},

	["flusher"] = {
		label = "The Flusher",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 28,
			},
			image = "flusher.png",
		}
	},

	["milkshake"] = {
		label = "Milkshake",
		weight = 500,
		stack = true,
		close = true,
		description = "BurgerShot Milkshake",
		client = {
			status = {
				thirst = 51,
			},
			image = "burger-milkshake.png",
		}
	},

	["veh_interior"] = {
		label = "Interior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle interior",
		client = {
			image = "veh_interior.png",
		}
	},

	["baconhornburger"] = {
		label = "HornBurger Bacon",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 20,
			},
			image = "baconburger.png",
		}
	},

	["boar1"] = {
		label = "Boar Carcass",
		weight = 3000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "boar1.png",
		}
	},

	["boar3"] = {
		label = "Boar Carcass",
		weight = 3800,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "boar3.png",
		}
	},

	["newoil"] = {
		label = "Car Oil",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "caroil.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["ramen"] = {
		label = "Bowl of Ramen",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 45,
			},
			image = "ramen.png",
		}
	},

	["mechboard"] = {
		label = "Mechanic Sheet",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "mechboard.png",
		}
	},

	["hydrogen"] = {
		label = "Hydrogen",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["shotrings"] = {
		label = "Ring Shots",
		weight = 200,
		stack = true,
		close = true,
		description = "Burgershot Onion Rings",
		client = {
			status = {
				hunger = 42,
			},
			image = "burger-shotrings.png",
		}
	},

	["fueltank3"] = {
		label = "Tier 3 Fuel Tank",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "fueltank3.png",
		}
	},

	["toolbox"] = {
		label = "Toolbox",
		weight = 0,
		stack = false,
		close = true,
		description = "Needed for Performance part removal",
		client = {
			image = "toolbox.png",
		}
	},

	["car_armor"] = {
		label = "Vehicle Armor",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "car_armour.png",
		}
	},

	["sparkplugs"] = {
		label = "Spark Plugs",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sparkplugs.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["weed_ogkush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["drives3"] = {
		label = "Tier 3 Drive Shaft",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "drives3.png",
		}
	},

	["purrito"] = {
		label = "Purrito",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 44,
			},
			image = "purrito.png",
		}
	},

	["baconcheesemelt"] = {
		label = "Bacon-Triple Cheese Melt",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "baconcheesemelt.png",
		}
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["veh_armor"] = {
		label = "Armor",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle armor",
		client = {
			image = "veh_armor.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["underglow_controller"] = {
		label = "Neon Controller",
		weight = 0,
		stack = true,
		close = true,
		description = "RGB LED Vehicle Remote",
		client = {
			image = "underglow_controller.png",
		}
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["cheesecake"] = {
		label = "Cheese Cake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "cheesecake.png",
		}
	},

	["omochi"] = {
		label = "Orange Mochi",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 42,
			},
			image = "mochiorange.png",
		}
	},

	["coyote1"] = {
		label = "Coyote Carcass",
		weight = 3000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coyote1.png",
		}
	},

	["nekolatte"] = {
		label = "Neko Latte",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 29,
			},
			image = "latte.png",
		}
	},

	["potato"] = {
		label = "Potatoes",
		weight = 500,
		stack = true,
		close = false,
		description = "Bag of Potatos",
		client = {
			image = "potatoes.png",
		}
	},

	["torpedo"] = {
		label = "Torpedo",
		weight = 200,
		stack = true,
		close = true,
		description = "BurgerShot Torpedo",
		client = {
			status = {
				hunger = 44,
			},
			image = "burger-torpedo.png",
		}
	},

	["rollcage"] = {
		label = "Roll Cage",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "rollcage.png",
		}
	},

	["milk"] = {
		label = "Milk",
		weight = 500,
		stack = true,
		close = true,
		description = "Carton of Milk",
		client = {
			status = {
				thirst = 39,
			},
			image = "burger-milk.png",
		}
	},

	["oystershell"] = {
		label = "Oyster Shell",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "oyster.png",
		}
	},

	["internals"] = {
		label = "Internal Cosmetics",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "internals.png",
		}
	},

	["bratte"] = {
		label = "The Bratte",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 22,
			},
			image = "bratte.png",
		}
	},

	["ecocoffee"] = {
		label = "The Eco-ffee",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 21,
			},
			image = "ecoffee.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["beancoffee"] = {
		label = "Coffe Beans",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 22,
			},
			image = "beancoffee.png",
		}
	},

	["cylind2"] = {
		label = "Tier 2 Cylinder Head",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "cylind2.png",
		}
	},

	["cleaningkit"] = {
		label = "Cleaning Kit",
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["weed_ogkush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["fat_end_muzzle_brake"] = {
		label = "Fat End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "fat_end_muzzle_brake.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["rimjob"] = {
		label = "Rim Job",
		weight = 200,
		stack = true,
		close = true,
		description = "BurgerShot Donut",
		client = {
			status = {
				hunger = 43,
			},
			image = "burger-rimjob.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["brakes1"] = {
		label = "Tier 1 Brakes",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "brakes1.png",
		}
	},

	["drug_ecstasy"] = {
		label = "Ecstasy",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["barrel_attachment"] = {
		label = "Barrel",
		weight = 1000,
		stack = true,
		close = true,
		description = "A barrel for a weapon",
		client = {
			image = "barrel_attachment.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["gazpacho"] = {
		label = "Guzpacho",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 22,
			},
			image = "gazpacho.png",
		}
	},

	["drug_lean"] = {
		label = "Lean",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["weed_purplehaze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["jolly_ranchers"] = {
		label = "Jolly Ranchers",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["joint"] = {
		label = "Joint",
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint.png",
		}
	},

	["drug_meth"] = {
		label = "Meth",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["bleeder"] = {
		label = "The Bleeder",
		weight = 200,
		stack = true,
		close = true,
		description = "The Bleeder",
		client = {
			status = {
				hunger = 50,
			},
			image = "burger-bleeder.png",
		}
	},

	["nekocookie"] = {
		label = "Neko Cookie",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 41,
			},
			image = "catcookie.png",
		}
	},

	["blueberry"] = {
		label = "Blueberry",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 40,
			},
			image = "blueberry.png",
		}
	},

	["tofu"] = {
		label = "Tofu",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 49,
			},
			image = "tofu.png",
		}
	},

	["riceball"] = {
		label = "Neko Onigiri",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 49,
			},
			image = "catrice.png",
		}
	},

	["coyote4"] = {
		label = "Coyote Carcass",
		weight = 4000,
		stack = true,
		close = false,
		description = "This looks like a protected coyote.",
		client = {
			image = "coyote4.png",
		}
	},

	["kidneys"] = {
		label = "Kidneys",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "kidneys.png",
		}
	},

	["veh_brakes"] = {
		label = "Brakes",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle brakes",
		client = {
			image = "veh_brakes.png",
		}
	},

	["advscope_attachment"] = {
		label = "Advanced Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "An advanced scope for a weapon",
		client = {
			image = "advscope_attachment.png",
		}
	},

	["fueltank1"] = {
		label = "Tier 1 Fuel Tank",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "fueltank1.png",
		}
	},

	["burgerbun"] = {
		label = "Burger Bun",
		weight = 100,
		stack = true,
		close = false,
		description = "Some big burger brother",
		client = {
			image = "burgerbun.png",
		}
	},

	["liver"] = {
		label = "Liver",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "liver.png",
		}
	},

	["mtlion2"] = {
		label = "Mountain Lion Carcass",
		weight = 3500,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "mtlion2.png",
		}
	},

	["oilp1"] = {
		label = "Tier 1 Oil Pump",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "oilp1.png",
		}
	},

	["holoscope_attachment"] = {
		label = "Holo Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A holo scope for a weapon",
		client = {
			image = "holoscope_attachment.png",
		}
	},

	["flashlight_attachment"] = {
		label = "Flashlight",
		weight = 1000,
		stack = true,
		close = true,
		description = "A flashlight for a weapon",
		client = {
			image = "flashlight_attachment.png",
		}
	},

	["patriotcamo_attachment"] = {
		label = "Patriot Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A patriot camo for a weapon",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["icecream"] = {
		label = "Ice Cream",
		weight = 500,
		stack = true,
		close = false,
		description = "Ice Cream.",
		client = {
			image = "burger-icecream.png",
		}
	},

	["drifttires"] = {
		label = "Drift Tires",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "drifttires.png",
		}
	},

	["ecolalight"] = {
		label = "eCola Light",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 26,
			},
			image = "ecolalight.png",
		}
	},

	["boomcamo_attachment"] = {
		label = "Boom Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A boom camo for a weapon",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["meatfree"] = {
		label = "Meat Free",
		weight = 200,
		stack = true,
		close = true,
		description = "Meat Free",
		client = {
			status = {
				hunger = 43,
			},
			image = "burger-meatfree.png",
		}
	},

	["digicamo_attachment"] = {
		label = "Digital Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A digital camo for a weapon",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["visa"] = {
		label = "Visa Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM",
		client = {
			image = "visacard.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["weed_whitewidow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["squared_muzzle_brake"] = {
		label = "Squared Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "squared_muzzle_brake.png",
		}
	},

	["smallscope_attachment"] = {
		label = "Small Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A small scope for a weapon",
		client = {
			image = "smallscope_attachment.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["coyote2"] = {
		label = "Coyote Carcass",
		weight = 3500,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coyote2.png",
		}
	},

	["enchiladas"] = {
		label = "Breakfast Enchiladas",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 21,
			},
			image = "enchi.png",
		}
	},

	["cheddar"] = {
		label = "Cheddar Slice",
		weight = 500,
		stack = true,
		close = false,
		description = "Slice of Cheese",
		client = {
			image = "cheddar.png",
		}
	},

	["deer4"] = {
		label = "Deer Carcass",
		weight = 4000,
		stack = true,
		close = false,
		description = "This looks like a protected deer.",
		client = {
			image = "deer4.png",
		}
	},

	["mocha"] = {
		label = "Mocha Meow",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 46,
			},
			image = "mochameow.png",
		}
	},

	["largescope_attachment"] = {
		label = "Large Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A large scope for a weapon",
		client = {
			image = "largescope_attachment.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		client = {
			image = "diving_tube.png",
		}
	},

	["engine2"] = {
		label = "Tier 2 Engine",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "engine2.png",
		}
	},

	["humanmeat"] = {
		label = "Questionable Meat",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "humanmeat.png",
		}
	},

	["oxygen"] = {
		label = "Oxygen",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["roof"] = {
		label = "Vehicle Roof",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "roof.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["picklehornburger"] = {
		label = "HornBurger Pickle",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "pickleburger.png",
		}
	},

	["hunterslogo"] = {
		label = "Hunters Logo",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hunterslogo.png",
		}
	},

	["speedball"] = {
		label = "The SpeedBall",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 28,
			},
			image = "speedball.png",
		}
	},

	["pizza"] = {
		label = "Kitty Pizza",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 49,
			},
			image = "catpizza.png",
		}
	},

	["deer1"] = {
		label = "Deer Carcass",
		weight = 3000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "deer1.png",
		}
	},

	["knife"] = {
		label = "Sharp Knife",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "knife.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["tripleburger"] = {
		label = "The Triple Burger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 20,
			},
			image = "tripleburger.png",
		}
	},

	["watermelon"] = {
		label = "WaterMelon Slice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 20,
				thirst = 22,
			},
			image = "watermelon.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["customplate"] = {
		label = "Customized Plates",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "plate.png",
		}
	},

	["cocaine"] = {
		label = "Cocaine",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["cheesewrap"] = {
		label = "BS Cheese Wrap",
		weight = 150,
		stack = true,
		close = true,
		description = "BurgerShot Cheese Wrap",
		client = {
			status = {
				hunger = 42,
			},
			image = "burger-chickenwrap.png",
		}
	},

	["hunksohen"] = {
		label = "Hunk o Hen",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 23,
			},
			image = "chickenthighs.png",
		}
	},

	["veh_wheels"] = {
		label = "Wheels",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle wheels",
		client = {
			image = "veh_wheels.png",
		}
	},

	["hotdogmeat"] = {
		label = "Hotdog Meat",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hotdogmeat.png",
		}
	},

	["transmission4"] = {
		label = "Tier 4 Transmission",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "transmission4.png",
		}
	},

	["oilp2"] = {
		label = "Tier 2 Oil Pump",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "oilp2.png",
		}
	},

	["burgerpatty"] = {
		label = "Burger Patty",
		weight = 500,
		stack = true,
		close = false,
		description = "Raw Patty",
		client = {
			image = "burgerpatty.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["icecake"] = {
		label = "Ice Cream Cake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "icecake.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["burgermeat"] = {
		label = "Burger Meat",
		weight = 500,
		stack = true,
		close = false,
		description = "Cooked Burger Meat",
		client = {
			image = "burgermeat.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["butter"] = {
		label = "Butter",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farming_butter.png",
		}
	},

	["strawberry"] = {
		label = "Strawberry",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 50,
			},
			image = "strawberry.png",
		}
	},

	["axleparts"] = {
		label = "Axle Parts",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "axleparts.png",
		}
	},

	["drug_lsd"] = {
		label = "LSD",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["chickenhorn"] = {
		label = "Chicken Hornstars",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 29,
			},
			image = "chickhornstars.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 1500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["caffeagra"] = {
		label = "Caffeagra",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 29,
			},
			image = "caffeagra.png",
		}
	},

	["ammonium_nitrate"] = {
		label = "Ammonium nitrate",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["luxuryfinish_attachment"] = {
		label = "Luxury Finish",
		weight = 1000,
		stack = true,
		close = true,
		description = "A luxury finish for a weapon",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["orange"] = {
		label = "Orange",
		weight = 200,
		stack = true,
		close = false,
		description = "An Orange.",
		client = {
			image = "orange.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["veh_exterior"] = {
		label = "Exterior",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle exterior",
		client = {
			image = "veh_exterior.png",
		}
	},

	["ecola"] = {
		label = "eCola",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 20,
			},
			image = "ecola.png",
		}
	},

	["precision_muzzle_brake"] = {
		label = "Precision Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "precision_muzzle_brake.png",
		}
	},

	["bigfoot"] = {
		label = "Big Foot Carcass",
		weight = 9000,
		stack = true,
		close = false,
		description = "A human in a costume??",
		client = {
			image = "bigfoot.png",
		}
	},

	["veh_neons"] = {
		label = "Neons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle neons",
		client = {
			image = "veh_neons.png",
		}
	},

	["boba"] = {
		label = "Boba",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 43,
			},
			image = "boba.png",
		}
	},

	["veh_transmission"] = {
		label = "Transmission",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle transmission",
		client = {
			image = "veh_transmission.png",
		}
	},

	["chickenwrap"] = {
		label = "BS Goat Cheese Wrap",
		weight = 150,
		stack = true,
		close = true,
		description = "BurgerShot Goat Cheese Wrap",
		client = {
			status = {
				hunger = 44,
			},
			image = "burger-goatwrap.png",
		}
	},

	["boar4"] = {
		label = "Boar Carcass",
		weight = 4000,
		stack = true,
		close = false,
		description = "This looks like a protected boar.",
		client = {
			image = "boar4.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["carbattery"] = {
		label = "Car Battery",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "carbattery.png",
		}
	},

	["intestines"] = {
		label = "Intestines",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "intestines.png",
		}
	},

	["nori"] = {
		label = "Nori",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "nori.png",
		}
	},

	["clip_attachment"] = {
		label = "Clip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A clip for a weapon",
		client = {
			image = "clip_attachment.png",
		}
	},

	["cables3"] = {
		label = "Tier 3 Battery Cables",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "cables3.png",
		}
	},

	["lettuce"] = {
		label = "Lettuce",
		weight = 100,
		stack = true,
		close = false,
		description = "Some big taco brother",
		client = {
			image = "lettuce.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["weed_whitewidow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["paintcan"] = {
		label = "Vehicle Spray Can",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "spraycan.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["nekodonut"] = {
		label = "Neko Donut",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 49,
			},
			image = "catdonut.png",
		}
	},

	["deer2"] = {
		label = "Deer Carcass",
		weight = 3500,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "deer2.png",
		}
	},

	["raine"] = {
		label = "Raine",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 20,
			},
			image = "raine.png",
		}
	},

	["engine5"] = {
		label = "Tier 5 Engine",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "engine5.png",
		}
	},

	["heart"] = {
		label = "Heart",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "heart.png",
		}
	},

	["grip_attachment"] = {
		label = "Grip",
		weight = 1000,
		stack = true,
		close = true,
		description = "A grip for a weapon",
		client = {
			image = "grip_attachment.png",
		}
	},

	["perseuscamo_attachment"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A perseus camo for a weapon",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["rawsausage"] = {
		label = "Raw Sausages",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rawsausage.png",
		}
	},

	["boostinglaptop"] = {
		label = "Boosting Laptop",
		weight = 1000,
		stack = true,
		close = true,
		description = "A laptop used for boosting contracts.",
		client = {
			image = "boostinglaptop.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},
	['id_card'] = {
        label = 'ID Card',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'idcard.png'}
    },
    ['driver_license'] = {
        label = 'Drivers License',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'driverlicense.png'}
    },
    ['weaponlicense'] = {
        label = 'Weapon License',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'weaponlicense.png'}
    },
    ['lawyerpass'] = {
        label = 'Lawyer Pass',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'lawyerpass.png'}
    },

	["dblchickenhornburger"] = {
		label = "DBL Chicken HornBurger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 27,
			},
			image = "dblchickenburger.png",
		}
	},

	["tint_supplies"] = {
		label = "Tint Supplies",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle tint",
		client = {
			image = "tint_supplies.png",
		}
	},

	["livery"] = {
		label = "Livery Roll",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "livery.png",
		}
	},

	["deer3"] = {
		label = "Deer Carcass",
		weight = 3800,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "deer3.png",
		}
	},

	["veh_turbo"] = {
		label = "Turbo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle turbo",
		client = {
			image = "veh_turbo.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["suspension4"] = {
		label = "Tier 4 Suspension",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "suspension4.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["cylind1"] = {
		label = "Tier 1 Cylinder Head",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "cylind1.png",
		}
	},

	["mint"] = {
		label = "Matcha",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "matcha.png",
		}
	},

	["skirts"] = {
		label = "Vehicle Skirts",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "skirts.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["miso"] = {
		label = "Miso Soup",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 42,
			},
			image = "miso.png",
		}
	},

	["sprunk"] = {
		label = "Sprunk",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 22,
			},
			image = "sprunk.png",
		}
	},

	["rawhotdog"] = {
		label = "Raw Hotdog",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rawhotdog.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["split_end_muzzle_brake"] = {
		label = "Split End Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "split_end_muzzle_brake.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["bento"] = {
		label = "Bento Box",
		weight = 500,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 48,
			},
			image = "bento.png",
		}
	},

	["baconeggtoast"] = {
		label = "Bacon & Egg on Toast",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 22,
			},
			image = "baconegg.png",
		}
	},

	["chickensalad"] = {
		label = "Chicken Salad",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 30,
			},
			image = "chickensalad.png",
		}
	},

	["bigfruit"] = {
		label = "The Big Fruit",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 22,
			},
			image = "bigfruit.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["hotdogbun"] = {
		label = "Hotdog Bun",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hotdogbun.png",
		}
	},

	["frenchtoast"] = {
		label = "French Toast",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 25,
			},
			image = "frenchtoast.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["thermalscope_attachment"] = {
		label = "Thermal Scope",
		weight = 1000,
		stack = true,
		close = true,
		description = "A thermal scope for a weapon",
		client = {
			image = "thermalscope_attachment.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["codeine"] = {
		label = "Codeine",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["chickenfillet"] = {
		label = "Chicken Fillets",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 25,
			},
			image = "chickenbreasts.png",
		}
	},

	["shotnuggets"] = {
		label = "Shot Nuggets",
		weight = 200,
		stack = true,
		close = true,
		description = "Burgershot Nuggets",
		client = {
			status = {
				hunger = 49,
			},
			image = "burger-shotnuggets.png",
		}
	},

	["suppressor_attachment"] = {
		label = "Suppressor",
		weight = 1000,
		stack = true,
		close = true,
		description = "A suppressor for a weapon",
		client = {
			image = "suppressor_attachment.png",
		}
	},

	["veh_xenons"] = {
		label = "Xenons",
		weight = 1000,
		stack = true,
		close = true,
		description = "Upgrade vehicle xenons",
		client = {
			image = "veh_xenons.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["veh_plates"] = {
		label = "Plates",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle plates",
		client = {
			image = "veh_plates.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["woodcamo_attachment"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A woodland camo for a weapon",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["transmission1"] = {
		label = "Tier 1 Transmission",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "transmission1.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["junkdrink"] = {
		label = "Junk",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 24,
			},
			image = "junkdrink.png",
		}
	},

	["leopardcamo_attachment"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A leopard camo for a weapon",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["sessantacamo_attachment"] = {
		label = "Sessanta Nove Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A sessanta nove camo for a weapon",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["heavy_duty_muzzle_brake"] = {
		label = "HD Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "heavy_duty_muzzle_brake.png",
		}
	},

	["goldchain"] = {
		label = "Golden Chain",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["catcoffee"] = {
		label = "Cat Coffee",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 22,
			},
			image = "catcoffee.png",
		}
	},

	["flour"] = {
		label = "Flour",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 48,
			},
			image = "flour.png",
		}
	},

	["liquid_sulfur"] = {
		label = "Liquid Sulfur",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["sugar"] = {
		label = "Sugar",
		weight = 100,
		stack = true,
		close = false,
		description = "",
		client = {
			status = {
				hunger = 10,
			},
			image = "sugar.png",
		}
	},

	["zebracamo_attachment"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A zebra camo for a weapon",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["driver_license"] = {
		label = "Drivers License",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["coyote3"] = {
		label = "Coyote Carcass",
		weight = 3800,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coyote3.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["suspension5"] = {
		label = "Tier 5 Suspension",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "suspension5.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["hood"] = {
		label = "Vehicle Hood",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "hood.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["boostingdisabler"] = {
		label = "Tracking Disabler",
		weight = 1000,
		stack = true,
		close = true,
		description = "This small tool can disable these pesky trackers.",
		client = {
			image = "boostingdisabler.png",
		}
	},

	["bacon"] = {
		label = "Bacon",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bacon.png",
		}
	},

	["suspension3"] = {
		label = "Tier 3 Suspension",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "suspension3.png",
		}
	},

	["murderbag"] = {
		label = "Murder Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "Grab a Murder Bag of Burgers",
		client = {
			image = "burgerbag.png",
		}
	},

	["mtlion1"] = {
		label = "Mountain Lion Carcass",
		weight = 3000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "mtlion1.png",
		}
	},

	["slicedpotato"] = {
		label = "Sliced Potatoes",
		weight = 500,
		stack = true,
		close = false,
		description = "Sliced Potato",
		client = {
			image = "burger-slicedpotato.png",
		}
	},

	["brakes3"] = {
		label = "Tier 3 Brakes",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "brakes3.png",
		}
	},

	["chickenhornburger"] = {
		label = "Chicken HornBurger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 27,
			},
			image = "chickenburger.png",
		}
	},

	["slanted_muzzle_brake"] = {
		label = "Slanted Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "slanted_muzzle_brake.png",
		}
	},

	["noscolour"] = {
		label = "NOS Colour Injector",
		weight = 0,
		stack = true,
		close = true,
		description = "Make that purge spray",
		client = {
			image = "noscolour.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["icecone"] = {
		label = "Ice Cone",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 23,
			},
			image = "cone.png",
		}
	},

	["moneyshot"] = {
		label = "Money Shot",
		weight = 200,
		stack = true,
		close = true,
		description = "Money Shot",
		client = {
			status = {
				hunger = 42,
			},
			image = "burger-moneyshot.png",
		}
	},

	["chickentaco"] = {
		label = "Chicken Taco",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 25,
			},
			image = "chickentaco.png",
		}
	},

	["chillidog"] = {
		label = "Footlong Chili Dog",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 27,
			},
			image = "chillidog.png",
		}
	},

	["sparetire"] = {
		label = "Spare Tire",
		weight = 0,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "sparetire.png",
		}
	},

	["rawbacon"] = {
		label = "Raw Bacon",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "rawbacon.png",
		}
	},

	["flat_muzzle_brake"] = {
		label = "Flat Muzzle Brake",
		weight = 1000,
		stack = true,
		close = true,
		description = "A muzzle brake for a weapon",
		client = {
			image = "flat_muzzle_brake.png",
		}
	},

	["transmission2"] = {
		label = "Tier 2 Transmission",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "transmission2.png",
		}
	},

	["tomato"] = {
		label = "Tomato",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato.png",
		}
	},

	["turbo"] = {
		label = "Supercharger Turbo",
		weight = 0,
		stack = false,
		close = true,
		description = "Who doesnt need a 65mm Turbo??",
		client = {
			image = "turbo.png",
		}
	},

	["slicedtomato"] = {
		label = "Sliced Tomato",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "slicedtomato.png",
		}
	},

	["exhaust"] = {
		label = "Vehicle Exhaust",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "exhaust.png",
		}
	},

	["slicedonion"] = {
		label = "Sliced Onions",
		weight = 500,
		stack = true,
		close = false,
		description = "Sliced Onion",
		client = {
			image = "burger-slicedonion.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["oilp3"] = {
		label = "Tier 3 Oil Pump",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "oilp3.png",
		}
	},

	["weed_purplehaze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["horn"] = {
		label = "Custom Vehicle Horn",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "horn.png",
		}
	},

	["gunkaccino"] = {
		label = "The Gunkaccino",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				thirst = 21,
			},
			image = "gunkaccino.png",
		}
	},

	["cream"] = {
		label = "Cream",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cream.png",
		}
	},

	["skullcamo_attachment"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A skull camo for a weapon",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["dblhornburger"] = {
		label = "DBL HornBurger",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 20,
			},
			image = "dblhornburger.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["stomach"] = {
		label = "Stomach",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "stomach.png",
		}
	},

	["breadslice"] = {
		label = "Slice of Bread",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 14,
			},
			image = "breadslice.png",
		}
	},

	["noscan"] = {
		label = "Empty NOS Bottle",
		weight = 0,
		stack = true,
		close = true,
		description = "An Empty bottle of NOS",
		client = {
			image = "noscan.png",
		}
	},

	["creamyshake"] = {
		label = "Extra Creamy Jumbo Shake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 22,
			},
			image = "atomshake.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["hornbreakfast"] = {
		label = "Hornys Breakfast",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 28,
			},
			image = "bangers.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["mechanic_tools"] = {
		label = "Mechanic tools",
		weight = 0,
		stack = false,
		close = true,
		description = "Needed for vehicle repairs",
		client = {
			image = "mechanic_tools.png",
		}
	},

	["boar2"] = {
		label = "Boar Carcass",
		weight = 3500,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "boar2.png",
		}
	},

	["icenugget"] = {
		label = "Ice Nugget",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 21,
			},
			image = "icenugget.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["id_card"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself",
		client = {
			image = "id_card.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1000,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["noodles"] = {
		label = "Instant Noodles",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "noodles.png",
		}
	},

	["drives1"] = {
		label = "Tier 1 Drive Shaft",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "drives1.png",
		}
	},

	["bumper"] = {
		label = "Vehicle Bumper",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "bumper.png",
		}
	},

	["opium"] = {
		label = "Opium",
		weight = 500,
		stack = true,
		close = false,
		client = {
			image = "your_image.png",
		}
	},

	["pancake"] = {
		label = "PawCake",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			status = {
				hunger = 49,
			},
			image = "pawcakes.png",
		}
	},

	["geocamo_attachment"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "A geometric camo for a weapon",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bread.png",
		}
	},

	["beefquesadilla"] = {
		label = "Beef Quesadilla",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beefquesadilla.png",
		}
	},

	["sapphire_earring"] = {
		label = "Sapphire Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_earring.png",
		}
	},

	["liquidmix"] = {
		label = "Liquid Chem Mix",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "liquidmix.png",
		}
	},

	["aquamarine_unshapped"] = {
		label = "Aquamarine Unshapped",
		weight = 0,
		stack = true,
		close = false,
		description = "aquamarine unshapped",
		client = {
			image = "aquamarine_unshapped.png",
		}
	},

	["recyclablematerial"] = {
		label = "Recycle Box",
		weight = 100,
		stack = true,
		close = false,
		description = "A box of Recyclable Materials",
		client = {
			image = "recyclablematerial.png",
		}
	},

	["steaktaco"] = {
		label = "Steak Taco",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "steaktaco.png",
		}
	},

	["silveringot"] = {
		label = "Silver Ingot",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silveringot.png",
		}
	},

	["steakquesadilla"] = {
		label = "Steak Quesadilla",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "steakquesadilla.png",
		}
	},

	["stripedbass"] = {
		label = "Striped Bass",
		weight = 1000,
		stack = true,
		close = true,
		description = "A Striped Bass",
		client = {
			image = "stripedbass.png",
		}
	},

	["killerwhale"] = {
		label = "Killer Whale",
		weight = 7000,
		stack = true,
		close = true,
		description = "This is a whole ass Shamu.",
		client = {
			image = "killerwhalemeat.png",
		}
	},

	["eelfish"] = {
		label = "Eel",
		weight = 4000,
		stack = true,
		close = true,
		description = "An eel.. pretty useless.",
		client = {
			image = "eelfish.png",
		}
	},

	["gholfish"] = {
		label = "Ghol",
		weight = 1000,
		stack = true,
		close = true,
		description = "A big Ghol",
		client = {
			image = "ghol-fish.png",
		}
	},

	["steakburrito"] = {
		label = "Steak Burrito",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "steakburrito.png",
		}
	},

	["emerald_ring"] = {
		label = "Emerald Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_ring.png",
		}
	},

	["uwugreenrareplush"] = {
		label = "Rare Green Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A rare green UwU plush",
		client = {
			image = "uwugreenrareplush.png",
		}
	},

	["unshapped_sulfur"] = {
		label = "Ushapped Sulfur",
		weight = 1000,
		stack = true,
		close = false,
		description = "unshapped_sulfur",
		client = {
			image = "unshapped_sulfur.png",
		}
	},

	["beeftaco"] = {
		label = "Beef Taco",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beeftaco.png",
		}
	},

	["wet_weed"] = {
		label = "Moist Weed",
		weight = 3000,
		stack = true,
		close = false,
		description = "Wet weed that needs to be treated!",
		client = {
			image = "wet_weed.png",
		}
	},

	["dicedtomatoes"] = {
		label = "Diced Tomatoes",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "dicedtomatoes.png",
		}
	},

	["diamond_earring"] = {
		label = "Diamond Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_earring.png",
		}
	},

	["weedplant_seedm"] = {
		label = "Male Weed Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "Male Weed Seed",
		client = {
			image = "weedplant_seed.png",
		}
	},

	["bauxite"] = {
		label = "Bauxite",
		weight = 1000,
		stack = true,
		close = false,
		description = "bauxite",
		client = {
			image = "bauxite.png",
		}
	},

	["beans"] = {
		label = "Beans",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beans.png",
		}
	},

	["diamond_earring_silver"] = {
		label = "Diamond Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_earring_silver.png",
		}
	},

	["chemicalvapor"] = {
		label = "Chemical Vapors",
		weight = 1500,
		stack = true,
		close = false,
		description = "High Pressure Chemical Vapors, Explosive!",
		client = {
			image = "chemicalvapor.png",
		}
	},

	["swordfish"] = {
		label = "Sword Fish",
		weight = 3000,
		stack = true,
		close = true,
		description = "This has a giant ass needle for a face.",
		client = {
			image = "swordfish.png",
		}
	},

	["gold_bar"] = {
		label = "Gold Bar",
		weight = 0,
		stack = true,
		close = false,
		description = "Gold Bar made from melted Gold ore",
		client = {
			image = "gold_bar.png",
		}
	},

	["uncut_diamond"] = {
		label = "Uncut Diamond",
		weight = 1000,
		stack = true,
		close = false,
		description = "uncut_diamond",
		client = {
			image = "uncut_diamond.png",
		}
	},

	["coke"] = {
		label = "Cocaine",
		weight = 1000,
		stack = true,
		close = false,
		description = "Processed cocaine",
		client = {
			image = "coke.png",
		}
	},

	["uwugreenplush"] = {
		label = "Green Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A green UwU plush",
		client = {
			image = "uwugreenplush.png",
		}
	},

	["thionyl_chloride"] = {
		label = "Thionyl Chloride",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "thionyl_chloride.png",
		}
	},

	["uwupurpleplush"] = {
		label = "Purple Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A purple UwU plush",
		client = {
			image = "uwupurpleplush.png",
		}
	},

	["prisonrock"] = {
		label = "Coarse Rock",
		weight = 1000,
		stack = true,
		close = false,
		description = "A very big coarse rock",
		client = {
			image = "prisonrock.png",
		}
	},

	["sapphire_necklace_silver"] = {
		label = "Sapphire Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_necklace_silver.png",
		}
	},

	["bottlemap"] = {
		label = "Treasure Bottle",
		weight = 1000,
		stack = false,
		close = true,
		description = "looks very old.",
		client = {
			image = "bottlemap.png",
		}
	},

	["unshapped_copper"] = {
		label = "Unshapped Copper",
		weight = 0,
		stack = true,
		close = false,
		description = "unshapped copper",
		client = {
			image = "unshapped_copper.png",
		}
	},

	["tostadashell"] = {
		label = "Tostada Shell",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tostadashell.png",
		}
	},

	["tuna-fish"] = {
		label = "Tuna",
		weight = 2000,
		stack = true,
		close = true,
		description = "Chicken of the sea, but fucking massive.",
		client = {
			image = "tuna-fish.png",
		}
	},

	["unwashed_iron"] = {
		label = "Unwashed Iron",
		weight = 0,
		stack = true,
		close = false,
		description = "unwashed iron",
		client = {
			image = "unwashed_iron.png",
		}
	},

	["porktaco"] = {
		label = "Pork Taco",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "porktaco.png",
		}
	},

	["prisonwine_fermented"] = {
		label = "Pruno",
		weight = 1000,
		stack = true,
		close = true,
		description = "This should give you a good buzz",
		client = {
			image = "prisonwine_fermented.png",
		}
	},

	["unwashed_sulfur"] = {
		label = "Unwashed Sulfur",
		weight = 1000,
		stack = true,
		close = false,
		description = "unwashed_sulfur",
		client = {
			image = "unwashed_sulfur.png",
		}
	},

	["unshapped_tin"] = {
		label = "Unshapped Tin",
		weight = 0,
		stack = true,
		close = false,
		description = "unshapped tin",
		client = {
			image = "unshapped_tin.png",
		}
	},

	["sapphire_ring"] = {
		label = "Sapphire Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_ring.png",
		}
	},

	["silverchain"] = {
		label = "Silver Chain",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silverchain.png",
		}
	},

	["chickenburrito"] = {
		label = "Chicken Burrito",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chickenburrito.png",
		}
	},

	["chickenquesadilla"] = {
		label = "Chicken Quesadilla",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chickenquesadilla.png",
		}
	},

	["treasuremap"] = {
		label = "Treasure Map",
		weight = 500,
		stack = false,
		close = true,
		description = "This could lead somewhere...",
		client = {
			image = "treasuremap.png",
		}
	},

	["miningdrill"] = {
		label = "Mining Drill",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "miningdrill.png",
		}
	},

	["tigershark"] = {
		label = "Tigershark",
		weight = 7000,
		stack = true,
		close = true,
		description = "There are bigger sharks but this is still impressive..",
		client = {
			image = "tigershark.png",
		}
	},

	["chicken"] = {
		label = "Chicken",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chicken.png",
		}
	},

	["emerald_earring"] = {
		label = "Emerald Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_earring.png",
		}
	},

	["emerald_necklace_silver"] = {
		label = "Emerald Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_necklace_silver.png",
		}
	},

	["cookedsteak"] = {
		label = "Cooked Steak",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cookedsteak.png",
		}
	},

	["unshapped_bauxite"] = {
		label = "Unshapped Bauxite",
		weight = 1000,
		stack = true,
		close = false,
		description = "unshapped_bauxite",
		client = {
			image = "unshapped_bauxite.png",
		}
	},

	["chickentostada"] = {
		label = "Chicken Tostada",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chickentostada.png",
		}
	},

	["catfish"] = {
		label = "Catfish",
		weight = 3000,
		stack = true,
		close = true,
		description = "A Catfish",
		client = {
			image = "catfish.png",
		}
	},

	["silverore"] = {
		label = "Silver Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Silver Ore",
		client = {
			image = "silverore.png",
		}
	},

	["weedplant_package"] = {
		label = "Suspicious Package",
		weight = 10000,
		stack = false,
		close = false,
		description = "Suspicious Package",
		client = {
			image = "weedplant_package.png",
		}
	},

	["cigs"] = {
		label = "cigs",
		weight = 0,
		stack = true,
		close = true,
		description = "You old fart...",
		client = {
			image = "cigs.png",
		}
	},

	["beeftostada"] = {
		label = "Beef Tostada",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beeftostada.png",
		}
	},

	["methtray"] = {
		label = "Meth Tray",
		weight = 200,
		stack = true,
		close = false,
		description = "make some meth",
		client = {
			image = "meth_tray.png",
		}
	},

	["aquamarine"] = {
		label = "Aquamarine",
		weight = 0,
		stack = true,
		close = false,
		description = "aquamarine",
		client = {
			image = "aquamarine.png",
		}
	},

	["ironore"] = {
		label = "Iron Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Iron, a base ore.",
		client = {
			image = "ironore.png",
		}
	},

	["unwashed_lead"] = {
		label = "Unwashed Lead",
		weight = 1000,
		stack = true,
		close = false,
		description = "unwashed_lead",
		client = {
			image = "unwashed_lead.png",
		}
	},

	["ruby_earring_silver"] = {
		label = "Ruby Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_earring_silver.png",
		}
	},

	["finescale"] = {
		label = "Fine Scale",
		weight = 200,
		stack = true,
		close = false,
		description = "Scale Used for Fine Powders and Materials.",
		client = {
			image = "finescale.png",
		}
	},

	["avocado"] = {
		label = "Avocado",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "avocado.png",
		}
	},

	["pro-reel"] = {
		label = "Pro Fishing Reel",
		weight = 1000,
		stack = false,
		close = true,
		description = "A professional fishing reel.",
		client = {
			image = "pro-reel.png",
		}
	},

	["captainskull"] = {
		label = "Captain Skull",
		weight = 4000,
		stack = true,
		close = false,
		description = "An old skull of a captain!",
		client = {
			image = "captainskull.png",
		}
	},

	["goldfish"] = {
		label = "Goldfish",
		weight = 2000,
		stack = true,
		close = true,
		description = "A Goldfish... I wonder how he got there...",
		client = {
			image = "goldfish.png",
		}
	},

	["steaktorta"] = {
		label = "Steak Torta",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "steaktorta.png",
		}
	},

	["goldpan"] = {
		label = "Gold Panning Tray",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "goldpan.png",
		}
	},

	["shreddedlettuce"] = {
		label = "Shredded Lettuce",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "shreddedlettuce.png",
		}
	},

	["can"] = {
		label = "Empty Can",
		weight = 10,
		stack = true,
		close = false,
		description = "An empty can, good for recycling",
		client = {
			image = "can.png",
		}
	},

	["copperore"] = {
		label = "Copper Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Copper, a base ore.",
		client = {
			image = "copperore.png",
		}
	},

	["mininglaser"] = {
		label = "Mining Laser",
		weight = 900,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "mininglaser.png",
		}
	},

	["unwashed_copper"] = {
		label = "Unwashed Copper",
		weight = 0,
		stack = true,
		close = false,
		description = "unwashed copper",
		client = {
			image = "unwashed_copper.png",
		}
	},

	["prisonjuice"] = {
		label = "Orange Juice",
		weight = 1000,
		stack = true,
		close = false,
		description = "Regular Orange Juice",
		client = {
			image = "prisonjuice.png",
		}
	},

	["prisonspoon"] = {
		label = "Spoon",
		weight = 1000,
		stack = true,
		close = false,
		description = "Cafeteria spoon",
		client = {
			image = "prisonspoon.png",
		}
	},

	["weedplant_packedweed"] = {
		label = "Packed Weed",
		weight = 100,
		stack = false,
		close = false,
		description = "Weed ready for sale",
		client = {
			image = "weedplant_weed.png",
		}
	},

	["silverearring"] = {
		label = "Silver Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_earring.png",
		}
	},

	["refriedbeans"] = {
		label = "Refried Beans",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "refriedbeans.png",
		}
	},

	["ruby_necklace_silver"] = {
		label = "Ruby Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_necklace_silver.png",
		}
	},

	["fishingrod2"] = {
		label = "Skilled Fishing Rod",
		weight = 5000,
		stack = false,
		close = true,
		description = "This rod is better than most, but not the best.",
		client = {
			image = "betterrod.png",
		}
	},

	["porktostada"] = {
		label = "Pork Tostada",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "porktostada.png",
		}
	},

	["prisonfarmseeds"] = {
		label = "Plant Seeds",
		weight = 1000,
		stack = true,
		close = false,
		description = "Seeds, water, nutrition and love make happy plants",
		client = {
			image = "prisonfarmseeds.png",
		}
	},

	["iron_bar"] = {
		label = "Iron Bar",
		weight = 0,
		stack = true,
		close = false,
		description = "Iron Bar made from melted Iron ore",
		client = {
			image = "iron_bar.png",
		}
	},

	["emerald_earring_silver"] = {
		label = "Emerald Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_earring_silver.png",
		}
	},

	["diamond_ring_silver"] = {
		label = "Diamond Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_ring_silver.png",
		}
	},

	["unshapped_iron"] = {
		label = "Unshapped Iron",
		weight = 0,
		stack = true,
		close = false,
		description = "unshapped iron",
		client = {
			image = "unshapped_iron.png",
		}
	},

	["ruby_unshapped"] = {
		label = "Ruby Unshapped",
		weight = 0,
		stack = true,
		close = false,
		description = "ruby unshapped",
		client = {
			image = "ruby_unshapped.png",
		}
	},

	["unwashed_stone"] = {
		label = "Unwashed Stone",
		weight = 0,
		stack = true,
		close = false,
		description = "unwashed stone",
		client = {
			image = "unwashed_stone.png",
		}
	},

	["ruby"] = {
		label = "Ruby",
		weight = 0,
		stack = true,
		close = false,
		description = "ruby",
		client = {
			image = "ruby.png",
		}
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 500,
		stack = true,
		close = true,
		description = "Some fine smelling buds.",
		client = {
			image = "marijuana.png",
		}
	},

	["shreddedcheese"] = {
		label = "Shredded Cheese",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "shreddedcheese.png",
		}
	},

	["sulfur_bar"] = {
		label = "Sulfur",
		weight = 1000,
		stack = true,
		close = false,
		description = "sulfurr",
		client = {
			image = "sulfur_bar.png",
		}
	},

	["cookedchicken"] = {
		label = "Cooked Chicken",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cookedchicken.png",
		}
	},

	["unshapped_gold"] = {
		label = "Unshapped Gold",
		weight = 0,
		stack = true,
		close = false,
		description = "unshapped gold",
		client = {
			image = "unshapped_gold.png",
		}
	},

	["sulfuric_acid"] = {
		label = "Sulfuric Acid",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "sulfuric_acid.png",
		}
	},

	["chemicals"] = {
		label = "Chemicals",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care...",
		client = {
			image = "chemicals.png",
		}
	},

	["steak"] = {
		label = "Steak",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "steak.png",
		}
	},

	["c4"] = {
		label = "C4",
		weight = 0,
		stack = true,
		close = false,
		description = "C4 For mining",
		client = {
			image = "weapon_stickybomb.png",
		}
	},

	["goldore"] = {
		label = "Gold Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "Gold Ore",
		client = {
			image = "goldore.png",
		}
	},

	["bluefish"] = {
		label = "Bluefish",
		weight = 1000,
		stack = true,
		close = true,
		description = "One fish two fish redfish...",
		client = {
			image = "bluefish.png",
		}
	},

	["weedplant_seedf"] = {
		label = "Female Weed Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "Female Weed Seed",
		client = {
			image = "weedplant_seed.png",
		}
	},

	["lsd"] = {
		label = "LSD",
		weight = 500,
		stack = true,
		close = false,
		description = "Lets get this party started!",
		client = {
			image = "lsd.png",
		}
	},

	["rainbowtrout"] = {
		label = "Rainbow Trout",
		weight = 1000,
		stack = true,
		close = true,
		description = "A colorful Trout",
		client = {
			image = "rainbow-trout.png",
		}
	},

	["cookedpork"] = {
		label = "Cooked Pork",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cookedpork.png",
		}
	},

	["diamond_necklace"] = {
		label = "Diamond Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_necklace.png",
		}
	},

	["tacoshell"] = {
		label = "Taco Shell",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tacoshell.png",
		}
	},

	["redfish"] = {
		label = "Redfish",
		weight = 2000,
		stack = true,
		close = true,
		description = "One fish two fish...",
		client = {
			image = "redfish.png",
		}
	},

	["unshapped_lead"] = {
		label = "Unshapped Lead",
		weight = 1000,
		stack = true,
		close = false,
		description = "Unshapped Lead",
		client = {
			image = "unshapped_lead.png",
		}
	},

	["stone"] = {
		label = "Stone",
		weight = 2000,
		stack = true,
		close = false,
		description = "Stone woo",
		client = {
			image = "stone.png",
		}
	},

	["groundbeef"] = {
		label = "Ground Beef",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "groundbeef.png",
		}
	},

	["treasurechest"] = {
		label = "Treasure Chest",
		weight = 5000,
		stack = false,
		close = true,
		description = "Ye, Treasure mighty.",
		client = {
			image = "treasurechest.png",
		}
	},

	["greenberyl_unshapped"] = {
		label = "Greenberyl Unshapped",
		weight = 0,
		stack = true,
		close = false,
		description = "greenberyl unshapped",
		client = {
			image = "greenberyl_unshapped.png",
		}
	},

	["uncut_sapphire"] = {
		label = "Uncut Sapphire",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Sapphire",
		client = {
			image = "uncut_sapphire.png",
		}
	},

	["prisonmeth"] = {
		label = "Crank",
		weight = 1000,
		stack = true,
		close = true,
		description = "Prison made meth of low quality.",
		client = {
			image = "prisonmeth.png",
		}
	},

	["ruby_earring"] = {
		label = "Ruby Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_earring.png",
		}
	},

	["stingraymeat"] = {
		label = "Stingray",
		weight = 2000,
		stack = true,
		close = true,
		description = "Stingray Meat",
		client = {
			image = "stingraymeat.png",
		}
	},

	["uncut_ruby"] = {
		label = "Uncut Ruby",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Ruby",
		client = {
			image = "uncut_ruby.png",
		}
	},

	["empty_watering_can"] = {
		label = "Empty Watering Can",
		weight = 500,
		stack = false,
		close = true,
		description = "Empty watering can",
		client = {
			image = "watering_can.png",
		}
	},

	["unwashed_gold"] = {
		label = "Unwashed Gold",
		weight = 0,
		stack = true,
		close = false,
		description = "unwashed gold",
		client = {
			image = "unwashed_gold.png",
		}
	},

	["largemouthbass"] = {
		label = "Largemouth Bass",
		weight = 3000,
		stack = true,
		close = true,
		description = "Fish for Fishing.",
		client = {
			image = "largemouthbass.png",
		}
	},

	["uwupinkrareplush"] = {
		label = "Rare Pink Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A rare pink UwU plush",
		client = {
			image = "uwupinkrareplush.png",
		}
	},

	["unwashed_bauxite"] = {
		label = "Unwashed Bauxite",
		weight = 1000,
		stack = true,
		close = false,
		description = "unwashed_bauxite",
		client = {
			image = "unwashed_bauxite.png",
		}
	},

	["diamond_necklace_silver"] = {
		label = "Diamond Necklace Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "diamond_necklace_silver.png",
		}
	},

	["unshapped_coal"] = {
		label = "Unshapped Coal",
		weight = 0,
		stack = true,
		close = false,
		description = "unshapped_coal",
		client = {
			image = "unshapped_coal.png",
		}
	},

	["sapphire"] = {
		label = "Sapphire",
		weight = 2000,
		stack = true,
		close = false,
		description = "Gems are truly, truly, truly outrageous.",
		client = {
			image = "sapphire.png",
		}
	},

	["full_watering_can"] = {
		label = "Full Watering Can",
		weight = 1000,
		stack = false,
		close = false,
		description = "Watering can filled with water for watering plants",
		client = {
			image = "watering_can.png",
		}
	},

	["chestkey"] = {
		label = "Key",
		weight = 1000,
		stack = true,
		close = true,
		description = "A gold key.",
		client = {
			image = "chestkey.png",
		}
	},

	["coal"] = {
		label = "Coal",
		weight = 0,
		stack = true,
		close = false,
		description = "coal",
		client = {
			image = "coal.png",
		}
	},

	["drillbit"] = {
		label = "Drill Bit",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "drillbit.png",
		}
	},

	["yellow-diamond"] = {
		label = "Canary Diamond",
		weight = 3000,
		stack = true,
		close = true,
		description = "Yellow is truly, truly, truly gorgeous..",
		client = {
			image = "yellow-diamond.png",
		}
	},

	["poppyresin"] = {
		label = "Poppy resin",
		weight = 2000,
		stack = true,
		close = false,
		description = "It sticks to your fingers when you handle it.",
		client = {
			image = "poppyresin.png",
		}
	},

	["trimming_scissors"] = {
		label = "Trimming Scissors",
		weight = 1500,
		stack = true,
		close = false,
		description = "Very Sharp Trimming Scissors",
		client = {
			image = "trimming_scissors.png",
		}
	},

	["cheesequesadilla"] = {
		label = "Cheese Quesadilla",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cheesequesadilla.png",
		}
	},

	["peppers"] = {
		label = "Peppers",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "peppers.png",
		}
	},

	["emerald_ring_silver"] = {
		label = "Emerald Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_ring_silver.png",
		}
	},

	["greenberyl"] = {
		label = "Green Beryl",
		weight = 0,
		stack = true,
		close = false,
		description = "greenberyl",
		client = {
			image = "greenberyl.png",
		}
	},

	["prisonbag"] = {
		label = "Plastic Bag",
		weight = 1000,
		stack = true,
		close = false,
		description = "A plastic bag",
		client = {
			image = "prisonbag.png",
		}
	},

	["methkey"] = {
		label = "Key A",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with \"Walter\" Engraved on the Back...",
		client = {
			image = "keya.png",
		}
	},

	["cookedbeef"] = {
		label = "Cooked Beef",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cookedbeef.png",
		}
	},

	["salmon"] = {
		label = "Salmon",
		weight = 2000,
		stack = true,
		close = true,
		description = "A Salmon Fish",
		client = {
			image = "salmon.png",
		}
	},

	["ruby_ring_silver"] = {
		label = "Ruby Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_ring_silver.png",
		}
	},

	["sapphire_ring_silver"] = {
		label = "Sapphire Ring Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_ring_silver.png",
		}
	},

	["uwublueplush"] = {
		label = "Blue Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A blue UwU plush",
		client = {
			image = "uwublueplush.png",
		}
	},

	["uwubrownplush"] = {
		label = "Brown Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A brown UwU plush",
		client = {
			image = "uwubrownplush.png",
		}
	},

	["sapphire_necklace"] = {
		label = "Sapphire Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_necklace.png",
		}
	},

	["prisonwateringcan"] = {
		label = "Watering Can",
		weight = 1000,
		stack = false,
		close = false,
		description = "Watering can with a Bolingbroke Penitentiary label.",
		client = {
			image = "prisonwateringcan.png",
		}
	},

	["tortillas"] = {
		label = "Tortillas",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tortillas.png",
		}
	},

	["copper_bar"] = {
		label = "Copper Bar",
		weight = 0,
		stack = true,
		close = false,
		description = "Copper Bar made from melted copper ore",
		client = {
			image = "copper_bar.png",
		}
	},

	["cocainekey"] = {
		label = "Key B",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with a \"Razorblade\" Engraved on the Back...",
		client = {
			image = "keyb.png",
		}
	},

	["veh_tint"] = {
		label = "Tints",
		weight = 1000,
		stack = true,
		close = true,
		description = "Install vehicle tint",
		client = {
			image = "veh_tint.png",
		}
	},

	["uwuyellowplush"] = {
		label = "Yellow Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A yellow UwU plush",
		client = {
			image = "uwuyellowplush.png",
		}
	},

	["hydrochloric_acid"] = {
		label = "Hydrochloric Acid",
		weight = 1500,
		stack = true,
		close = true,
		description = "Chemicals, handle with care!",
		client = {
			image = "hydrochloric_acid.png",
		}
	},

	["fishinglure"] = {
		label = "Fishing Lure",
		weight = 1000,
		stack = true,
		close = true,
		description = "A colorful lure",
		client = {
			image = "beginnerlure.png",
		}
	},

	["unwashed_tin"] = {
		label = "Unwashed Tin",
		weight = 0,
		stack = true,
		close = false,
		description = "unwashed tin",
		client = {
			image = "unwashed_tin.png",
		}
	},

	["pickaxe"] = {
		label = "Pickaxe",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pickaxe.png",
		}
	},

	["weedplant_weed"] = {
		label = "Dried Weed",
		weight = 100,
		stack = true,
		close = false,
		description = "Weed ready for packaging",
		client = {
			image = "weedplant_weed.png",
		}
	},

	["fishingrod3"] = {
		label = "Professional Rod",
		weight = 5000,
		stack = false,
		close = true,
		description = "S+ tier fishing rod!!",
		client = {
			image = "bestrod.png",
		}
	},

	["beefburrito"] = {
		label = "Beef Burrito",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beefburrito.png",
		}
	},

	["bakingsoda"] = {
		label = "Baking Soda",
		weight = 1500,
		stack = true,
		close = false,
		description = "Household Baking Soda!",
		client = {
			image = "bakingsoda.png",
		}
	},

	["coca_leaf"] = {
		label = "Cocaine leaves",
		weight = 1500,
		stack = true,
		close = false,
		description = "Cocaine leaves that must be processed !",
		client = {
			image = "coca_leaf.png",
		}
	},

	["prisonwine"] = {
		label = "Pruno Mix",
		weight = 1000,
		stack = true,
		close = false,
		description = "You should ferment this to get a good buzz",
		client = {
			image = "prisonwine.png",
		}
	},

	["silver_ring"] = {
		label = "Silver Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "silver_ring.png",
		}
	},

	["uncut_emerald"] = {
		label = "Uncut Emerald",
		weight = 100,
		stack = true,
		close = false,
		description = "A rough Emerald",
		client = {
			image = "uncut_emerald.png",
		}
	},

	["cheese"] = {
		label = "Cheese",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cheese.png",
		}
	},

	["prisonfarmnutrition"] = {
		label = "Plant Nutrition",
		weight = 1000,
		stack = true,
		close = false,
		description = "Plant nutrition with a Bolingbroke Penitentiary label",
		client = {
			image = "prisonfarmnutrition.png",
		}
	},

	["fishingrod"] = {
		label = "Fishing Rod",
		weight = 5000,
		stack = false,
		close = true,
		description = "A fishing rod for adventures with friends!!",
		client = {
			image = "fishingrod.png",
		}
	},

	["pork"] = {
		label = "Pork",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pork.png",
		}
	},

	["emerald_necklace"] = {
		label = "Emerald Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "emerald_necklace.png",
		}
	},

	["tin_bar"] = {
		label = "Tin Bar",
		weight = 0,
		stack = true,
		close = false,
		description = "Tin Bar made from melted Tin ore",
		client = {
			image = "tin_bar.png",
		}
	},

	["prisonslushie"] = {
		label = "Slushie",
		weight = 1000,
		stack = true,
		close = true,
		description = "Slushie",
		client = {
			image = "prisonslushie.png",
		}
	},

	["sapphire_earring_silver"] = {
		label = "Sapphire Earrings Silver",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "sapphire_earring_silver.png",
		}
	},

	["uwuredplush"] = {
		label = "Red Plush",
		weight = 200,
		stack = true,
		close = true,
		description = "A red UwU plush",
		client = {
			image = "uwuredplush.png",
		}
	},

	["prisonsugar"] = {
		label = "Sugar Pack",
		weight = 1000,
		stack = true,
		close = false,
		description = "Plain old sugar",
		client = {
			image = "prisonsugar.png",
		}
	},

	["gold_ring"] = {
		label = "Gold Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "gold_ring.png",
		}
	},

	["fishinglure2"] = {
		label = "Pro Fishing Lure",
		weight = 1000,
		stack = true,
		close = true,
		description = "A realistic lure",
		client = {
			image = "betterlure.png",
		}
	},

	["bottle"] = {
		label = "Empty Bottle",
		weight = 10,
		stack = true,
		close = false,
		description = "A glass bottle",
		client = {
			image = "bottle.png",
		}
	},

	["plant_tub"] = {
		label = "Plant Tub",
		weight = 1000,
		stack = true,
		close = false,
		description = "Pot for planting plants",
		client = {
			image = "plant_tub.png",
		}
	},

	["beefandbeanburrito"] = {
		label = "Beef and Bean Burrito",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beefandbeanburrito.png",
		}
	},

	["lead_ore"] = {
		label = "Lead Ore",
		weight = 1000,
		stack = true,
		close = false,
		description = "lead ore",
		client = {
			image = "lead_ore.png",
		}
	},

	["weedplant_branch"] = {
		label = "Weed Branch",
		weight = 10000,
		stack = false,
		close = false,
		description = "Weed plant",
		client = {
			image = "weedplant_branch.png",
		}
	},

	["goldearring"] = {
		label = "Golden Earrings",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "gold_earring.png",
		}
	},

	["beanandcheeseburrito"] = {
		label = "Bean and Cheese Burrito",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beanandcheeseburrito.png",
		}
	},

	["ruby_ring"] = {
		label = "Ruby Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_ring.png",
		}
	},

	["skill-reel"] = {
		label = "Skill Fishing Reel",
		weight = 1000,
		stack = false,
		close = true,
		description = "A skilled fishing reel.",
		client = {
			image = "skill-reel.png",
		}
	},

	["tacoseasoning"] = {
		label = "Taco Seasoning",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tacoseasoning.png",
		}
	},

	["keya"] = {
		label = "Labkey A",
		weight = 0,
		stack = false,
		close = false,
		description = "Labkey A..",
		client = {
			image = "keya.png",
		}
	},

	["fishingbait"] = {
		label = "Fish Bait",
		weight = 1000,
		stack = true,
		close = true,
		description = "Worm bait!",
		client = {
			image = "wormbait.png",
		}
	},

	["ruby_necklace"] = {
		label = "Ruby Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ruby_necklace.png",
		}
	},

	["heroin"] = {
		label = "Heroin",
		weight = 500,
		stack = true,
		close = false,
		description = "Really addictive depressant...",
		client = {
			image = "heroin.png",
		}
	},

	["lsa"] = {
		label = "LSA",
		weight = 500,
		stack = true,
		close = false,
		description = "Almost ready to party...",
		client = {
			image = "lsa.png",
		}
	},

	["prisonchemicals"] = {
		label = "Chemicals",
		weight = 1000,
		stack = true,
		close = false,
		description = "Some random chemicals",
		client = {
			image = "prisonchemicals.png",
		}
	},

	["porktorta"] = {
		label = "Pork Torta",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "porktorta.png",
		}
	},

	["ds_diamond"] = {
		label = "Diamond",
		weight = 0,
		stack = true,
		close = false,
		description = "iamond",
		client = {
			image = "ds_diamond.png",
		}
	},

	["prisonfruit"] = {
		label = "Fruit Mix",
		weight = 1000,
		stack = true,
		close = false,
		description = "A mix of random fruits",
		client = {
			image = "prisonfruit.png",
		}
	},

	["codfish"] = {
		label = "Cod",
		weight = 3000,
		stack = true,
		close = true,
		description = "A cody fish",
		client = {
			image = "codfish.png",
		}
	},

	["fish"] = {
		label = "Fish",
		weight = 1000,
		stack = true,
		close = false,
		description = "A Catfish",
		client = {
			image = "fish.png",
		}
	},

	["goldingot"] = {
		label = "Gold Ingot",
		weight = 1000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "goldingot.png",
		}
	},

	["emerald"] = {
		label = "Emerald",
		weight = 3000,
		stack = true,
		close = false,
		description = "Emerald",
		client = {
			image = "emerald.png",
		}
	},

	["weedkey"] = {
		label = "Key C",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with a \"Seed\" Engraved on the Back...",
		client = {
			image = "keyc.png",
		}
	},

	["tacocrate"] = {
		label = "Taco Crate",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tacocrate.png",
		}
	},

	["clothing_bag"] = {
		label = "Clothing Bag",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "clothing_bag.png",
		}
	},
}