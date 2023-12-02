local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local playerJob = nil
local tacoblip = nil
local onduty = true
local isSpawned = false
local onDelivery = false
local availableTacos = {}
local selling = false
local lastPed = {}
StockPrice = Config.StockPrice
local CalledIngredients = false

CreateThread(function()
    local coords = Config.TacoJobBlipLocation
    tacoblip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite (tacoblip, 208)
    SetBlipDisplay(tacoblip, 4)
    SetBlipScale  (tacoblip, 1.0)
    SetBlipAsShortRange(tacoblip, true)
    SetBlipColour(tacoblip, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.TacoBlipName)
    EndTextCommandSetBlipName(tacoblip)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    playerJob = QBCore.Functions.GetPlayerData().job
    onduty = playerJob.onduty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    playerJob = JobInfo
    if playerJob.name == "tacofarmer" then
        if tacoBlip ~= nil then
            RemoveBlip(tacoBlip)
        end
    end
end)

RegisterNetEvent('tk-tacojob:client:refreshAvailableTacos', function(items)
    availableTacos = items
    if #availableTacos <= 0 then
        QBCore.Functions.Notify('No more Tacos Left To Sell!', 'error')
        selling = false
        LocalPlayer.state:set("inv_busy", false, true)
    end
end)

--ThirdEye
CreateThread(function()
    exports['qb-target']:AddBoxZone("OnOffDuty", Config.OnOffDutyLocation, 1, 1, {
        name = "On / Off Duty",
        heading = Config.OnOffDutyHeading,
        debugPoly = false,
        minZ = Config.OnOffDutyMinZ,
        maxZ = Config.OnOffDutyMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-tacojob:client:duty",
                targeticon = 'fas fa-sign-in-alt',
                label = "Go On/Off Duty"
            },
            {
                type = "client",
                event = "tk-tacojob:client:getStock",
                targeticon = 'fas fa-sign-in-alt',
                label = "Purchase Stock"
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("refill", Config.TacoRefillAreaLocation, 1, 1, {
        name = "Fridge",
        heading = Config.RefillHeading,
        debugPoly = false,
        minZ = Config.RefillMinZ,
        maxZ = Config.RefillMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-tacojob:client:restock",
                targeticon = 'fas fa-box',
                label = "Restock"
            },
            {
                type = "client",
                event = "tk-tacojob:client:openFridge",
                targeticon = 'fas fa-box',
                label = "Open Fridge"
            },
            {
                type = "client",
                event = "tk-tacojob:unloadPallete",
                targeticon = 'fas fa-box',
                label = "Unload Pallete"
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("warehouse", Config.WarehouseLocation, 1, 1, {
        name = "Warehouse",
        heading = Config.WarehouseHeading,
        debugPoly = false,
        minZ = Config.WarehouseMinZ,
        maxZ = Config.WarehouseMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-tacojob:client:warehouse",
                targeticon = 'fas fa-box',
                label = "Get Stock"
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("prep", Config.PrepLocation, 1, 2, {
        name = "Prep",
        heading = Config.PrepHeading,
        debugPoly = false,
        minZ = Config.PrepMinZ,
        maxZ = Config.PrepMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-tacojob:client:OpenPrepTable",
                targeticon = 'fas fa-utensils',
                label = "Prep Ingredients"
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("stove", Config.StoveLocation, 1, 1.5, {
        name = "Stove",
        heading = Config.StoveHeading,
        debugPoly = false,
        minZ = Config.StoveMinZ,
        maxZ = Config.StoveMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-tacojob:client:OpenStove",
                targeticon = 'fas fa-utensils',
                label = "Cook Recipes"
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("shelf", Config.ShelfLocation, 1.8, 1.5, {
        name = "Stove",
        heading = Config.ShelfHeading,
        debugPoly = false,
        minZ = Config.ShelfMinZ,
        maxZ = Config.ShelfMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-tacojob:client:openShelf",
                targeticon = 'fas fa-utensils',
                label = "Open Shelf"
            },
        },
        distance = 3.0
    })
end)

RegisterNetEvent('tk-tacojob:client:openShelf')
AddEventHandler('tk-tacojob:client:openShelf', function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacoshelf")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacoshelf", {
        maxweight = 4000000,
        slots = 500,
    })
end)

function QBCore.Functions.HasItem(items, amount)
    return exports[Config.InventoryScript]:HasItem(items, amount)
end

RegisterNetEvent('tk-tacojob:client:OpenPrepTable')
AddEventHandler('tk-tacojob:client:OpenPrepTable', function()
    if QBCore.Functions.GetPlayerData().job.grade.level == 1 or QBCore.Functions.GetPlayerData().job.grade.level == 2 or QBCore.Functions.GetPlayerData().job.grade.level == 3 then
        exports['qb-menu']:openMenu({
            {
                header = "Prep Table",
                isMenuHeader = true, -- Set to true to make a nonclickable title
            },
            {
                header = "Shredded Lettuce",
                txt = "Requires Item: Lettuce",
                params = {
                    event = "tk-tacojob:client:preplettuce",
                }
            },
            {
                header = "Prep Shredded Cheese",
                txt = "Requires Item: Cheese",
                params = {
                    event = "tk-tacojob:client:prepcheese",
                }
            },
            {
                header = "Prep Diced Tomatoes",
                txt = "Requires Item: Tomato",
                params = {
                    event = "tk-tacojob:client:preptomatoes",
                }
            },
        })
    else
        QBCore.Functions.Notify('Your Not The Cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:OpenStove')
AddEventHandler('tk-tacojob:client:OpenStove', function()
    if QBCore.Functions.GetPlayerData().job.grade.level == 1 or QBCore.Functions.GetPlayerData().job.grade.level == 2 or QBCore.Functions.GetPlayerData().job.grade.level == 3 then
        exports['qb-menu']:openMenu({
            {
                header = "Stove",
                isMenuHeader = true, -- Set to true to make a nonclickable title
            },
            {
                header = "Cook Ingredients",
                txt = "",
                params = {
                    event = "tk-tacojob:client:CookIngredients",
                }
            },
            {
                header = "Tacos",
                txt = "",
                params = {
                    event = "tk-tacojob:client:CookTacos",
                }
            },
            {
                header = "Burritos",
                txt = "",
                params = {
                    event = "tk-tacojob:client:CookBurritos",
                }
            },
            {
                header = "Tostadas",
                txt = "",
                params = {
                    event = "tk-tacojob:client:CookTostadas",
                }
            },
            {
                header = "Tortas",
                txt = "",
                params = {
                    event = "tk-tacojob:client:CookTortas",
                }
            },
            {
                header = "Quesadillas",
                txt = "",
                params = {
                    event = "tk-tacojob:client:CookQuesadillas",
                }
            },
            
        })
    else
        QBCore.Functions.Notify('Your Not The Cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:CookIngredients')
AddEventHandler('tk-tacojob:client:CookIngredients', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cook Ingredients",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Cook Ground Beef",
            txt = "Requires Item: Ground Beef",
            params = {
                event = "tk-tacojob:client:cookbeef",
            }
        },
        {
            header = "Cook Pork",
            txt = "Requires Item: Pork",
            params = {
                event = "tk-tacojob:client:cookpork",
            }
        },
        {
            header = "Cook Steak",
            txt = "Requires Item: Steak",
            params = {
                event = "tk-tacojob:client:cooksteak",
            }
        },
        {
            header = "Cook Chicken",
            txt = "Requires Item: Chicken",
            params = {
                event = "tk-tacojob:client:cookchicken",
            }
        },
        {
            header = "Cook Beans",
            txt = "Requires Item: Beans",
            params = {
                event = "tk-tacojob:client:cookbeans"
            }
        },
        {
            header = "Back",
            txt = "",
            params = {
                event = "tk-tacojob:client:OpenStove",
            }
        },
        
    })
end)

RegisterNetEvent('tk-tacojob:client:CookTacos')
AddEventHandler('tk-tacojob:client:CookTacos', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cook Tacos",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Make Chicken Taco",
            txt = "Requires Items: Cooked Chicken,Taco Seasoning,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Taco Shell",
            params = {
                event = "tk-tacojob:MakeChickenTaco",
            }
        },
        {
            header = "Make Steak Taco",
            txt = "Requires Items: Cooked Steak,Taco Seasoning,Shredded Lettuce, Diced Tomatoes,Shredded Cheese,Peppers,Taco Shell",
            params = {
                event = "tk-tacojob:MakeSteakTaco",
            }
        },
        {
            header = "Make Beef Taco",
            txt = "Requires Items: Cooked Ground Beef,Taco Seasoning,Shredded Lettuce, Diced Tomatoes,Shredded Cheese,Peppers,Taco Shell",
            params = {
                event = "tk-tacojob:MakeBeefTaco",
            }
        },
        {
            header = "Make Pork Taco",
            txt = "Requires Items: Cooked Pork,Taco Seasoning,Shredded Lettuce, Diced Tomatoes,Shredded Cheese,Peppers, Taco Shell",
            params = {
                event = "tk-tacojob:MakePorkTaco",
            }
        },
        {
            header = "Back",
            txt = "",
            params = {
                event = "tk-tacojob:client:OpenStove",
            }
        },
        
    })
end)

RegisterNetEvent('tk-tacojob:client:CookBurritos')
AddEventHandler('tk-tacojob:client:CookBurritos', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cook Burritos",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Make Steak Burrito",
            txt = "Requires Items: Cooked Steak,Taco Seasoning,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Tortillas",
            params = {
                event = "tk-tacojob:MakeSteakBurrito",
            }
        },
        {
            header = "Make Chicken Burrito",
            txt = "Requires Items: Cooked Chicken,Taco Seasoning,Shredded Lettuce, Diced Tomatoes,Shredded Cheese,Peppers,Tortillas",
            params = {
                event = "tk-tacojob:MakeChickenBurrito",
            }
        },
        {
            header = "Make Beef Burrito",
            txt = "Requires Items: Cooked Ground Beef,Taco Seasoning,Shredded Lettuce, Diced Tomatoes,Shredded Cheese,Peppers,Tortillas",
            params = {
                event = "tk-tacojob:MakeBeefBurrito",
            }
        },
        {
            header = "Make Bean & Cheese Burrito",
            txt = "Requires Items: Refried Beans,Shredded Cheese,Tortillas",
            params = {
                event = "tk-tacojob:MakeBean&CheeseBurrito",
            }
        },
        {
            header = "Make Beef & Bean Burrito",
            txt = "Requires Items: Refried Beans,Cooked Ground Beef,Tortillas",
            params = {
                event = "tk-tacojob:MakeBeef&BeanBurrito",
            }
        },
        {
            header = "Back",
            txt = "",
            params = {
                event = "tk-tacojob:client:OpenStove",
            }
        },
        
    })
end)

