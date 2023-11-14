--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil

if Config.Framework == 'esx' then
    pcall(function() ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject() end)
    if ESX == nil then
        TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
    end

    
elseif Config.Framework == 'qbcore' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
    end
end

function GetIdentifier(source)
    if not source then return end
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.identifier

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.citizenid

    elseif Config.Framework == 'other' then
        return GetPlayerIdentifiers(source)[1] --return your identifier here (string).

    end
end

function GetJob(source)
    if not source then return end
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.job.name
    
    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.job.name

    elseif Config.Framework == 'other' then
        return 'unemployed' --return the players job name (string).

    end
end

function CheckMoney(source, amount, payment_type) --payment_type = What this payment is for. [ 'garage_space' / 'return_vehicle' / 'civ_unimpound' / 'transfer_garage' ] 
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getAccount('bank').money >= amount then
            xPlayer.removeAccountMoney('bank', amount)
            return true
        else
            return false
        end

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.PlayerData.money['bank'] >= amount then
            xPlayer.Functions.RemoveMoney('bank', amount, 'Garage Payment')
            return true
        else
            return false
        end

    elseif Config.Framework == 'other' then
        return false --check the players bank balance (boolean).
    end
end

function RemoveMoney(source, amount, payment_type) --payment_type = What this payment is for. [ 'garage_tax' ] 
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeAccountMoney('bank', amount)

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveMoney('bank', amount, 'Garage Payment')

    elseif Config.Framework == 'other' then
        --remove money from a player.
    end
end

function CheckPerms(source, action)
    if Config.StaffPerms[action].perms == nil then return false end
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = xPlayer.getGroup()
        for c, d in pairs(Config.StaffPerms[action].perms[Config.Framework]) do
            if perms == d then
                return true
            end
        end

    elseif Config.Framework == 'qbcore' then
        local perms = QBCore.Functions.GetPermission(source)
        for c, d in pairs(Config.StaffPerms[action].perms[Config.Framework]) do
            if type(perms) == 'string' then
                if perms == d then
                    return true
                end
            elseif type(perms) == 'table' then
                if perms[d] then
                    return true
                end
            end
        end

    elseif Config.Framework == 'other' then
        return 'change_me' --return the players permissions (string).
    end
    return false
end

function GetCharacterName(source)
    local char_name = L('unknown')
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        char_name = xPlayer.getName(source)
    
    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer then
            if xPlayer.PlayerData.charinfo.firstname and xPlayer.PlayerData.charinfo.lastname then
                char_name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
            end
        end

    elseif Config.Framework == 'other' then
        --get the players permissions (string).

    end
    return char_name
end

function GetPlayerFromIdentifier(identifier)
    if Config.Framework == 'esx' then
        local AllPlayers = ESX.GetPlayers()
        for cd = 1, #AllPlayers do
            local xPlayer = ESX.GetPlayerFromId(AllPlayers[cd])
            local xPlayer_identifier = GetIdentifier(xPlayer.source)
             if xPlayer_identifier and xPlayer_identifier == identifier then
                return xPlayer.source
            end
        end
    
    elseif Config.Framework == 'qbcore' then
        local AllPlayers = QBCore.Functions.GetPlayers()
        for cd = 1, #AllPlayers do
            local xPlayer = QBCore.Functions.GetPlayer(AllPlayers[cd])
            local xPlayer_identifier = GetIdentifier(xPlayer.PlayerData.source)
            if xPlayer_identifier and xPlayer_identifier == identifier then
                return xPlayer.PlayerData.source
            end
        end
    
    elseif Config.Framework == 'other' then
        --add your own code here.
    
    end
end


-- ██████╗ █████╗ ██╗     ██╗     ██████╗  █████╗  ██████╗██╗  ██╗███████╗
--██╔════╝██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝
--██║     ███████║██║     ██║     ██████╔╝███████║██║     █████╔╝ ███████╗
--██║     ██╔══██║██║     ██║     ██╔══██╗██╔══██║██║     ██╔═██╗ ╚════██║
--╚██████╗██║  ██║███████╗███████╗██████╔╝██║  ██║╚██████╗██║  ██╗███████║
-- ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝


RegisterServerEvent('cd_garage:Callback')
AddEventHandler('cd_garage:Callback', function(id, action, data)
    local _source = source
    if action == 'mileage' then
        TriggerClientEvent('cd_garage:Callback', _source, id, GetAdvStats(data))

    elseif action == 'onstreetscheck' then
        TriggerClientEvent('cd_garage:Callback', _source, id, OnStreetsCheck(data))

    end
end)

