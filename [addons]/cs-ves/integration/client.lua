-- Client-side checks and integration of how the VES UI is accessed.
-- Here you can do any client-side check you want as well as change the way UI is accessed, what happens when it is and so on.
-- You can execute `TriggerEvent('cs-ves:setUiAccessible', boolean)` to set whether the UI is accessible (client-side), if the UI is open it will be closed and will not open again until its accessible again.

local uiAccessible = false
local vesReady = false
local lastAccessedPlate = nil

function CanAccessControllerInterface()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = vehicle > 0 and GetVehicleNumberPlateText(vehicle):gsub('%s+', '-') or nil
    return (not lastAccessedPlate or plate == lastAccessedPlate) and not IsEntityDead(PlayerPedId())
end

RegisterCommand('ves', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = vehicle > 0 and GetVehicleNumberPlateText(vehicle):gsub('%s+', '-') or nil

    if (uiAccessible and plate) then
        lastAccessedPlate = plate
        TriggerServerEvent('cs-ves:integration:toggleControllerInterface', plate)
    else
        if (config.debug) then
            print('[debug] ves inaccessible (not in vehicle / UI blocked)', plate, uiAccessible)
        end

        lastAccessedPlate = nil
    end
end)

RegisterKeyMapping('ves', 'Open Interface', 'keyboard', '')

AddEventHandler('cs-ves:ready', function()
    vesReady = true
end)

CreateThread(function()
    TriggerEvent('cs-ves:integrationReady')

    while (true) do
        if (vesReady and CanAccessControllerInterface() ~= uiAccessible) then
            uiAccessible = not uiAccessible

            TriggerEvent('cs-ves:setUiAccessible', uiAccessible)

            if (not uiAccessible) then
                lastAccessedPlate = nil
            end
        end

        Wait(500)
    end
end)

-- Performing action animations and handling NUI controls block.

local animDict = 'amb@world_human_seat_wall_tablet@female@idle_a'
local animName = 'idle_c'
local remoteAnimDict = 'anim@mp_player_intmenu@key_fob@'
local remoteAnimName = 'fob_click_fp'
local interfaceOpen = false

AddEventHandler('cs-ves:onControllerInterfaceOpen', function()
    interfaceOpen = true

    CreateThread(function()
        while (interfaceOpen) do
            DisablePlayerFiring(PlayerId())
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            Wait(0)
        end
    end)

    local playerPed = PlayerPedId()

    if (not IsEntityPlayingAnim(playerPed, animDict, animName, 3)) then
        RequestAnimDict(animDict)
        RequestAnimDict(remoteAnimDict)

        while ((not HasAnimDictLoaded(animDict)) or (not HasAnimDictLoaded(remoteAnimDict))) do
            Wait(0)
        end
    
        TaskPlayAnim(playerPed, animDict, animName, 4.0, 4.0, -1, 49, 0, 0, 0, 0)
    end
end)

AddEventHandler('cs-ves:onControllerInterfaceClose', function()
    interfaceOpen = false

    local playerPed = PlayerPedId()

    if (IsEntityPlayingAnim(playerPed, animDict, animName, 3)) then
        StopAnimTask(playerPed, animDict, animName, 4.0)
        Wait(75)
    end
end)

AddEventHandler('cs-ves:onInterfacelessFeatureUsed', function(plate, feature)
    TaskPlayAnim(PlayerPedId(), remoteAnimDict, remoteAnimName, 4.0, 4.0, -1, 48, 1, false, false, false)
end)

AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end
    
    if (resource == GetCurrentResourceName()) then
        local playerPed = PlayerPedId()
    
        if (IsEntityPlayingAnim(playerPed, animDict, animName, 3)) then
            StopAnimTask(playerPed, animDict, animName, 4.0)
        end
    end
end)
