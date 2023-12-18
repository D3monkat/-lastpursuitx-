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
  
  	["crisps"] = {
  		label = "Crisps",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 30,
  			},
  			image = "chips.png",
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
  
  	["rimjob"] = {
  		label = "Rim Job",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "BurgerShot Donut",
  		client = {
  			status = {
  				hunger = 45,
  			},
  			image = "burger-rimjob.png",
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
  
  	["tripleburger"] = {
  		label = "The Triple Burger",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 22,
  			},
  			image = "tripleburger.png",
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
  
  	["drug_ecstasy"] = {
  		label = "Ecstasy",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["gummy_zkittlez_cbd"] = {
  		label = "CBD Zkittlez Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd zkittlez gummy bear!",
  		client = {
  			image = "gummy_zkittlez_cbd.png",
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
  
  	["weed_ak47_cbd_joint"] = {
  		label = "CBD AK 47 Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that ak47 son!",
  		client = {
  			image = "weed_ak47_cbd_joint.png",
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
  
  	["lighter"] = {
  		label = "Lighter",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "A lighter, everybody has to have one of these on hand!",
  		client = {
  			image = "lighter.png",
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
  
  	["weed_skunk_cbd_joint"] = {
  		label = "CBD Skunk Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that skunk son!",
  		client = {
  			image = "weed_skunk_cbd_joint.png",
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
  
  	["ecocoffee"] = {
  		label = "The Eco-ffee",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 24,
  			},
  			image = "ecoffee.png",
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
  
  	["flusher"] = {
  		label = "The Flusher",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 22,
  			},
  			image = "flusher.png",
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
  
  	["weed_gelato_cbd"] = {
  		label = "CBD Gelato 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD Gelato!",
  		client = {
  			image = "weed_gelato_cbd.png",
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
  
  	["weed_zkittlez_cbd_crop"] = {
  		label = "CBD Zkittlez Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD Zkittlez!",
  		client = {
  			image = "weed_zkittlez_cbd_crop.png",
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
  
  	["weed_ak47_cbd_crop"] = {
  		label = "CBD AK 47 Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD AK47!",
  		client = {
  			image = "weed_ak47_cbd_crop.png",
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
  
  	["catcoffee"] = {
  		label = "Cat Coffee",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 28,
  			},
  			image = "catcoffee.png",
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
  
  	["hunksohen"] = {
  		label = "Hunk o Hen",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 29,
  			},
  			image = "chickenthighs.png",
  		}
  	},
  
  	["weed_amnesia_cbd"] = {
  		label = "CBD Amnesia 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD Amnesia!",
  		client = {
  			image = "weed_amnesia_cbd.png",
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
  
  	["caffeagra"] = {
  		label = "Caffeagra",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 23,
  			},
  			image = "caffeagra.png",
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
  
  	["shotrings"] = {
  		label = "Ring Shots",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "Burgershot Onion Rings",
  		client = {
  			status = {
  				hunger = 50,
  			},
  			image = "burger-shotrings.png",
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
  
  	["WEAPON_FADEBFKNIFE"] = {
  		label = "Fade Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Fade Butterfly Knife",
  		client = {
  			image = "WEAPON_FADEBFKNIFE",
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
  
  	["gummybearmould"] = {
  		label = "Gummy Bear Mould",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "A BPA free mould, shaped like a bear!",
  		client = {
  			image = "gummybearmould.png",
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
  
  	["weed_zkittlez_cbd_joint"] = {
  		label = "CBD Zkittlez Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that zkittlez son!",
  		client = {
  			image = "weed_zkittlez_cbd_joint.png",
  		}
  	},
  
  	["weed_og-kush_cbd_crop"] = {
  		label = "CBD OG Kush Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD OG Kush",
  		client = {
  			image = "weed_og-kush_cbd_crop.png",
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
  
  	["tomato"] = {
  		label = "Tomato",
  		weight = 1,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			image = "tomato.png",
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
  
  	["WEAPON_FLIPKNIFE"] = {
  		label = "Flip Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Flip Knife",
  		client = {
  			image = "WEAPON_FLIPKNIFE",
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
  
  	["blueberry"] = {
  		label = "Blueberry",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 43,
  			},
  			image = "blueberry.png",
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
  				hunger = 25,
  			},
  			image = "atomfries.png",
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
  				hunger = 22,
  			},
  			image = "eggbene.png",
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
  
  	["wwmenu"] = {
  		label = "White Widow Menu",
  		weight = 10,
  		stack = true,
  		close = true,
  		description = "A menu for the white widoe medical dispensary!",
  		client = {
  			image = "wwmenu.png",
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
  
  	["gummy_skunk_cbd"] = {
  		label = "CBD Skunk Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd skunk gummy bear!",
  		client = {
  			image = "gummy_skunk_cbd.png",
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
  				hunger = 23,
  			},
  			image = "pickleburger.png",
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
  
  	["WEAPON_GUTKNIFE"] = {
  		label = "Gut Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Gut Knife.",
  		client = {
  			image = "WEAPON_GUTKNIFE.png",
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
  
  	["ecola"] = {
  		label = "eCola",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 24,
  			},
  			image = "ecola.png",
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
  
  	["cheesecake"] = {
  		label = "Cheese Cake",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 21,
  			},
  			image = "cheesecake.png",
  		}
  	},
  
  	["weed_gelato_cbd_crop"] = {
  		label = "CBD Gelato Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD Gelato!",
  		client = {
  			image = "weed_gelato_cbd_crop.png",
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
  
  	["hornburger"] = {
  		label = "HornBurger",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 28,
  			},
  			image = "hornburger.png",
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
  
  	["gazpacho"] = {
  		label = "Guzpacho",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 25,
  			},
  			image = "gazpacho.png",
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
  
  	["gelatine"] = {
  		label = "Gelatine",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "A packet of gelatine, good for making sweets!",
  		client = {
  			image = "gelatine.png",
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
  
  	["sprunklight"] = {
  		label = "Sprunk Light",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 25,
  			},
  			image = "sprunklight.png",
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
  
  	["junkdrink"] = {
  		label = "Junk",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 22,
  			},
  			image = "junkdrink.png",
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
  
  	["gummy_purple-haze_cbd"] = {
  		label = "CBD Purple-Haze Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd purple haze gummy bear!",
  		client = {
  			image = "gummy_purple-haze_cbd.png",
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
  				hunger = 50,
  			},
  			image = "flour.png",
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
  
  	["pancake"] = {
  		label = "PawCake",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 48,
  			},
  			image = "pawcakes.png",
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
  
  	["WEAPON_BFKNIFE"] = {
  		label = "Vanilla Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Vanilla Butterfly Knife",
  		client = {
  			image = "WEAPON_BFKNIFE",
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
  
  	["weed_purple-haze_cbd_joint"] = {
  		label = "CBD Purple-Haze Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that purple haze son!",
  		client = {
  			image = "weed_purple-haze_cbd_joint.png",
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
  
  	["rice"] = {
  		label = "Bowl of Rice",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 47,
  			},
  			image = "rice.png",
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
  
  	["shotfries"] = {
  		label = "Shot Fries",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "Shot Fries",
  		client = {
  			status = {
  				hunger = 41,
  			},
  			image = "burger-fries.png",
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
  
  	["hornbreakfast"] = {
  		label = "Hornys Breakfast",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 29,
  			},
  			image = "bangers.png",
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
  
  	["bleeder"] = {
  		label = "The Bleeder",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "The Bleeder",
  		client = {
  			status = {
  				hunger = 44,
  			},
  			image = "burger-bleeder.png",
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
  
  	["milk"] = {
  		label = "Milk",
  		weight = 500,
  		stack = true,
  		close = true,
  		description = "Carton of Milk",
  		client = {
  			status = {
  				thirst = 50,
  			},
  			image = "burger-milk.png",
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
  
  	["beandonut"] = {
  		label = "Donut",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 28,
  			},
  			image = "popdonut.png",
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
  
  	["weed_purple-haze_cbd"] = {
  		label = "CBD Purple-Haze 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD Purple-Haze!",
  		client = {
  			image = "weed_purple-haze_cbd.png",
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
  
  	["boba"] = {
  		label = "Boba",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 42,
  			},
  			image = "boba.png",
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
  
  	["omochi"] = {
  		label = "Orange Mochi",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 46,
  			},
  			image = "mochiorange.png",
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
  				hunger = 44,
  			},
  			image = "mochipink.png",
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
  
  	["atomsoda"] = {
  		label = "Atom Soda",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 28,
  			},
  			image = "atomsoda.png",
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
  
  	["bobatea"] = {
  		label = "Boba Tea",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 41,
  			},
  			image = "bubbletea.png",
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
  
  	["moneyshot"] = {
  		label = "Money Shot",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "Money Shot",
  		client = {
  			status = {
  				hunger = 50,
  			},
  			image = "burger-moneyshot.png",
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
  
  	["empty_weed_bag"] = {
  		label = "Resealable Bag",
  		weight = 1,
  		stack = true,
  		close = true,
  		description = "A small empty bag",
  		client = {
  			image = "empty_weed_bag.png",
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
  
  	["chocolate"] = {
  		label = "Chocolate",
  		weight = 200,
  		stack = true,
  		close = false,
  		description = "Chocolate Bar",
  		client = {
  			status = {
  				hunger = 17,
  			},
  			image = "chocolate.png",
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
  				hunger = 41,
  			},
  			image = "miso.png",
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
  
  	["weed_purple-haze_cbd_crop"] = {
  		label = "CBD Purple-Haze Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD Purple-Haze!",
  		client = {
  			image = "weed_purple-haze_cbd_crop.png",
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
  
  	["drug_lean"] = {
  		label = "Lean",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
  		}
  	},
  
  	["weed_skunk_cbd"] = {
  		label = "CBD Skunk 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD Skunk!",
  		client = {
  			image = "weed_skunk_cbd.png",
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
  
  	["weed_og-kush_cbd"] = {
  		label = "CBD OGKush 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD OG Kush!",
  		client = {
  			image = "weed_og-kush_cbd.png",
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
  
  	["tofu"] = {
  		label = "Tofu",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 48,
  			},
  			image = "tofu.png",
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
  
  	["weed_amnesia_cbd_joint"] = {
  		label = "CBD Amnesia Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that amnesia son!",
  		client = {
  			image = "weed_amnesia_cbd_joint.png",
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
  
  	["weed_zkittlez_cbd"] = {
  		label = "CBD Zkittles 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD Zkittlez!",
  		client = {
  			image = "weed_zkittlez_cbd.png",
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
  
  	["sodium_hydroxide"] = {
  		label = "Sodium Hydroxide",
  		weight = 1500,
  		stack = true,
  		close = true,
  		description = "Chemicals, handle with care!",
  		client = {
  			image = "sodium_hydroxide.png",
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
  				thirst = 49,
  			},
  			image = "bubbleteagreen.png",
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
  				thirst = 26,
  			},
  			image = "gunkaccino.png",
  		}
  	},
  
  	["cannabis"] = {
  		label = "Cannabis",
  		weight = 2500,
  		stack = true,
  		close = true,
  		description = "Uncured cannabis",
  		client = {
  			image = "cannabis.png",
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
  
  	["WEAPON_FORESTBFKNIFE"] = {
  		label = "Forest Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Forest Butterfly Knife.",
  		client = {
  			image = "WEAPON_FORESTBFKNIFE.png",
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
  
  	["chillidog"] = {
  		label = "Footlong Chili Dog",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 21,
  			},
  			image = "chillidog.png",
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
  
  	["purrito"] = {
  		label = "Purrito",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 40,
  			},
  			image = "purrito.png",
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
  
  	["WEAPON_PERFORATOR"] = {
  		label = "The Perforator",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "PERFORATOR.",
  		client = {
  			image = "PERFORATOR.png",
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
  
  	["chickentaco"] = {
  		label = "Chicken Taco",
  		weight = 1,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			image = "chickentaco.png",
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
  
  	["WEAPON_KARAMBITKNIFE"] = {
  		label = "Karamabit Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Karamabit Knife.",
  		client = {
  			image = "WEAPON_KARAMBITKNIFE.png",
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
  
  	["highnoon"] = {
  		label = "Highnoon",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 22,
  			},
  			image = "highnoon.png",
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
  
  	["pbobatea"] = {
  		label = "Pink Boba Tea",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 45,
  			},
  			image = "bubbleteapink.png",
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
  
  	["drug_shears"] = {
  		label = "Trimming Shears",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "A set of high quality trimming shears.",
  		client = {
  			image = "drug_shears.png",
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
  
  	["gummy_white-widow_cbd"] = {
  		label = "CBD White-Widow Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd white widow gummy bear!",
  		client = {
  			image = "gummy_white-widow_cbd.png",
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
  				hunger = 25,
  			},
  			image = "baconburger.png",
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
  
  	["strawberry"] = {
  		label = "Strawberry",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 40,
  			},
  			image = "strawberry.png",
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
  
  	["pseudoefedrine"] = {
  		label = "Pseudoefedrine",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["weed_white-widow_cbd"] = {
  		label = "CBD White Widow 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD White Widow!",
  		client = {
  			image = "weed_white-widow_cbd.png",
  		}
  	},
  
  	["rollingpapers"] = {
  		label = "Rolling Papers",
  		weight = 50,
  		stack = true,
  		close = true,
  		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
  		client = {
  			image = "rollingpapers.png",
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
  
  	["shotnuggets"] = {
  		label = "Shot Nuggets",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "Burgershot Nuggets",
  		client = {
  			status = {
  				hunger = 40,
  			},
  			image = "burger-shotnuggets.png",
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
  
  	["raine"] = {
  		label = "Raine",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 26,
  			},
  			image = "raine.png",
  		}
  	},
  
  	["WEAPON_SLAUGHTERBFKNIFE"] = {
  		label = "Slaughter Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Slaughter Butterfly Knife.",
  		client = {
  			image = "WEAPON_SLAUGHTERBFKNIFE.png",
  		}
  	},
  
  	["diamond"] = {
  		label = "Diamond",
  		weight = 3000,
  		stack = true,
  		close = false,
  		description = "Shiny Diamond",
  		client = {
  			image = "diamond.png",
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
  				hunger = 47,
  			},
  			image = "catcookie.png",
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
  
  	["chickenwrap"] = {
  		label = "BS Goat Cheese Wrap",
  		weight = 150,
  		stack = true,
  		close = true,
  		description = "BurgerShot Goat Cheese Wrap",
  		client = {
  			status = {
  				hunger = 41,
  			},
  			image = "burger-goatwrap.png",
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
  
  	["creamyshake"] = {
  		label = "Extra Creamy Jumbo Shake",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 29,
  			},
  			image = "atomshake.png",
  		}
  	},
  
  	["weed_amnesia_cbd_crop"] = {
  		label = "CBD Amnesia Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD Amnesia!",
  		client = {
  			image = "weed_amnesia_cbd_crop.png",
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
  
  	["WEAPON_STAINEDRBFKNIFE"] = {
  		label = "Stained Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Stained Butterfly Knife.",
  		client = {
  			image = "WEAPON_STAINEDRBFKNIFE.png",
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
  
  	["weed_og-kush_cbd_joint"] = {
  		label = "CBD OG Kush Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that og kush son!",
  		client = {
  			image = "weed_og-kush_cbd_joint.png",
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
  
  	["sake"] = {
  		label = "Sake",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 44,
  			},
  			image = "sake.png",
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
  
  	["watermelon"] = {
  		label = "WaterMelon Slice",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 27,
  				thirst = 24,
  			},
  			image = "watermelon.png",
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
  
  	["gummy_og-kush_cbd"] = {
  		label = "CBD OG-Kush Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd og kush gummy bear!",
  		client = {
  			image = "gummy_og-kush_cbd.png",
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
  
  	["chickenhorn"] = {
  		label = "Chicken Hornstars",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 30,
  			},
  			image = "chickhornstars.png",
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
  
  	["opium"] = {
  		label = "Opium",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["coke_small_brick"] = {
  		label = "Coke Package",
  		weight = 350,
  		stack = true,
  		close = true,
  		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
  		client = {
  			image = "coke_small_brick.png",
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
  
  	["WEAPON_CRIMSONBFKNIFE"] = {
  		label = "Crimson Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Crimson Butterfly Knife",
  		client = {
  			image = "WEAPON_CRIMSONBFKNIFE",
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
  				hunger = 50,
  			},
  			image = "catrice.png",
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
  
  	["enchiladas"] = {
  		label = "Breakfast Enchiladas",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 26,
  			},
  			image = "enchi.png",
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
  
  	["ramen"] = {
  		label = "Bowl of Ramen",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 48,
  			},
  			image = "ramen.png",
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
  
  	["oxygen"] = {
  		label = "Oxygen",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["icecone"] = {
  		label = "Ice Cone",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 22,
  			},
  			image = "cone.png",
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
  
  	["pickle"] = {
  		label = "Pickle",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "A jar of Pickles",
  		client = {
  			status = {
  				hunger = 50,
  			},
  			image = "pickle.png",
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
  
  	["gummy_amnesia_cbd"] = {
  		label = "CBD Amnesia Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd og kush gummy bear!",
  		client = {
  			image = "gummy_amnesia_cbd.png",
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
  				hunger = 26,
  			},
  			image = "chickensalad.png",
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
  
  	["orangotang"] = {
  		label = "Bacon",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 20,
  			},
  			image = "orangotang.png",
  		}
  	},
  
  	["rawhoney"] = {
  		label = "Raw Honey",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "A jar of rawhoney, good for making sweets!",
  		client = {
  			image = "rawhoney.png",
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
  
  	["baconcheesemelt"] = {
  		label = "Bacon-Triple Cheese Melt",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 30,
  			},
  			image = "baconcheesemelt.png",
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
  
  	["weed_gelato_cbd_joint"] = {
  		label = "CBD Gelato Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that gelato son!",
  		client = {
  			image = "weed_gelato_cbd_joint.png",
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
  
  	["ceramic"] = {
  		label = "ceramic",
  		weight = 100,
  		stack = true,
  		close = false,
  		description = "you can probably use this for something",
  		client = {
  			image = "ceramic.png",
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
  
  	["cakepop"] = {
  		label = "Cat Cake-Pop",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 48,
  			},
  			image = "cakepop.png",
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
  
  	["chickenfillet"] = {
  		label = "Chicken Fillets",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 21,
  			},
  			image = "chickenbreasts.png",
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
  
  	["gmochi"] = {
  		label = "Green Mochi",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 45,
  			},
  			image = "mochigreen.png",
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
  
  	["goldchain"] = {
  		label = "Golden Chain",
  		weight = 200,
  		stack = true,
  		close = false,
  		description = "",
  		client = {
  			image = "goldchain.png",
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
  
  	["codeine"] = {
  		label = "Codeine",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  				hunger = 26,
  			},
  			image = "frenchbacon.png",
  		}
  	},
  
  	["WEAPON_HUNTSMANKNIFE"] = {
  		label = "Huntsman Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Huntsman Knife.",
  		client = {
  			image = "WEAPON_HUNTSMANKNIFE.png",
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
  
  	["liquid_sulfur"] = {
  		label = "Liquid Sulfur",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["sugar"] = {
  		label = "Sugar",
  		weight = 100,
  		stack = true,
  		close = false,
  		description = "",
  		client = {
  			status = {
  				hunger = 15,
  			},
  			image = "sugar.png",
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
  				hunger = 25,
  			},
  			image = "icenugget.png",
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
  
  	["baconroll"] = {
  		label = "Bacon Roll",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 28,
  			},
  			image = "baconroll.png",
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
  
  	["diamond_ring"] = {
  		label = "Diamond Ring",
  		weight = 200,
  		stack = true,
  		close = false,
  		description = "",
  		client = {
  			image = "diamond_ring.png",
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
  
  	["WEAPON_SAFARIBFKNIFE"] = {
  		label = "Safari Mesh Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Safari Mesh Butterfly Knife.",
  		client = {
  			image = "WEAPON_SAFARIBFKNIFE.png",
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
  
  	["ecolalight"] = {
  		label = "eCola Light",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 23,
  			},
  			image = "ecolalight.png",
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
  
  	["drug_lsd"] = {
  		label = "LSD",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["weed_ak47_cbd"] = {
  		label = "CBD AK47 2g",
  		weight = 2,
  		stack = true,
  		close = false,
  		description = "A 2g bag of CBD AK47!",
  		client = {
  			image = "weed_ak47_cbd.png",
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
  
  	["cheesewrap"] = {
  		label = "BS Cheese Wrap",
  		weight = 150,
  		stack = true,
  		close = true,
  		description = "BurgerShot Cheese Wrap",
  		client = {
  			status = {
  				hunger = 46,
  			},
  			image = "burger-chickenwrap.png",
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
  
  	["nekodonut"] = {
  		label = "Neko Donut",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 48,
  			},
  			image = "catdonut.png",
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
  				thirst = 37,
  			},
  			image = "burger-coffee.png",
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
  
  	["icecake"] = {
  		label = "Ice Cream Cake",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 24,
  			},
  			image = "icecake.png",
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
  
  	["milkshake"] = {
  		label = "Milkshake",
  		weight = 500,
  		stack = true,
  		close = true,
  		description = "BurgerShot Milkshake",
  		client = {
  			status = {
  				thirst = 38,
  			},
  			image = "burger-milkshake.png",
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
  
  	["hydrogen"] = {
  		label = "Hydrogen",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  				hunger = 25,
  			},
  			image = "chickensandwich.png",
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
  
  	["pizza"] = {
  		label = "Kitty Pizza",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 46,
  			},
  			image = "catpizza.png",
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
  
  	["drink_sprite"] = {
  		label = "Sprite",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["weed_skunk_cbd_crop"] = {
  		label = "CBD Skunk Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD Skunk!",
  		client = {
  			image = "weed_skunk_cbd_crop.png",
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
  
  	["bratte"] = {
  		label = "The Bratte",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 29,
  			},
  			image = "bratte.png",
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
  
  	["sprunk"] = {
  		label = "Sprunk",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 23,
  			},
  			image = "sprunk.png",
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
  
  	["gummy_ak47_cbd"] = {
  		label = "CBD AK47 Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd ak47 gummy bear!",
  		client = {
  			image = "gummy_ak47_cbd.png",
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
  
  	["WEAPON_BLUEBFKNIFE"] = {
  		label = "Blue Steel Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Blue Steel Butterfly Knife",
  		client = {
  			image = "WEAPON_BLUEBFKNIFE",
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
  
  	["creampie"] = {
  		label = "Creampie",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "BurgerShot Apple Pie",
  		client = {
  			status = {
  				hunger = 45,
  			},
  			image = "burger-creampie.png",
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
  
  	["speedball"] = {
  		label = "The SpeedBall",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 27,
  			},
  			image = "speedball.png",
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
  
  	["lettuce"] = {
  		label = "Head of Lettuce",
  		weight = 1,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			image = "lettuce.png",
  		}
  	},
  
  	["weed_white-widow_cbd_joint"] = {
  		label = "CBD White Widow Joint",
  		weight = 1,
  		stack = true,
  		close = false,
  		description = "Light up that white widow son!",
  		client = {
  			image = "weed_white-widow_cbd_joint.png",
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
  				hunger = 25,
  			},
  			image = "chickenburger.png",
  		}
  	},
  
  	["gummy_gelato_cbd"] = {
  		label = "CBD Gelato Gummy",
  		weight = 4,
  		stack = true,
  		close = true,
  		description = "A edible cbd gelato gummy bear!",
  		client = {
  			image = "gummy_gelato_cbd.png",
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
  				thirst = 50,
  			},
  			image = "burger-softdrink.png",
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
  
  	["WEAPON_CHBFKNIFE"] = {
  		label = "Case Hardened Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Case Hardened Butterfly Knife",
  		client = {
  			image = "WEAPON_CHBFKNIFE",
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
  				hunger = 26,
  			},
  			image = "sausage.png",
  		}
  	},
  
  	["drug_grinder"] = {
  		label = "Tobacco Grinder",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "A tobacco grinder or something more..",
  		client = {
  			image = "drug_grinder.png",
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
  
  	["frenchtoast"] = {
  		label = "French Toast",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 23,
  			},
  			image = "frenchtoast.png",
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
  
  	["bento"] = {
  		label = "Bento Box",
  		weight = 500,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 50,
  			},
  			image = "bento.png",
  		}
  	},
  
  	["dblchickenhornburger"] = {
  		label = "DBL Chicken HornBurger",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 21,
  			},
  			image = "dblchickenburger.png",
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
  
  	["weed_white-widow_cbd_crop"] = {
  		label = "CBD White Widow Crop",
  		weight = 1200,
  		stack = true,
  		close = false,
  		description = "A crop of CBD White Widow",
  		client = {
  			image = "weed_white-widow_cbd_crop.png",
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
  
  	["obobatea"] = {
  		label = "Orange Boba Tea",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 42,
  			},
  			image = "bubbleteaorange.png",
  		}
  	},
  
  	["carbon"] = {
  		label = "Carbon",
  		weight = 1000,
  		stack = true,
  		close = false,
  		description = "Carbon, a base ore.",
  		client = {
  			image = "carbon.png",
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
  
  	["bbobatea"] = {
  		label = "Blue Boba Tea",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 48,
  			},
  			image = "bubbleteablue.png",
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
  
  	["nekolatte"] = {
  		label = "Neko Latte",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				thirst = 26,
  			},
  			image = "latte.png",
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
  				hunger = 41,
  			},
  			image = "burger-meatfree.png",
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
  
  	["breadslice"] = {
  		label = "Slice of Bread",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 15,
  			},
  			image = "breadslice.png",
  		}
  	},
  
  	["WEAPON_URBANRBFKNIFE"] = {
  		label = "Urban Masked Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Urban Masked Butterfly Knife",
  		client = {
  			image = "WEAPON_URBANRBFKNIFE.png",
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
  
  	["red_sulfur"] = {
  		label = "Red Sulfur",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["baconeggtoast"] = {
  		label = "Bacon & Egg on Toast",
  		weight = 100,
  		stack = true,
  		close = true,
  		description = "",
  		client = {
  			status = {
  				hunger = 24,
  			},
  			image = "baconegg.png",
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
  				hunger = 28,
  			},
  			image = "dblhornburger.png",
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
  
  	["muriatic_acid"] = {
  		label = "Muriatic Acid",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["heartstopper"] = {
  		label = "HeartStopper",
  		weight = 200,
  		stack = true,
  		close = true,
  		description = "Heartstopper",
  		client = {
  			status = {
  				hunger = 52,
  			},
  			image = "burger-heartstopper.png",
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
  
  	["atmrope"] = {
  		label = "Steel lined rope",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["nitrogen"] = {
  		label = "Nitrogen",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
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
  
  	["WEAPON_SCORCHEDBFKNIFE"] = {
  		label = "Scorched Butterfly Knife",
  		weight = 1000,
  		stack = false,
  		close = true,
  		description = "Scorched Butterfly Knife.",
  		client = {
  			image = "WEAPON_SCORCHEDBFKNIFE.png",
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
  
  	["meth"] = {
  		label = "Meth",
  		weight = 500,
  		stack = true,
  		close = false,
  		description = "Really addictive stimulant...",
  		client = {
  			image = "meth.png",
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
  
  	["green_gelato_cannabis"] = {
  		label = "Green Gelato Cannabis",
  		weight = 500,
  		stack = true,
  		close = false,
  		client = {
  			image = "your_image.png",
  		}
  	},
    ['forceps'] = {
      label = 'forceps',
      weight = 8,
      stack = true,
      close = true,
      description = 'Forceps for medical',
      },
	  ['gauze'] = {
		label = 'gauze',
		weight = 6,
		stack = true,
		close = true,
		description = 'Gauze',
		},
		['pill'] = {
		  label = 'pill',
		  weight = 6,
		  stack = true,
		  close = true,
		  description = 'pill',
		  },
		  ['surgical-gloves'] = {
			label = 'surgical-gloves',
			weight = 6,
			stack = true,
			close = true,
			description = 'surgical-gloves',
			},
			['surgical-staple'] = {
			  label = 'surgical-staple',
			  weight = 6,
			  stack = true,
			  close = true,
			  description = 'surgical-staple',
			  },
			  ['syringe'] = {
				label = 'syringe',
				weight = 6,
				stack = true,
				close = true,
				description = 'syringe',
				},
				['tape'] = {
				  label = 'tape',
				  weight = 6,
				  stack = true,
				  close = true,
				  description = 'tape',
				  },
				  ['iodine'] = {
					label = 'iodine',
					weight = 6,
					stack = true,
					close = true,
					description = 'iodine',
					},

	["key1"] = {
		label = "Casino Key 1",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "key1.png",
		}
	},

	["artlamp"] = {
		label = "Art Lamp",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanNecklace.png",
		}
	},

	["armored_cat"] = {
		label = "Armored Cat",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "armored_cat.png",
		}
	},

	["paintingj"] = {
		label = "Painting D",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "paintingj.png",
		}
	},

	["questing_mouse"] = {
		label = "Quest Mouse",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "questing_mouse.png",
		}
	},

	["hollow_knight"] = {
		label = "Hollow Knight",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "hollow_knight.png",
		}
	},

	["scrap2"] = {
		label = "Scrap M",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["arthorse"] = {
		label = "Art Horse",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanNecklace.png",
		}
	},

	["fox"] = {
		label = "Fox",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "fox.png",
		}
	},

	["bolt_cutter"] = {
		label = "Bolt Cutter",
		weight = 100,
		stack = false,
		close = true,
		description = "0x0x",
		client = {
			image = "weapon_stickybomb.png",
		}
	},

	["gold"] = {
		label = "Gold Bar",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["scrap"] = {
		label = "Scrap L",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["gasmask"] = {
		label = "gasmask",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "gasmask.png",
		}
	},

	["buttercup"] = {
		label = "Buttercup",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "buttercup.png",
		}
	},

	["hack_usb"] = {
		label = "Hack USB",
		weight = 100,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["dino_student"] = {
		label = "Dino",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "dino_student.png",
		}
	},

	["necklace"] = {
		label = "Necklace",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["vanbottle"] = {
		label = "vanBottle",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanBottle.png",
		}
	},

	["paintingg"] = {
		label = "Painting A",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "paintingg.png",
		}
	},

	["knight_cat"] = {
		label = "Knight Cat",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "knight_cat.png",
		}
	},

	["paintingh"] = {
		label = "Painting C",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "paintingh.png",
		}
	},

	["vanpanther"] = {
		label = "vanPanther",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanPanther.png",
		}
	},

	["pig_angel"] = {
		label = "Angel Pig",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "pig_angel.png",
		}
	},

	["videorecord"] = {
		label = "Video Record",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "key1.png",
		}
	},

	["bubbles"] = {
		label = "Bubbles",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "bubbles.png",
		}
	},

	["paintingf"] = {
		label = "Painting B",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "paintingf.png",
		}
	},

	["blowtorch"] = {
		label = "blowtorch",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["vandiamond"] = {
		label = "vanDiamond",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanDiamond.png",
		}
	},

	["vanpogo"] = {
		label = "vanPogo",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanPogo.png",
		}
	},

	["vannecklace"] = {
		label = "vanNecklace",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanNecklace.png",
		}
	},

	["mickey_mouse"] = {
		label = "Mickey Mouse",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "mickey_mouse.png",
		}
	},

	["coke_pooch"] = {
		label = "Coke Pooch",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["pogo"] = {
		label = "Pogo",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanPogo.png",
		}
	},

	["artskull"] = {
		label = "Art Skull",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanNecklace.png",
		}
	},

	["big_drill"] = {
		label = "big_drill",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "big_drill.png",
		}
	},

	["key2"] = {
		label = "Casino Key 2",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "key2.png",
		}
	},

	["ring"] = {
		label = "Ring",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["artgun"] = {
		label = "Art Gun",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanNecklace.png",
		}
	},

	["shark_boi"] = {
		label = "Shark Boi",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "shark_boi.png",
		}
	},

	["artegg"] = {
		label = "Art Egg",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanNecklace.png",
		}
	},

	["cutter"] = {
		label = "cutter",
		weight = 5,
		stack = true,
		close = false,
		description = "Cutter",
		client = {
			image = "cutter.png",
		}
	},

	["c4_bomb"] = {
		label = "C4",
		weight = 100,
		stack = false,
		close = true,
		description = "0x0x",
		client = {
			image = "weapon_stickybomb.png",
		}
	},

	["weed_pooch"] = {
		label = "Weed Pooch",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["monkey_punk"] = {
		label = "Monkey Punk",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "monkey_punk.png",
		}
	},

	["goldwatch"] = {
		label = "Gold Watch",
		weight = 200,
		stack = true,
		close = false,
		description = "0x0x",
		client = {
			image = "blowtorch.png",
		}
	},

	["dino"] = {
		label = "Dino",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "dino.png",
		}
	},

	["thermite_bomb"] = {
		label = "Thermite Bomb",
		weight = 100,
		stack = false,
		close = true,
		description = "0x0x",
		client = {
			image = "weapon_stickybomb.png",
		}
	},

	["panther"] = {
		label = "Panther",
		weight = 100,
		stack = true,
		close = true,
		description = "Stolen Artwork",
		client = {
			image = "vanPanther.png",
		}
	},

	["bag"] = {
		label = "Bag",
		weight = 5,
		stack = true,
		close = false,
		description = "Bag",
		client = {
			image = "bag.png",
		}
	},

	["monky"] = {
		label = "Monkey",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "monky.png",
		}
	},

	["blossom"] = {
		label = "Blossom",
		weight = 0,
		stack = true,
		close = true,
		description = "Looks expensive to me o.o",
		client = {
			image = "blossom.png",
		}
	},
}