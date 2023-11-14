local QBCore = exports[Config.Core]:GetCoreObject()

local blips = {}

-- Functions

function getRep()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local repAmount = PlayerData.metadata['jobrep'][Config.RepName]

    for k, _ in pairs(Config.RepLevels) do
        if repAmount >= Config.RepLevels[k]['repNeeded'] then
            return Config.RepLevels[k]['label'], repAmount
        end
    end
end

function isTow()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if (PlayerData.job.name == Config.Job) then
        return true
    end
end

function inZone()
    local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)

    for _, v in pairs(Config.DepotLot) do
        if (#(pedPos - v.xyz) <= 20.0) then
            return true
        end
    end
end

function notification(title, msg, action)
    if Config.NotificationStyle == 'phone' then
        TriggerEvent('qb-phone:client:CustomNotification', title, msg, 'fas fa-user', '#b3e0f2', 5000)
    elseif Config.NotificationStyle == 'qbcore' then
        QBCore.Functions.Notify(msg, action, 5000)
    end
end

local function generateCustomClass(entity)
    local model = GetEntityModel(entity)
    for k, _ in pairs(QBCore.Shared.Vehicles) do
        if QBCore.Shared.Vehicles[k]['hash'] == model then
            return QBCore.Shared.Vehicles[k][Config.SharedTierName]
        end
    end
end

local function canRequestTow()
    local PlayerData = QBCore.Functions.GetPlayerData()
    for _, v in pairs(Config.CanRequestTow) do
        if (PlayerData.job.name == v) and PlayerData.job.onduty then
            return true
        end
    end
end

function depotVehicle(NetworkID)
    local entity = NetworkGetEntityFromNetworkId(NetworkID)
    local plate = QBCore.Functions.GetPlate(entity)
    local class = GetVehicleClass(entity)

    if Config.PayoutType == 'custom' and Config.UseTierVehicles then
        class = generateCustomClass(entity)
    end
    QBCore.Functions.Progressbar("depot_vehicle", Config.Lang['progressBar']['depotVehicle'].title, Config.Lang['progressBar']['depotVehicle'].time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('brazzers-tow:server:depotVehicle', plate, class, NetworkID)
    end, function()
    end)
end

-- Events

-- YOU CAN USE THIS EVENT TO INPUT INTO RADIAL MENU OR WHATEVER YOU WANT TO REQUEST TOW
RegisterNetEvent("brazzers-tow:client:requestTowTruck", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate = QBCore.Functions.GetPlate(vehicle)
    local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()

    TriggerEvent('animations:client:EmoteCommandStart', {"phonecall"})
    QBCore.Functions.Progressbar("calling_tow", Config.Lang['progressBar']['callingTow'].title, Config.Lang['progressBar']['callingTow'].time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("brazzers-tow:server:markForTow", NetworkGetNetworkIdFromEntity(vehicle), vehname, plate)
    end, function() -- Cancel
        TriggerEvent('DoLongHudText', Config.Lang['error'][10], 2)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent("brazzers-tow:client:sendTowRequest", function(info, vehicle, plate, pos)
    local success = exports[Config.Phone]:PhoneNotification("JOB OFFER", 'Incoming Tow Request', 'fas fa-map-pin', '#b3e0f2', "NONE", 'fas fa-check-circle', 'fas fa-times-circle')
    if not success then return end
    TriggerServerEvent("brazzers-tow:server:sendTowRequest", info, vehicle, plate, pos)
end)

RegisterNetEvent('brazzers-tow:client:receiveTowRequest', function(pos, plate, blipId)
    CreateThread(function()
        local alpha = 255
        local blip = nil
        local radius = nil
        local radiusAlpha = 128
        local sprite, colour, scale = 280, 17, 1.0

        blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        blips[blipId] = blip
        -- Extra Shit
        SetBlipSprite(blip, sprite)
        SetBlipHighDetail(blip, true)
        SetBlipScale(blip, scale)
        SetBlipColour(blip, colour)
        SetBlipAlpha(blip, alpha)
        SetBlipAsShortRange(blip, false)
        SetBlipCategory(blip, 2)
        SetBlipColour(radius, colour)
        SetBlipAlpha(radius, radiusAlpha)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.Lang['blip']['towRequest']..''..plate)
        EndTextCommandSetBlipName(blip)

        while radiusAlpha ~= 0 do
            Wait(Config.BlipLength * 1000)
            radiusAlpha = radiusAlpha - 1
            SetBlipAlpha(radius, radiusAlpha)
            if radiusAlpha == 0 then
                RemoveBlip(radius)
                RemoveBlip(blip)
                return
            end
        end
    end)
end)

RegisterNetEvent('brazzers-tow:client:truckSpawned', function(NetID, plate)
    Wait(500)
    if NetID and plate then
        local vehicle = NetToVeh(NetID)
        exports[Config.Fuel]:SetFuel(vehicle, 100.0)
        TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", plate)
        notification(Config.Lang['current'], Config.Lang['primary'][5], 'primary')
    end
    signedIn = true
end)

-- Global Blip
local mainBlip = nil
local depotBlip = nil

CreateThread(function()
    mainBlip = AddBlipForCoord(Config.LaptopCoords.xyz)
    SetBlipSprite(mainBlip, 68)
    SetBlipDisplay(mainBlip, 4)
    SetBlipScale(mainBlip, 0.7)
    SetBlipAsShortRange(mainBlip, true)
    SetBlipColour(mainBlip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Tow Lot")
    EndTextCommandSetBlipName(mainBlip)

    for _, v in pairs(Config.DepotLot) do
        depotBlip = AddBlipForCoord(v.xyz)
        SetBlipSprite(depotBlip, 68)
        SetBlipDisplay(depotBlip, 4)
        SetBlipScale(depotBlip, 0.7)
        SetBlipAsShortRange(depotBlip, true)
        SetBlipColour(depotBlip, 3)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Depot Lot")
        EndTextCommandSetBlipName(depotBlip)
    end
end)

-- Threads

CreateThread(function()
    if Config.Target == 'ox' then
        exports.ox_target:addBoxZone({
            coords = Config.LaptopCoords.xyz,
            size = vec3(0.2, 0.4, 1.0),
            rotation = 117,
            debug = Config.Debug,
            options = {
                {
                    name = 'tow_signin_laptop',
                    icon = Config.Lang['target']['signIn'].icon,
                    label = Config.Lang['target']['signIn'].title,
                    onSelect = function()
                        signIn()
                    end,
                    canInteract = function()
                        if Config.WhitelistedJob and not isTow() then return end
                        if signedIn then return end
                        return true
                    end,
                },
                {
                    name = 'tow_signout_laptop',
                    icon = Config.Lang['target']['signOut'].icon,
                    label = Config.Lang['target']['signOut'].title,
                    onSelect = function()
                        signOut()
                    end,
                    canInteract = function()
                        if not signedIn then return end
                        return true
                    end,
                },
                {
                    name = 'tow_missionboard_laptop',
                    icon = Config.Lang['target']['missionBoard'].icon,
                    label = Config.Lang['target']['missionBoard'].title,
                    onSelect = function()
                        viewMissionBoard()
                    end,
                    canInteract = function()
                        if Config.WhitelistedJob and not isTow() then return end
                        if not signedIn then return end
                        return true
                    end,
                },
            }
        })
        return
    end

    exports[Config.Target]:AddBoxZone("tow_signin", Config.LaptopCoords.xyz, 0.2, 0.4, {
        name = "tow_signin",
        heading = 117.93,
        debugPoly = false,
        minZ = Config.LaptopCoords.z,
        maxZ = Config.LaptopCoords.z + 1.0,
        }, {
            options = {
            {
                action = function()
                    signIn()
                end,
                icon = Config.Lang['target']['signIn'].icon,
                label = Config.Lang['target']['signIn'].title,
                canInteract = function()
                    if Config.WhitelistedJob and not isTow() then return end
                    if signedIn then return end
                    return true
                end,
            },
            {
                action = function()
                    signOut()
                end,
                icon = Config.Lang['target']['signOut'].icon,
                label = Config.Lang['target']['signOut'].title,
                canInteract = function()
                    if not signedIn then return end
                    return true
                end,
            },
            {
                action = function()
                    viewMissionBoard()
                end,
                icon = Config.Lang['target']['missionBoard'].icon,
                label = Config.Lang['target']['missionBoard'].title,
                canInteract = function()
                    if Config.WhitelistedJob and not isTow() then return end
                    if not signedIn then return end
                    return true
                end,
            },
        },
        distance = 1.0,
    })
end)

CreateThread(function()
    if Config.Target == 'ox' then
        local options = {
            {
                name = 'tow_hook_vehicle',
                icon = Config.Lang['target']['hookVehicle'].icon,
                label = Config.Lang['target']['hookVehicle'].title,
                onSelect = function(data)
                    hookVehicle(NetworkGetNetworkIdFromEntity(data.entity))
                end,
                canInteract = function(entity)
                    if not isTowVehicle(entity) then return end
                    if Config.AllowTowOnly and not isTow() then return end

                    local target = GetVehicleBehindTowTruck(entity, -8, 0.7)
                    if not target or target == 0 then return end

                    local state = Entity(entity).state.FlatBed
                    if not state then return end
                    if state.carAttached then return end

                    return true
                end
            },
            {
                name = 'tow_unhook_vehicle',
                icon = Config.Lang['target']['unHookVehicle'].icon,
                label = Config.Lang['target']['unHookVehicle'].title,
                onSelect = function(data)
                    unHookVehicle(NetworkGetNetworkIdFromEntity(data.entity))
                end,
                canInteract = function(entity)
                    if not isTowVehicle(entity) then return end
                    if Config.AllowTowOnly and not isTow() then return end

                    local state = Entity(entity).state.FlatBed
                    if not state then return end
                    if not state.carAttached then return end

                    return true
                end
            },
            {
                name = 'tow_depot_vehicle',
                icon = Config.Lang['target']['depotVehicle'].icon,
                label = Config.Lang['target']['depotVehicle'].title,
                onSelect = function(data)
                    depotVehicle(NetworkGetNetworkIdFromEntity(data.entity))
                end,
                canInteract = function(entity)
                    if not isTow() then return end
                    if not inZone() then return end
                    local state = Entity(entity).state.FlatBed
                    if state and state.carAttached then return end
                    local markedState = Entity(entity).state.marked
                    if not markedState then return end
                    if not markedState.markedForTow then return end

                    return true
                end
            },
            {
                name = 'call_tow_vehicle',
                icon = Config.Lang['target']['markVehicle'].icon,
                label = Config.Lang['target']['markVehicle'].title,
                onSelect = function()
                    callTow()
                end,
                canInteract = function(entity)
                    if not canRequestTow() then return end
                    local markedState = Entity(entity).state.marked
                    if markedState and markedState.markedForTow then return end
                    if not Config.CallTowThroughTarget then return end
    
                    return true
                end
            },
        }
        exports.ox_target:addGlobalVehicle(options)
        return
    end

    exports[Config.Target]:AddGlobalVehicle({
        options = {
            {
                label = Config.Lang['target']['hookVehicle'].title,
                icon = Config.Lang['target']['hookVehicle'].icon,
                action = function(entity)
                    hookVehicle(NetworkGetNetworkIdFromEntity(entity))
                end,
                canInteract = function(entity)
                    if not isTowVehicle(entity) then return end
                    if Config.AllowTowOnly and not isTow() then return end

                    local target = GetVehicleBehindTowTruck(entity, -8, 0.7)
                    if not target or target == 0 then return end

                    local state = Entity(entity).state.FlatBed
                    if not state then return end
                    if state.carAttached then return end

                    return true
                end
            },
            {
                label = Config.Lang['target']['unHookVehicle'].title,
                icon = Config.Lang['target']['unHookVehicle'].icon,
                action = function(entity)
                    unHookVehicle(NetworkGetNetworkIdFromEntity(entity))
                end,
                canInteract = function(entity)
                    if not isTowVehicle(entity) then return end
                    if Config.AllowTowOnly and not isTow() then return end

                    local state = Entity(entity).state.FlatBed
                    if not state then return end
                    if not state.carAttached then return end

                    return true
                end
            },
            {
                label = Config.Lang['target']['depotVehicle'].title,
                icon = Config.Lang['target']['depotVehicle'].icon,
                action = function(entity)
                    depotVehicle(NetworkGetNetworkIdFromEntity(entity))
                end,
                canInteract = function(entity)
                    if not isTow() then return end
                    if not inZone() then return end
                    local state = Entity(entity).state.FlatBed
                    if state and state.carAttached then return end
                    local markedState = Entity(entity).state.marked
                    if not markedState then return end
                    if not markedState.markedForTow then return end

                    return true
                end
            },
            {
                label = Config.Lang['target']['markVehicle'].title,
                icon = Config.Lang['target']['markVehicle'].icon,
                action = function()
                    callTow()
                end,
                canInteract = function(entity)
                    if not canRequestTow() then return end
                    local markedState = Entity(entity).state.marked
                    if markedState and markedState.markedForTow then return end
                    if not Config.CallTowThroughTarget then return end

                    return true
                end
            },
        },
        distance = 1.5
    })
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, _ in pairs(blips) do
            RemoveBlip(blips[k])
        end
    end
end)

-- Export if you want to check if you're signed into tow in any other script
exports('isSignedIn', function()
    return signedIn
end)