local QBCore = exports[Config.Core]:GetCoreObject()

local cachedQueue = {}
local cachedMission = {}

local currentMission = {}
local activePlates = {}

-- Functions

function resetLocation(location, instant)
    if not location then return end
    if instant then
        Config.Locations[location]['isBusy'] = false
        return
    end
    SetTimeout(5 * 60000, function()
        Config.Locations[location]['isBusy'] = false
    end)
end

local function generatePlate()
    local plate = QBCore.Shared.RandomInt(1) ..
        QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result or activePlates[plate] then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

local function generateLocation()
    local locations = {}
    for i = 1, #Config.Locations do
        if not Config.Locations[i]['isBusy'] then
            locations[#locations + 1] = i
        end
    end
    if locations == 0 then return false, false end
    local location = locations[math.random(1, #locations)]
    Config.Locations[location]['isBusy'] = true
    return Config.Locations[location]['coords'], location
end

local function generateVehicle(group, source)
    if not group or not source then return end

    local src = source
    local carModel = createVehicle(source)
    if not carModel then return end

    local coords = currentMission[group].currentLocation
    local CreateAutomobile = joaat('CREATE_AUTOMOBILE')
    local car = Citizen.InvokeNative(CreateAutomobile, joaat(carModel), coords, true, false)

    local checks = 0
    
    while not DoesEntityExist(car) do
        if checks == 10 then break end
        Wait(25)
        checks += 1
    end

    if DoesEntityExist(car) then
        local plate = generatePlate()
        activePlates[plate] = true

        Entity(car).state.tow = {
            missionVehicle = true
        }
        if Config.Fuel == 'ox' and GetResourceState('ox_fuel') == "started" then
            Entity(car).state.fuel = 100.0
        end
        SetVehicleNumberPlateText(car, plate)
        currentMission[group].netID = NetworkGetNetworkIdFromEntity(car)
        currentMission[group].plate = plate
        TriggerClientEvent('brazzers-tow:client:setCarDamage', src, currentMission[group].netID, currentMission[group].plate)
        return true
    else
        return false
    end
end

local function generateMission(groupLeader)
    if not groupLeader then return end

    local src = groupLeader
    local Player = QBCore.Functions.GetPlayer(src)
    local group = Player.PlayerData.citizenid

    if Config.RenewedPhone then
        group = exports[Config.Phone]:GetGroupByMembers(src)
        if not group then return end
        
        local location, place = generateLocation()
        if not location then return end

        currentMission[group] = {
            currentLocation = location,
            place = place,
            netID = nil,
            plate = nil,
        }
        -- ADD SOME MORE BULLSHIT HERE
        if generateVehicle(group, src) then
            local members = exports[Config.Phone]:getGroupMembers(group)
            if not members then return end

            resetLocation(place, false)
            markForTow(currentMission[group].netID, currentMission[group].plate)
            cachedQueue[group].inQueue = false

            for i=1, #members do
                if members[i] then
                    TriggerClientEvent('brazzers-tow:client:sendMissionBlip', members[i], currentMission[group].currentLocation) -- SEND BLIP
                end
            end
        end
        return
    end

    local location, place = generateLocation()
    if not location then return end

    currentMission[group] = {
        currentLocation = location,
        place = place,
        netID = nil,
        plate = nil,
    }

    if generateVehicle(group, src) then
        resetLocation(place, false)
        markForTow(currentMission[group].netID, currentMission[group].plate)
        cachedQueue[group].inQueue = false
        TriggerClientEvent('brazzers-tow:client:sendMissionBlip', src, currentMission[group].currentLocation) -- SEND BLIP
    end
end

local function sendMissionRequest(groupLeader)
    local src = groupLeader
    local Player = QBCore.Functions.GetPlayer(src)
    local group = Player.PlayerData.citizenid

    if Config.RenewedPhone then
        group = exports[Config.Phone]:GetGroupByMembers(src)
        if not group then return end

        cachedQueue[group].inQueue = false
        TriggerClientEvent('brazzers-tow:client:sendMissionRequest', src)
        return
    end
    cachedQueue[group].inQueue = false
    generateMission(src)
end

function endMission(source, group)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if DoesEntityExist(NetworkGetEntityFromNetworkId(currentMission[group].netID)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(currentMission[group].netID))
    end

    resetLocation(currentMission[group].place, true)

    cachedQueue[group] = nil
    cachedMission[group] = nil
    currentMission[group] = nil

    notification(src, Config.Lang['current'], Config.Lang['primary'][6], 'primary')
    -- Reset Blip
    TriggerClientEvent('brazzers-tow:client:leaveQueue', src, false)
end

-- Events

RegisterNetEvent('brazzers-tow:server:joinQueue', function(isAllowed)
    if not isAllowed then return end

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local group = Player.PlayerData.citizenid

    if Config.RenewedPhone then
        group = exports[Config.Phone]:GetGroupByMembers(src)
        if not group then return end

        local members = exports[Config.Phone]:getGroupMembers(group)
        if not members then return end

        if cachedQueue[group] and cachedQueue[group].inQueue then
            print("YOUR ALREADY IN QUEUE MORON")
            return
        end

        if cachedMission[group] then return print("CURRENTLY ON A MISSION") end
        if not exports[Config.Phone]:isGroupLeader(src, group) then return print("YOU MUST BE GROUP LEADER TO QUEUE") end
        
        if not cachedQueue[group] then cachedQueue[group] = {} end
        if not cachedMission[group] then cachedMission[group] = {} end

        cachedQueue[group] = {
            groupLeader = src,
            groupId = group,
            inQueue = true,
            available = true,
        }

        if cachedQueue[group].inQueue then
            for i=1, #members do
                if not members[i] then return end
                TriggerClientEvent('brazzers-tow:client:queueIndex', members[i], cachedQueue[group].inQueue)
                notification(members[i], Config.Lang['current'], Config.Lang['primary'][7], 'primary')
            end
        end

        if not Config.UseQueue then
            sendMissionRequest(src)
        end
        return
    end

    if cachedQueue[group] and cachedQueue[group].inQueue then
        print("YOUR ALREADY IN QUEUE MORON")
        return
    end

    if cachedMission[group] then return print("CURRENTLY ON A MISSION") end
    if not cachedQueue[group] then cachedQueue[group] = {} end
    if not cachedMission[group] then cachedMission[group] = {} end

    cachedQueue[group] = {
        groupLeader = src,
        groupId = group,
        inQueue = true,
        available = true,
    }

    TriggerClientEvent('brazzers-tow:client:queueIndex', src, cachedQueue[group].inQueue)
    notification(src, Config.Lang['current'], Config.Lang['primary'][7], 'primary')

    if not Config.UseQueue then
        sendMissionRequest(src)
    end
end)

RegisterNetEvent('brazzers-tow:server:reQueueSystem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local group = Player.PlayerData.citizenid

    if Config.RenewedPhone then
        group = exports[Config.Phone]:GetGroupByMembers(src)
        if not group then return end

        local members = exports[Config.Phone]:getGroupMembers(group)
        if not members then return end

        if currentMission[group] then
            resetLocation(currentMission[group].place, true)
        end

        cachedQueue[group] = {}
        cachedMission[group] = {}
        currentMission[group] = {}

        if not exports[Config.Phone]:isGroupLeader(src, group) then return print("YOU MUST BE GROUP LEADER TO QUEUE") end

        cachedQueue[group] = {
            groupLeader = src,
            groupId = group,
            inQueue = true,
            available = true,
        }

        if cachedQueue[group].inQueue then
            for i=1, #members do
                if not members[i] then return end
                TriggerClientEvent('brazzers-tow:client:queueIndex', members[i], cachedQueue[group].inQueue)
                notification(members[i], Config.Lang['current'], Config.Lang['primary'][8], 'primary')
            end
        end

        if not Config.UseQueue then
            sendMissionRequest(src)
        end
        return
    end

    resetLocation(currentMission[group].place, true)

    cachedQueue[group] = {}
    cachedMission[group] = {}
    currentMission[group] = {}

    cachedQueue[group] = {
        groupLeader = src,
        groupId = group,
        inQueue = true,
        available = true,
    }

    TriggerClientEvent('brazzers-tow:client:queueIndex', src, cachedQueue[group].inQueue)
    notification(src, Config.Lang['current'], Config.Lang['primary'][8], 'primary')

    if not Config.UseQueue then
        sendMissionRequest(src)
    end
end)

RegisterNetEvent('brazzers-tow:server:leaveQueue', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local group = Player.PlayerData.citizenid

    if Config.RenewedPhone then
        group = exports[Config.Phone]:GetGroupByMembers(src)
        if not group then return end

        local members = exports[Config.Phone]:getGroupMembers(group)
        if not members then return end

        if currentMission[group] then
            if DoesEntityExist(NetworkGetEntityFromNetworkId(currentMission[group].netID)) then
                DeleteEntity(NetworkGetEntityFromNetworkId(currentMission[group].netID))
            end

            resetLocation(currentMission[group].place, true)
        end

        cachedQueue[group] = nil
        cachedMission[group] = nil
        currentMission[group] = nil

        for i=1, #members do
            if not members[i] then return end
            TriggerClientEvent('brazzers-tow:client:leaveQueue', members[i], true)
            TriggerClientEvent('brazzers-tow:client:queueIndex', members[i], false)
        end
        return
    end

    if DoesEntityExist(NetworkGetEntityFromNetworkId(currentMission[group].netID)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(currentMission[group].netID))
    end

    resetLocation(currentMission[group].place, true)

    cachedQueue[group] = nil
    cachedMission[group] = nil
    currentMission[group] = nil

    TriggerClientEvent('brazzers-tow:client:leaveQueue', src, true)
    TriggerClientEvent('brazzers-tow:client:queueIndex', src, false)
end)

RegisterNetEvent('brazzers-tow:server:sendMissionRequest', function(accepted)
    local src = source
    if not accepted then return TriggerClientEvent('brazzers-tow:client:reQueueSystem', src) end
    generateMission(src)
end)

-- Threads

if Config.UseQueue then
    CreateThread(function()
        while true do
            if cachedQueue then
                for k, v in pairs(cachedQueue) do
                    if cachedMission[k] then
                        if v.inQueue and v.available then
                            sendMissionRequest(v.groupLeader)
                        end
                    end
                end
            end
            Wait(Config.QueueTimer * 60000)
        end
    end)
end

-- Event Handlers

if Config.RenewedPhone then
    AddEventHandler('qb-phone:server:GroupDeleted', function(group, players)
        if not cachedQueue[group] or not cachedMission[group] or not currentMission[group] then return end

        for i=1, #players do
            endMission(players[i], group)
        end
    end)
end