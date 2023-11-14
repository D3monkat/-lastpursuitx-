local QBCore = exports[Config.Core]:GetCoreObject()

-- Global Variables

local inQueue = false
local blip

local function CreateBlip(coords)
    blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipScale(blip, 0.7)
	SetBlipColour(blip, 3)
	SetBlipRoute(blip, true)
    return blip
end

local function doCarDamage(vehicle)
    -- Doors
    if math.random() > 0.1 then
        for i = 1, math.random(1, 6) do
            SetVehicleDoorBroken(vehicle, math.random(0, 6), true)
        end
    end
    -- Windows
    if math.random() > 0.1 then
        for i = 1, math.random(1, 5) do
            SmashVehicleWindow(vehicle, math.random(0, 4))
        end
    end
    -- Tyres
    if math.random() > 0.1 then
        for i = 1, math.random(1, 4) do
            SetVehicleTyreBurst(vehicle, math.random(1, 4), false, 990.0)
        end
    end
    -- Engine
    if math.random() > 0.1 then
        SetVehicleEngineHealth(vehicle, 100.0)
    end
    -- Body
    if math.random() > 0.1 then
        SetVehicleBodyHealth(vehicle, 100.0)
    end
end

function viewMissionBoard()
    local isSignedIn = true
    if exports['brazzers-tow']:isSignedIn() then isSignedIn = false end
    local label = Config.Lang['missionBoard']['header'].label
    if Config.AllowRep then
        local repLevel, repAmount = getRep()
        label = repLevel..' | '..repAmount..''..Config.Lang['missionBoard']['header'].repLabel
    end
    if Config.Menu == 'ox' then
        local menu = {}
        menu[#menu+1] = {
            title = Config.Lang['missionBoard']['firstMenu'].title,
            icon = Config.Lang['missionBoard']['firstMenu'].icon,
            description = Config.Lang['missionBoard']['firstMenu'].desc,
            event = "brazzers-tow:client:joinQueue",
            disabled = isSignedIn,
        }
        if inQueue then
            menu[#menu+1] = {
                title = Config.Lang['missionBoard']['secondMenu'].title,
                icon = Config.Lang['missionBoard']['secondMenu'].icon,
                serverEvent = "brazzers-tow:server:leaveQueue",
            }
        end
        lib.registerContext({
            id = 'brazzers-tow:mainMenu',
            icon = Config.Lang['missionBoard']['header'].icon,
            title = label,
            options = menu
        })
        lib.showContext('brazzers-tow:mainMenu')
    else
        local menu = {
            {
                header = label,
                isMenuHeader = true,
                icon = Config.Lang['missionBoard']['header'].icon,
            },
        }
        menu[#menu+1] = {
            header = Config.Lang['missionBoard']['firstMenu'].title,
            isMenuHeader = isSignedIn,
            txt = Config.Lang['missionBoard']['firstMenu'].desc,
            icon = Config.Lang['missionBoard']['firstMenu'].icon,
            params = {
                event = "brazzers-tow:client:joinQueue",
            }
        }
        if inQueue then
            menu[#menu+1] = {
                header = Config.Lang['missionBoard']['secondMenu'].title,
                icon = Config.Lang['missionBoard']['secondMenu'].icon,
                params = {
                    isServer = true,
                    event = "brazzers-tow:server:leaveQueue",
                }
            }
        end
        menu[#menu+1] = {
            header = Config.Lang['missionBoard']['thirdMenu'].title,
            icon = Config.Lang['missionBoard']['thirdMenu'].icon,
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
        exports[Config.Menu]:openMenu(menu)
    end
end

RegisterNetEvent('brazzers-tow:client:joinQueue', function()
    if not exports['brazzers-tow']:isSignedIn() then return end
    TriggerServerEvent('brazzers-tow:server:joinQueue', true)
end)

RegisterNetEvent('brazzers-tow:client:queueIndex', function(value)
    inQueue = value
end)

RegisterNetEvent('brazzers-tow:client:setCarDamage', function(netID, plate)
    Wait(1000)
    if netID and plate then
        local vehicle = NetToVeh(netID)
        if Config.Fuel ~= 'ox' then exports[Config.Fuel]:SetFuel(vehicle, 0.0) end
        doCarDamage(vehicle)
    end
end)

RegisterNetEvent('brazzers-tow:client:sendMissionBlip', function(coords)
    if coords then
        CreateBlip(coords)
        notification(Config.Lang['current'], Config.Lang['primary'][1], 'primary')
        return
    end

    RemoveBlip(blip)
    notification(Config.Lang['current'], Config.Lang['primary'][2], 'primary')
end)

RegisterNetEvent('brazzers-tow:client:reQueueSystem', function()
    TriggerServerEvent('brazzers-tow:server:reQueueSystem')
end)

RegisterNetEvent('brazzers-tow:client:leaveQueue', function(notify)
    RemoveBlip(blip)
    if notify then
        notification(Config.Lang['current'], Config.Lang['primary'][3], 'primary')
    end
end)

RegisterNetEvent('brazzers-tow:client:sendMissionRequest', function()
    local success = exports[Config.Phone]:PhoneNotification(Config.Lang['missionRequest'].title, Config.Lang['missionRequest'].desc, Config.Lang['missionRequest'].icon, Config.Lang['missionRequest'].color, "NONE", 'fas fa-check-circle', 'fas fa-times-circle')
    if not success then return TriggerServerEvent('brazzers-tow:server:sendMissionRequest', false) end
    TriggerServerEvent('brazzers-tow:server:sendMissionRequest', true)
end)