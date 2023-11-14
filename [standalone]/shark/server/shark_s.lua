QBCore = nil

if Config.Framework["framework"] == 'qb-core' then
	QBCore = exports['qb-core']:GetCoreObject()
	
	QBCore.Functions.CreateUseableItem(Config.SharkRepelentItemName, function(source, item)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)			
			TriggerClientEvent('jake:client:sharkDoRepelent', src, item.name, item.slot)
	end)



	RegisterServerEvent('jake:server:takeSharkRepelent')
	AddEventHandler('jake:server:takeSharkRepelent', function(name, slot)
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)	
		
		if Player.Functions.RemoveItem(name, 1, slot) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name], "use")	
		end
	end)
	
	
elseif Config.Framework["framework"] == 'esx' then 

	ESX.RegisterUsableItem(Config.SharkRepelentItemName, function(source)
		local src = source
		local xPlayer = ESX.GetPlayerFromId(src) 
		
		TriggerClientEvent('jake:client:sharkDoRepelent', src, Config.SharkRepelentItemName)
	end)

	RegisterServerEvent('jake:server:takeSharkRepelent')
	AddEventHandler('jake:server:takeSharkRepelent', function(name)
		local src = source
		local xPlayer = ESX.GetPlayerFromId(src) 
		
		xPlayer.removeInventoryItem(name, 1)
	end)
	
end
	

