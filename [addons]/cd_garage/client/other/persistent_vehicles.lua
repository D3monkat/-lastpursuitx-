if Config.PersistentVehicles.ENABLE then

    RegisterNetEvent('cd_garage:PersistentVehicles_GetVehicleProperties')
    AddEventHandler('cd_garage:PersistentVehicles_GetVehicleProperties', function(plate, netid)
        TriggerServerEvent('cd_garage:PersistentVehicles_GetVehicleProperties', plate, GetVehicleProperties(NetworkGetEntityFromNetworkId(netid)))
    end)

    local RespawnWaitngList = 0
    RegisterNetEvent('cd_garage:PersistentVehicles_SpawnVehicle')
    AddEventHandler('cd_garage:PersistentVehicles_SpawnVehicle', function(data)
        while RespawnWaitngList > 0 do Wait(100) end
        RespawnWaitngList = RespawnWaitngList + 1
        ExitLocation = {x = data.coords.x, y = data.coords.y, z = data.coords.z, h = data.heading}
        local vehicle = SpawnVehicle({plate = data.plate, vehicle = data.props}, false, false, false)
        RespawnWaitngList = RespawnWaitngList - 1
        if RespawnWaitngList < 0 then RespawnWaitngList = 0 end
        if (data.lock_state ~= nil and data.lock_state > 0) then
            SetVehicleDoorsLocked(vehicle, 2)
            SetVehicleDoorsLockedForAllPlayers(vehicle, true)
        end
    end)

end