RegisterNetEvent('tk-tacojob:client:CookTostadas')
AddEventHandler('tk-tacojob:client:CookTostadas', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cook Tostadas",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Make Chicken Tostada",
            txt = "Requires Items: Cooked Chicken,Taco Seasoning,Refried Beans,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Tostada Shell",
            params = {
                event = "tk-tacojob:MakeChickenTostada",
            }
        },
        {
            header = "Make Beef Tostada",
            txt = "Requires Items: Cooked Ground Beef,Taco Seasoning,Refried Beans,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Tostada Shell",
            params = {
                event = "tk-tacojob:MakeBeefTostada",
            }
        },
        {
            header = "Make Pork Tostada",
            txt = "Requires Items: Cooked Pork,Taco Seasoning,Refried Beans,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Tostada Shell",
            params = {
                event = "tk-tacojob:MakePorkTostada",
            }
        },
        {
            header = "Back",
            txt = "",
            params = {
                event = "tk-tacojob:client:OpenStove",
            }
        },
        
    })
end)

RegisterNetEvent('tk-tacojob:client:CookTortas')
AddEventHandler('tk-tacojob:client:CookTortas', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cook Tortas",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Make Steak Torta",
            txt = "Requires Items: Cooked Ground Beef,Taco Seasoning,Refried Beans,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Bread,Avocado",
            params = {
                event = "tk-tacojob:MakeSteakTorta",
            }
        },
        {
            header = "Make Pork Torta",
            txt = "Requires Items: Cooked Pork,Taco Seasoning,Refried Beans,Shredded Lettuce,Diced Tomatoes,Shredded Cheese,Peppers,Bread,Avocado",
            params = {
                event = "tk-tacojob:MakePorkTorta",
            }
        },
        {
            header = "Back",
            txt = "",
            params = {
                event = "tk-tacojob:client:OpenStove",
            }
        },
        
    })
