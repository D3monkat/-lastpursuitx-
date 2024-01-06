AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	for _, loc in pairs(Config.Locations) do
		if (QBCore.Shared.Jobs[loc.job] or QBCore.Shared.Gangs[loc.gang]) and loc.zoneEnable then
			--Built-in DJ Booth location creation
			local Booth = loc.Booth
			if loc.Booth.enableBooth then
				TriggerEvent("jim-djbooth:server:AddLocation", { job = loc.job, enableBooth = Booth.enableBooth, DefaultVolume = Booth.DefaultVolume, radius = Booth.radius, coords = Booth.coords })
			end
		end
	end
	for k, v in pairs(Crafting) do for i = 1, #v do for l, b in pairs(v[i]) do if l ~= "amount" and l ~= "job" and l ~= "gang" then
		if not QBCore.Shared.Items[l] then print("Crafting: Missing Item from QBCore.Shared.Items: '"..l.."'") end
		for j, c in pairs(b) do if not QBCore.Shared.Items[j] then print("Crafting: Missing Ingredient Item from QBCore.Shared.Items: '"..j.."'") end end end end end
	end
	for i = 1, #Config.DrinkItems.items do
		if not QBCore.Shared.Items[Config.DrinkItems.items[i].name] then print("Store: Missing Item from QBCore.Shared.Items: '"..Config.DrinkItems.items[i].name.."'") end
	end
	for _, v in pairs(Config.Locations) do
		--if Config.Debug then print("Loading Job into script: '"..v.label.."'") end
		if v.job then if not QBCore.Shared.Jobs[v.job] then print("Error: Job role not found - '"..v.job.."' for location: "..v.label) end end
		if v.gang then if not QBCore.Shared.Gangs[v.gang] then print("Error: Gang role not found - '"..v.gang.."' for location: "..v.label) end end
	end
end)

--Consumables
if not Config.JimConsumables then
	local cocktails = { "b52", "brussian", "bkamikaze", "cappucc", "ccookie", "iflag", "kamikaze", "sbullet",
						"voodoo", "woowoo", "schnapps", "gin", "scotch", "rum", "icream", "amaretto", "curaco", "vodka" }
    for _, v in pairs(cocktails) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-bars:client:Consume', source, item.name, "alcohol") end) end

	local beers = { "ambeer", "dusche", "logger", "pisswasser", "pisswasser2", "pisswasser3" }
    for _, v in pairs(beers) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-bars:client:Consume', source, item.name, "alcohol") end) end

	local drinks = { "sprunk", "sprunklight", "ecola", "ecolalight", "cranberry" }
    for _, v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-bars:client:Consume', source, item.name, "drink") end) end

	local food = { "chocolate", "crisps" }
    for _, v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-bars:client:Consume', source, item.name, "food") end) end
