# Made By: Tkiljoy

# GuideLines:
**You May NOT Repost This Script On ANY platform Without Our Written Consent To Do So.**
**You May NOT Take This Script And Say The Contents Are Yours And You Made It.**

# Dependencies
* [QBCore-Framework] https://github.com/qbcore-framework
* [QB-Target] https://github.com/BerkieBb/qb-target
* [TacoMlo] https://www.gta5-mods.com/maps/taco-restaurant-mlo-add-on-fivem-pablitomamutopaputo#comments_tab

# How To Install:

**1:Before Starting tk-tacojob You Must Add The Items First, To Do So Go Into [qb]/qb-core/shared/items.lua**
**And Paste The Following**
```lua
	--TacoJobIngredients
	["lettuce"] 				         = {["name"] = "lettuce", 			    		            ["label"] = "Head of Lettuce", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "lettuce.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["shreddedlettuce"] 				 = {["name"] = "shreddedlettuce", 			    		    ["label"] = "Shredded Lettuce", 			    ["weight"] = 1, 		["type"] = "item", 		["image"] = "shreddedlettuce.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cheese"] 				             = {["name"] = "cheese", 			    		            ["label"] = "Cheese", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "cheese.png", 	            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["shreddedcheese"] 				     = {["name"] = "shreddedcheese", 			    		    ["label"] = "Shredded Cheese", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "shreddedcheese.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["groundbeef"] 				         = {["name"] = "groundbeef", 			    		        ["label"] = "Ground Beef", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "groundbeef.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cookedbeef"] 				         = {["name"] = "cookedbeef", 			    		        ["label"] = "Cooked Beef", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "cookedbeef.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["pork"] 				             = {["name"] = "pork", 			    		                ["label"] = "Pork", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "pork.png", 	            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cookedpork"] 				         = {["name"] = "cookedpork", 			    		        ["label"] = "Cooked Pork", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "cookedpork.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["steak"] 				             = {["name"] = "steak", 			    		            ["label"] = "Steak", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "steak.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cookedsteak"] 				     = {["name"] = "cookedsteak", 			    		        ["label"] = "Cooked Steak", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "cookedsteak.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["chicken"] 				         = {["name"] = "chicken", 			    		            ["label"] = "Chicken", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "chicken.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cookedchicken"] 				     = {["name"] = "cookedchicken", 			    		    ["label"] = "Cooked Chicken", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "cookedchicken.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beans"] 				             = {["name"] = "beans", 			    		            ["label"] = "Beans", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "beans.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["refriedbeans"] 				     = {["name"] = "refriedbeans", 			    		        ["label"] = "Refried Beans", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "refriedbeans.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["tomato"] 				             = {["name"] = "tomato", 			    		            ["label"] = "Tomato", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "tomato.png", 	            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["dicedtomatoes"] 				     = {["name"] = "dicedtomatoes", 			    		    ["label"] = "Diced Tomatoes", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "dicedtomatoes.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["tortillas"] 				         = {["name"] = "tortillas", 			    		        ["label"] = "Tortillas", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "tortillas.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["tacoshell"] 				         = {["name"] = "tacoshell", 			    		        ["label"] = "Taco Shell", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "tacoshell.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["tostadashell"] 				     = {["name"] = "tostadashell", 			    		        ["label"] = "Tostada Shell", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "tostadashell.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["bread"] 				             = {["name"] = "bread", 			    		            ["label"] = "Bread", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "bread.png", 	            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["avocado"] 				         = {["name"] = "avocado", 			    		            ["label"] = "Avocado", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "avocado.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["peppers"] 				         = {["name"] = "peppers", 			    		            ["label"] = "Peppers", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "peppers.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["tacoseasoning"] 				     = {["name"] = "tacoseasoning", 			    		    ["label"] = "Taco Seasoning", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "tacoseasoning.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},

    --TacoJobFinalProducts
	["chickentaco"] 				     = {["name"] = "chickentaco", 			    		        ["label"] = "Chicken Taco", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "chickentaco.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["steaktaco"] 				         = {["name"] = "steaktaco", 			    		        ["label"] = "Steak Taco", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "steaktaco.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beeftaco"] 				         = {["name"] = "beeftaco", 			    		            ["label"] = "Beef Taco", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "beeftaco.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["porktaco"] 				         = {["name"] = "porktaco", 			    		            ["label"] = "Pork Taco", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "porktaco.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["steakburrito"] 				     = {["name"] = "steakburrito", 			    		        ["label"] = "Steak Burrito", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "steakburrito.png",         ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["chickenburrito"] 				     = {["name"] = "chickenburrito", 			    		    ["label"] = "Chicken Burrito", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "chickenburrito.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beefburrito"] 				     = {["name"] = "beefburrito", 			    		        ["label"] = "Beef Burrito", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "beefburrito.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beanandcheeseburrito"] 		     = {["name"] = "beanandcheeseburrito", 			    		["label"] = "Bean and Cheese Burrito", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "beanandcheeseburrito.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beefandbeanburrito"] 				 = {["name"] = "beefandbeanburrito", 			    		["label"] = "Beef and Bean Burrito", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "beefandbeanburrito.png",   ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["porktorta"] 				         = {["name"] = "porktorta", 			    		        ["label"] = "Pork Torta", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "porktorta.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["steaktorta"] 				         = {["name"] = "steaktorta", 			    		        ["label"] = "Steak Torta", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "steaktorta.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cheesequesadilla"] 				 = {["name"] = "cheesequesadilla", 			    		    ["label"] = "Cheese Quesadilla", 			    ["weight"] = 1, 		["type"] = "item", 		["image"] = "cheesequesadilla.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["chickenquesadilla"] 				 = {["name"] = "chickenquesadilla", 			    		["label"] = "Chicken Quesadilla", 			    ["weight"] = 1, 		["type"] = "item", 		["image"] = "chickenquesadilla.png",    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["steakquesadilla"] 				 = {["name"] = "steakquesadilla", 			    		    ["label"] = "Steak Quesadilla", 			    ["weight"] = 1, 		["type"] = "item", 		["image"] = "steakquesadilla.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beefquesadilla"] 				     = {["name"] = "beefquesadilla", 			    		    ["label"] = "Beef Quesadilla", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "beefquesadilla.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["chickentostada"] 				     = {["name"] = "chickentostada", 			    		    ["label"] = "Chicken Tostada", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "chickentostada.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["beeftostada"] 				     = {["name"] = "beeftostada", 			    		        ["label"] = "Beef Tostada", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "beeftostada.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["porktostada"] 				     = {["name"] = "porktostada", 			    		        ["label"] = "Pork Tostada", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "porktostada.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	
	--Taco Misc Items
	["tacocrate"] 				     = {["name"] = "tacocrate", 			    		        ["label"] = "Taco Crate", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "tacocrate.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
```