end)

RegisterNetEvent('tk-tacojob:client:CookQuesadillas')
AddEventHandler('tk-tacojob:client:CookQuesadillas', function()
    exports['qb-menu']:openMenu({
        {
            header = "Cook Quesadillas",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Make Cheese Quesadilla",
            txt = "Requires Items: Shredded Cheese,Tortillas",
            params = {
                event = "tk-tacojob:MakeCheeseQuesadilla",
            }
        },
        {
            header = "Make Chicken Quesadilla",
            txt = "Requires Items: Cooked Chicken,Taco Seasoning,Shredded Cheese,Tortillas",
            params = {
                event = "tk-tacojob:MakeChickenQuesadilla",
            }
        },
        {
            header = "Make Steak Quesadilla",
            txt = "Requires Items: Cooked Steak,Taco Seasoning,Shredded Cheese,Tortillas",
            params = {
                event = "tk-tacojob:MakeSteakQuesadilla",
            }
        },
        {
            header = "Make Beef Quesadilla",
            txt = "Requires Items: Cooked Ground Beef,Taco Seasoning,Shredded Cheese,Tortillas",
            params = {
                event = "tk-tacojob:MakeBeefQuesadilla",
            }
        },
        {
            header = "Back",
            txt = "",
            params = {
                event = "tk-tacojob:client:OpenStove",
            }
        },
        
    })
end)

