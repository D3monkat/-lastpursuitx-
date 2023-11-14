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
    
elseif Config.Framework == 'other' then
    --add your own code here.
end


function GetIdentifier(source)
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.identifier
        end

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer then
            return xPlayer.PlayerData.citizenid
        end

    elseif Config.Framework == 'other' then
        return GetPlayerIdentifiers(source)[1] --return your identifier here (string).

    end
end

function GetJob(source)
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.job.name
        end
    
    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer then
            return xPlayer.PlayerData.job.name
        end

    elseif Config.Framework == 'other' then
        return 'unemployed' --return the players job name (string).

    end
end

function CheckJob(source, job)
    if CheckMultiJobs(job) and self[source].on_duty then
        return true
    else
        return false
    end
end

function RemoveMoney(source, amount)
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.removeAccountMoney('bank', amount)
        end

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer then
            xPlayer.Functions.RemoveMoney('bank', amount, 'Speeding fine')
        end

    elseif Config.Framework == 'other' then
        --remove money from a player.
    end
end


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


RegisterServerEvent('cd_dispatch:PlayerLoaded')
AddEventHandler('cd_dispatch:PlayerLoaded', function()
    local _source = source
    local data = GetCharacterInfo(_source)
    self[_source] = {}
    self[_source].source = _source
    self[_source].char_name = data.char_name
    self[_source].callsign = data.callsign
    self[_source].phone_number = data.phone_number
    self[_source].job = GetJob(_source)
    self[_source].radio_channel = 0
    self[_source].vehicle = 'foot'
    self[_source].status = {
        name = 'Available',
        color = '#539D1B'
    }
    self[_source].on_duty = true
    if Config.UseFrameworkDutySystem then
        if Config.Framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(_source)
            if xPlayer and xPlayer.job.onDuty ~= nil then
                self[_source].on_duty = xPlayer.job.onDuty
            end
        elseif Config.Framework == 'qbcore' then
            self[_source].on_duty = QBCore.Functions.GetPlayer(_source).PlayerData.job.onduty
        end
    end
    TriggerClientEvent('cd_dispatch:SendSourceData', _source, self[_source], DispatcherData.active)
    PlayerBlipsActions(_source, 'update')
    if CheckMultiJobs(self[_source].job) then
        RefreshLargeUI(self[_source].job)
    end
end)

function GetCharacterInfo(source)
    local identifier = GetIdentifier(source)
    local data = {}
    data.char_name, data.callsign = L('unknown'), L('unknown')

    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            data.char_name = xPlayer.getName(source)
        end
    
    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer then
            data.char_name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
        end
    
    elseif Config.Framework == 'other' then
        --add your own code here.

    end

    local Result = DatabaseQuery('SELECT callsign FROM cd_dispatch WHERE identifier="'..identifier..'"')
    if Result and Result[1] and Result[1].callsign then
        data.callsign = Result[1].callsign
    end
    
    data.phone_number = GetPhoneNumber(source)
    return data
end

function GetPhoneNumber(source)
    if GetResourceState('lb-phone') == 'started' then
        return exports['lb-phone']:GetEquippedPhoneNumber(source)
    end

    if Config.Framework == 'esx' then 
        local identifier = GetIdentifier(source)
        local Result = DatabaseQuery('SELECT phone_number FROM users WHERE identifier="'..identifier..'"')
        if Result and Result[1] and Result[1].phone_number then
            return Result[1].phone_number
        end

    elseif Config.Framework == 'qbcore' then 
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer and xPlayer.PlayerData.charinfo.phone then
            return xPlayer.PlayerData.charinfo.phone
        end

    elseif Config.Framework == 'other' then 
        --add your own code here.

    end
    return ''
end

function SetCallsign(source, callsign)
    local identifier = GetIdentifier(source)
    local Result = DatabaseQuery('SELECT callsign FROM cd_dispatch WHERE identifier="'..identifier..'"')
    if Result and Result[1] and Result[1].callsign then
      	DatabaseQuery('UPDATE cd_dispatch SET callsign="'..callsign..'" WHERE identifier="'..identifier..'"')
    else
        DatabaseQuery('INSERT INTO cd_dispatch (identifier, callsign) VALUES ("'..identifier..'", "'..callsign..'")')
    end
end

RegisterServerEvent('cd_dispatch:JobSet')
AddEventHandler('cd_dispatch:JobSet', function(job)
    local _source = source
    if self and self[_source] and type(job) == 'string' then
        local old_job = self[_source].job
        self[_source].job = job
        PlayerBlipsActions(_source, 'update')
        if CheckMultiJobs(job) then
            RefreshLargeUI(job)
            TriggerClientEvent('cd_dispatch:SendSourceData', _source, self[_source], DispatcherData.active)
        end
        if CheckMultiJobs(old_job) then
            RefreshLargeUI(old_job)
        end
    end
end)


