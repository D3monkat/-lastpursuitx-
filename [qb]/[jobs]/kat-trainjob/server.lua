local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('Trainjob:GetTriggers', function(source, cb)
	cb(Triggers)
end)

if Config.UseCommand and Config.UseCommand ~= '' then
    RegisterCommand(Config.UseCommand, function(source, args, user)
        local _source = source
        TriggerClientEvent('Trainjob:startRun',_source)
    end)
end
if Config.UseItem and Config.UseItem ~= '' then
    ESX.RegisterUsableItem(Config.UseItem, function(source)
        local _source = source
        TriggerClientEvent('Trainjob:startRun',_source)
    end)
end
RegisterServerEvent('Trainjob:GiveMoney')
AddEventHandler('Trainjob:GiveMoney',function(amount)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Name = "Train"

    if xPlayer ~= nil then
        xPlayer.Functions.AddMoney('cash', amount)
        if Config.Webhook ~= nil then
            if Config.Webhook ~= "" and Config.Webhook ~= false then
                TriggerEvent('qb-log:server:CreateLog',Name,Name,"green", xPlayer.PlayerData.name.." "..Config.Translation[Config.Language]["Webhook"]..amount.." "..Config.currency)
            end
        end
        if Config.JobMoney and Config.JobMoney > 0 then
            exports['Renewed-Banking']:addAccountMoney(Config.JobRequire, amount)
        end
    end
end)