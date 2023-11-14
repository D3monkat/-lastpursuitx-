RegisterServerEvent('cd_garage:VehicleManagement')
AddEventHandler('cd_garage:VehicleManagement', function(action, data)
    local _source = source

    if CheckPerms(_source, action) then

        if action == 'add' then
            VehicleAdd(_source, action, data)

        elseif action == 'delete' then
            VehicleDelete(_source, action, data)

        elseif action == 'plate' then
            VehiclePlate(source, action, data)
        
        elseif action == 'keys' then
            VehicleKeys(source, action, data)
        end
        
    else
        Notif(_source, 3, 'vehmanagment_noperms')
    end
end)

function VehicleAdd(source, action, data)
    if GetPlayerName(data.target) then
        local identifier = GetIdentifier(data.target)
        local Result = DatabaseQuery('SELECT plate FROM '..FW.vehicle_table..' WHERE plate="'..data.all_plates.trimmed..'" or plate="'..data.all_plates.with_spaces..'" or plate="'..data.all_plates.mixed..'"')
        if Result[1] == nil then
            if Config.Framework == 'esx' then
                DatabaseQuery('INSERT INTO '..FW.vehicle_table..' ('..FW.vehicle_identifier..', plate, '..FW.vehicle_props..', garage_type, in_garage) VALUES (@'..FW.vehicle_identifier..', @plate, @'..FW.vehicle_props..', @garage_type, @in_garage)',
                {
                    ['@'..FW.vehicle_identifier..''] = identifier,
                    ['@plate'] = data.plate,
                    ['@'..FW.vehicle_props..''] = json.encode(data.props),
                    ['@garage_type'] = data.garage_type,
                    ['@in_garage'] = 0,
                })
            elseif Config.Framework == 'qbcore' then
                DatabaseQuery('INSERT INTO '..FW.vehicle_table..' ('..FW.vehicle_identifier..', plate, '..FW.vehicle_props..', garage_type, in_garage, license, hash, vehicle) VALUES (@'..FW.vehicle_identifier..', @plate, @'..FW.vehicle_props..', @garage_type, @in_garage, @license, @hash, @vehicle)',
                {
                    ['@'..FW.vehicle_identifier..''] = identifier,
                    ['@plate'] = data.plate,
                    ['@'..FW.vehicle_props..''] = json.encode(data.props),
                    ['@garage_type'] = data.garage_type,
                    ['@in_garage'] = 0,
                    ['@license'] = QBCore.Functions.GetIdentifier(source, Config.IdentifierType),
                    ['@hash'] = data.props.model,
                    ['@vehicle'] = data.label
                })
            end
            TriggerClientEvent('cd_garage:AddKeys', source, data.plate)
            Notif(source, 1, 'vehmanagment_added', data.plate, data.target)
            VehicleManagmentLogs(source, action, data.plate, data.target, data.garage_type)
        else
            Notif(source, 3, 'owned_vehicle', data.plate)
        end
    else
        Notif(source, 3, 'incorrect_id')
    end
end

function VehicleDelete(source, action, data)
    local Result = DatabaseQuery('SELECT plate FROM '..FW.vehicle_table..' WHERE plate="'..data.plate..'"')
    if Result and Result[1] then
        DatabaseQuery('DELETE FROM '..FW.vehicle_table..' WHERE plate="'..data.plate..'"')
        Notif(source, 1, 'vehmanagment_deleted')
        VehicleManagmentLogs(source, action, data.plate)
    else
        Notif(source, 3, 'not_owned_vehicle')
    end
end

function VehiclePlate(source, action, data)
    local Result_1 = DatabaseQuery('SELECT plate, '..FW.vehicle_props..' FROM '..FW.vehicle_table..' WHERE plate="'..data.old_plate..'"')
    if Result_1 and Result_1[1] ~= nil then
        local Result_2 = DatabaseQuery('SELECT plate FROM '..FW.vehicle_table..' WHERE plate="'..data.new_plate..'"')
        if Result_2[1] == nil then
            local props = json.decode(ConvertData({Result_1[1].vehicle, Result_1[1].mods}))
            props.plate = data.new_plate
            DatabaseQuery('UPDATE '..FW.vehicle_table..' SET plate=@new_plate, '..FW.vehicle_props..'=@'..FW.vehicle_props..' WHERE plate=@old_plate', {
                ['@old_plate'] = data.old_plate,
                ['@new_plate'] = data.new_plate,
                ['@'..FW.vehicle_props..''] = json.encode(props),
            })
            TriggerClientEvent('cd_garage:VehicleManagement_plate', source, data.new_plate)
            Notif(source, 1, 'vehmanagment_platechanged', data.old_plate, data.new_plate)
            VehicleManagmentLogs(source, action, data.old_plate, data.new_plate)
            if Config.PersistentVehicles.ENABLE then
                PersistentVehicle_FakePlate(data.old_plate, data.new_plate)
            end
        else
            Notif(source, 3, 'owned_vehicle', data.new_plate)
        end
    else
        Notif(source, 3, 'not_owned_vehicle')
    end
end

function VehicleKeys(source, action, data)
    TriggerClientEvent('cd_garage:GiveVehicleKeys', source, data.plate)
end
