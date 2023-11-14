if Config.Framework == 'qbcore' then
    
    QBCore.Functions.CreateCallback('qb-garage:server:GetPlayerVehicles', function(source, cb)
        local Player = QBCore.Functions.GetPlayer(source)
        local Vehicles = {}

        local Result = DatabaseQuery('SELECT * FROM player_vehicles WHERE citizenid="'..Player.PlayerData.citizenid..'"')
        if Result and Result[1] then
            for k, v in pairs(Result) do
                local VehicleData = QBCore.Shared.Vehicles[v.vehicle]
                if VehicleData then
                    if v.impound == 1 then
                        v.state = json.decode(v.impound_data).impound_label
                    else
                        if v.in_garage then
                            v.state = 'Garaged'
                        else
                            v.state = 'Out'
                        end
                    end
                    
                    local fullname 
                    if VehicleData["brand"] ~= nil then
                        fullname = VehicleData["brand"] .. " " .. VehicleData["name"]
                    else
                        fullname = VehicleData["name"]
                    end
                    local props = json.decode(v.mods)
                    Vehicles[#Vehicles+1] = {
                        fullname = fullname,
                        brand = VehicleData["brand"],
                        model = VehicleData["name"],
                        plate = v.plate,
                        garage = v.garage_id,
                        state = v.state,
                        fuel = props.fuelLevel,
                        engine = props.engineHealth,
                        body = props.bodyHealth
                    }
                else
                    print('^1[error_code-1975]')
                    print('Codesign Vehicle Missing: '..v.vehicle)
                end
            end
            cb(Vehicles)
        else
            cb(nil)
        end
    end)

    QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleOwner", function(source, cb, plate)
        local src = source
        local pData = QBCore.Functions.GetPlayer(src)
        MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',{plate, pData.PlayerData.citizenid}, function(result)
            if result[1] then
                cb(true, result[1].balance)
            else
                cb(false)
            end
        end)
    end)
    
end