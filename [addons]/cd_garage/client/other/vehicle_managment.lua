if Config.StaffPerms['add'].ENABLE then
    TriggerEvent('chat:addSuggestion', '/'..Config.StaffPerms['add'].chat_command, L('chatsuggestion_vehicle_add'), {{ name=L('chatsuggestion_playerid_1'), help=L('chatsuggestion_playerid_2')}})
    RegisterCommand(Config.StaffPerms['add'].chat_command, function(source, args)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        if args[1] == nil then
            args[1] = GetPlayerServerId(PlayerId())
        end
        if IsPedInAnyVehicle(ped) then
            local all_plates = GetAllPlateFormats(vehicle)
            local plate = GetPlate(vehicle)
            local target = tonumber(args[1])
            local props = GetVehicleProperties(vehicle)
            local garage_type = GetGarageType(vehicle)
            TriggerServerEvent('cd_garage:VehicleManagement', 'add', {all_plates = all_plates, plate = plate, target = target, props = props, garage_type = garage_type, label = GetVehiclesData(props.model).model})
        else
            Notif(3, 'get_inside_veh')
        end
    end)
end

if Config.StaffPerms['delete'].ENABLE then
    TriggerEvent('chat:addSuggestion', '/'..Config.StaffPerms['delete'].chat_command, L('chatsuggestion_vehicle_delete'))
    RegisterCommand(Config.StaffPerms['delete'].chat_command, function(source)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local plate = GetPlate(vehicle)
            TriggerServerEvent('cd_garage:VehicleManagement', 'delete', {plate = plate})
        else
            local plate = OpenTextBox(false)
            if plate then
                TriggerServerEvent('cd_garage:VehicleManagement', 'delete', {plate = plate})
            else
                Notif(3, 'invalid_plateformat')
            end
        end
    end)
end

if Config.StaffPerms['plate'].ENABLE then
    TriggerEvent('chat:addSuggestion', '/'..Config.StaffPerms['plate'].chat_command, L('chatsuggestion_vehicle_plate'))
    RegisterCommand(Config.StaffPerms['plate'].chat_command, function(source)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local old_plate = GetPlate(vehicle)
            local new_plate = OpenTextBox(true)
            if new_plate then
                TriggerServerEvent('cd_garage:VehicleManagement', 'plate', {old_plate = old_plate, new_plate = new_plate})
            else
                Notif(3, 'invalid_plateformat')
            end
        else
            Notif(3, 'get_inside_veh')
        end
    end)
end

if Config.StaffPerms['keys'].ENABLE then
    TriggerEvent('chat:addSuggestion', '/'..Config.StaffPerms['keys'].chat_command, L('chatsuggestion_vehicle_keys'))
    RegisterCommand(Config.StaffPerms['keys'].chat_command, function()
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local old_plate = GetPlate(vehicle)
            TriggerServerEvent('cd_garage:VehicleManagement', 'keys', {plate = old_plate})
        else
            Notif(3, 'get_inside_veh')
        end
    end)
    
end


RegisterNetEvent('cd_garage:VehicleManagement_plate')
AddEventHandler('cd_garage:VehicleManagement_plate', function(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNumberPlateText(vehicle, plate)
    GiveVehicleKeys(GetCorrectPlateFormat(plate), vehicle)
end)