--██████╗  █████╗ ██████╗ ██╗ ██████╗      ██████╗██╗  ██╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██╗     
--██╔══██╗██╔══██╗██╔══██╗██║██╔═══██╗    ██╔════╝██║  ██║██╔══██╗████╗  ██║████╗  ██║██╔════╝██║     
--██████╔╝███████║██║  ██║██║██║   ██║    ██║     ███████║███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██║     
--██╔══██╗██╔══██║██║  ██║██║██║   ██║    ██║     ██╔══██║██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║     
--██║  ██║██║  ██║██████╔╝██║╚██████╔╝    ╚██████╗██║  ██║██║  ██║██║ ╚████║██║ ╚████║███████╗███████╗
--╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝ ╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚══════╝


RegisterServerEvent('cd_dispatch:GetRadioChannel')
AddEventHandler('cd_dispatch:GetRadioChannel', function(radio_channel)
    local _source = source
    if radio_channel ~= nil and CheckJob(_source, self[_source].job) and self and self[_source] then
        self[_source].radio_channel = tonumber(radio_channel)
        RefreshLargeUI(self[_source].job)
        PlayerBlipsActions(_source, 'update')
    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(source, notif_type, message)
    if notif_type and message then
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

        elseif Config.Notification == 'chat' then
                TriggerClientEvent('chatMessage', source, message)

        elseif Config.Notification == 'other' then
            --add your own notification.

        end
    end
end


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


RegisterServerEvent('esx:cd_multicharacter:SwitchCharacter')
AddEventHandler('esx:cd_multicharacter:SwitchCharacter', function(_source)
	if type(_source) ~= 'number' then _source = source end
	PlayerDropped(_source)
end)

RegisterServerEvent('cd_donatorshop:CharacterNameChanged')
AddEventHandler('cd_donatorshop:CharacterNameChanged', function(new_name, _source)
	if type(_source) ~= 'number' then _source = source end
	if self and self[_source] then
        self[_source].char_name = new_name
        PlayerBlipsActions(_source, 'update')
    end
end)

RegisterNetEvent('cd_dispatch:OnDutyChecks')
AddEventHandler('cd_dispatch:OnDutyChecks', function(boolean)
    local _source = source
    while not self do Wait(1000) end
    if self[_source] and type(boolean) == 'boolean' then
        self[_source].on_duty = boolean
        if boolean then
            PlayerBlipsActions(_source, 'update')
        else
            PlayerBlipsActions(_source, 'remove')
        end
    end
end)

function PlayerDropped(source)
    if self and source and self[source] then
        PlayerBlipsActions(source, 'remove')
        if self[source].dispatcher then
            TriggerEvent('cd_dispatch:DispatcherToggle', false, self[source].job)
        end
        if CheckMultiJobs(self[source].job) then
            RefreshLargeUI(self[source].job)
        end
	    Wait(2000)
        self[source] = nil
    end
end
AddEventHandler('playerDropped', function()
    PlayerDropped(source)
end)

RegisterServerEvent('cd_dispatch:AddNotification')
AddEventHandler('cd_dispatch:AddNotification', function(data)
    for c, d in pairs(self) do
        for cc, dd in pairs(data.job_table) do
            if d.job == dd then
                TriggerClientEvent('cd_dispatch:AddNotification', d.source, data)
            end
        end
    end
end)


--███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
--██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
--███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
--╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
--███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
--╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝


function GetPlayersDispatchData(source)
    return self[source]
end


--██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗ 
--██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝ 
--██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗
--██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║
--██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝
--╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ 


RegisterServerEvent('cd_dispatch:Debug')
AddEventHandler('cd_dispatch:Debug', function()
    local _source = source
    print('^6-----------------------^0')
    print('^1CODESIGN DEBUG^0')
    print(string.format('^6Identifier:^0 %s', GetIdentifier(_source)))
    print(string.format('^6Job Name:^0 %s', GetJob(_source)))
    if GetResourceState('cd_devtools') == 'started' then
        local count = 0
        while not self[_source] do Wait(1000) count = count+1 print('^6Waited '..count..' second(s) for the player data to cache.^0') end
        TriggerClientEvent('table', _source, self[_source])
        print('^3Check the client side cd_devtools UI.^0')
    else
        print('^1You need to have cd_devtools started!^0')
    end
    print('^6-----------------------^0')
end)
