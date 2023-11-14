CreateThread(function()
    if Config.ESX then 
        ESX = exports["es_extended"]:getSharedObject()
        callback = ESX.RegisterServerCallback
    else
        QBCore = exports['qb-core']:GetCoreObject()
        callback = QBCore.Functions.CreateCallback
    end 
end)

local currentJob = {}

local function Notification(_source, title, text, type)
    if Config.Notification == "ESX" then 
        local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.showNotification(text)
    elseif Config.Notification == "QB" then
        TriggerClientEvent("QBCore:Notify", _source, text, type)
    elseif Config.Notification == "OX" then 
        TriggerClientEvent("ox_lib:notify", _source, {title = title, description = text, type = type})
    end
end

local function createStopLocation(playerName)
    if not currentJob[playerName] then 
        randomLocation = math.random(1, #Config.Stops)
        currentLocation = Config.Stops[randomLocation]
    else 
        randomLocation = math.random(1, #Config.Stops)
        while currentJob[playerName].history[randomLocation] do
            randomLocation = math.random(1, #Config.Stops)
            Wait(10)
        end

        currentLocation = Config.Stops[randomLocation]
        currentJob[playerName].history[randomLocation] = true
        currentJob[playerName].currentLocation = currentLocation
    end

    return randomLocation, currentLocation
end

local function getLocationAmount(jobType)
    if not jobType then return end 

    local locationAmount 
        if jobType == "small" then 
            locationAmount = math.random(Config.StopsAmount.small.minAmount, Config.StopsAmount.small.maxAmount)
        elseif jobType == "medium" then 
            locationAmount = math.random(Config.StopsAmount.medium.minAmount, Config.StopsAmount.medium.maxAmount)
        elseif jobType == "large" then 
            locationAmount = math.random(Config.StopsAmount.large.minAmount, Config.StopsAmount.large.maxAmount)
        end  

    return locationAmount
end

local function getDumpsterAmount(playerName)
    local dumpsterAmount = math.random(Config.DumpstersMinAmount, Config.DumpstersMaxAmount)

    if currentJob[playerName] then
        currentJob[playerName].dumpsterAmount = dumpsterAmount
    end

    return dumpsterAmount
end

local function getPlayer(source)
    if not source then return end 

    local Player
        if Config.ESX then 
            Player = ESX.GetPlayerFromId(source)
        else 
            Player = QBCore.Functions.GetPlayer(source)
        end

    if not Player then return end 

    return Player
end

local function getPayCheck(playerName, source)
    if not playerName and not source and not currentJob[playerName] then return end 
    
    local Player = getPlayer(source)
    local paycheckAmount = Config.MoneyPerTrashBag * currentJob[playerName].totalDumpstersLooted

    if Config.ESX then 
        Player.addAccountMoney('bank', paycheckAmount)
    else 
        Player.Functions.AddMoney("bank", paycheckAmount, "PostOP") 
    end

    Notification(source, "Sanitation", "You collected a paycheck of: $".. paycheckAmount .."", 'success')
end

local function removeMoney(Player, amount)
    if not source then return end 
    if not Player then return end 
    if not amount then return end 

    if Config.ESX then 
        Player.removeMoney(amount)
    else 
        Player.Functions.RemoveMoney("cash", amount)
    end
end

local function addItem(source, Player, item, amount)
    if not source then return end 
    if not Player then return end 
    if not item then return end 
    if not amount then return end 

    if Config.ESX then 
        Player.addInventoryItem(item, amount)
    else 
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item], "add", amount)
    end
end

RegisterNetEvent('qb-sanitation:server:startJob', function(jobType)
    if not jobType then return end 
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.PedCoords.xyz)) > 5.0 then return end

    local playerName = GetPlayerName(source)

    local randomLocation, currentLocation = createStopLocation(playerName)
    if not randomLocation and not currentLocation then return end 

    local locationAmount = getLocationAmount(jobType)
    if not locationAmount then return end 

    local dumpsterAmount = getDumpsterAmount()
    if not dumpsterAmount then return end

    currentJob[playerName] = {
        currentLocation = currentLocation,
        locationsDone = 0,
        locationAmount = locationAmount, 
        dumpstersLooted = 0,
        dumpsterAmount = dumpsterAmount, 
        totalDumpstersLooted = 0,
        history = {
            [randomLocation] = true,
        },
    }

    TriggerClientEvent('qb-sanitation:client:createVehicle', source, currentJob[playerName].currentLocation)