else
	local foodTable = {
		["b52"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["brussian"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["bkamikaze"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["cappucc"] = { emote = "browncup", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["ccookie"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["iflag"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["kamikaze"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["sbullet"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["voodoo"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["woowoo"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["schnapps"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["gin"] = { emote = "ginb", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["scotch"] = { emote = "whiskeyb", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["rum"] = { emote = "rumb", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["icream"] = { emote = "icream", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["amaretto"] = { emote = "vodkab", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["curaco"] = { emote = "vodkab", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["ambeer"] = { emote = "beer3", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["dusche"] = { emote = "beer1", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["logger"] = { emote = "beer2", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["pisswasser"] = { emote = "beer4", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["pisswasser2"] = { emote = "beer5", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["pisswasser3"] = { emote = "beer6", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
		["cranberry"] = { emote = "wine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50), }},
		["ecola"] = { emote = "ecola", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
		["ecolalight"] = { emote = "ecola", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
		["sprunk"] = { emote = "sprunk", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
		["sprunklight"] = { emote = "sprunk", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
		["crisps"] = { emote = "crisps", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
	}
	local emoteTable = {
		["browncup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Brown Cup", AnimationOptions = { Prop = 'v_serv_bs_mug', PropBone = 28422, PropPlacement = {0.03, -0.02, 0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions = { Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},
		["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions = { Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
		["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions = { Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},	EmoteMoving = true, EmoteLoop = true }},
		["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions = { Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},	EmoteMoving = true, EmoteLoop = true }},
		["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions = { Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
		["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions = { Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0}, EmoteLoop = true, EmoteMoving = true, }},
		["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions = { Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions = { Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions = { Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions = { Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions = { Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions = { Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions = { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
	}
	AddEventHandler('onResourceStart', function(r)
		while GetResourceState("jim-consumables") == "starting" do Wait(10) end
		if GetResourceState("jim-consumables") == "started" then
			for k, v in pairs(foodTable) do TriggerEvent("jim-consumables:server:syncAddItem", k, v) end
			for k, v in pairs(emoteTable) do TriggerEvent("jim-consumables:server:syncAddEmote", k, v) end
		end
	end)
end

---Crafting
RegisterServerEvent('jim-bars:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
	--This grabs the table from client and removes the item requirements
	local amount = 1
	if craftable then
		if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do TriggerEvent("jim-bars:server:toggleItem", false, tostring(k), v, src) end
	end
	--This should give the item, while the rest removes the requirements
	TriggerEvent("jim-bars:server:toggleItem", true, ItemMake, amount, src)
end)

local function dupeWarn(src, item)
	local P = QBCore.Functions.GetPlayer(src)
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Tried to remove item ^7('^3"..item.."^7')^2 but it wasn't there^7")
	if not Config.Debug then DropPlayer(src, "^1Kicked for attempting to duplicate items") end
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
end

RegisterNetEvent('jim-bars:server:toggleItem', function(give, item, amount, newsrc)
	local src = newsrc or source
	local Player = QBCore.Functions.GetPlayer(src)
	local remamount = (amount or 1)
	if give == 0 or give == false then
		if HasItem(src, item, amount or 1) then -- check if you still have the item
			while remamount > 0 do if Player.Functions.RemoveItem(item, 1) then end remamount -= 1 end
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount or 1)
			if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		else dupeWarn(src, item) end -- if not boot the player
	else
		if Player.Functions.AddItem(item, amount or 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount or 1)
			if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		end
	end
end)

if Config.Inv == "ox" then
	for _, loc in pairs(Config.Locations) do
		if loc.Targets.Shop then exports.ox_inventory:RegisterShop(loc.label, { name = Config.DrinkItems.label, inventory = Config.DrinkItems.items}) end
		if loc.Targets.Tray then for k in pairs(loc.Targets.Tray) do exports.ox_inventory:RegisterStash(loc.label.."Tray"..k, loc.label.." Tray "..k, 20, 400000) end end
		if loc.Targets.Storage then for k in pairs(loc.Targets.Storage) do exports.ox_inventory:RegisterStash(tostring(loc.label.."Storage"..loc.job..k), loc.label.." Storage", 20, 400000) end end
	end
	function HasItem(src, items, amount)
		local count = exports.ox_inventory:Search(src, 'count', items)
		if exports.ox_inventory:Search(src, 'count', items) >= (amount or 1) then
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^5FOUND^7 ^3"..count.."^7/^3"..(amount or 1).." "..tostring(items)) end return true
        else
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2"..tostring(items).." ^1NOT FOUND^7") end return false
		end
	end
else
	function HasItem(source, items, amount)
		local amount, count = amount or 1, 0
		local Player = QBCore.Functions.GetPlayer(source)
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player has required item^7 '^3"..tostring(items).."^7'") end
		for _, itemData in pairs(Player.PlayerData.items) do
			if itemData and (itemData.name == items) then
				if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Item^7: '^3"..tostring(items).."^7' ^2Slot^7: ^3"..itemData.slot.." ^7x(^3"..tostring(itemData.amount).."^7)") end
				count += itemData.amount
			end
		end
		if count >= amount then if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^5FOUND^7 ^3"..count.."^7/^3"..(amount or 1).." "..tostring(items)) end return true end
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2"..tostring(items).." ^1NOT FOUND^7") end	return false
	end
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for i = 1, #Config.Locations do
		if Config.Locations[i].Booth.playing then
			local zoneLabel = Config.Locations[i].label..i
			xSound:Destroy(-1, zoneLabel)
		end
	end
end)

local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/jimathy/UpdateVersions/master/jim-bars.txt', function(err, newestVersion, headers)
		local currentVersion = "^3"..GetResourceMetadata(GetCurrentResourceName(), 'version'):gsub("%.", "^7.^3").."^7"
		newestVersion = "^3"..newestVersion:sub(1, -2):gsub("%.", "^7.^3").."^7"
		if not newestVersion then print("Currently unable to run a version check.") return end
		print("^6Version Check^7: ^2Running^7: "..currentVersion.." ^2Latest^7: "..newestVersion)
		print(newestVersion == currentVersion and '^6You are running the latest version.^7 ('..currentVersion..')' or "^1You are currently running an outdated version^7, ^1please update^7!")
	end)
end
CheckVersion()