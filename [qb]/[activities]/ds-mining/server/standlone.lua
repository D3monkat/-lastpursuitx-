
QBCore = nil
if Config.Object.usingexport then
    QBCore = exports[Config.Object.CoreName]:GetCoreObject()
else
    TriggerEvent(Config.Object.event, function(obj) QBCore = obj end)
end

QBCore.Functions.CreateCallback("ds-mining:server:removeitem",function(source, cb, item, qty)
    if RemoveItem(source, item, qty) then
        cb(true)
    else
        cb(false)
    end
end)

AddItem = function(src, item, qty)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.AddItem(item, qty) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
        return true
    end
    return false
end

RemoveItem = function(src, item, qty)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item, qty) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
        return true
    end
    return false
end

GetPlayerLicense = function(src)
    return QBCore.Functions.GetIdentifier(src, 'license')
end

GetPlayer = function(src)
    return QBCore.Functions.GetPlayer(src)
end

GetItemByName = function(src, item)
    local Player = GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName(item)
    return ItemData
end

GetPlayerInventory = function(src)
    local Player = GetPlayer(src)
    return Player.PlayerData.items
end

AddMoney = function(src, amount)
    local Player = GetPlayer(src)
    Player.Functions.AddMoney('cash', amount)
end


Notify = function(src, msg, type)
    TriggerClientEvent("QBCore:Notify", src, msg, type, 5000)
end

QBCore.Functions.CreateCallback('ds-mining:server:getdata', function(source, cb)
    local src = source
    if Config.UseGlobalCoolDown then
        cb(MineDataGlobal)
    else
        local license = GetPlayerLicense(src)
        if MineData[license] then
            cb(MineData[license])
        else
            MineData[license] = {}
            cb(MineData[license])
        end
    end
end)

RegisterServerEvent("ds-mining:getunwashed")
AddEventHandler("ds-mining:getunwashed", function(item)
    local src = source
    if item then
        AddItem(source,item,1)
        Notify(src, Language['mined']..item, "success")
    end
end)
