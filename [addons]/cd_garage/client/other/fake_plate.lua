if Config.FakePlates.ENABLE then

    CreateThread(function()
        if Config.FakePlates.RemovePlate.chat_command then
            while not Authorised do Wait(1000) end
            TriggerEvent('chat:addSuggestion', '/'..Config.FakePlates.RemovePlate.chat_command, L('chatsuggestion_fakeplate'))
            RegisterCommand(Config.FakePlates.RemovePlate.chat_command, function()
                TriggerEvent('cd_garage:FakePlate', 'remove')
            end)
        end
    end)

    RegisterNetEvent('cd_garage:FakePlate')
    AddEventHandler('cd_garage:FakePlate', function(action)
        local ped = PlayerPedId()
        if not InVehicle() then
            local vehicle = GetClosestVehicle(5)
            if vehicle then
                local current_plate = GetPlate(vehicle)
                if action == 'add' then
                    TaskTurnPedToFaceEntity(ped, vehicle, 1000)
                    Wait(1000)
                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                    local new_plate = OpenTextBox(true)
                    if new_plate then
                        TriggerServerEvent('cd_garage:FakePlate', action, current_plate, vehicle, new_plate)
                    else
                        Notif(3, 'invalid_plateformat')
                    end

                elseif action == 'remove' then
                    TriggerServerEvent('cd_garage:FakePlate', action, current_plate, vehicle)
                end
                ClearPedTasks(ped)
            else
                Notif(3, 'no_vehicle_found')
            end
        else
            Notif(3, 'get_out_veh')
        end
    end)

    RegisterNetEvent('cd_garage:FakePlate_change')
    AddEventHandler('cd_garage:FakePlate_change', function(action, vehicle, plate)
        SetVehicleNumberPlateText(vehicle, plate)
        if action == 'add' then
            GiveVehicleKeys(plate, vehicle)
        end
    end)
    
end
