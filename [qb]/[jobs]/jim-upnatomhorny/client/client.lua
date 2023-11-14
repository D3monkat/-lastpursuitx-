local Targets, Props, Blips, CraftLock, alcoholCount = {}, {}, {}, false, 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job for k, v in pairs(Config.Locations) do if PlayerData.job.name == v.job then onDuty = PlayerJob.onduty end end end) end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job for k, v in pairs(Config.Locations) do if PlayerData.job.name == v.job then onDuty = PlayerJob.onduty end end end) end)

CreateThread(function()
	local propTable = {}
	if Config.Locations[1].zoneEnable then	-- [[ GNMODS ]] --
		local loc = Config.Locations[1]
		local bossroles = {}
		if QBCore.Shared.Jobs and not QBCore.Shared.Jobs[loc.job] then print("^5Debug^7: ^1Can't find the job ^7'^6"..loc.job.."^7' ^1in the core shared files^7") else
			for grade in pairs(QBCore.Shared.Jobs[loc.job].grades) do
				if QBCore.Shared.Jobs[loc.job].grades[grade].isboss == true then
					if bossroles[loc.job] then
						if bossroles[loc.job] > tonumber(grade) then bossroles[loc.job] = tonumber(grade) end
					else bossroles[loc.job] = tonumber(grade)	end
				end
			end
		end
		if loc.zones then
			JobLocation = PolyZone:Create(loc.zones, { name = loc.label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside)
				if PlayerJob.name == loc.job then
					if loc.autoClock and loc.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
					if loc.autoClock and loc.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
				end
			end)
		end
		if loc.blip then Blips[#Blips+1] = makeBlip({coords = loc.blip, sprite = loc.blipsprite, col = loc.blipcolor, scale = loc.blipscale, disp = loc.blipdisp, category = nil, name = loc.label}) end
		if loc.MLO == "GN" then
			--Targets
		--Stash/Shops
			Targets["AtomShelf"] =
			exports['qb-target']:AddBoxZone("AtomShelf", vec3(82.53, 290.86, 110.22-1), 2.6, 0.5, { name="AtomShelf", heading = 70, debugPoly=Config.Debug, minZ = 109.22, maxZ = 111.62, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "UpNAtom_Shelf", coords = vec3(82.53, 290.86, 110.22), }, },
					distance = 2.0 })
			Targets["AtomShelf2"] =
			exports['qb-target']:AddBoxZone("AtomShelf2", vec3(81.55, 292.69, 110.22-1), 2.6, 0.5, { name="AtomShelf2", heading = 340, debugPoly=Config.Debug, minZ = 109.22, maxZ = 111.42, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "UpNAtom_Shelf2", coords = vec3(81.55, 292.69, 110.22), }, },
					distance = 2.0 })
			Targets["AtomShelfShop"] =
			exports['qb-target']:AddBoxZone("AtomShop", vec3(84.08, 293.3, 110.22-1), 4.2, 0.5, { name="AtomShop", heading = 70, debugPoly=Config.Debug, minZ = 109.22, maxZ = 111.62, },
				{ options = { { event = "jim-upnatomhorny:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_storage"], job = loc.job, shop = Config.AtomIngredients, id = "AtomShop", coords = vec3(84.08, 293.3, 110.22), }, },
					distance = 2.0 })
			Targets["AtomIceCream"] =
			exports['qb-target']:AddBoxZone("AtomIceCream", vec3(90.03, 284.83, 110.22-1), 0.8, 1.6, { name="AtomIceCream", heading = 340, debugPoly=Config.Debug, minZ = 109.02, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_fridge"], job = loc.job, shop = Config.IceCream, id = "AtomiceShop", coords = vec3(90.03, 284.83, 110.22), }, },
					distance = 2.0 })

		--Food Making
			Targets["AtomGrill"] =
			exports['qb-target']:AddBoxZone("AtomGrill", vec3(92.96, 289.9, 110.22-1), 0.8, 1.4, { name="AtomGrill", heading = 340, debugPoly=Config.Debug, minZ = 109.42, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].menu["use_grill"], job = loc.job, craftable = Crafting.AtomGrill, header = Loc[Config.Lan].menu["header_grill"], coords = vec3(92.96, 289.9, 110.22), }, },
					distance = 1.5 })
			Targets["AtomFryer"] =
			exports['qb-target']:AddBoxZone("AtomFryer", vec3(90.05, 291.1, 110.22-1), 0.8, 1.6, { name="AtomFryer", heading = 340, debugPoly=Config.Debug, minZ = 109.42, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].menu["use_deepfryer"], job = loc.job, craftable = Crafting.AtomFryer, header = Loc[Config.Lan].menu["header_deepfryer"], coords = vec3(90.05, 291.1, 110.22), }, },
					distance = 1.5 })
			Targets["AtomBoard"] =
			exports['qb-target']:AddBoxZone("AtomBoard", vec3(90.48, 288.45, 110.22-1), 1.6, 0.5, { name="AtomBoard", heading = 70, debugPoly=Config.Debug, minZ = 109.22, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].menu["use_chop"], job = loc.job, craftable = Crafting.AtomChoppingBoard, header = Loc[Config.Lan].menu["header_chop"], coords = vec3(90.48, 288.45, 110.22), }, },
					distance = 1.5 })
			Targets["AtomPrep"] =
			exports['qb-target']:AddBoxZone("AtomPrep", vec3(89.65, 287.37, 110.22-1), 1.4, 0.5, { name="AtomPrep", heading = 70, debugPoly=Config.Debug, minZ = 109.22, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].menu["prepare_food"], job = loc.job, craftable = Crafting.AtomPrepare, header = Loc[Config.Lan].menu["prepare_food"], coords = vec3(89.65, 287.37, 110.22), }, },
					distance = 1.5 })

		--Drinks
			Targets["AtomDrink"] =
			exports['qb-target']:AddBoxZone("AtomDrink", vec3(93.3, 287.76, 110.22-1), 0.7, 0.5, { name="AtomDrink", heading = 340, debugPoly=Config.Debug, minZ = 109.22, maxZ = 110.82, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.AtomDrink, header = Loc[Config.Lan].menu["header_drink"], coords = vec3(93.3, 287.76, 110.22), }, },
					distance = 1.5 })
			Targets["AtomCoffee"] =
			exports['qb-target']:AddBoxZone("AtomCoffee", vec3(93.52, 288.5, 110.22-1), 0.7, 0.5, { name="AtomCoffee", heading = 340, debugPoly=Config.Debug, minZ = 109.22, maxZ = 110.82, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_coffee"], coords = vec3(93.52, 288.5, 110.22), }, },
					distance = 2.0 })

		--Trays
			Targets["AtomTray1"] =
			exports['qb-target']:AddBoxZone("AtomTray1", vec3(86.03, 284.55, 110.62-1), 1.2, 0.5, { name="AtomTray1", heading = 340.0, debugPoly=Config.Debug, minZ = 109.60, maxZ = 110.82, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "UpNAtom_Tray1", coords = vec3(86.03, 284.55, 110.22), }, },
					distance = 2.5 })
			Targets["AtomTray3"] =
			exports['qb-target']:AddBoxZone("AtomTray2", vec3(95.15, 285.18, 110.62-1), 1.2, 0.5, { name="AtomTray2", heading = 340.0, debugPoly=Config.Debug, minZ = 109.60, maxZ = 110.82, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "UpNAtom_Tray2", }, }, -- Dont add coords here
					distance = 2.0 })

		--Hand Washing
			Targets["AtomWash1"] =
			exports['qb-target']:AddBoxZone("AtomWash1", vec3(92.3, 283.85, 110.22-0.5), 0.5, 0.8, { name="AtomWash1", heading = 340, debugPoly=Config.Debug, minZ = 109.62, maxZ = 110.22, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(92.3, 283.85, 110.22) }, },
					distance = 2.0 })
			Targets["AtomWash2"] =
			exports['qb-target']:AddBoxZone("AtomWash2", vec3(89.78, 275.9, 110.22-0.5), 0.5, 0.5, { name="AtomWash2", heading = 340, debugPoly=Config.Debug, minZ = 109.82, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(89.78, 275.9, 110.22) }, },
					distance = 2.0 })
			Targets["AtomWash3"] =
			exports['qb-target']:AddBoxZone("AtomWash3", vec3(91.83, 281.59, 110.22-0.5), 0.5, 0.5, { name="AtomWash3", heading = 340, debugPoly=Config.Debug, minZ = 109.82, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(91.83, 281.59, 110.22) }, },
					distance = 2.0 })
			Targets["AtomWash4"] =
			exports['qb-target']:AddBoxZone("AtomWash4", vec3(87.22, 293.13, 110.22-0.5), 0.9, 0.7, { name="AtomWash4", heading = 340, debugPoly=Config.Debug, minZ = 109.62, maxZ = 110.42, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(87.22, 293.13, 110.22) }, },
					distance = 2.0 })

		--Payments / Clockin
			Targets["AtomCharge1"] =
			exports['qb-target']:AddBoxZone("AtomCharge1", vec3(86.83, 284.39, 110.22-0.3), 0.5, 0.5, { name="AtomCharge1", heading = 340.0, debugPoly=Config.Debug, minZ = 110.00, maxZ = 110.50, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(86.83, 284.39, 110.22),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
								{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
							}, distance = 2.0 })
			Targets["AtomCharge2"] =
			exports['qb-target']:AddBoxZone("AtomCharge2", vec3(85.04, 285.61, 110.22-0.3), 0.5, 0.5, { name="AtomCharge2", heading = 15, debugPoly=Config.Debug, minZ = 110.00, maxZ = 110.50, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(85.04, 285.61, 110.22),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
								{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job }
							}, distance = 2.0 })
			Targets["AtomCharge3"] =
			exports['qb-target']:AddBoxZone("AtomCharge3", vec3(95.03, 286.14, 110.22-0.3), 0.5, 0.5, { name="AtomCharge3", heading = 325, debugPoly=Config.Debug, minZ = 110.00, maxZ = 110.50, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(95.03, 286.14, 110.22),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
							{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
						}, distance = 2.0 })
			Targets["AtomClock"] =
			exports['qb-target']:AddBoxZone("AtomClock", vec3(94.46, 292.78, 110.22), 1.15, 0.75, { name="AtomClock", heading = 340, debugPoly=Config.Debug, minZ = 109.82, maxZ = 110.82, },
					{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
								{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
								}, distance = 2.5 })
		elseif loc.MLO == "GABZ" then --[[GABZ]]--
			--Targets
		--Stash/Shops
			Targets["AtomShelf"] =
			exports['qb-target']:AddBoxZone("AtomShelf", vec3(91.66, 288.71, 110.21-0.3), 1.9, 0.7, { name="AtomShelf", heading = 25.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "UpNAtom_Shelf", coords = vec3(91.66, 288.71, 110.21), }, },
					distance = 2.0 })

			Targets["AtomIng1"] =
			exports['qb-target']:AddBoxZone("AtomIng1", vec3(95.21, 288.51, 110.21-0.5), 1.5, 1.0, { name="AtomIng1", heading = 340.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "UpNAtom_Ingredients", coords = vec3(95.21, 288.51, 110.21), }, },
					distance = 2.0 })
			Targets["AtomIng2"] =
			exports['qb-target']:AddBoxZone("AtomIng2", vec3(93.7, 288.14, 110.21-0.5), 1.5, 1.0, { name="AtomIng2", heading = 70.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "UpNAtom_Ingredients", coords = vec3(93.7, 288.14, 110.21), }, },
					distance = 2.0 })

			Targets["AtomShop"] =
			exports['qb-target']:AddBoxZone("AtomShop", vec3(88.79, 292.04, 110.21-1), 1.9, 0.7, { name="AtomShop", heading = 70.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 111.61, },
				{ options = { { event = "jim-upnatomhorny:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_storage"], job = loc.job, shop = Config.AtomIngredients, id = "AtomShop", coords = vec3(88.79, 292.04, 110.21), }, },
					distance = 2.0 })
			Targets["AtomIceCream"] =
			exports['qb-target']:AddBoxZone("AtomIceCream", vec3(89.56, 294.13, 110.21-1), 1.9, 0.7, { name="AtomIceCream", heading = 70.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 111.61, },
				{ options = { { event = "jim-upnatomhorny:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_fridge"], job = loc.job, shop = Config.IceCream, id = "AtomiceShop", coords = vec3(89.56, 294.13, 110.21), }, },
					distance = 2.0 })

		--Food Making
			Targets["AtomGrill"] =
			exports['qb-target']:AddBoxZone("AtomGrill", vec3(93.93, 291.83, 110.21-1), 1.5, 1.0, { name="AtomGrill", heading = 340.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].menu["use_grill"], job = loc.job, craftable = Crafting.AtomGrill, header = Loc[Config.Lan].menu["header_grill"], coords = vec3(93.93, 291.83, 110.21), }, },
					distance = 1.5 })

			Targets["AtomFryer"] =
			exports['qb-target']:AddBoxZone("AtomFryer", vec3(93.04, 292.16, 110.21-1), 1.5, 1.0, { name="AtomFryer", heading = 340, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].menu["use_deepfryer"], job = loc.job, craftable = Crafting.AtomFryer, header = Loc[Config.Lan].menu["header_deepfryer"], coords = vec3(93.04, 292.16, 110.21), }, },
					distance = 1.5 })


			Targets["AtomBoard"] =
			exports['qb-target']:AddBoxZone("AtomBoard", vec3(96.93, 293.1, 110.21-1), 1.5, 1.0, { name="AtomBoard", heading = 340.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].menu["use_chop"], job = loc.job, craftable = Crafting.AtomChoppingBoard, header = Loc[Config.Lan].menu["header_chop"], coords = vec3(90.48, 288.45, 110.22), }, },
					distance = 1.5 })
			Targets["AtomPrep"] =
			exports['qb-target']:AddBoxZone("AtomPrep", vec3(93.07, 290.8, 110.21-1), 1.5, 1.0, { name="AtomPrep", heading = 70.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].menu["prepare_food"], job = loc.job, craftable = Crafting.AtomPrepare, header = Loc[Config.Lan].menu["prepare_food"], coords = vec3(93.07, 290.8, 110.21), }, },
					distance = 1.5 })
			Targets["AtomPrep2"] =
			exports['qb-target']:AddBoxZone("AtomPrep2", vec3(93.92, 293.16, 110.21-1), 1.5, 1.0, { name="AtomPrep2", heading = 70.0, debugPoly=Config.Debug, minZ = 109.21, maxZ = 110.81, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].menu["prepare_food"], job = loc.job, craftable = Crafting.AtomPrepare, header = Loc[Config.Lan].menu["prepare_food"], coords = vec3(93.92, 293.16, 110.21), }, },
					distance = 1.5 })
		--Drinks
			Targets["AtomDrink"] =
			exports['qb-target']:AddBoxZone("AtomDrink", vec3(93.51, 287.27, 110.21-0.2), 0.65, 0.6, { name="AtomDrink", heading = 70.0, debugPoly=Config.Debug, minZ = 109.81, maxZ = 111.21, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.AtomDrink, header = Loc[Config.Lan].menu["header_drink"], coords = vec3(93.51, 287.27, 110.21), }, },
					distance = 1.5 })
			Targets["AtomCoffee"] =
			exports['qb-target']:AddBoxZone("AtomCoffee", vec3(92.85, 287.49, 110.21-0.2), 0.7, 0.6, { name="AtomCoffee", heading = 70.0, debugPoly=Config.Debug, minZ = 109.81, maxZ = 111.21, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_coffee"], coords = vec3(92.85, 287.49, 110.21), }, },
					distance = 2.0 })



			Targets["AtomShake"] =
			exports['qb-target']:AddBoxZone("AtomShake", vec3(92.29, 287.73, 110.21-0.2), 0.65, 0.5, { name="AtomShake", heading = 340.0, debugPoly=Config.Debug, minZ = 109.81, maxZ = 111.21, },
				{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.AtomShakes, header = Loc[Config.Lan].menu["header_coffee"], coords = vec3(92.29, 287.73, 110.21), }, },
					distance = 2.0 })

		--Trays
			Targets["AtomTray1"] =
			exports['qb-target']:AddBoxZone("AtomTray1", vec3(89.13, 288.13, 110.21-0.3), 0.6, 0.6, { name="AtomTray1", heading = 295.0, debugPoly=Config.Debug, minZ = 109.81, maxZ = 110.41, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "UpNAtom_Tray1", coords = vec3(89.13, 288.13, 110.21), }, },
					distance = 2.5 })
			Targets["AtomTray2"] =
			exports['qb-target']:AddBoxZone("AtomTray2", vec3(89.76, 286.96, 110.21-0.3), 0.6, 0.6, { name="AtomTray2", heading = 295.0, debugPoly=Config.Debug, minZ = 109.81, maxZ = 110.41, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "UpNAtom_Tray2", coords = vec3(89.76, 286.96, 110.21), }, }, -- Dont add coords here
					distance = 2.0 })
			Targets["AtomTray3"] =
			exports['qb-target']:AddBoxZone("AtomTray3", vec3(90.38, 285.79, 110.21-0.3), 0.6, 0.6, { name="AtomTray3", heading = 295.0, debugPoly=Config.Debug, minZ = 109.81, maxZ = 110.41, },
				{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "UpNAtom_Tray3", coords = vec3(90.38, 285.79, 110.21), }, }, -- Dont add coords here
					distance = 2.0 })

		--Hand Washing
			Targets["AtomWash1"] =
			exports['qb-target']:AddBoxZone("AtomWash1", vec3(79.5, 278.88, 110.21-0.3), 0.6, 0.6, { name="AtomWash1", heading = 340.0, debugPoly=Config.Debug, minZ=109.81, maxZ=110.61, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(79.5, 278.88, 110.21) }, },
					distance = 2.0 })
			Targets["AtomWash2"] =
			exports['qb-target']:AddBoxZone("AtomWash2", vec3(79.22, 278.04, 110.21-0.3), 0.6, 0.6, { name="AtomWash2", heading = 340.0, debugPoly=Config.Debug, minZ=109.81, maxZ=110.61, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(79.22, 278.04, 110.21) }, },
					distance = 2.0 })
			Targets["AtomWash3"] =
			exports['qb-target']:AddBoxZone("AtomWash3", vec3(78.9, 277.23, 110.21-0.3), 0.6, 0.6, { name="AtomWash3", heading = 340.0, debugPoly=Config.Debug, minZ=109.81, maxZ=110.61, },
				{ options = { { event = "jim-upnatomhorny:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(78.9, 277.23, 110.21) }, },
					distance = 2.0 })
		--Payments / Clockin
			Targets["AtomCharge1"] =
			exports['qb-target']:AddBoxZone("AtomCharge1", vec3(90.2, 286.44, 110.21-0.3), 0.6, 0.6, { name="AtomCharge1", heading = 25.0, debugPoly=Config.Debug, minZ = 110.01, maxZ = 110.81, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(90.2, 286.44, 110.21),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
								{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
							}, distance = 2.0 })
			Targets["AtomCharge2"] =
			exports['qb-target']:AddBoxZone("AtomCharge2", vec3(89.7, 287.65, 110.21-0.3), 0.6, 0.6, { name="AtomCharge2", heading = 25.0, debugPoly=Config.Debug, minZ = 110.01, maxZ = 110.81, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(89.7, 287.65, 110.21),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
								{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job }
							}, distance = 2.0 })
			Targets["AtomCharge3"] =
			exports['qb-target']:AddBoxZone("AtomCharge3", vec3(89.12, 288.82, 110.21-0.3), 0.6, 0.6, { name="AtomCharge3", heading = 25.0, debugPoly=Config.Debug, minZ = 110.01, maxZ = 110.81, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(89.12, 288.82, 110.21),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
							{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
						}, distance = 2.0 })
			Targets["AtomCharge4"] =
			exports['qb-target']:AddBoxZone("AtomCharge4", vec3(94.44, 284.63, 110.21-0.3), 0.4, 0.4, { name="AtomCharge4", heading = 330.0, debugPoly=Config.Debug, minZ = 110.01, maxZ = 110.81, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(94.44, 284.63, 110.21),
								img = "<center><p><img src=https://i.imgur.com/55lm2PR.jpg width=100px></p>" },
							{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
						}, distance = 2.0 })

			Targets["AtomClock"] =
			exports['qb-target']:AddBoxZone("AtomClock", vec3(88.21, 297.99, 110.21), 1.8, 0.5, { name="AtomClock", heading = 70.0, debugPoly=Config.Debug, minZ = 108.01, maxZ = 111.41, },
					{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
								{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
								}, distance = 2.5 })
		end
	end
	if Config.Locations[2].zoneEnable then	-- [[ GABZ MIRROR PARK ]] --
		local loc = Config.Locations[2]
		local bossroles = {}
		if QBCore.Shared.Jobs and not QBCore.Shared.Jobs[loc.job] then print("^5Debug^7: ^1Can't find the job ^7'^6"..loc.job.."^7' ^1in the core shared files^7") else
			for grade in pairs(QBCore.Shared.Jobs[loc.job].grades) do
				if QBCore.Shared.Jobs[loc.job].grades[grade].isboss == true then
					if bossroles[loc.job] then
						if bossroles[loc.job] > tonumber(grade) then bossroles[loc.job] = tonumber(grade) end
					else bossroles[loc.job] = tonumber(grade)	end
				end
			end
		end
		if loc.zones then
			JobLocation = PolyZone:Create(loc.zones, { name = loc.label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside)
				if PlayerJob.name == loc.job then
					if loc.autoClock and loc.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
					if loc.autoClock and loc.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
				end
			end)
		end
		if loc.blip then Blips[#Blips+1] = makeBlip({coords = loc.blip, sprite = loc.blipsprite or 106, col = loc.blipcolor, scale = loc.blipscale, disp = loc.blipdisp, category = nil, name = loc.label}) end
		if loc.MLO == "GABZ" then
		--Targets
		--Stash/Shops
		Targets["HornysShelf"] =
		exports['qb-target']:AddBoxZone("HornysShelf", vec3(1251.87, -356.89, 69.08-0.3), 1.5, 0.6, { name="HornysShelf", heading = 255.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 70.28, },
			{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "Hornys_Shelf", coords = vec3(1251.87, -356.89, 69.08), }, },
				distance = 2.0 })


		Targets["HornysIng1"] =
		exports['qb-target']:AddBoxZone("HornysIng1", vec3(1248.15, -351.86, 69.08-0.3), 1.5, 0.6, { name="HornysIng1", heading = 75.0, debugPoly=Config.Debug, minZ = 68.28, maxZ = 70.68, },
			{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_shelves"], job = loc.job, stash = "Hornys_Ingredients", coords = vec3(1248.15, -351.86, 69.08), }, },
				distance = 2.0 })

		Targets["HornysShop"] =
		exports['qb-target']:AddBoxZone("HornysShop", vec3(1249.61, -352.16, 69.08-1), 1.5, 0.6, { name="HornysShop", heading = 75.0, debugPoly=Config.Debug, minZ = 68.28, maxZ = 70.68, },
			{ options = { { event = "jim-upnatomhorny:Shop", icon = "fas fa-temperature-low", label = Loc[Config.Lan].targetinfo["open_storage"], job = loc.job, shop = Config.HornyIngredients, id = "HornyShop", coords = vec3(1249.61, -352.16, 69.08), }, },
				distance = 2.0 })

	--Food Making
		Targets["HornysGrill"] =
		exports['qb-target']:AddBoxZone("HornysGrill", vec3(1253.5, -355.54, 69.08-1), 1.5, 1.0, { name="HornysGrill", heading = 345.0, debugPoly=Config.Debug, minZ = 68.08, maxZ = 69.68, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-fire", label = Loc[Config.Lan].menu["use_grill"], job = loc.job, craftable = Crafting.HornyGrill, header = Loc[Config.Lan].menu["header_grill"], coords = vec3(1253.5, -355.54, 69.08), }, },
				distance = 1.5 })

		Targets["HornysFryer"] =
		exports['qb-target']:AddBoxZone("HornysFryer", vec3(1254.23, -352.86, 69.08-1.0), 1.5, 1.0, { name="HornysFryer", heading = 345.0, debugPoly=Config.Debug, minZ = 68.08, maxZ = 69.68, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].menu["use_deepfryer"], job = loc.job, craftable = Crafting.HornyFryer, header = Loc[Config.Lan].menu["header_deepfryer"], coords = vec3(1254.23, -352.86, 69.08), }, },
				distance = 1.5 })
		Targets["HornysBoard"] =
		exports['qb-target']:AddBoxZone("HornysBoard", vec3(1249.57, -355.69, 69.08-1.0), 1.5, 1.0, { name="HornysBoard", heading = 75.0, debugPoly=Config.Debug, minZ = 68.28, maxZ = 70.68, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].menu["use_chop"], job = loc.job, craftable = Crafting.HornyChoppingBoard, header = Loc[Config.Lan].menu["header_chop"], coords = vec3(1249.57, -355.69, 69.08), }, },
				distance = 1.5 })
		Targets["HornysPrep"] =
		exports['qb-target']:AddBoxZone("HornysPrep", vec3(1251.99, -356.29, 69.08-0.5), 1.5, 0.5, { name="HornysPrep", heading = 75.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 69.28, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].menu["prepare_food"], job = loc.job, craftable = Crafting.HornyPrepare, header = Loc[Config.Lan].menu["prepare_food"], coords = vec3(1251.99, -356.29, 69.08), }, },
				distance = 1.5 })

		Targets["HornysDeserts"] =
		exports['qb-target']:AddBoxZone("HornysDeserts", vec3(1248.78, -356.47, 69.08), 0.9, 0.6, { name="HornysDeserts", heading = 75.0, debugPoly=Config.Debug, minZ = 68.28, maxZ = 70.48, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_storage"], job = loc.job, craftable = Crafting.HornyDeserts, header = Loc[Config.Lan].targetinfo["open_storage"], coords = vec3(1248.78, -356.47, 69.08), }, },
				distance = 1.5 })

	--Drinks
		Targets["HornysDrink"] =
		exports['qb-target']:AddBoxZone("HornysDrink", vec3(1246.37, -356.68, 69.08-0.3), 1.0, 0.6, { name="HornysDrink", heading = 345.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 69.88, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.HornyDrinks, header = Loc[Config.Lan].menu["header_drink"], coords = vec3(1246.37, -356.68, 69.08), }, },
				distance = 1.5 })
		Targets["HornysCoffee"] =
		exports['qb-target']:AddBoxZone("HornysCoffee", vec3(1246.08, -357.54, 69.08-0.3), 0.7, 0.6, { name="HornysCoffee", heading = 345.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 69.88, },
			{ options = { { event = "jim-upnatomhorny:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].menu["prepare_drinks"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_coffee"], coords = vec3(1246.08, -357.54, 69.08), }, },
				distance = 2.0 })


	--Trays
		Targets["HornysTray1"] =
		exports['qb-target']:AddBoxZone("HornysTray1", vec3(1251.42, -359.71, 69.08-0.3), 0.6, 0.6, { name="HornysTray1", heading = 345.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 69.48, },
			{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "Hornys_Tray1", coords = vec3(1251.42, -359.71, 69.08), }, },
				distance = 2.5 })
		Targets["HornysTray2"] =
		exports['qb-target']:AddBoxZone("HornysTray2", vec3(1250.05, -359.36, 69.08-0.3), 0.6, 0.6, { name="HornysTray2", heading = 345.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 69.48, },
			{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "Hornys_Tray2", coords = vec3(1250.05, -359.36, 69.08), }, }, -- Dont add coords here
				distance = 2.0 })
		Targets["HornysTray3"] =
		exports['qb-target']:AddBoxZone("HornysTray3", vec3(1248.76, -358.95, 69.08-0.3), 0.6, 0.6, { name="HornysTray3", heading = 345.0, debugPoly=Config.Debug, minZ = 68.48, maxZ = 69.48, },
			{ options = { { event = "jim-upnatomhorny:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_tray"], stash = "Hornys_Tray3", coords = vec3(1248.76, -358.95, 69.08), }, }, -- Dont add coords here
				distance = 2.0 })

	--Payments / Clockin
		Targets["HornysCharge1"] =
		exports['qb-target']:AddBoxZone("HornysCharge1", vec3(1250.78, -359.51, 69.08-0.3), 0.6, 0.6, { name="HornysCharge1", heading = 345.0, debugPoly=Config.Debug, minZ = 68.68, maxZ = 69.68, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(1250.78, -359.51, 69.08),
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/a/a0/Horny%27sBurgers-GTAV-Logo.png width=100px></p>" },
							{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
						}, distance = 2.0 })
		Targets["HornysCharge2"] =
		exports['qb-target']:AddBoxZone("HornysCharge2", vec3(1249.4, -359.1, 69.08-0.3), 0.6, 0.6, { name="HornysCharge2", heading = 345.0, debugPoly=Config.Debug, minZ = 68.68, maxZ = 69.68, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(1249.4, -359.1, 69.08),
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/a/a0/Horny%27sBurgers-GTAV-Logo.png width=100px></p>" },
							{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job }
						}, distance = 2.0 })
		Targets["HornysCharge3"] =
		exports['qb-target']:AddBoxZone("HornysCharge3", vec3(1248.1, -358.76, 69.08-0.3), 0.6, 0.6, { name="HornysCharge3", heading = 345.0, debugPoly=Config.Debug, minZ = 68.68, maxZ = 69.68, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(1248.1, -358.76, 69.08),
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/a/a0/Horny%27sBurgers-GTAV-Logo.png width=100px></p>" },
						{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
					}, distance = 2.0 })
		Targets["HornysCharge4"] =
		exports['qb-target']:AddBoxZone("HornysCharge4", vec3(1252.88, -357.58, 69.08-0.3), 0.6, 0.6, { name="HornysCharge4", heading = 345.0, debugPoly=Config.Debug, minZ = 68.68, maxZ = 69.68, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge"], job = loc.job, coords = vec3(1252.88, -357.58, 69.08),
							img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/a/a0/Horny%27sBurgers-GTAV-Logo.png width=100px></p>" },
						{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
					}, distance = 2.0 })

		Targets["HornysClock"] =
		exports['qb-target']:AddBoxZone("HornysClock", vec3(1243.54, -349.88, 69.08-0.2), 1.8, 0.3, { name="HornysClock", heading = 75.0, debugPoly=Config.Debug, minZ = 68.88, maxZ = 70.48, },
				{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = loc.job },
							{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
							}, distance = 2.5 })
		end
	end
	for _, prop in pairs(propTable) do Props[#Props+1] = makeProp(prop, true, false) end
end)

