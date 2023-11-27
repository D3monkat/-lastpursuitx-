local Targets, Props, alcoholCount, CraftLock = {}, {}, 0, false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job PlayerGang = PlayerData.gang end) end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)
RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo) PlayerGang = GangInfo end)

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job PlayerGang = PlayerData.gang onDuty = PlayerJob.onduty end)
end)

CreateThread(function()
	for _, loc in pairs(Config.Locations) do
		-- Base Variables
		local job, gang, bossroles, gangroles = nil, nil, {}, {}

		if (QBCore.Shared.Jobs[loc.job] or QBCore.Shared.Gangs[loc.gang]) and loc.zoneEnable then
			if loc.job then --Grab Boss role from the qb-core jobs.lua to make bossmenu accessible
				job = (loc.job or nil)
				for grade in pairs(QBCore.Shared.Jobs[job].grades) do
					if QBCore.Shared.Jobs[job].grades[grade].isboss then
						if bossroles[job] then
							if bossroles[job] > tonumber(grade) then bossroles[job] = tonumber(grade) end
						else bossroles[job] = tonumber(grade) end
					end
				end
			elseif loc.gang then --Grab Boss role from the qb-core gangs.lua to make gangmenu accessible
				gang = (loc.gang or nil)
				for grade in pairs(QBCore.Shared.Gangs[gang].grades) do
					if QBCore.Shared.Gangs[gang].grades[grade].isboss then
						if gangroles[gang] then
							if gangroles[gang] > tonumber(grade) then gangroles[gang] = tonumber(grade) end
						else gangroles[gang] = tonumber(grade)	end
					end
				end
			end

			if loc.autoClockOut then
				JobLocation = PolyZone:Create(loc.zones, { name = loc.label, debugPoly = Config.Debug })
				JobLocation:onPlayerInOut(function(isPointInside)
					if PlayerJob.name == job then
						if loc.autoClockOut and loc.autoClockOut.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
						if loc.autoClockOut and loc.autoClockOut.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
					end
				end)
			end

			--Make Blip from locationv
			if loc.Blip.showBlip then makeBlip({ coords = loc.Blip.coords, sprite = loc.Blip.sprite, col = loc.Blip.color, scale = loc.Blip.scale, disp = loc.Blip.disp, category = loc.Blip.category, name = loc.label }) end

			--Target Setup
			if loc.Targets.Clockin then
				for k, v in pairs(loc.Targets.Clockin) do
					name = loc.label.."Clockin"..k

					local options = {}
					if gang then
						options[#options+1] = { event = "qb-gangmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["gang_menu"], gang = gangroles }
					else
						options[#options+1] = { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].target["duty"], job = job, }
						options[#options+1] = { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss_menu"], job = bossroles, }
					end
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, vec3(v.coords.x, v.coords.y, v.coords.z-1), v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top },
						{ options = options, distance = 2.0 })
					if v.prop then Props[#Props+1] = makeProp({prop = `prop_laptop_jimmy`, coords = vec4(v.coords.x, v.coords.y, v.coords.z-1.03, v.h)}, true, false) end
				end
			end
			--Hand Washing Sinks
			if loc.Targets.HandWash then
				for k, v in pairs(loc.Targets.HandWash) do
					name = loc.label.."HandWash"..k
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, vec3(v.coords.x, v.coords.y, v.coords.z-1), v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top+1 },
							{ options = { { event = "jim-bars:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["wash_hands"], coords = v.coords }, }, distance = 1.5 })
				end
			end
			--Shop Locations (Usually a Kitchen Fridge or Under counter Bar fridge)
			if loc.Targets.Shop then
				for k, v in pairs(loc.Targets.Shop) do
					name = loc.label.."Shop"..k
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, vec3(v.coords.x, v.coords.y, v.coords.z-1), v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top+1 },
						{ options = { { event = "jim-bars:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["open_fridge"], job = job, gang = gang, shop = Config.DrinkItems, coords = v.coords, shopid = loc.label }, }, distance = 1.5 })
				end
			end
			-- Cocktail preparation locations
			if loc.Targets.Cocktails then
				for k, v in pairs(loc.Targets.Cocktails) do
					name = loc.label.."Cocktails"..k
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, vec3(v.coords.x, v.coords.y, v.coords.z-1), v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top },
						{ options = { { event = "jim-bars:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].target["prep_cocktail"], job = job, gang = gang, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["cocktail_menu"], coords = v.coords }, }, distance = 2.0 })
					if v.prop then Props[#Props+1] = makeProp({prop = `v_res_mchopboard`, coords = vec4(v.coords.x, v.coords.y, v.coords.z-1, v.h)}, true, false) end
				end
			end
			-- Beer tap locations
			if loc.Targets.Tap then
				for k, v in pairs(loc.Targets.Tap) do
					name = loc.label.."Tap"..k

					Targets[name] =
					exports['qb-target']:AddBoxZone(name, vec3(v.coords.x, v.coords.y, v.coords.z-1), v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top+1 },
						{ options = { { event = "jim-bars:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].target["beer_tap"], job = job, gang = gang, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer_menu"], coords = v.coords }, }, distance = 2.0 })
					if v.prop then Props[#Props+1] = makeProp({prop = `prop_bar_pump_06`, coords = vec4(v.coords.x, v.coords.y, v.coords.z-1.03, v.h)}, true, false) end
				end
			end
			-- Simple coffee location
			if loc.Targets.Coffee then
				for k, v in pairs(loc.Targets.Coffee) do
					name = loc.label.."Coffee"..k
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, v.coords, v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top },
						{ options = { { event = "jim-bars:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].target["pour_coffee"], job = job, gang = gang, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["coffee_menu"], coords = v.coords }, }, distance = 2.0 })
					if v.prop then Props[#Props+1] = makeProp({prop = `prop_coffee_mac_02`, coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.h)}, true, false) end
				end
			end
			-- Simple Tray location
			if loc.Targets.Tray then
				for k, v in pairs(loc.Targets.Tray) do
					name = loc.label.."Tray"..k
					Targets[Targets] =
						exports['qb-target']:AddBoxZone(name, v.coords, v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top },
							{ options = { { event = "jim-bars:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["open_counter"], stash = name, coords = v.coords }, }, distance = 2.5 })
					if v.prop then Props[#Props+1] = makeProp({prop = `prop_food_tray_01`, coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.h)}, true, false) end
				end
			end
			-- Simple Stash location
			if loc.Targets.Storage then
				for k, v in pairs(loc.Targets.Storage) do
					name = loc.label.."Storage"..k
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, v.coords, v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top },
						{ options = { { event = "jim-bars:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["open_storage"], job = job or nil, gang = gang or nil, stash = loc.label.."Storage"..(job or gang)..k, coords = v.coords }, }, distance = 2.5 })
					if v.prop then Props[#Props+1] = makeProp({ prop = `v_med_cor_minifridge`, coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.h)}, true, false) end
				end
			end
			-- Simple Cash Register location
			if loc.Targets.Payment then
				for k, v in pairs(loc.Targets.Payment) do
					name = loc.label.."Payment"..k
					Targets[name] =
					exports['qb-target']:AddBoxZone(name, v.coords, v.l, v.w, { name=name, heading = v.h, debugPoly=Config.Debug, minZ=v.bottom, maxZ=v.top },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = job, gang = gang,
										img = "<center><p><img src="..loc.logo.." width=225px></p>"
									} }, distance = 2.0 })
					if v.prop then Props[#Props+1] = makeProp({prop = `prop_till_03`, coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.h+90)}, true, false) end
				end
			end
		end
	end
end)

RegisterNetEvent('jim-bars:washHands', function(data)
	lookEnt(data.coords)
	local cam = createTempCam(PlayerPedId(), data.coords)
	if progressBar({label = Loc[Config.Lan].progressbar["progress_washing"], time = 5000, cancel = true, dict = "mp_arresting",	anim = "a_uncuff", flag = 8, icon = data.icon, cam = cam }) then
		triggerNotify(nil, Loc[Config.Lan].success["washed_hands"], "success")
	else
		triggerNotify(nil, Loc[Config.Lan].error["cancel"], 'error')
	end
	ClearPedTasks(Ped)
end)

--[[CRAFTING]]--
RegisterNetEvent('jim-bars:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local bartext = ""
	for i = 1, #Crafting.Cocktails do
		for k, v in pairs(Crafting.Cocktails[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progressbar["progress_mix"] bartime = 7000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions" animNow = "cop_b_idle"
			end
		end
	end
	for i = 1, #Crafting.Beer do
		for k, v in pairs(Crafting.Beer[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progressbar["progress_pour"] bartime = 3000
				animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
			end
		end
	end
	if data.item == "coffee" then
		bartext = Loc[Config.Lan].progressbar["progress_pour"] bartime = 3000
		animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
	end
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k, v in pairs(data.craft[data.item]) do	data.craft[data.item][k] *= data.amount	end
		bartime *= data.amount bartime *= 0.9
	end
	local cam = createTempCam(PlayerPedId(), data.coords)

	CreateThread(function() while CraftLock do playAnim(animDictNow, animNow, bartime, 32) Wait(GetAnimDuration(animDictNow, animNow)*1000) end stopAnim(animDictNow, animNow)end)
	if progressBar({label = bartext..QBCore.Shared.Items[data.item].label, time = bartime, cancel = true, icon = data.icon, cam = cam}) then
		CraftLock = false TriggerServerEvent('jim-bars:Crafting:GetItem', data.item, data.craft) Wait(500) TriggerEvent("jim-bars:Crafting", data)
	else
		CraftLock = false TriggerEvent('inventory:client:busy:status', false)
	end
end)

RegisterNetEvent('jim-bars:Crafting', function(data)
	if CraftLock then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "jim-bars:client:Menu:Close" } }
	end
	for i = 1, #data.craftable do
		for k in pairs(data.craftable[i]) do
			if k ~= "amount" and k ~= "job" and k ~= "gang" then
				if data.craftable[i]["job"] then hasjob = false
					for l, b in pairs(data.craftable[i]["job"]) do if l == PlayerJob.name and PlayerJob.grade.level >= b then hasjob = true end	end
				end
				if data.craftable[i]["gang"] then hasjob = false
					for l, b in pairs(data.craftable[i]["gang"]) do if l == PlayerGang.name and PlayerGang.grade.level >= b then hasjob = true end end
				end
				if not QBCore.Shared.Items[k] then print("^5Debug^7: ^2Item not found in server^7: '^6"..k.."^7'") else
					if (data.craftable[i]["job"] or data.craftable[i]["gang"]) and hasjob == false then else
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
						local event = "jim-bars:Crafting:MakeItem"
						if Config.MultiCraft then event = "jim-bars:Crafting:MultiCraft" end
						Menu[#Menu + 1] = {
							disabled = disable,
							icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
							header = setheader, txt = settext, --qb-menu
							params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, anim = data.craftable["anim"], coords = data.coords } }, -- qb-menu
							title = setheader, description = settext, -- ox_lib
							event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, anim = data.craftable["anim"], coords = data.coords  }, -- ox_lib
						}
						settext, setheader = nil
					end
				end
			end
		end Wait(0)
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-bars:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-bars:Crafting", args = data }, event = "jim-bars:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-bars:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, amount = k, coords = data.coords  },
			params = { event = "jim-bars:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, amount = k, coords = data.coords  } }
		}
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-bars:client:Menu:Close', function() exports['qb-menu']:closeMenu() end)

--[[STASH SHOPS]]--
RegisterNetEvent('jim-bars:Stash', function(data)
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', data.stash)
	else TriggerEvent("inventory:client:SetCurrentStash", data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", data.stash) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-bars:Shop', function(data)
	local event = "inventory:server:OpenInventory"
	if (data.job and PlayerJob.name ~= data.job) and (data.gang and PlayerGang.name ~= data.gang) then return end
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then exports.ox_inventory:openInventory('shop', { type = data.shopid }) end
	TriggerServerEvent(event, "shop", "barShop", data.shop)
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

RegisterNetEvent('jim-bars:client:Consume', function(itemName, type)
	local emoteTable = {
		--Beers
		["ambeer"] = "beer3", ["dusche"] = "beer1", ["logger"] = "beer2", ["pisswasser"] = "beer4", ["pisswasser2"] = "beer5", ["pisswasser3"] = "beer6",
		--Cocktails
		["b52"] = "whiskey", ["brussian"] = "whiskey", ["bkamikaze"] = "whiskey", ["cappucc"] = "whiskey", ["ccookie"] = "whiskey", ["iflag"] = "whiskey", ["kamikaze"] = "whiskey", ["sbullet"] = "whiskey", ["voodoo"] = "whiskey", ["woowoo"] = "whiskey",
		--Spirits
		["icream"] = "icream", ["rum"] = "rumb", ["gin"] = "ginb", ["scotch"] = "whiskeyb", ["vodka"] = "vodkab", ["amaretto"] = "vodkab", ["curaco"] = "vodkab",
		--Drinks
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk",
		["ecola"] = "ecola", ["ecolalight"] = "ecola",
		["cranberry"] = "wine",
		--Food
		["crisps"] = "crisps",
	}
	local progstring, defaultemote = Loc[Config.Lan].progressbar["progress_drink"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progressbar["progress_eat"] defaultemote = "burger" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	if progressBar({label = progstring..QBCore.Shared.Items[itemName].label.."..", time = math.random(3000, 6000), cancel = true, icon = itemName}) then
		ConsumeSuccess(itemName, type)
	else
		ExecuteCommand("e c")
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k, v in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		for k, v in pairs(Props) do DeleteEntity(Props[k]) end
		exports['qb-menu']:closeMenu()
	end
end)