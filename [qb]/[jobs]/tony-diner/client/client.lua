local QBCore = exports[Config.Core]:GetCoreObject()

PlayerJob = {}
local Targets, Props, CraftLock = {}, {}, false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerJob.onduty then for k, v in pairs(Config.Locations) do if PlayerData.job.name == v.job then TriggerServerEvent("QBCore:ToggleDuty") end end end end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job for k, v in pairs(Config.Locations) do if PlayerData.job.name == v.job then onDuty = PlayerJob.onduty end end end)
end)

CreateThread(function()
	for k, v in pairs(Config.Locations) do
		local bossroles = {}
		for grade, info in pairs(QBCore.Shared.Jobs[v.job].grades) do
			if info.isboss then
				if bossroles[v.job] then
					if bossroles[v.job] > tonumber(grade) then bossroles[v.job] = tonumber(grade) end
				else bossroles[v.job] = tonumber(grade)	end
			end
		end
		if v.zoneEnable then
			makeBlip({ coords = v.blip, sprite = v.blipsprite, col = v.blipcolor, scale = v.blipscale, disp = v.blipdisp, category = v.blipcat, name = v.label })
			if v.zones then
				JobLocation = PolyZone:Create(v.zones, { name = v.label, debugPoly = Config.Debug })
				JobLocation:onPlayerInOut(function(isPointInside)
					if PlayerJob.name == v.job then
						if v.autoClock and v.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
						if v.autoClock and v.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
					end
				end)
			end
			local propTable = {}
			if k == "lasttrainlegion" then
				Targets["LTWash"] =
					exports['qb-target']:AddBoxZone("LTWash", vec3(123.73, -1039.24, 29.28-0.5), 1.2, 0.6, { name="LTWash", heading = 340.0, debugPoly=Config.Debug, minZ=28.88, maxZ=29.68 },
						{ options = { { event = "frosty-lasttrain:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(123.73, -1039.24, 29.28) }, }, distance = 1.5 })
				Targets["LTCounter"] =
					exports['qb-target']:AddBoxZone("LTCounter", vec3(-377.52, 267.83, 86.49), 0.6, 0.6, { name="LTCounter", heading = 106.0, debugPoly=Config.Debug, minZ=86.49, maxZ=87.29 },
						{ options = { { event = "frosty-lasttrain:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter", coords = vec3(-377.52, 267.83, 86.49) }, }, distance = 2.0 })
				Targets["LTCounter2"] =
					exports['qb-target']:AddBoxZone("LTCounter2", vec3(-375.47, 269.47, 86.49), 0.6, 0.6, { name="LTCounter2", heading = 35.0, debugPoly=Config.Debug, minZ=86.49, maxZ=87.29},
						{ options = { { event = "frosty-lasttrain:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter2", coords = vec3(-375.47, 269.47, 86.49) }, }, distance = 2.0 })

				Targets["LTStorage"] =
					exports['qb-target']:AddBoxZone("LTStorage", vec3(-374.77, 276.65, 86.49), 0.6, 1.2, { name="LTStorage", heading = 35, debugPoly=Config.Debug, minZ=85.49, maxZ=86.69 },
						{ options = { {  event = "frosty-lasttrain:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["store"], job = v.job, coords = vec3(-374.77, 276.65, 86.49), }, }, distance = 2.0 })

				Targets["LTReceipt"] =
					exports['qb-target']:AddBoxZone("LTReceipt", vec3(-376.26, 268.92, 86.49), 0.6, 0.6, { name="LTReceipt", heading = 306.0, debugPoly=Config.Debug, minZ=86.49, maxZ=87.09 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://i.imgur.com/feVn6Mf.png width=100px></p>"
						} }, distance = 2.0 })
				Targets["LTReceipt2"] =
					exports['qb-target']:AddBoxZone("LTReceipt2",vec3(-374.98, 269.83, 86.49), 0.6, 0.6, { name="LTReceipt2", heading = 305.0, debugPoly=Config.Debug, minZ=86.49, maxZ=87.29 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://i.imgur.com/feVn6Mf.png width=100px></p>"
						} }, distance = 2.0 })

				Targets["LTFridge"] =
					exports['qb-target']:AddBoxZone("LTFridge", vec3(-371.89, 269.46, 86.49), 1, 1, { name="LTFridge", heading = 34.0, debugPoly=Config.Debug, minZ=85.49, maxZ=86.49 },
						{ options = { {  event = "frosty-lasttrain:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_storage"], job = v.job, shop = Config.FoodItems, shopname = "LastTrainFridge", coords = vec3(-371.89, 269.46, 86.49) }, }, distance = 1.5 })

				Targets["LTDrink"] =
					exports['qb-target']:AddBoxZone("LTDrink", vec3(-382.56, 271.02, 86.49), 0.8, 1.4, { name="LTDrink", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "frosty-lasttrain:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_food"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["food_menu"], coords = vec3(124.56, -1036.88, 29.28) }, }, distance = 2.0 })

				Targets["LTSlush"] =
					exports['qb-target']:AddBoxZone("LTSlush", vec3(-378.17, 274.05, 86.49), 0.6, 0.6, { name="LTSlush", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08 },
						{ options = { { event = "frosty-lasttrain:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_shake"], job = v.job, craftable = Crafting.Slush, header = Loc[Config.Lan].menu["shake_menu"], coords = vec3(126.07, -1036.59, 29.28) }, }, distance = 2.0 })

				Targets["LTClockin"] =
					exports['qb-target']:AddBoxZone("LTClockin", vec3(-376.85, 268.55, 86.49), 0.2, 0.8, { name="LTClockin", heading = 51.0, debugPoly=Config.Debug, minZ=86.49, maxZ=87.29 },
						{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
									{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
									}, distance = 2.0 })
			end
			for _, prop in pairs(propTable) do makeProp(prop, true, false) end
		end
	end
end)