RegisterNetEvent('jim-upnatomhorny:washHands', function(data)
	lookEnt(data.coords) Wait(1000)
	local cam = createTempCam(PlayerPedId(), data.coords)
	if progressBar({ label = Loc[Config.Lan].progressbar["progress_washing"], time = 5000, cancel = true, dict = "mp_arresting", anim = "a_uncuff", flag = 8, icon = "fas fa-hand-holding-droplet", cam = cam }) then
		triggerNotify(nil, Loc[Config.Lan].success["washed_hands"], 'success')
	else
		triggerNotify(nil, Loc[Config.Lan].error["cancel"], 'error')
	end
	ClearPedTasks(PlayerPedId())
end)

--[[ CRAFTING ]]--
RegisterNetEvent('jim-upnatomhorny:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local cam = createTempCam(PlayerPedId(), data.coords)
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k in pairs(data.craft[data.item]) do data.craft[data.item][k] *= data.amount end
		data.anim.bartime *= data.amount
		data.anim.bartime *= 0.9
	end
	CreateThread(function() while CraftLock do playAnim(data.anim.animDict, data.anim.anim, data.anim.bartime, 32) Wait(GetAnimDuration(data.anim.animDict, data.anim.anim)*1000) end stopAnim(data.anim.animDict, data.anim.anim)	end)
	if progressBar({ label = data.anim.bartext.." "..QBCore.Shared.Items[data.item].label, time = data.anim.bartime, cancel = true, icon = data.item, cam = cam }) then
		CraftLock = false
		TriggerServerEvent('jim-upnatomhorny:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-upnatomhorny:Crafting", data)
	else
		CraftLock = false
	end
end)

RegisterNetEvent('jim-upnatomhorny:Crafting', function(data)
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
						local event = "jim-upnatomhorny:Crafting:MakeItem"
						if Config.MultiCraft then event = "jim-upnatomhorny:Crafting:MultiCraft" end
						Menu[#Menu + 1] = {
							disabled = disable,
							icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
							header = setheader, txt = settext, --qb-menu
							params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, anim = data.craftable["anim"], coords = data.coords } }, -- qb-menu
							title = setheader, description = settext, -- ox_lib
							event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, anim = data.craftable["anim"], coords = data.coords }, -- ox_lib
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

