local lastrob = {}
ESX, QBCore = nil
Citizen.CreateThread(function()
    if not Config['FleecaHeist']['cooldown']['globalCooldown'] then
        for i = 1, #Config['FleecaSetup'] do
            lastrob[i] = 0
        end
    else
        lastrob = 0
    end
    if Config['FleecaHeist']['framework']['name'] == 'ESX' then
        pcall(function() ESX = exports[Config['FleecaHeist']['framework']['scriptName']]:getSharedObject() end)
        if not ESX then
            TriggerEvent(Config['FleecaHeist']['framework']['eventName'], function(library) 
                ESX = library 
            end)
        end
        ESX.RegisterServerCallback('fleeca:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = ESX.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = ESX.GetPlayerFromId(players[i])
                if player['job']['name'] == Config['FleecaHeist']['setjobForPolice'] then
                    policeCount = policeCount + 1
                end
            end
        
            if policeCount >= Config['FleecaHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('fleeca:client:showNotification', src, Strings['need_police'])
            end
        end)
        ESX.RegisterServerCallback('fleeca:server:checkTime', function(source, cb, index)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            
            if not Config['FleecaHeist']['cooldown']['globalCooldown'] then
                if (os.time() - lastrob[index]) < Config['FleecaHeist']['cooldown']['time'] and lastrob[index] ~= 0 then
                    local seconds = Config['FleecaHeist']['cooldown']['time'] - (os.time() - lastrob[index])
                    TriggerClientEvent('fleeca:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                    cb({status = false})
                else
                    lastrob[index] = os.time()
                    discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' started the Fleeca Heist!')
                    cb({status = true})
                end
            else
                if (os.time() - lastrob) < Config['FleecaHeist']['cooldown']['time'] and lastrob ~= 0 then
                    local seconds = Config['FleecaHeist']['cooldown']['time'] - (os.time() - lastrob)
                    TriggerClientEvent('fleeca:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                    cb({status = false})
                else
                    lastrob = os.time()
                    discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' started the Fleeca Heist!')
                    cb({status = true})
                end
            end
        end)
        ESX.RegisterServerCallback('fleeca:server:hasItem', function(source, cb, data)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            local playerItem = player.getInventoryItem(data.itemName)
        
            if player and playerItem ~= nil then
                if playerItem.count >= 1 then
                    cb({status = true, label = playerItem.label})
                else
                    cb({status = false, label = playerItem.label})
                end
            else
                print('[rm_fleecafinal] you need add required items to server database')
            end
        end)
    elseif Config['FleecaHeist']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['FleecaHeist']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['FleecaHeist']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent(Config['FleecaHeist']['framework']['eventName'], function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
        QBCore.Functions.CreateCallback('fleeca:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = QBCore.Functions.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = QBCore.Functions.GetPlayer(players[i])
                if player.PlayerData.job.name == Config['FleecaHeist']['setjobForPolice'] then
                    policeCount = policeCount + 1
                end
            end
        
            if policeCount >= Config['FleecaHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('fleeca:client:showNotification', src, Strings['need_police'])
            end
        end)
        QBCore.Functions.CreateCallback('fleeca:server:checkTime', function(source, cb, index)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)

            if not Config['FleecaHeist']['cooldown']['globalCooldown'] then
                if (os.time() - lastrob[index]) < Config['FleecaHeist']['cooldown']['time'] and lastrob[index] ~= 0 then
                    local seconds = Config['FleecaHeist']['cooldown']['time'] - (os.time() - lastrob[index])
                    TriggerClientEvent('fleeca:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                    cb({status = false})
                else
                    lastrob[index] = os.time()
                    discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' started the Fleeca Heist!')
                    cb({status = true})
                end
            else
                if (os.time() - lastrob) < Config['FleecaHeist']['cooldown']['time'] and lastrob ~= 0 then
                    local seconds = Config['FleecaHeist']['cooldown']['time'] - (os.time() - lastrob)
                    TriggerClientEvent('fleeca:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                    cb({status = false})
                else
                    lastrob = os.time()
                    discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' started the Fleeca Heist!')
                    cb({status = true})
                end
            end
        end)
        QBCore.Functions.CreateCallback('fleeca:server:hasItem', function(source, cb, data)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            local playerItem = player.Functions.GetItemByName(data.itemName)
        
            if player then 
                if playerItem ~= nil then
                    if playerItem.amount >= 1 then
                        cb({status = true, label = data.itemName})
                    end
                else
                    cb({status = false, label = data.itemName})
                end
            end
        end)
    end
end)

RegisterServerEvent('fleeca:server:removeItem')
AddEventHandler('fleeca:server:removeItem', function(item)
    local src = source
    if Config['FleecaHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        if player then
            player.removeInventoryItem(item, 1)
        end
    elseif Config['FleecaHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        if player then
            player.Functions.RemoveItem(item, 1)
        end 
    end
end)

RegisterServerEvent('fleeca:server:rewardItem')
AddEventHandler('fleeca:server:rewardItem', function(item, count, type, index)
    local src = source

    if Config['FleecaHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - Config['FleecaSetup'][index]['main'])
                if dist > 100.0 then
                    print('[rm_fleecafinal] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['FleecaHeist']['black_money']['status'] then
                        player.addAccountMoney('black_money', count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. count .. '$ on Fleeca Heist')
                    else
                        player.addMoney(count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. count .. '$ on Fleeca Heist')
                    end
                end
            else
                for k, v in pairs(Config['FleecaHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.addInventoryItem(item, count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. item .. ' x' .. count .. ' on Fleeca Heist')
                    else
                        player.addInventoryItem(item, 1)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. item .. ' x' .. 1 .. ' on Fleeca Heist')
                    end
                else
                    print('[rm_fleecafinal] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    elseif Config['FleecaHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - Config['FleecaSetup'][index]['main'])
                if dist > 100.0 then
                    print('[rm_fleecafinal] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['FleecaHeist']['black_money']['status'] then
                        player.Functions.AddItem(Config['FleecaHeist']['black_money']['itemName'], count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Fleeca Heist')
                    else
                        player.Functions.AddMoney('cash', count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Fleeca Heist')
                    end
                end
            else
                for k, v in pairs(Config['FleecaHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.Functions.AddItem(item, count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. count .. ' on Fleeca Heist')
                    else
                        player.Functions.AddItem(item, 1)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. 1 .. ' on Fleeca Heist')
                    end
                else
                    print('[rm_fleecafinal] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    end
end)

RegisterServerEvent('fleeca:server:sellRewardItems')
AddEventHandler('fleeca:server:sellRewardItems', function()
    local src = source

    if Config['FleecaHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['FleecaHeist']['rewardItems']) do
                local playerItem = player.getInventoryItem(v['itemName'])
                if playerItem.count >= 1 then
                    player.removeInventoryItem(v['itemName'], playerItem.count)
                    if Config['FleecaHeist']['black_money']['status'] then
                        player.addAccountMoney('black_money', playerItem.count * v['sellPrice'])
                    else
                        if Config['FleecaHeist']['moneyItem']['status'] then
                            player.addInventoryItem(Config['FleecaHeist']['moneyItem']['itemName'], playerItem.count * v['sellPrice'])
                        else
                            player.addMoney(playerItem.count * v['sellPrice'])
                        end
                    end
                    totalMoney = totalMoney + (playerItem.count * v['sellPrice'])
                end
            end

            discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain $' .. math.floor(totalMoney) .. ' on the Union Heist Buyer!')
            TriggerClientEvent('fleeca:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    elseif Config['FleecaHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['FleecaHeist']['rewardItems']) do
                local playerItem = player.Functions.GetItemByName(v['itemName'])
                if playerItem ~= nil and playerItem.amount > 0 then
                    player.Functions.RemoveItem(v['itemName'], playerItem.amount)
                    if Config['FleecaHeist']['black_money']['status'] then
                        player.Functions.AddItem(Config['FleecaHeist']['black_money']['itemName'], playerItem.amount * v['sellPrice'])
                    else
                        player.Functions.AddMoney('cash', playerItem.amount * v['sellPrice'])
                    end
                    totalMoney = totalMoney + (playerItem.amount * v['sellPrice'])
                end
            end

            discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain $' .. math.floor(totalMoney) .. ' on the Union Heist Buyer!')
            TriggerClientEvent('fleeca:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    end
end)

RegisterCommand('pdfleeca', function(source, args)
    local src = source

    if Config['FleecaHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        
        if player then
            if player['job']['name'] == Config['FleecaHeist']['setjobForPolice'] then
                TriggerClientEvent('fleeca:client:nearBank', src)
            else
                TriggerClientEvent('fleeca:client:showNotification', src, Strings['not_cop'])
            end
        end
    elseif Config['FleecaHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
    
        if player then
            if player.PlayerData.job.name == Config['FleecaHeist']['setjobForPolice'] then
                TriggerClientEvent('fleeca:client:nearBank', src)
            else
                TriggerClientEvent('fleeca:client:showNotification', src, Strings['not_cop'])
            end
        end
    end
end)

RegisterServerEvent('fleeca:server:sync')
AddEventHandler('fleeca:server:sync', function(type, args)
    TriggerClientEvent('fleeca:client:sync', -1, type, args)
end)

RegisterServerEvent('fleeca:server:sceneSync')
AddEventHandler('fleeca:server:sceneSync', function(model, animDict, animName, pos, rotation)
    TriggerClientEvent('fleeca:client:sceneSync', -1, model, animDict, animName, pos, rotation)
end)