RegisterNetEvent('frosty-lasttrain:washHands', function(data)
	QBCore.Functions.Progressbar('hand_washing', Loc[Config.Lan].progressbar["washing_hands"], 5000, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		triggerNotify(nil, Loc[Config.Lan].success["success_washed_hands"], 'success')
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false) triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
	end, "fas fa-hand-holding-droplet")
end)

--[[CRAFTING]]--
RegisterNetEvent('frosty-lasttrain:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local bartime = 5000
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k, v in pairs(data.craft[data.item]) do	data.craft[data.item][k] *= data.amount	end
		bartime *= data.amount bartime *= 0.9
	end
	QBCore.Functions.Progressbar('making_food', Loc[Config.Lan].progressbar["making"]..QBCore.Shared.Items[data.item].label, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_ped_interaction", anim = "handshake_guy_a", flags = 8, }, {}, {}, function()
		CraftLock = false
		TriggerServerEvent('frosty-lasttrain:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("frosty-lasttrain:Crafting", data)
	end, function() -- Cancel
		CraftLock = false
		TriggerEvent('inventory:client:busy:status', false)
	end, data.item)
end)

RegisterNetEvent('frosty-lasttrain:Crafting', function(data)
	if CraftLock then return end
	--if not jobCheck() then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	end
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 0 or b == 1 then number = "" else number = " x"..b end
					if not QBCore.Shared.Items[l] then print("^3Error^7: ^2Script can't find ingredient item in QB-Core items.lua - ^1"..l.."^7") return end
					if Config.Menu == "ox" then text = text..QBCore.Shared.Items[l].label..number.."\n" end
					if Config.Menu == "qb" then text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>" end
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				local event = "frosty-lasttrain:Crafting:MakeItem"
                if Config.MultiCraft then event = "frosty-lasttrain:Crafting:MultiCraft" end
				Menu[#Menu + 1] = {
					disabled = disable,
					icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
					header = setheader, txt = settext, --qb-menu
					params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } }, -- qb-menu
					title = setheader, description = settext, -- ox_lib
					event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header }, -- ox_lib
				}
				settext, setheader = nil
			end
		end
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu }) exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('frosty-lasttrain:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end
	end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "frosty-lasttrain:Crafting", args = data }, event = "frosty-lasttrain:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "frosty-lasttrain:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k },
			params = { event = "frosty-lasttrain:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k } }
		}
	end
	if Config.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
end)

--[[STASH SHOPS]]--
RegisterNetEvent('frosty-lasttrain:Stash', function(data)
	--if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', "Last Train "..data.stash) else
	TriggerEvent("inventory:client:SetCurrentStash", "Last Train "..data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "Last Train "..data.stash) end
	lookEnt(data.coords)
end)

RegisterNetEvent('frosty-lasttrain:Shop', function(data)
	--if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then  exports.ox_inventory:openInventory('shop', { type = data.shopname }) end
	TriggerServerEvent(event, "shop", "lasttrain", data.shop)
	lookEnt(data.coords)
end)

-- [[CONSUME]] --
local function ConsumeSuccess(itemName, type)
	ExecuteCommand("e c")
	toggleItem(false, itemName, 1)
	if QBCore.Shared.Items[itemName].hunger then
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
		--TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
	end
	if QBCore.Shared.Items[itemName].thirst then
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		--TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
	end
	if type == "alcohol" then alcoholCount += 1
		if alcoholCount > 1 and alcoholCount < 4 then TriggerEvent("evidence:client:SetStatus", "alcohol", 200)	elseif alcoholCount >= 4 then TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200) AlienEffect() end
	end
	if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
end

RegisterNetEvent('frosty-lasttrain:client:Consume', function(itemName, type)
	local emoteTable = {
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk", ["ecola"] = "ecola",	["ecolalight"] = "ecola",
		["ecocoffee"] = "bmcoffee1", ["flusher"] = "bmcoffee2", ["caffeagra"] = "bmcoffee3",	["crisps"] = "crisps",
		["beandonut"] = "donut2", ["chocolate"] = "egobar",
	}
	local progstring, defaultemote = Loc[Config.Lan].progressbar["drinking"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progressbar["eating"] defaultemote = "burger" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	QBCore.Functions.Progressbar('making_food', progstring..QBCore.Shared.Items[itemName].label.."..", math.random(3000, 6000), false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = 8, }, {}, {}, function()
		ConsumeSuccess(itemName, type)
	end, function() -- Cancel
		ExecuteCommand("e c")
	end, itemName)
end)
AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		for k in pairs(Props) do DeleteEntity(Props[k]) end
		exports['qb-menu']:closeMenu()
	end
end)