RegisterNetEvent('jim-upnatomhorny:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-upnatomhorny:Crafting", args = data }, event = "jim-upnatomhorny:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-upnatomhorny:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k, coords = data.coords },
			params = { event = "jim-upnatomhorny:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k, coords = data.coords } }
		}
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

--[[STASH SHOPS]]--
RegisterNetEvent('jim-upnatomhorny:Stash', function(data)
	if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', tostring(data.stash))
	else TriggerEvent("inventory:client:SetCurrentStash", tostring(data.stash))
	TriggerServerEvent("inventory:server:OpenInventory", "stash", tostring(data.stash)) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-upnatomhorny:Shop', function(data)
	if Config.Inv == "ox" and not Config.JimShop then exports.ox_inventory:openInventory('shop', { type = tostring(data.id) }) else
	TriggerServerEvent(((Config.JimShop) and "jim-shops:ShopOpen" or "inventory:server:OpenInventory"), "shop", "upnatom", data.shop) end
	lookEnt(data.coords)
end)

--[[CONSUME]]--
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

RegisterNetEvent('jim-upnatomhorny:client:Consume', function(itemName, type)
	local emoteTable = {
		["atomfries"] = "atomfries", ["chillidog"] = "atomhotdog",

		["ecola"] = "ecola", ["ecolalight"] = "ecola",
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk",
		["raine"] = "ecola", ["junkdrink"] = "ecola", ["organotang"] = "ecola",
		["creamyshake"] = "atomdrink", ["atomsoda"] = "atomdrink",
	}
	local progstring, defaultemote = Loc[Config.Lan].progressbar["progress_drink"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progressbar["progress_eat"] defaultemote = "burger" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	if progressBar({label = progstring.." "..QBCore.Shared.Items[itemName].label.."..", time = math.random(3000, 6000), cancel = true, icon = itemName}) then
		ConsumeSuccess(itemName, type)
	else
		ExecuteCommand("e c")
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do removeZone(k) end
		for k in pairs(Props) do DeleteEntity(Props[k]) end
		exports['qb-menu']:closeMenu()
	end
end)