function OnStreetsCheck(data)
    local self = nil
    for c, d in pairs(GetAllVehicles()) do
        if DoesEntityExist(d) then
            if GetCorrectPlateFormat(GetVehicleNumberPlateText(d)) == GetCorrectPlateFormat((data.plate)) then
                local coords = GetEntityCoords(d)
                if data.shell_coords and GetVehicleEngineHealth(d) > 0 then
                    local dist = #(vector3(coords.x, coords.y, coords.z)-vector3(data.shell_coords.x, data.shell_coords.y, data.shell_coords.z))
                    if dist > 30 then
                        self = {result = 'onstreets', message = L('vehicle_onstreets'), coords = coords}
                        break
                    end
                elseif GetVehicleEngineHealth(d) > 0 then
                    self = {result = 'onstreets', message = L('vehicle_onstreets'), coords = coords}
                    break
                end
            end
        end
    end
    return self
end


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function FakePlateChange(current_plate, new_plate) --This is triggered when a player adds/removes a fake plate.
    if GetResourceState('ox_inventory') == 'started' then
        exports['ox_inventory']:UpdateVehicle(current_plate, new_plate)
    end
    --You can add other events/exports here to update other inventories when a fake plate is added/removed.
    
end

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        if Config.Mileage.ENABLE then
            TriggerClientEvent('cd_garage:SaveAllMiles', -1)
        end
        if Config.Impound.ENABLE then
            TriggerEvent('cd_garage:SaveImpoundTimers')
        end
        if Config.VehicleKeys.ENABLE then
            TriggerClientEvent('cd_garage:SaveAllVehicleDamage', -1)
        end
    end
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
    if Config.Mileage.ENABLE then
        TriggerClientEvent('cd_garage:SaveAllMiles', -1)
    end
    if Config.Impound.ENABLE then
        TriggerEvent('cd_garage:SaveImpoundTimers')
    end
    if Config.VehicleKeys.ENABLE then
        TriggerClientEvent('cd_garage:SaveAllVehicleDamage', -1)
    end
end)

RegisterServerEvent('cd_garage:DeleteVehicleADV')
AddEventHandler('cd_garage:DeleteVehicleADV', function(net)
    TriggerClientEvent('cd_garage:DeleteVehicleADV', source, net)
end)

function ConvertData(...)
    if ... ~= nil then
        for c, d in pairs(...) do
            if d ~= nil then
                return d
            end
        end
    end
    return nil
end


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(source, notif_type, message)
    if source and notif_type and message then
        if Config.Notification == 'esx' then
            TriggerClientEvent('esx:showNotification', source, message)
        
        elseif Config.Notification == 'qbcore' then
            if notif_type == 1 then
                TriggerClientEvent('QBCore:Notify', source, message, 'success')
            elseif notif_type == 2 then
                TriggerClientEvent('QBCore:Notify', source, message, 'primary')
            elseif notif_type == 3 then
                TriggerClientEvent('QBCore:Notify', source, message, 'error')
            end

        elseif Config.Notification == 'okokNotify' then
            if notif_type == 1 then
                TriggerClientEvent('okokNotify:Alert', source, L('garage'), message, 5000, 'success')
            elseif notif_type == 2 then
                TriggerClientEvent('okokNotify:Alert', source, L('garage'), message, 5000, 'info')
            elseif notif_type == 3 then
                TriggerClientEvent('okokNotify:Alert', source, L('garage'), message, 5000, 'error')
            end

        elseif Config.Notification == 'ps-ui' then
            if notif_type == 1 then
                TriggerClientEvent('ps-ui:Notify', source, message, 'success')
            elseif notif_type == 2 then
                TriggerClientEvent('ps-ui:Notify', source, message, 'primary')
            elseif notif_type == 3 then
                TriggerClientEvent('ps-ui:Notify', source, message, 'error')
            end

        elseif Config.Notification == 'ox_lib' then
            if notif_type == 1 then
                lib.notify({title = L('garage'), description = message, type = 'success'})
            elseif notif_type == 2 then
                lib.notify({title = L('garage'), description = message, type = 'inform'})
            elseif notif_type == 3 then
                lib.notify({title = L('garage'), description = message, type = 'error'})
            end

        elseif Config.Notification == 'chat' then
                TriggerClientEvent('chatMessage', source, message)

        elseif Config.Notification == 'other' then
            --add your own notification.

        end
    end
end


--██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗ 
--██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝ 
--██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗
--██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║
--██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝
--╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ 


RegisterServerEvent('cd_garage:Debug')
AddEventHandler('cd_garage:Debug', function()
    local _source = source
    print('^6-----------------------^0')
    print('^1CODESIGN DEBUG^0')
    print(string.format('^6Identifier:^0 %s', GetIdentifier(_source)))
    print(string.format('^6Job Name:^0 %s', GetJob(_source)))
    print(string.format('^6Character Name:^0 %s', GetCharacterName(_source)))
    print(string.format('^6Perms [add]:^0 %s', CheckPerms(_source, 'add')))
    print(string.format('^6Perms [delete]:^0 %s', CheckPerms(_source, 'delete')))
    print(string.format('^6Perms [plate]:^0 %s', CheckPerms(_source, 'plate')))
    print(string.format('^6Perms [keys]:^0 %s', CheckPerms(_source, 'keys')))
    print('^6-----------------------^0')
end)
