if Config.FakePlates.ENABLE then

    CreateThread(function()
        while not Authorised do Wait(1000) end

        if Config.Framework == 'esx' then
            ESX.RegisterUsableItem(Config.FakePlates.item_name, function(source)
                TriggerClientEvent('cd_garage:FakePlate', source, 'add')
            end)

        elseif Config.Framework == 'qbcore' then
            QBCore.Functions.CreateUseableItem(Config.FakePlates.item_name, function(source, item)
                TriggerClientEvent('cd_garage:FakePlate', source, 'add')
            end)
        end
    end)

    RegisterServerEvent('cd_garage:FakePlate')
    AddEventHandler('cd_garage:FakePlate', function(action, current_plate, vehicle, new_plate)
        local _source = source
        if action == 'add' then
            if FakePlateTable[current_plate] == nil or FakePlateTable[new_plate] == nil then
                if CheckVehicleOwner(_source, current_plate) then
                    local Result = DatabaseQuery('SELECT plate FROM '..FW.vehicle_table..' WHERE plate="'..new_plate..'"')
                    if Result and Result[1] == nil then
                        FakePlateTable[new_plate] = {}
                        FakePlateTable[new_plate].new_plate = new_plate
                        FakePlateTable[new_plate].old_plate = current_plate
                        TriggerClientEvent('cd_garage:FakePlate_change', _source, action, vehicle, new_plate)
                        if Config.Framework == 'esx' then
                            local xPlayer = ESX.GetPlayerFromId(_source)
                            xPlayer.removeInventoryItem(Config.FakePlates.item_name, 1)
                
                        elseif Config.Framework == 'qbcore' then
                            local xPlayer = QBCore.Functions.GetPlayer(_source)
                            xPlayer.Functions.RemoveItem(Config.FakePlates.item_name, 1)
                        end
                        if Config.PersistentVehicles.ENABLE then
                            PersistentVehicle_FakePlate(current_plate, new_plate)
                        end
                        FakePlateChange(current_plate, new_plate)
                        Notif(_source, 1, 'fakeplate_add_success')
                    else
                        Notif(_source, 3, 'owned_vehicle', new_plate)
                    end
                else
                    Notif(_source, 3, 'dont_own_vehicle')
                end
            else
                Notif(_source, 3, 'already_has_fakeplate')
            end
        elseif action == 'remove' then
            if FakePlateTable[current_plate] ~= nil then
                if CheckVehicleOwner(_source, FakePlateTable[current_plate].old_plate) or (Config.FakePlates.RemovePlate.allowed_jobs.ENABLE and Config.FakePlates.RemovePlate.allowed_jobs.table[GetJob(_source)]) then
                    TriggerClientEvent('cd_garage:FakePlate_change', _source, action, vehicle, FakePlateTable[current_plate].old_plate)
                    if Config.PersistentVehicles.ENABLE then
                        PersistentVehicle_FakePlate(current_plate, FakePlateTable[current_plate].old_plate)
                    end
                    FakePlateChange(current_plate, FakePlateTable[current_plate].old_plate)
                    FakePlateTable[current_plate] = nil
                    Notif(_source, 1, 'fakeplate_remove_success')
                else
                    Notif(_source, 3, 'dont_own_vehicle')
                end
            else
                Notif(_source, 3, 'no_fakeplate')
            end
        end
    end)
end