**2:Add The Job To Do So Go Into [qb]/qb-core/shared/jobs.lua**
**And Paste The Following**
```lua
    ['tacofarmer'] = {
		label = 'Taco Farmer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Delivery Worker',
                payment = 10
            },
            ['1'] = {
                name = 'Cook',
                payment = 20
            },
            ['2'] = {
                name = 'Manager',
                isboss = true,
                payment = 30
            },
            ['3'] = {
                name = 'Owner',
                isboss = true,
                payment = 40
            },
        },
	},
```

**3: Add The Boss Menu To Do So Go Into [qb]/qb-management/client/cl_config.lua**
**And Paste The Following**
```lua
	--Config.BossMenus
    ['tacofarmer'] = {
        vector3(20.28, -1602.45, 29.39)
    }

	--Config.BossMenuZones
	['tacofarmer'] = {
        { coords = vector3(20.28, -1602.45, 29.39), length = 1.15, width = 2.6, heading = 248.86, minZ = 28, maxZ = 31 },
    },
```

**4 Add The Options For The Radial Menu To Do So Go Into [qb]/qb-radialmenu/config.lua** (Under Job Interactions)
**And Paste The Following**
```lua
	["tacofarmer"] = {
        {
            id = 'startselling',
            title = 'Start Selling',
            icon = 'car',
            type = 'client',
            event = 'tk-tacojob:client:startselling',
            shouldClose = true
        }
    },
```

**4: Add The Images in the image folder to [qb]/ps-inventory/html/images**

**5: Add The Items as Consumables (Optional) to [qb]/qb-smallresources/config.lua**
**And Paste The Following**
```lua
	-- Taco Job Items
    ["beanandcheeseburrito"] = math.random(40, 50),
    ["beefandbeanburrito"] = math.random(40, 50),
    ["beefburrito"] = math.random(40, 50),
    ["beefquesadilla"] = math.random(40, 50),
    ["beeftaco"] = math.random(40, 50),
    ["beeftostada"] = math.random(40, 50),
    ["cheesequesadilla"] = math.random(40, 50),
    ["chickenburrito"] = math.random(40, 50),
    ["chickenquesadilla"] = math.random(40, 50),
    ["chickentaco"] = math.random(40, 50),
    ["chickentostada"] = math.random(40, 50),
    ["porktaco"] = math.random(40, 50),
    ["porktorta"] = math.random(40, 50),
    ["porktostada"] = math.random(40, 50),
    ["steakburrito"] = math.random(40, 50),
    ["steakquesadilla"] = math.random(40, 50),
    ["steaktaco"] = math.random(40, 50),
    ["steaktorta"] = math.random(40, 50),
```

**6: Add The Items as Consumables (Part 2) (Optional) to [qb]/qb-smallresources/server/consumables.lua**
**And Paste The Following**
```lua
	----------- / TacoJob Food
	QBCore.Functions.CreateUseableItem("beanandcheeseburrito", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("beefandbeanburrito", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("beefburrito", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("beefquesadilla", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("beeftaco", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("beeftostada", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("cheesequesadilla", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("chickenburrito", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("chickenquesadilla", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("chickentaco", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("chickentostada", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("porktaco", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("porktorta", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("porktostada", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("steakburrito", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("steakquesadilla", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("steaktaco", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)

	QBCore.Functions.CreateUseableItem("steaktorta", function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent("consumables:client:Eat", src, item.name)
		end
	end)
```

**7: Paste tk-tacojob In Your a Folder In Resources And Ensure It To Your Server.cfg** 
