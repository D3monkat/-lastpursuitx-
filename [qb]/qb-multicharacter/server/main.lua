local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, v.amount, false, info)
    end
end

local function loadHouseData()
    local HouseGarages = {}
    local Houses = {}
    -- local result = MySQL.Sync.fetchAll('SELECT * FROM houselocations', {}) -- new
    local result = MySQL.query.await('SELECT * FROM houselocations', {}) -- new 2.3.1
    -- local result = exports.oxmysql:executeSync('SELECT * FROM houselocations', {}) -- old
    if result[1] ~= nil then
        for _, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end
    TriggerClientEvent("qb-garages:client:houseGarageConfig", -1, HouseGarages)
    TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Houses)
end

-- Commands

QBCore.Commands.Add("logout", "Logout of Character (Admin Only)", {}, false, function(source)
    local src = source
    QBCore.Player.Logout(src)
    TriggerClientEvent('qb-multicharacter:client:chooseChar', src)
end, "admin")

QBCore.Commands.Add("closeNUI", "Close Multi NUI", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-multicharacter:client:closeNUI', src)
end)

-- Events

RegisterNetEvent('qb-multicharacter:server:disconnect', function()
    local src = source
    DropPlayer(src, "You have disconnected from QBCore")
end)

RegisterNetEvent('qb-multicharacter:server:loadUserData', function(cData)
    local src = source
    if QBCore.Player.Login(src, cData.citizenid) then
        print('^2[qb-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData.citizenid..') has succesfully loaded!')
        QBCore.Commands.Refresh(src)
        loadHouseData()
        if Config.Housing['ps-housing'] then
            TriggerClientEvent('ps-housing:client:setupSpawnUI', src, cData)
        elseif Config.Housing['qb-houses'] then
            TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
        end
        TriggerEvent("qb-log:server:CreateLog", "joinleave", "Loaded", "green", "**".. GetPlayerName(src) .. "** ("..(QBCore.Functions.GetIdentifier(src, 'discord') or 'undefined') .." |  ||"  ..(QBCore.Functions.GetIdentifier(src, 'ip') or 'undefined') ..  "|| | " ..(QBCore.Functions.GetIdentifier(src, 'license') or 'undefined') .." | " ..cData.citizenid.." | "..src..") loaded..")
	end
end)

RegisterNetEvent('qb-multicharacter:server:createCharacter', function(data)
    local src = source
    local newData = {}
    newData.cid = data.cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        exports['um-idcard']:CreateMetaLicense(src, {'id_card','driver_license'})
        if Config.StartingApartment then
            local randbucket = (GetPlayerPed(src) .. math.random(1,999))
            SetPlayerRoutingBucket(src, randbucket)
            print('^2[qb-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
            exports['um-idcard']:CreateMetaLicense(src, {'id_card','driver_license'})
            QBCore.Commands.Refresh(src)
            loadHouseData()
            TriggerClientEvent("qb-multicharacter:client:closeNUI", src)
            
            if Config.Housing['ps-housing'] then
                TriggerClientEvent('ps-housing:client:setupSpawnUI', src, newData)
            elseif Config.Housing['qb-houses'] then
                TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
            end
            GiveStarterItems(src)
        else
            print('^2[qb-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
            QBCore.Commands.Refresh(src)
            loadHouseData()
            TriggerClientEvent("qb-multicharacter:client:closeNUIdefault", src)
            GiveStarterItems(src)
        end
	end
end)

RegisterNetEvent('qb-multicharacter:server:deleteCharacter', function(citizenid)
    local src = source
    QBCore.Player.DeleteCharacter(src, citizenid)
end)

-- Callbacks

QBCore.Functions.CreateCallback("qb-multicharacter:server:GetUserCharacters", function(source, cb)
    local src = source
    local license = QBCore.Functions.GetIdentifier(src, 'license')

    -- MySQL.Async.execute('SELECT * FROM players WHERE license = ?', {license}, function(result) -- new
        MySQL.query('SELECT * FROM players WHERE license = ?', {license}, function(result) -- new 2.3.1
    -- exports.oxmysql:execute('SELECT * FROM players WHERE license = ?', {license}, function(result) -- old
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:GetServerLogs", function(_, cb)
    -- MySQL.Async.execute('SELECT * FROM server_logs', {}, function(result) -- new
        MySQL.query('SELECT * FROM server_logs', {}, function(result) -- new 2.3.1
    -- exports.oxmysql:execute('SELECT * FROM server_logs', {}, function(result) -- old
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:GetNumberOfCharacters", function(source, cb)
    local src = source
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    local numOfChars = 0

    if next(Config.PlayersNumberOfCharacters) then
        for _, v in pairs(Config.PlayersNumberOfCharacters) do
            if v.license == license then
                numOfChars = v.numberOfChars
                break
            else 
                numOfChars = Config.DefaultNumberOfCharacters
            end
        end
    else
        numOfChars = Config.DefaultNumberOfCharacters
    end
    cb(numOfChars)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:SetupNewCharacter", function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local plyChars = {}
    -- MySQL.Async.fetchAll('SELECT * FROM players WHERE license = ?', {license}, function(result) -- new
        MySQL.query('SELECT * FROM players WHERE license = ?', {license}, function(result) -- new 2.3.1
    -- exports.oxmysql:execute('SELECT * FROM players WHERE license = ?', {license}, function(result) -- old
        while result == nil do Wait(5) end
        for k, v in pairs(result) do
            if Config.Clothing['qb-clothing'] then
                -- local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- new
                local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- new 2.3.1
                -- local result = exports.oxmysql:executeSync('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- old
                while result == nil do Wait(5) end
                if result ~= nil then
                    if result[1] ~= nil then
                        if not tonumber(result[1].model) then
                            plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                        else
                            plyChars[k] = {result[1].model, result[1].skin, v.cid, v.charinfo, v}
                        end
                    else
                        plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                    end
                else
                    plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                end
            elseif Config.Clothing['fivem-appearance'] then
                -- local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- new
                local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- new 2.3.1
                -- local result = exports.oxmysql:executeSync('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- old
                while result == nil do Wait(5) end
                if result ~= nil then
                    if result[1] ~= nil then
                        if tonumber(result[1].model) then
                            plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                        else
                            plyChars[k] = {result[1].model, result[1].skin, v.cid, v.charinfo, v}
                        end
                    else
                        plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                    end
                else
                    plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                end
            elseif Config.Clothing['illenium-appearance'] then
                -- local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- new
                local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- new 2.3.1
                -- local result = exports.oxmysql:executeSync('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {v.citizenid, 1}) -- old
                while result == nil do Wait(5) end
                if result ~= nil then
                    if result[1] ~= nil then
                        if tonumber(result[1].model) then
                            plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                        else
                            plyChars[k] = {result[1].model, result[1].skin, v.cid, v.charinfo, v}
                        end
                    else
                        plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                    end
                else
                    plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
                end
            else
                plyChars[k] = {nil, nil, v.cid, v.charinfo, v}
            end
        end
        cb(plyChars)
    end)
end)