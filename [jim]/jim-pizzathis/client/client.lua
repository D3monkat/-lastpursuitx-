local Targets, Props, Blips, CraftLock, alcoholCount = {}, {}, {}, false, 0

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job onDuty = PlayerJob.onduty end) Ped = PlayerPedId() end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job end) Ped = PlayerPedId() end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

CreateThread(function()
	local loc = Config.Locations[1]
	local bossroles = {}
	if QBCore.Shared.Jobs and not QBCore.Shared.Jobs[loc.job] then print("^5Debug^7: ^1Can't find the job ^7'^6"..loc.job.."^7' ^1in the core shared files^7") else
		for grade in pairs(QBCore.Shared.Jobs[loc.job].grades) do
			if QBCore.Shared.Jobs[loc.job].grades[grade].isboss == true then
				if bossroles[loc.job] then
					if bossroles[loc.job] > tonumber(grade) then bossroles[loc.job] = tonumber(grade) end
				else bossroles[loc.job] = tonumber(grade) end
			end
		end
	end
	if loc.zoneEnable then
		JobLocation = PolyZone:Create(loc.zones, { name = loc.label, debugPoly = Config.Debug })
		JobLocation:onPlayerInOut(function(isPointInside)
			if PlayerJob.name == loc.job then
				if loc.autoClock and loc.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
				if loc.autoClock and loc.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
			end
		end)
	end
	if loc.blip then Blips[#Blips+1] = makeBlip({ coords = loc.blip, sprite = loc.blipsprite, col = loc.blipcolor, scale = loc.blipscale, disp = loc.blipdisp, category = loc.blipcat, name = loc.label }) end

	Targets["PizzTray"] =
	exports['qb-target']:AddBoxZone("PizzTray", vec3(811.94, -755.57, 26.78-0.5), 0.6, 1.6, { name="PizzTray", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.68, },
		{ options = { {  event = "jim-pizzathis:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["toppings_tray"], stash = "Toppings", job = loc.job }, }, distance = 1.0 })

	Targets["PizzBase"] =
	exports['qb-target']:AddBoxZone("PizzBase", vec3(811.42, -754.55, 26.78-0.5), 0.4, 0.4, { name="PizzBase", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.18, },
		{ options = { {  event = "jim-pizzathis:Crafting", icon = "fas fa-pizza-slice", label = Loc[Config.Lan].targetinfo["prepare_pizza"], job = loc.job, craftable = Crafting.Base, header = Loc[Config.Lan].menu["pizza_base"], coords = vec3(811.42, -754.55, 26.78) }, }, distance = 1.0 })

	Targets["PizzDough"] =
	exports['qb-target']:AddBoxZone("PizzDough", vec3(806.98, -757.05, 26.78-1), 1.2, 3.2, { name="PizzDough", heading = 0.0, debugPoly=Config.Debug, minZ = 25.78, maxZ = 27.58, },
		{ options = { {  event = "jim-pizzathis:Crafting", icon = "fas fa-cookie", label = Loc[Config.Lan].targetinfo["prepare_dough"], job = loc.job, craftable = Crafting.Dough, header = Loc[Config.Lan].menu["dough_mix"], coords = vec3(806.98, -757.05, 26.78) }, }, distance = 1.0 })

	Targets["PizzOven"] =
	exports['qb-target']:AddBoxZone("PizzOven", vec3(808.28, -761.19, 26.78-1), 2.8, 0.7, { name="PizzOven", heading = 0.0, debugPoly=Config.Debug, minZ = 26.18, maxZ = 27.38, },
		{ options = { {  event = "jim-pizzathis:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_oven"], job = loc.job, craftable = Crafting.Oven, header = Loc[Config.Lan].menu["oven_menu"], coords = vec3(808.28, -761.19, 26.78) }, }, distance = 1.0 })

	Targets["PizzChop"] =
	exports['qb-target']:AddBoxZone("PizzChop", vec3(810.45, -765.17, 26.78-1), 0.6, 0.6, { name="PizzChop", heading = 0.0, debugPoly=Config.Debug, minZ = 26.18, maxZ = 27.38, },
		{ options = { {  event = "jim-pizzathis:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].targetinfo["chopping_board"], job = loc.job, craftable = Crafting.ChoppingBoard, header = Loc[Config.Lan].menu["chopping_board"], coords = vec3(810.45, -765.17, 26.78) }, }, distance = 1.0	})

	Targets["PizzChop2"] =
	exports['qb-target']:AddBoxZone("PizzChop2", vec3(809.26, -761.19, 26.78-1), 0.55, 0.4, { name="PizzChop2", heading = 10.0, debugPoly=Config.Debug, minZ = 26.18, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].targetinfo["chopping_board"], job = loc.job, craftable = Crafting.ChoppingBoard, header = Loc[Config.Lan].menu["chopping_board"], coords = vec3(809.26, -761.19, 26.78) }, }, distance = 1.0	})

	Targets["PizzBurner"] =
	exports['qb-target']:AddBoxZone("PizzBurner", vec3(814.05, -752.89, 26.78-1), 2.4, 1.2, { name="PizzBurner", heading = 0.0, debugPoly=Config.Debug, minZ = 25.98, maxZ = 27.98, },
		{ options = { { event = "jim-pizzathis:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["stone_oven"],"Use Stone Oven", job = loc.job, craftable = Crafting.PizzaOven, header = Loc[Config.Lan].menu["stone_pizza"], coords = vec3(814.05, -752.89, 26.78) }, }, distance = 1.0 })

	Targets["PizzWine"] =
	exports['qb-target']:AddBoxZone("PizzWine", vec3(809.34, -761.84, 22.3-1), 0.6, 1.7, { name="PizzWine", heading = 0.0, debugPoly=Config.Debug, minZ = 21.3, maxZ = 22.9, },
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["wine_rack"], job = loc.job, shop = Config.WineItems, coords = vec3(809.34, -761.84, 22.3), shopname = "PizzWine" }, }, distance = 1.5 })
	Targets["PizzWine2"] =
	exports['qb-target']:AddBoxZone("PizzWine2", vec3(807.25, -761.79, 22.3-1), 0.6, 1.7, { name="PizzWine", heading = 0.0, debugPoly=Config.Debug, minZ = 21.3, maxZ = 22.9, },
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["wine_rack"], job = loc.job, shop = Config.WineItems, coords = vec3(807.25, -761.79, 22.3), shopname = "PizzWine" }, }, distance = 1.5 })

	Targets["PizzFridge"] =
	exports['qb-target']:AddBoxZone("PizzFridge", vec3(814.09, -750.07, 26.78-1), 0.6, 0.6, { name="PizzFridge", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=26.83 },
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["drink_fridge"], job = loc.job, shop = Config.DrinkItems, coords = vec3(814.09, -750.07, 26.78), shopname = "PizzFridge" }, }, distance = 1.5 })
	Targets["PizzFridge2"] =
	exports['qb-target']:AddBoxZone("PizzFridge2", vec3(814.07, -748.64, 26.78-1), 0.6, 0.6, { name="PizzFridge2", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=26.83 },
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["drink_fridge"], job = loc.job, shop = Config.DrinkItems, coords = vec3(814.07, -748.64, 26.78), shopname = "PizzFridge" }, }, distance = 1.5 })
	Targets["PizzFridge3"] =
	exports['qb-target']:AddBoxZone("PizzFridge3", vec3(805.68, -761.62, 26.78-1), 1.6, 0.6, { name="PizzFridge3", heading = 0.0, debugPoly=Config.Debug, minZ = 25.98, maxZ = 28.18, },
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["food_fridge"],  job = loc.job, shop = Config.FoodItems, coords = vec3(805.68, -761.62, 26.78), shopname = "PizzFridge3" }, }, distance = 2.0 })
	Targets["PizzFreezer"] =
	exports['qb-target']:AddBoxZone("PizzFreezer", vec3(802.75, -756.85, 26.78-1), 0.6, 4.0, { name="PizzFreezer", heading = 0.0, debugPoly=Config.Debug, minZ = 25.78, maxZ = 28.58, },
		{ options = { {  event = "jim-pizzathis:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_freezer"], job = loc.job, shop = Config.FreezerItems, coords = vec3(802.75, -756.85, 26.78), shopname = "PizzFreezer" }, }, distance = 1.0 })

	Targets["PizzWash1"] =
	exports['qb-target']:AddBoxZone("PizzWash1", vec3(809.47, -765.19, 26.78-0.54), 0.6, 0.8, { name="PizzWash1", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(809.47, -765.19, 26.78) }, }, distance = 1.5 })
	Targets["PizzWash2"] =
	exports['qb-target']:AddBoxZone("PizzWash2", vec3(809.25, -760.15, 26.78-0.5), 0.8, 0.6, { name="PizzWash2", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(809.25, -760.15, 26.78) }, }, distance = 1.5 })
	Targets["PizzWash3"] =
	exports['qb-target']:AddBoxZone("PizzWash3", vec3(813.35, -755.46, 26.78-0.5), 0.4, 0.8, { name="PizzWash3", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(813.35, -755.46, 26.78) }, }, distance = 1.2 })
	Targets["PizzWash4"] =
	exports['qb-target']:AddBoxZone("PizzWash4", vec3(800.88, -767.88, 26.78-1), 0.8, 0.6, { name="PizzWash4", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = loc.job, coords = vec3(800.88, -767.88, 26.78) }, }, distance = 1.5 })
	Targets["PizzWash5"] =
	exports['qb-target']:AddBoxZone("PizzWash5", vec3(800.85, -767.07, 26.78-0.5), 0.8, 0.6, { name="PizzWash5", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(800.85, -767.07, 26.78) }, }, distance = 1.5 })
	Targets["PizzWash6"] =
	exports['qb-target']:AddBoxZone("PizzWash6", vec3(800.85, -761.18, 26.78-1), 0.8, 0.6, { name="PizzWash6", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(800.85, -761.18, 26.78) }, }, distance = 1.2 })
	Targets["PizzWash7"] =
	exports['qb-target']:AddBoxZone("PizzWash7", vec3(800.89, -762.04, 26.78-1), 0.8, 0.6, { name="PizzWash7", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.38, },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(800.89, -762.04, 26.78) }, }, distance = 1.2 })
	Targets["PizzWash8"] =
	exports['qb-target']:AddBoxZone("PizzWash8", vec3(809.9, -765.32, 31.27-1), 0.6, 0.6, { name="PizzWash8", heading = 0.0, debugPoly=Config.Debug, minZ=30.67, maxZ=31.67 },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(809.9, -765.32, 31.27) }, }, distance = 1.2 })
	Targets["PizzWash9"] =
	exports['qb-target']:AddBoxZone("PizzWash9", vec3(808.91, -765.34, 31.27-1), 0.6, 0.6, { name="PizzWash9", heading = 0.0, debugPoly=Config.Debug, minZ=30.67, maxZ=31.67 },
		{ options = { { event = "jim-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(808.91, -765.34, 31.27) }, }, distance = 1.2 })

	Targets["PizzCounter"] =
	exports['qb-target']:AddBoxZone("PizzCounter", vec3(810.98, -752.9, 26.78), 0.6, 0.6, { name="PizzCounter", heading = 9.0, debugPoly=Config.Debug, minZ = 26.78, maxZ = 27.58, },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "CounterRight", coords = vec3(810.98, -752.9, 26.78) }, }, distance = 2.0 })
	Targets["PizzCounter2"] =
	exports['qb-target']:AddBoxZone("PizzCounter2", vec3(810.93, -749.92, 26.78), 0.7, 0.7, { name="PizzCounter2", heading = 30.0, debugPoly=Config.Debug, minZ = 26.78, maxZ = 27.58, },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "CounterLeft", coords = vec3(810.93, -749.92, 26.78) }, }, distance = 2.0 })

	Targets["PizzReceipt"] =
	exports['qb-target']:AddBoxZone("PizzReceipt", vec3(811.32, -750.77, 26.78), 0.7, 0.35, { name="PizzReceipt", heading = 0.0, debugPoly=Config.Debug, minZ = 26.78, maxZ = 27.18, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = loc.job, coords = vec3(811.32, -750.77, 26.78),
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/5/59/PizzaThis.png width=200px></p>", },
						{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
						{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
					}, distance = 2.0 })
	Targets["PizzReceipt2"] =
	exports['qb-target']:AddBoxZone("PizzReceipt2", vec3(811.29, -752.09, 26.78), 0.7, 0.35, { name="PizzReceipt2", heading = 0.0, debugPoly=Config.Debug, minZ = 26.78, maxZ = 27.18, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = loc.job, coords = vec3(811.29, -752.09, 26.78),
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/5/59/PizzaThis.png width=200px></p>", },
						{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
						{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
					}, distance = 2.0 })

	Targets["PizzTap"] =
	exports['qb-target']:AddBoxZone("PizzTap", vec3(814.14, -749.35, 26.78), 0.9, 0.6, { name="PizzTap", heading = 0.0, debugPoly=Config.Debug, minZ = 26.78, maxZ = 27.48, },
		{ options = { { event = "jim-pizzathis:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = loc.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer_menu"], coords = vec3(814.14, -749.35, 26.78) }, }, distance = 1.5 })

	Targets["PizzCoffee"] =
		exports['qb-target']:AddBoxZone("PizzCoffee", vec3(808.78, -765.35, 26.78), 0.6, 0.6, { name="PizzCoffee", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.58, },
			{ options = { { event = "jim-pizzathis:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["pour_coffee"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["coffee_menu"], coords = vec3(808.78, -765.35, 26.78) }, }, distance = 1.5 })
	Targets["PizzCoffee2"] =
		exports['qb-target']:AddBoxZone("PizzCoffee2", vec3(811.49, -764.82, 26.78), 1.6, 0.63, { name="PizzCoffee2", heading = 0.0, debugPoly=Config.Debug, minZ = 26.58, maxZ = 27.58, },
			{ options = { { event = "jim-pizzathis:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["pour_coffee"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["coffee_menu"], coords = vec3(808.78, -765.35, 26.78) }, }, distance = 1.5 })

	Targets["PizzClockin"] =
	exports['qb-target']:AddBoxZone("PizzClockin", vec3(807.15, -761.83, 31.27), 1.2, 0.2, { name="PizzClockin", heading = 0.0, debugPoly=Config.Debug, minZ = 31.27, maxZ = 32.52, },
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job, coords = vec3(807.15, -761.83, 31.27) }, }, distance = 2.0 })
	Targets["PizzClockin2"] =
	exports['qb-target']:AddBoxZone("PizzClockin2", vec3(804.44, -760.52, 31.27-0.5), 0.4, 0.4, { name="PizzClockin2", heading = 0.0, debugPoly=Config.Debug, minZ = 30.87, maxZ = 31.67, },
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job, coords = vec3(804.44, -760.52, 31.27) }, }, distance = 2.0 })

	Targets["PizzBoss"] =
	exports['qb-target']:AddBoxZone("PizzBoss", vec3(797.46, -751.52, 31.27-1), 1.5, 1.0, { name="PizzBoss", heading = 90.0, debugPoly=Config.Debug, minZ = 30.87, maxZ = 31.87, },
		{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, coords = vec3(797.46, -751.52, 31.27) }, }, distance = 2.0 })
	Targets["PizzBoss2"] =
	exports['qb-target']:AddBoxZone("PizzBoss2", vec3(794.91, -767.06, 31.27-1), 0.6, 0.6, { name="PizzBoss2", heading = 90.0, debugPoly=Config.Debug, minZ = 30.87, maxZ = 31.87, },
		{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, coords = vec3(794.91, -767.06, 31.27) }, }, distance = 2.0 })

	Targets["PizzTable"] =
	exports['qb-target']:AddBoxZone("PizzTable", vec3(807.08, -751.57, 26.78-0.5), 1.0, 1.0, { name="PizzTable", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=27.18 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table1" }, }, distance = 2.0 })
	Targets["PizzTable2"] =
	exports['qb-target']:AddBoxZone("PizzTable2", vec3(803.13, -751.59, 26.78-0.5), 1.0, 1.0, { name="PizzTable2", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=27.18 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table2" }, }, distance = 2.0 })
	Targets["PizzTable3"] =
	exports['qb-target']:AddBoxZone("PizzTable3", vec3(799.13, -751.57, 26.78-0.5), 1.0, 1.0, { name="PizzTable3", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=27.18 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table3" }, }, distance = 2.0 })
	Targets["PizzTable4"] =
	exports['qb-target']:AddBoxZone("PizzTable4", vec3(797.96, -748.86, 26.78-0.5), 1.0, 1.0, { name="PizzTable4", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=27.18 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table4" }, }, distance = 2.0 })
	Targets["PizzTable5"] =
	exports['qb-target']:AddBoxZone("PizzTable5", vec3(795.25, -751.55, 26.78-0.5), 1.0, 1.0, { name="PizzTable5", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=27.18 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table5" }, }, distance = 2.0 })
	Targets["PizzTable6"] =
	exports['qb-target']:AddBoxZone("PizzTable6", vec3(799.46, -755.04, 26.78-0.5), 1.0, 1.0, { name="PizzTable6", heading = 0.0, debugPoly=Config.Debug, minZ=25.98, maxZ=27.18 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table6" }, }, distance = 2.0 })
	Targets["PizzTable7"] =
	exports['qb-target']:AddBoxZone("PizzTable7", vec3(807.71, -754.9, 26.78-0.5), 2.0, 0.8, { name="PizzTable7", heading = 0.0, debugPoly=Config.Debug, minZ=26.18, maxZ=26.98 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table7" }, }, distance = 2.0 })
	Targets["PizzTable8"] =
	exports['qb-target']:AddBoxZone("PizzTable8", vec3(805.61, -754.89, 26.78-0.5), 2.0, 0.8, { name="PizzTable8", heading = 0.0, debugPoly=Config.Debug, minZ=26.18, maxZ=26.98 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table8" }, }, distance = 2.0 })
	Targets["PizzTable9"] =
	exports['qb-target']:AddBoxZone("PizzTable9", vec3(803.51, -754.9, 26.78-0.5), 2.0, 0.8, { name="PizzTable9", heading = 0.0, debugPoly=Config.Debug, minZ=26.18, maxZ=26.98 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table9" }, }, distance = 2.0 })
	Targets["PizzTable10"] =
	exports['qb-target']:AddBoxZone("PizzTable10", vec3(801.42, -754.93, 26.78-0.5), 2.0, 0.8, { name="PizzTable10", heading = 0.0, debugPoly=Config.Debug, minZ=26.18, maxZ=26.98 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table10" }, }, distance = 2.0 })
	Targets["PizzTable11"] =
	exports['qb-target']:AddBoxZone("PizzTable11", vec3(799.32, -757.63, 26.78-0.5), 0.8, 1.4, { name="PizzTable11", heading = 0.0, debugPoly=Config.Debug, minZ=26.18, maxZ=26.98 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table11" }, }, distance = 2.0 })
	Targets["PizzTable12"] =
	exports['qb-target']:AddBoxZone("PizzTable12", vec3(799.32, -759.72, 26.78-0.5), 0.8, 1.4, { name="PizzTable12", heading = 0.0, debugPoly=Config.Debug, minZ=26.18, maxZ=26.98 },
		{ options = { { event = "jim-pizzathis:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Table12" }, }, distance = 2.0 })

	-- Quick Prop Changes
	if not Props["box1"] then Props["box1"] = makeProp({prop = `prop_pizza_box_01`, coords = vec4(810.94, -749.94, 28.06, -150.0)}, 1, false) end
	if not Props["box2"] then Props["box2"] = makeProp({prop = `prop_pizza_box_02`, coords = vec4(810.98, -752.89, 28.06, -80.0)}, 1, false) end
	if not Props["clockin"] then Props["clockin"] = makeProp({prop = `v_ind_tor_clockincard`, coords = vec4(807.07, -761.83, 32.27, -270.0)}, 1, false) end
end)

RegisterNetEvent('jim-pizzathis:washHands', function(data)
	lookEnt(data.coords)
	local cam = createTempCam(PlayerPedId(), data.coords)
	if progressBar({ label = Loc[Config.Lan].progressbar["washing_hands"], time = 5000, cancel = true, dict = "mp_arresting", anim = "a_uncuff", flag = 32, icon = data.item, cam = cam }) then
		triggerNotify(nil, Loc[Config.Lan].success["washed_hands"], "success")
	else
		triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
	end
	ClearPedTasks(PlayerPedId())
end)

--[[ CRAFTING ]]--
RegisterNetEvent('jim-pizzathis:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local bartext, bartime, animDictNow, animNow = "", 7000, "anim@heists@prison_heiststation@cop_reactions", "cop_b_idle"
	for i = 1, #Crafting.ChoppingBoard do
		for k, v in pairs(Crafting.ChoppingBoard[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progress["mixing"] bartime = 7000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions" animNow = "cop_b_idle"
			end
		end
	end
	for i = 1, #Crafting.Oven do
		for k, v in pairs(Crafting.Oven[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progress["cooking"] bartime = 5000
				animDictNow = "amb@prop_human_bbq@male@base" animNow = "base"
			end
		end
	end
	for i = 1, #Crafting.PizzaOven do
		for k, v in pairs(Crafting.PizzaOven[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progress["cooking"] bartime = 5000
				animDictNow = "amb@prop_human_bbq@male@base" animNow = "base"
			end
		end
	end
	for i = 1, #Crafting.Beer do
		for k, v in pairs(Crafting.Beer[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progress["pouring"] bartime = 3000
				animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
			end
		end
	end
	if ItemMake == "pizzadough" then
		bartext = Loc[Config.Lan].progress["grabbing"]..QBCore.Shared.Items[ItemMake].label	bartime = 5000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions" animNow = "cop_b_idle"
	elseif ItemMake == "coffee" then
		bartext = Loc[Config.Lan].progress["pouring"]..QBCore.Shared.Items[ItemMake].label bartime = 3000
		animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
	end
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k in pairs(data.craft[data.item]) do data.craft[data.item][k] *= data.amount end
		bartime *= data.amount bartime *= 0.9
	end
	local cam = createTempCam(PlayerPedId(), data.coords)
	CreateThread(function() while CraftLock do playAnim(animDictNow, animNow, bartime, 32) Wait(GetAnimDuration(animDictNow, animNow)*1000) end stopAnim(animDictNow, animNow) end)
	if progressBar({ label = bartext..QBCore.Shared.Items[data.item].label, time = bartime, cancel = true, icon = data.item, cam = cam }) then
		CraftLock = false
		TriggerServerEvent('jim-pizzathis:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-pizzathis:Crafting", data)
	else
		CraftLock = false
		TriggerEvent('inventory:client:busy:status', false)
	end
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('jim-pizzathis:Crafting', function(data)
	if CraftLock then return end
	if not jobCheck() then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	end
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if not QBCore.Shared.Items[k] then print("^5Debug^7: ^2Item not found in server^7: '^6"..k.."^7'") else
				if k ~= "amount" then
					local canShow, disable, setheader, settext, checktable = true, false, "", "", {}
					for l, b in pairs(data.craftable[i][tostring(k)]) do
						if not QBCore.Shared.Items[l] then
							print("^5Debug^7: ^3Ingredient Item^2 not found in server^7: '^6"..l.."^7'") canShow = false
						else
							settext = settext..QBCore.Shared.Items[l].label..(b > 1 and " x"..b or "")..(Config.Menu == "ox" and "\n" or "<br>")
							checktable[l] = HasItem(l, b)
						end
					end
					if canShow then
						for _, v in pairs(checktable) do if v == false then disable = true break end end
						setheader = QBCore.Shared.Items[k].label..(not disable and " ✔️" or "")
						local event = "jim-pizzathis:Crafting:MakeItem"
						if Config.MultiCraft then event = "jim-pizzathis:Crafting:MultiCraft" end
						Menu[#Menu + 1] = {
							disabled = disable,
							icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
							header = setheader, txt = settext, --qb-menu
							params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, coords = data.coords } }, -- qb-menu
							title = setheader, description = settext, -- ox_lib
							event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, coords = data.coords }, -- ox_lib
						}
					end
				end
			end
		end
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu }) exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-pizzathis:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-pizzathis:Crafting", args = data }, event = "jim-pizzathis:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-pizzathis:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k, coords = data.coords },
			params = { event = "jim-pizzathis:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k, coords = data.coords} }
		}
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

--[[STASH SHOPS]]--
RegisterNetEvent('jim-pizzathis:Shop', function(data)
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then  exports.ox_inventory:openInventory('shop', { type = data.shopname }) end
	TriggerServerEvent(event, "shop", "pizzathis", data.shop)
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-pizzathis:Stash', function(data)
	if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', "pizza_"..data.stash)
	else TriggerEvent("inventory:client:SetCurrentStash", "pizza_"..data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizza_"..data.stash) end
	lookEnt(data.coords)
end)

-- [[CONSUME]] --
local function ConsumeSuccess(itemName, type)
    ExecuteCommand("e c")
    toggleItem(false, itemName, 1)
	local change = { thirst = QBCore.Shared.Items[itemName].thirst, hunger = QBCore.Shared.Items[itemName].hunger }
    if change.hunger then
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + change.hunger)
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + change.hunger)
    end
    if change.thirst then
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + change.thirst)
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + change.thirst)
    end
    if type == "alcohol" then alcoholCount += 1
        if alcoholCount > 1 and alcoholCount < 4 then TriggerEvent("evidence:client:SetStatus", "alcohol", 200) elseif alcoholCount >= 4 then TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200) AlienEffect() end
    end
    if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
end

RegisterNetEvent('jim-pizzathis:client:Consume', function(itemName, type)
	local emoteTable = {
		["capricciosa"] = "pizza", ["diavola"] = "pizza", ["marinara"] = "pizza", ["margherita"] = "pizza", ["prosciuttio"] = "pizza", ["vegetariana"] = "pizza",
		["tiramisu"] = "bowl", ["gelato"] = "bowl",
		["medfruits"] = "pineapple",
		["calamari"] = "foodbowl", ["bolognese"] = "foodbowl", ["meatball"] = "foodbowl", ["alla"] = "foodbowl", ["pescatore"] = "foodbowl",
		["ambeer"] = "beer3", ["dusche"] = "beer1", ["logger"] = "beer2", ["pisswasser"] = "beer4", ["pisswasser2"] = "beer5", ["pisswasser3"] = "beer6",
		["amarone"] = "redwine",  ["barbera"] = "redwine",  ["housered"] = "redwine", ["rosso"] = "redwine",
		["dolceto"] = "whitewine", ["housewhite"] = "whitewine",
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk", ["ecola"] = "ecola", ["ecolalight"] = "ecola",
	}
	local progstring, defaultemote = Loc[Config.Lan].progressbar["drinking"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progressbar["eating"] defaultemote = "uwu3" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	if progressBar({label = progstring..QBCore.Shared.Items[itemName].label.."..", time = math.random(3000, 6000), cancel = true, icon = itemName}) then
		ConsumeSuccess(itemName, type)
	else
		ExecuteCommand("e c")
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		for k in pairs(Props) do DeleteEntity(Props[k]) end
		exports['qb-menu']:closeMenu()
	end
end)