RegisterNetEvent('tk-tacojob:client:preplettuce', function()
    local HasItem = QBCore.Functions.HasItem('lettuce', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','lettuce',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','shreddedlettuce',1)
        QBCore.Functions.Notify('Lettuce has been prepped!', 'success')
    else
        QBCore.Functions.Notify('You dont have any lettuce to prep', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:prepcheese', function()
    local HasItem = QBCore.Functions.HasItem('cheese', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','cheese',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','shreddedcheese',1)
        QBCore.Functions.Notify('Cheese has been prepped!', 'success')
    else
        QBCore.Functions.Notify('You dont have any cheese to prep', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:preptomatoes', function()
    local HasItem = QBCore.Functions.HasItem('tomato', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','tomato',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','dicedtomatoes',1)
        QBCore.Functions.Notify('Tomatoes have been prepped!', 'success')
    else
        QBCore.Functions.Notify('You dont have any tomatoes to prep', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:cookbeef', function()
    local HasItem = QBCore.Functions.HasItem('groundbeef', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','groundbeef',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','cookedbeef',1)
        QBCore.Functions.Notify('Beef has been cooked!', 'success')
        TriggerServerEvent('tk-tacojob:server:pay')
    else
        QBCore.Functions.Notify('You dont have beef to cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:cookpork', function()
    local HasItem = QBCore.Functions.HasItem('pork', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','pork',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','cookedpork',1)
        QBCore.Functions.Notify('Pork has been cooked!', 'success')
        TriggerServerEvent('tk-tacojob:server:pay')
    else
        QBCore.Functions.Notify('You dont have pork to cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:cooksteak', function()
    local HasItem = QBCore.Functions.HasItem('steak', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','steak',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','cookedsteak',1)
        QBCore.Functions.Notify('Steak has been cooked!', 'success')
        TriggerServerEvent('tk-tacojob:server:pay')
    else
        QBCore.Functions.Notify('You dont have steak to cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:cookchicken', function()
    local HasItem = QBCore.Functions.HasItem('chicken', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','chicken',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','cookedchicken',1)
        QBCore.Functions.Notify('Chicken has been cooked!', 'success')
        TriggerServerEvent('tk-tacojob:server:pay')
    else
        QBCore.Functions.Notify('You dont have chicken to cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:client:cookbeans', function()
    local HasItem = QBCore.Functions.HasItem('beans', 1)
    if HasItem then
        TriggerServerEvent('tk-tacojob:server:RemoveItem','beans',1)
        TriggerServerEvent('tk-tacojob:server:AddItem','refriedbeans',1)
        QBCore.Functions.Notify('Beans have been cooked!', 'success')
        TriggerServerEvent('tk-tacojob:server:pay')
    else
        QBCore.Functions.Notify('You dont have beans to cook', 'error')
    end
end)

RegisterNetEvent('tk-tacojob:MakeChickenTaco', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:chickentacoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Chicken Taco..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedchicken',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoshell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','chickentaco',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeSteakTaco', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:steaktacoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Steak Taco..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedsteak',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoshell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','steaktaco',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeBeefTaco', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:beeftacoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Beef Taco..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedbeef',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoshell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','beeftaco',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakePorkTaco', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:porktacoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Pork Taco..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedpork',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoshell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','porktaco',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeChickenBurrito', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:chickenburritoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Chicken Burrito..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedchicken',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','chickenburrito',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeSteakBurrito', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:steakburritoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Steak Burrito..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedsteak',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes,1')
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','steakburrito',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeBeefBurrito', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:beefburritoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Beef Burrito..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
						TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedbeef',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','beefburrito',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeBean&CheeseBurrito', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:bean&cheeseburritoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Bean & Cheese Burrito..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','beanandcheeseburrito',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeBeef&BeanBurrito', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:beef&beanburritoitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Beef & Bean Burrito..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedbeef',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','beefandbeanburrito',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeChickenTostada', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:chickentostadaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Chicken Tostada..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedchicken',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tostadashell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','chickentostada',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeBeefTostada', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:beeftostadaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Beef Tostada..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedbeef',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tostadashell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','beeftostada',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakePorkTostada', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:porktostadaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Pork Tostada..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedpork',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tostadashell',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','porktostada',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeSteakTorta', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:steaktortaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Steak Torta..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedsteak',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','bread',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','avocado',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','steaktorta',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakePorkTorta', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:porktortaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Pork Torta..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedpork',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','refriedbeans',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedlettuce',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','dicedtomatoes',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','peppers',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','bread',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','avocado',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','porktorta',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeCheeseQuesadilla', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:cheesequesadillaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Cheese Quesadilla Burrito..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','cheesequesadilla',1)

                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeChickenQuesadilla', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:chickenquesadillaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Chicken Quesadilla..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedchicken',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','chickenquesadilla',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeSteakQuesadilla', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:steakquesadillaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Steak Quesadilla..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedsteak',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','steakquesadilla',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:MakeBeefQuesadilla', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then   
    		QBCore.Functions.TriggerCallback('tk-tacojob:beefquesadillaitems', function(HasItems)  
    			if HasItems then
					Working = true
					TriggerEvent('inventory:client:busy:status', true)
					QBCore.Functions.Progressbar('pickup_sla', 'Making a Beef Quesadilla..', 5000, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = false,
					}, {
						animDict = 'mp_common',
						anim = 'givetake1_a',
						flags = 8,
                        tostring
					}, {}, {}, function() -- Done
						Working = false
						TriggerEvent('inventory:client:busy:status', false)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','cookedbeef',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tacoseasoning',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','shreddedcheese',1)
                        TriggerServerEvent('tk-tacojob:server:RemoveItem','tortillas',1)
                        TriggerServerEvent('tk-tacojob:server:AddItem','beefquesadilla',1)
                        TriggerServerEvent('tk-tacojob:server:pay')
					end, function()
						TriggerEvent('inventory:client:busy:status', false)
						QBCore.Functions.Notify('Cancelled..', 'error')
						Working = false
					end)
				else
   					QBCore.Functions.Notify('You dont have the right ingredients to make this', 'error')
				end
			end)
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)


RegisterNetEvent('tk-tacojob:client:warehouse', function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty and not IsPedInAnyVehicle(PlayerPedId(), false) then
            if CalledIngredients then
                TriggerServerEvent('tk-tacojob:server:AddItem','tacocrate',1)
				QBCore.Functions.Notify('Deliver the ingredients back to the Taco Shop', 'success')
				SetNewWaypoint(Config.WarehouseLocation)
				CalledIngredients = false
            else
				QBCore.Functions.Notify('You didnt call the warehouse first..', 'error')
			end
		else 
			QBCore.Functions.Notify('You must be Clocked in', 'error')
		end
	end)
end)

--Vehicle Spawn
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local markDist = #(pos - Config.TacoSpawnVehicleLocation)
        if markDist < 10 and onduty == true then
            if QBCore.Functions.GetPlayerData().job.grade.level == 0 or QBCore.Functions.GetPlayerData().job.grade.level == 2 or QBCore.Functions.GetPlayerData().job.grade.level == 3 then
                DrawMarker(39, Config.TacoVehicleTruck, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 47, 255, 0, 222, false, false, false, true, false, false, false)
                -- Circle Icon
                DrawMarker(25, Config.TacoVehicleCircle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.9, 1.9, 1.9, 47, 255, 0, 222, false, false, false, true, false, false, false)

                if markDist < 1 then
                    if IsPedInAnyVehicle(ped, false) then
                        ShowHelpNotification("Press ~INPUT_PICKUP~ To Store Vehicle")
                    end
                    if IsControlJustPressed(0,38) then
                        if IsPedInAnyVehicle(ped, false) and isSpawned == true then
                            QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                            isSpawned = false
                        end
                    end
                end
                onDelivery = false
            end
        end
    end
end)

--Taco Refill
RegisterNetEvent('tk-tacojob:client:restock')
AddEventHandler('tk-tacojob:client:restock', function()
    if QBCore.Functions.GetPlayerData().job.grade.level == 0 or QBCore.Functions.GetPlayerData().job.grade.level == 2 or QBCore.Functions.GetPlayerData().job.grade.level == 3 then
        onDelivery = true
        QBCore.Functions.Progressbar("restock", "Restocking...", 12000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, function() -- Done
        end, function()
        end)
        TriggerServerEvent('tk-tacojob:Server:DeliveryRestock')
        if isSpawned == false then
            QBCore.Functions.SpawnVehicle("taco", function(veh)
                SetEntityHeading(veh, Config.TacoVehicleHeading)
                exports['playlolly-drive']:SetFuel(veh, 100.0)
                TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                SetVehicleEngineOn(veh, true, true)
            end, Config.TacoSpawnVehicleLocation, true)
            isSpawned = true
        end
        if IsPedInAnyVehicle(ped, false) and isSpawned == true then
            QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
            isSpawned = false
        end
    else
        QBCore.Functions.Notify("You are Not a Delivery Driver", "error")
    end
end)

RegisterNetEvent('tk-tacojob:client:getStock')
AddEventHandler('tk-tacojob:client:getStock', function()
    if QBCore.Functions.GetPlayerData().job.grade.level == 2 or QBCore.Functions.GetPlayerData().job.grade.level == 3 then
        QBCore.Functions.TriggerCallback('tk-tacojob:takeManagementFunds', function(haspaid)
            if haspaid then
                SetNewWaypoint(Config.WarehouseLocation)
                CalledIngredients = true
            end
        end)
    else
        QBCore.Functions.Notify("You are Not a Manager or Owner", "error")
    end
end)

RegisterNetEvent('tk-tacojob:unloadPallete', function()
    local HasItem = QBCore.Functions.HasItem('tacocrate', 1)
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
            if HasItem then
                TriggerEvent('tk-tacojob:items')
            else
                QBCore.Functions.Notify('You don\'t have any crates.', 'error')
            end
		else 
			QBCore.Functions.Notify('You must be Clocked into work', 'error')
		end
	end)
end)

RegisterNetEvent('tk-tacojob:items', function()
    TriggerServerEvent('tk-tacojob:server:RemoveItem','tacocrate',1)
	QBCore.Functions.Notify('Ingredients have been unpacked!', 'success')
    TriggerServerEvent('tk-tacojob:server:AddItem','lettuce',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','cheese',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','groundbeef',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','pork',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','steak',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','chicken',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','beans',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','tomato',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','tortillas',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','tacoshell',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','tostadashell',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','bread',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','avocado',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','peppers',50)
    TriggerServerEvent('tk-tacojob:server:AddItem','tacoseasoning',50)
end)

RegisterNetEvent('tk-tacojob:client:openFridge')
AddEventHandler('tk-tacojob:client:openFridge', function()
    if QBCore.Functions.GetPlayerData().job.grade.level >= 1 then
        TriggerEvent("inventory:client:SetCurrentStash", "tacostash")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacostash", {
            maxweight = 4000000,
            slots = 500,
        })
    else
        QBCore.Functions.Notify("You are Not a Cook or Management", "error")
    end
end)

RegisterNetEvent('tk-tacojob:client:duty')
AddEventHandler('tk-tacojob:client:duty', function()
    if onduty == true then
        onduty = false
        TriggerServerEvent("QBCore:ToggleDuty")
    else
        onduty = true
        TriggerServerEvent("QBCore:ToggleDuty")
    end
end)

RegisterNetEvent('tk-tacojob:client:startselling', function(data)
    QBCore.Functions.TriggerCallback('tk-tacojob:server:tacoselling:getAvailableTacos', function(result)
        if result ~= nil then
            availableTacos = result
            if not selling then
                selling = true
                LocalPlayer.state:set("inv_busy", true, true)
                QBCore.Functions.Notify("Started Selling")
                startLocation = GetEntityCoords(PlayerPedId())
            else
                selling = false
                LocalPlayer.state:set("inv_busy", false, true)
                QBCore.Functions.Notify("Stopped Selling")
            end
        else
            QBCore.Functions.Notify("You have nothing to sell", 'error')
            LocalPlayer.state:set("inv_busy", false, true)
        end
    end)
end)

-- Shows Help Notification
function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function loadAnimDict(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function SellToPed(ped)
    hasTarget = true
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end

    local TacoType = math.random(1, #availableTacos)
    local Amount = math.random(1, availableTacos[TacoType].amount)

    if Amount > 3 then
        Amount = math.random(1, 3)
    end

    currentOfferTaco = availableTacos[TacoType]

    local ddata = currentOfferTaco.price

    local randomPrice = ddata * Amount

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)

    local coords = GetEntityCoords(PlayerPedId(), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(coords - pedCoords)
    TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)

    while pedDist > 1.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = #(coords - pedCoords)
        Wait(100)
    end

    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)

    if hasTarget then
        while pedDist < 1.5 do
            coords = GetEntityCoords(PlayerPedId(), true)
            pedCoords = GetEntityCoords(ped)
            pedDist = #(coords - pedCoords)
            if pedDist < 1.5 and selling then
                DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z, '~g~E~w~ '..Amount..'x '..currentOfferTaco.label..' for $'..randomPrice..'?')
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('tk-tacojob:server:sellTacos', availableTacos[TacoType].item, Amount, randomPrice)
                    hasTarget = false

                    loadAnimDict("gestures@f@standing@casual")
                    TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_point", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                    Wait(650)
                    ClearPedTasks(PlayerPedId())

                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    lastPed[#lastPed+1] = ped
                    break
                end
            else
                hasTarget = false
                pedDist = 5
                SetPedKeepTask(ped, false)
                SetEntityAsNoLongerNeeded(ped)
                ClearPedTasksImmediately(ped)
                lastPed[#lastPed+1] = ped
                selling = false
            end
            Wait(3)
        end
        Wait(math.random(4000, 7000))
    end
end

CreateThread(function()
    while true do
        sleep = 1000
        if selling then
            sleep = 0
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            if not hasTarget then
                local PlayerPeds = {}
                if next(PlayerPeds) == nil then
                    for _, player in ipairs(GetActivePlayers()) do
                        local ped = GetPlayerPed(player)
                        PlayerPeds[#PlayerPeds+1] = ped
                    end
                end
                local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
                if closestDistance < 45.0 and closestPed ~= 0 and not IsPedInAnyVehicle(closestPed) then
                    SellToPed(closestPed)
                end
            end
        end
        Wait(sleep)
    end
end)