end)

local function getPlayerMoney(Player)
    local moneyAmount = 0

    if Config.ESX then 
        moneyAmount = Player.getMoney()
    else 
        moneyAmount = Player.Functions.GetMoney("cash")
    end

    return moneyAmount
end

CreateThread(function()
    callback("qb-sanitation:server:getPedTable", function(source, cb)
        cb({Config.PedModel, Config.PedCoords, Config.PedBlip})
    end)

    callback("qb-sanitation:server:getMaterialsTable", function(source, cb)
        cb(Config.Materials)
    end)

    callback("qb-sanitation:server:getPlayerMoney", function(source, cb)
        cb(getPlayerMoney(getPlayer(source)))
    end)

    callback('qb-sanitation:server:grabTrashBag', function(source, cb)
        local playerName = GetPlayerName(source)
        
        if not currentJob[playerName] then return cb(false) end
        if #(GetEntityCoords(GetPlayerPed(source)) - currentJob[playerName].currentLocation) > Config.StopsBlip.blipRadius then return cb(false) end 

        if currentJob[playerName].dumpstersLooted <= currentJob[playerName].dumpsterAmount then 
            currentJob[playerName].dumpstersLooted = currentJob[playerName].dumpstersLooted + 1
            currentJob[playerName].totalDumpstersLooted = currentJob[playerName].totalDumpstersLooted + 1
            cb(true)
        end
    end)

    callback('qb-sanitation:server:throwTrashBag', function(source, cb, vehicleCoords)
        local playerName = GetPlayerName(source)
        if not currentJob[playerName] then return cb(false) end
        if #(GetEntityCoords(GetPlayerPed(source)) - vehicleCoords) > 10.0 then return cb(false) end

        Notification(source, "Sanitation", "Trash collected: (".. currentJob[playerName].dumpstersLooted .."/".. currentJob[playerName].dumpsterAmount ..")")
        if currentJob[playerName].dumpstersLooted == currentJob[playerName].dumpsterAmount then
            currentJob[playerName].locationsDone = currentJob[playerName].locationsDone + 1
            if currentJob[playerName].locationAmount > currentJob[playerName].locationsDone then 
                currentJob[playerName].dumpstersLooted = 0
                createStopLocation(playerName)
                getDumpsterAmount(playerName)
                TriggerClientEvent('qb-sanitation:client:newPlace', source, currentJob[playerName].currentLocation)
            else
                TriggerClientEvent('qb-sanitation:client:jobDone', source)
            end
        end

        cb(true)
    end)
end)

RegisterNetEvent('qb-sanitation:server:collectPaycheck', function(vehicleCoords)
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.PedCoords.xyz)) > 5.0 then return end
    if #(vector3(Config.PedCoords.xyz) - vehicleCoords) > 50.0 then Notification(source, "Sanitation", "Vehicle is too far away", 'error') return end

    local playerName = GetPlayerName(source)
    if currentJob[playerName].locationAmount == currentJob[playerName].locationsDone and currentJob[playerName].dumpstersLooted == currentJob[playerName].dumpsterAmount then 
        TriggerClientEvent('qb-sanitation:client:resetClient', source)
        getPayCheck(playerName, source)
        currentJob[playerName] = nil
    end 
end)

RegisterNetEvent("qb-sanitation:server:purchaseMaterial", function(materialName, materialAmount, materialPrice)
    if not source and not materialName and not materialAmount then return end 

    local Player = getPlayer(source)
    
    local moneyAmount = getPlayerMoney(Player)
    if moneyAmount < materialAmount * materialPrice then Notification(source, "Material Shop", "Not enough money", "error") return end 

    removeMoney(Player, materialAmount * materialPrice)
    addItem(source, Player, materialName, materialAmount)
    
    Notification(source, "Material Shop", "You bought ".. materialAmount .."x ".. materialName .." for $".. materialAmount * materialPrice .."", "success")
end)