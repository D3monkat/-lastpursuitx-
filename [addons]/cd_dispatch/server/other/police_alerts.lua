if Config.PoliceAlerts.ENABLE then


    --███████╗████████╗ ██████╗ ██╗     ███████╗███╗   ██╗     ██████╗ █████╗ ██████╗ 
    --██╔════╝╚══██╔══╝██╔═══██╗██║     ██╔════╝████╗  ██║    ██╔════╝██╔══██╗██╔══██╗
    --███████╗   ██║   ██║   ██║██║     █████╗  ██╔██╗ ██║    ██║     ███████║██████╔╝
    --╚════██║   ██║   ██║   ██║██║     ██╔══╝  ██║╚██╗██║    ██║     ██╔══██║██╔══██╗
    --███████║   ██║   ╚██████╔╝███████╗███████╗██║ ╚████║    ╚██████╗██║  ██║██║  ██║
    --╚══════╝   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝


    RegisterServerEvent('cd_dispatch:pdalerts:Stolencar')
    AddEventHandler('cd_dispatch:pdalerts:Stolencar', function(data)
        local message = L('policealerts_stolencar_message', data.sex, data.vehicle_colour, data.vehicle_label, data.vehicle_plate, data.street)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = Config.PoliceAlerts.police_jobs,
            coords = data.coords,
            title = L('policealerts_stolencar_title'),
            message = message,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 488,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = L('policealerts_stolencar_title'),
                time = 5,
                sound = 1,
                radius = 100,
            }
        })

        if GetResourceState('cd_radar') == 'started' then
            TriggerEvent('cd_radar:RadarDatabase_ADD', {
                plate = data.vehicle_plate,
                model = data.vehicle_label,
                colour = data.vehicle_colour,
                reason = 'Robbery',
                type = 'bolo',
                name = L('dispatch')..L('policealerts_stolencar_title'),
                notes = message,
                date = nil,
            })
        end
    end)

    local function CheckVehicleOwner(source, all_plates)
        local identifier = GetIdentifier(source)
        local Result = DatabaseQuery('SELECT '..Config.FrameworkSQLtables.vehicle_identifier..' FROM '..Config.FrameworkSQLtables.vehicle_table..' WHERE plate="'..all_plates.trimmed..'" or plate="'..all_plates.with_spaces..'" or plate="'..all_plates.mixed..'"')
        local is_owner, owner = false, nil
        if Result and Result[1] then
            if Config.Framework == 'esx' then
                owner = Result[1].owner
            elseif Config.Framework == 'qbcore' then
                owner = Result[1].citizenid
            end
            if owner and owner == identifier then
                is_owner = true
            end
        end
        return is_owner
    end

    RegisterServerEvent('cd_dispatch:CheckVehicleOwner')
    AddEventHandler('cd_dispatch:CheckVehicleOwner', function(all_plates, id)
        TriggerClientEvent('cd_dispatch:Callback', source, CheckVehicleOwner(source, all_plates), id)
    end)


    -- ██████╗ ██╗   ██╗███╗   ██╗███████╗██╗  ██╗ ██████╗ ████████╗███████╗
    --██╔════╝ ██║   ██║████╗  ██║██╔════╝██║  ██║██╔═══██╗╚══██╔══╝██╔════╝
    --██║  ███╗██║   ██║██╔██╗ ██║███████╗███████║██║   ██║   ██║   ███████╗
    --██║   ██║██║   ██║██║╚██╗██║╚════██║██╔══██║██║   ██║   ██║   ╚════██║
    --╚██████╔╝╚██████╔╝██║ ╚████║███████║██║  ██║╚██████╔╝   ██║   ███████║
    -- ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝


    RegisterServerEvent('cd_dispatch:pdalerts:Gunshots')
    AddEventHandler('cd_dispatch:pdalerts:Gunshots', function(data, weapon_name, in_vehicle)
        local message
        if in_vehicle then
            message = L('policealerts_gunshots_message_1', data.vehicle_colour, data.vehicle_label, data.vehicle_plate, data.heading, data.street)
        else
            message = L('policealerts_gunshots_message_2', data.sex, weapon_name, data.street)
        end
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = Config.PoliceAlerts.police_jobs,
            coords = data.coords,
            title = L('policealerts_gunshots_title'),
            message = message,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 313,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = L('policealerts_gunshots_title'),
                time = 5,
                sound = 1,
                radius = 100,
            }
        })

        if GetResourceState('cd_radar') == 'started' and in_vehicle then
            TriggerEvent('cd_radar:RadarDatabase_ADD', {
                plate = data.vehicle_plate,
                model = data.vehicle_label,
                colour = data.vehicle_colour,
                reason = 'Firearms',
                type = 'bolo',
                name = L('dispatch')..L('policealerts_gunshots_title'),
                notes = message,
                date = nil,
            })
        end
    end)


    --███████╗██████╗ ███████╗███████╗██████╗     ████████╗██████╗  █████╗ ██████╗ ███████╗
    --██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗    ╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝
    --███████╗██████╔╝█████╗  █████╗  ██║  ██║       ██║   ██████╔╝███████║██████╔╝███████╗
    --╚════██║██╔═══╝ ██╔══╝  ██╔══╝  ██║  ██║       ██║   ██╔══██╗██╔══██║██╔═══╝ ╚════██║
    --███████║██║     ███████╗███████╗██████╔╝       ██║   ██║  ██║██║  ██║██║     ███████║
    --╚══════╝╚═╝     ╚══════╝╚══════╝╚═════╝        ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝


    RegisterServerEvent('cd_dispatch:pdalerts:Speedtrap')
    AddEventHandler('cd_dispatch:pdalerts:Speedtrap', function(data, config_data, speed, all_plates)
        local _source = source
        if (config_data.fine_amount > 0 and not Config.PoliceAlerts.SpeedTrap.check_owner_for_fine) or (config_data.fine_amount > 0 and Config.PoliceAlerts.SpeedTrap.check_owner_for_fine and CheckVehicleOwner(_source, all_plates)) then
            RemoveMoney(_source, config_data.fine_amount)
            Notif(_source, 2, 'speedtrap_1', data.vehicle_colour, data.vehicle_label, data.vehicle_plate, speed, data.heading, data.street, config_data.fine_amount)
        else
            Notif(_source, 2, 'speedtrap_2', data.vehicle_colour, data.vehicle_label, data.vehicle_plate, speed, data.heading, data.street)
        end

        local message = L('policealerts_speedtrap_message', data.vehicle_colour, data.vehicle_label, data.vehicle_plate, speed, data.heading, data.street)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = Config.PoliceAlerts.police_jobs,
            coords = data.coords,
            title = L('policealerts_speedtrap_title'),
            message = message,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 515,
                scale = 1.0,
                colour = 3,
                flashes = false,
                text = L('policealerts_speedtrap_title'),
                time = 5,
                sound = 1,
                radius = 0,
            }
        })

        if GetResourceState('cd_radar') == 'started' then
            TriggerEvent('cd_radar:RadarDatabase_ADD', {
                plate = data.vehicle_plate,
                model = data.vehicle_label,
                colour = data.vehicle_colour,
                reason = 'Speeding',
                type = 'bolo',
                name = L('dispatch')..L('policealerts_speedtrap_title'),
                notes = message,
                date = nil,
            })
        end
    end)

end