--- Events

RegisterNetEvent(Shared.Resource .. ':server:CrushVehicle', function()
    local src = source
    local ped = GetPlayerPed(src)
    local Player = Framework.Functions.GetPlayer(src)

    local veh = GetVehiclePedIsIn(ped, false)
    if not Player or veh == 0 then return end

    if Utils.PlayerIsLeo(Player.PlayerData.job) then
        local model = Framework.Shared.VehicleHashes[GetEntityModel(veh)].model
        local plate = GetVehicleNumberPlateText(veh)

        MySQL.query([[
            DELETE FROM player_vehicles 
            WHERE vinscratched = 1 AND vehicle = ? AND plate = ?
        ]], { model, plate })

        -- Log
        if Shared.Debug then print('^3[' .. Shared.Resource .. '] ^5Deleted VIN Scratch Vehicle (Vehicle Crush) Model: ' .. model .. ' Plate: ' .. plate .. '^7') end
        
        Utils.CreateLog('carboosting', 'Vehicle Delete', '**'.. Player.PlayerData.name .. '** (citizenid: *' .. Player.PlayerData.citizenid .. '* | id: *' .. src .. '*) Crushed VIN Vehicle, Model: ' .. model .. ' Plate: ' .. plate)
    else
        Utils.Notify(src, Locales['police_only'], 'error', 2500)
    end
end)

--- Callbacks

lib.callback.register(Shared.Resource .. ':server:CanCrushVehicle', function(source)
    local ped = GetPlayerPed(source)
    local veh = GetVehiclePedIsIn(ped, false)

    local Player = Framework.Functions.GetPlayer(source)

    if veh == 0 or not Utils.PlayerIsLeo(Player.PlayerData.job) then
        return false
    end

    local vehData = Framework.Shared.VehicleHashes[GetEntityModel(veh)]
    if not vehData then return false end

    local plate = GetVehicleNumberPlateText(veh)

    local result = MySQL.scalar.await([[
        SELECT vinscratched 
        FROM player_vehicles 
        WHERE vehicle = ? AND plate = ?
    ]], { vehData.model, plate })

    return result == 1
end)
