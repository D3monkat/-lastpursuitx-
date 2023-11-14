if Config.TransferVehicle.ENABLE then
    
    RegisterServerEvent('cd_garage:TransferVehicle')
    AddEventHandler('cd_garage:TransferVehicle', function(plate, target, garage_type, label, fromUI)
        local _source = source
        if GetPlayerName(target) ~= nil then
            if target ~= _source then
                local source_identifier = GetIdentifier(_source)
                local target_identifier = GetIdentifier(target)

                local car_count = GetGarageCount(target, garage_type)
                local car_limit = GetGarageLimit(target)
                if car_count < car_limit then
                    if CheckVehicleOwner(_source, plate) then
                        DatabaseQuery('UPDATE '..FW.vehicle_table..' SET '..FW.vehicle_identifier..'="'..target_identifier..'" WHERE plate="'..plate..'"')
                        TriggerClientEvent('cd_garage:GiveVehicleKeys', _source, plate)
                        Notif(_source, 1, 'transfer_vehicle', plate, target)
                        Notif(target, 1, 'recieve_vehicle', plate, _source)
                        if fromUI then
                            TriggerClientEvent('cd_garage:TransferVehicle:Callback', _source, true, L('transfer_success'), false)
                        end
                        TransferVehicleLogs(_source, target, plate, label)
                    else
                        Notif(_source, 3, 'dont_own_vehicle')
                    end
                else
                    if fromUI then
                        TriggerClientEvent('cd_garage:TransferVehicle:Callback', _source, false, L('garage_full'), false)
                    else
                        Notif(_source, 3, 'garage_full')
                    end
                end
            else
                if fromUI then
                    TriggerClientEvent('cd_garage:TransferVehicle:Callback', _source, false, L('cant_transfer_yourself'), false)
                else
                    Notif(_source, 3, 'cant_transfer_yourself')
                end
            end
        else
            if fromUI then
                TriggerClientEvent('cd_garage:TransferVehicle:Callback', _source, false, L('incorrect_id'), false)
            else
                Notif(_source, 3, 'incorrect_id')
            end
        end
    end)

end
