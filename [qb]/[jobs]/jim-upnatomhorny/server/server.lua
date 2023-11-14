AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	for k, v in pairs(Config.Locations) do
		if not QBCore.Shared.Jobs[v.job] then print("Error: Job role not found - '"..v.job.."'") end
		if v.garage then
			TriggerEvent("jim-jobgarage:server:syncAddLocations", { job = v.job, garage = v.garage }) -- Job Garage creation
		end
	end
	for _, v in pairs(Crafting) do
		for i = 1, #v do
			for l, b in pairs(v[i]) do
				if not QBCore.Shared.Items[l] and l ~= "amount" then print("Crafting: Missing Item from QBCore.Shared.Items: '"..l.."'") end
				if type(b) == "table" then
					for j in pairs(b) do if not QBCore.Shared.Items[j] then print("Crafting: Missing Item from QBCore.Shared.Items: '"..j.."'") end end end end end end
	for i = 1, #Config.AtomIngredients.items do
		if not QBCore.Shared.Items[Config.AtomIngredients.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.AtomIngredients.items[i].name.."^7'") end
	end
	for i = 1, #Config.HornyIngredients.items do
		if not QBCore.Shared.Items[Config.HornyIngredients.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.HornyIngredients.items[i].name.."^7'") end
	end
	for i = 1, #Config.IceCream.items do
		if not QBCore.Shared.Items[Config.IceCream.items[i].name] then print("^5Debug^7: ^6Store^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..Config.IceCream.items[i].name.."^7'") end
	end
end)

if not Config.JimConsumables then
		-- Make Items Usable
		local food = {
			"tripleburger", "baconcheesemelt", "chillidog", "atomfries", "chickenfillet", "chickenhorn", "grilledchicken", "chickensalad", "hunksohen", "chickentaco", "enchiladas",
			"gazpacho", "hornbreakfast", "eggsbenedict", "hashbrowns", "sausages", "baconroll", "baconeggtoast", "frenchtoast", "frenchtoastbacon", "hornburger", "dblhornburger",
			"baconhornburger", "picklehornburger", "chickenhornburger", "dblchickenhornburger", "breadslice", "icecone", "icenugget", "icecake"	}
		for _, v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-upnatomhorny:client:Consume', source, item.name, "food") end) end

		local drinks = { "creamyshake", "atomsoda", "orangotang", "raine", "junkdrink", "milk", "ecola", "ecolalight", "sprunk", "sprunklight" }
		for _, v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-upnatomhorny:client:Consume', source, item.name, "drink") end) end
else
	local foodTable = {
		-- Food
		["tripleburger"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["baconcheesemelt"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["chillidog"] = 			{ emote = "atomhotdog", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["atomfries"] = 			{ emote = "atomfries", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["chickenfillet"]= 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["chickenhorn"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["grilledchicken"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["chickensalad"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["hunksohen"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["chickentaco"]= 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["enchiladas"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["gazpacho"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["hornbreakfast"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["eggsbenedict"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["hashbrowns"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["sausages"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["baconroll"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["baconeggtoast"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["frenchtoast"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["frenchtoastbacon"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["hornburger"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["dblhornburger"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["baconhornburger"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["picklehornburger"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["chickenhornburger"] = 	{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["dblchickenhornburger"] = 	{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["breadslice"] =			{ emote = "breadslice", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20) }},

		["icecone"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["icenugget"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},
		["icecake"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},

		["creamyshake"] = 			{ emote = "atomdrink", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30) }},
		["atomsoda"]  = 			{ emote = "atomdrink", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30) }},
		["orangotang"] = 			{ emote = "ecola", canRun = false, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30) }},
		["raine"]  = 				{ emote = "ecola", canRun = false, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30) }},
		["junkdrink"]  = 			{ emote = "bscoffee", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30) }},
		["milk"] = 					{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30) }},
		["ecola"] = 				{ emote = "ecola", canRun = false, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
		["ecolalight"] = 			{ emote = "ecola", canRun = false, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
		["sprunk"] = 				{ emote = "sprunk", canRun = false,		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
		["sprunklight"] = 			{ emote = "sprunk", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
	}
	local emoteTable = {
		["atomdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'ng_proc_sodacup_01c', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomhotdog"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_bs_burger2', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomfries"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_chips', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["breadslice"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Bread Slice", AnimationOptions = { Prop = 'v_res_fa_bread03', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, -10.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions = { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
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
RegisterServerEvent('jim-upnatomhorny:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
	--This grabs the table from client and removes the item requirements
	local amount = 1
	if craftable then
		if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do TriggerEvent("jim-upnatomhorny:server:toggleItem", false, tostring(k), v, src) end
	end
	--This should give the item, while the rest removes the requirements
	TriggerEvent("jim-upnatomhorny:server:toggleItem", true, ItemMake, amount, src)
end)

local function dupeWarn(src, item)
	local P = QBCore.Functions.GetPlayer(src)
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Tried to remove item ^7('^3"..item.."^7')^2 but it wasn't there^7")
	if not Config.Debug then DropPlayer(src, "^1Kicked for attempting to duplicate items") end
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
end

RegisterNetEvent('jim-upnatomhorny:server:toggleItem', function(give, item, amount, newsrc)
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
	--Default Loc
	exports.ox_inventory:RegisterStash("UpNAtom_Shelf", "Shelf", 20, 400000)
	exports.ox_inventory:RegisterStash("UpNAtom_Shelf2", "Fridge", 20, 400000)
	exports.ox_inventory:RegisterStash("UpNAtom_Ingredients", "Ingredients", 20, 400000)

	exports.ox_inventory:RegisterStash("UpNAtom_Tray1", "Tray", 20, 400000)
	exports.ox_inventory:RegisterStash("UpNAtom_Tray2", "Tray", 20, 400000)
	exports.ox_inventory:RegisterStash("UpNAtom_Tray3", "Tray", 20, 400000)

	exports.ox_inventory:RegisterStash("Hornys_Shelf", "Shelf", 20, 400000)
	exports.ox_inventory:RegisterStash("Hornys_Ingredients", "Ingredients", 20, 400000)

	exports.ox_inventory:RegisterStash("Hornys_Tray1", "Tray", 20, 400000)
	exports.ox_inventory:RegisterStash("Hornys_Tray2", "Tray", 20, 400000)
	exports.ox_inventory:RegisterStash("Hornys_Tray3", "Tray", 20, 400000)

	exports.ox_inventory:RegisterShop("AtomShop", { name = Config.AtomIngredients.label, inventory = Config.AtomIngredients.items })
	exports.ox_inventory:RegisterShop("AtomiceShop", { name = Config.IceCream.label, inventory = Config.IceCream.items })
	exports.ox_inventory:RegisterShop("HornyShop", { name = Config.HornyIngredients.label, inventory = Config.HornyIngredients.items })

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

local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/jimathy/UpdateVersions/master/jim-upnatomhorny.txt', function(err, newestVersion, headers)
		local currentVersion = "^3"..GetResourceMetadata(GetCurrentResourceName(), 'version'):gsub("%.", "^7.^3").."^7"
		newestVersion = "^3"..newestVersion:sub(1, -2):gsub("%.", "^7.^3").."^7"
		if not newestVersion then print("Currently unable to run a version check.") return end
		print("^6Version Check^7: ^2Running^7: "..currentVersion.." ^2Latest^7: "..newestVersion)
		print(newestVersion == currentVersion and '^6You are running the latest version.^7 ('..currentVersion..')' or "^1You are currently running an outdated version^7, ^1please update^7!")
	end)
end
CheckVersion()