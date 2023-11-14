if Config.PrivateGarages.ENABLE then

    local BlipTable = {}

    CreateThread(function()
        while not Authorised do Wait(1000) end
        TriggerEvent('chat:addSuggestion', '/'..Config.PrivateGarages.create_chat_command, L('chatsuggestion_privategarage_1'), {{ name=L('chatsuggestion_playerid_1'), help=L('chatsuggestion_playerid_2')}, {name=L('chatsuggestion_garagename_1'), help=L('chatsuggestion_garagename_2')}, {name=L('chatsuggestion_privategarage_2'), help=L('chatsuggestion_privategarage_3')} })
        RegisterCommand(Config.PrivateGarages.create_chat_command, function(source, args)
            if Config.PrivateGarages.Authorized_Jobs[GetJob().name] then
                if args[1] and args[2]and args[3] then
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local target_source = tonumber(args[1])
                    local garage_id = args[2]
                    local garage_type = args[3]
                    local data = {
                        Garage_ID = garage_id:lower(),
                        Type = garage_type,
                        Dist = 10,
                        x_1 = roundDecimals(coords.x, 2), y_1 = roundDecimals(coords.y, 2), z_1 = roundDecimals(coords.z, 2),
                        x_2 = roundDecimals(coords.x, 2), y_2 = roundDecimals(coords.y, 2), z_2 = roundDecimals(coords.z, 2), h_2 = roundDecimals(GetEntityHeading(ped), 2),
                        EventName1 = 'cd_garage:PrivateGarage',
                        Name = '<b>'..L('garage')..'</b></p>'..L('open_garage_1')..' </p>'..L('notif_storevehicle'),
                        EnableBlip = false,
                        JobRestricted = nil,
                    }
                    TriggerServerEvent('cd_garage:SavePrivateGarage', target_source, data)
                else
                    Notif(3, 'invalid_format')
                end
            else
                Notif(3, 'no_permissions')
            end
        end)

        TriggerEvent('chat:addSuggestion', '/'..Config.PrivateGarages.delete_chat_command, L('chatsuggestion_privategarage_4'), {{ name=L('chatsuggestion_privategarage_5'), help=L('chatsuggestion_privategarage_6')}})
        RegisterCommand(Config.PrivateGarages.delete_chat_command, function(source, args)
            if Config.PrivateGarages.Authorized_Jobs[GetJob().name] then
                if args[1] then
                    TriggerServerEvent('cd_garage:DeletePrivateGarage', args[1])
                else
                    Notif(3, 'invalid_format')
                end
            else
                Notif(3, 'no_permissions')
            end
        end)
    end)

    RegisterNetEvent('cd_garage:LoadPrivateGarages')
    AddEventHandler('cd_garage:LoadPrivateGarages', function(data)
        for c, d in pairs(data) do
            table.insert(Config.Locations, d)
            PrivateGarageBlips(d)
        end
    end)

    RegisterNetEvent('cd_garage:DeletePrivateGarage')
    AddEventHandler('cd_garage:DeletePrivateGarage', function(garage_id)
        for c, d in pairs(Config.Locations) do
            if d.Garage_ID == garage_id then
                table.remove(Config.Locations, c)
                local blip = BlipTable[d.Garage_ID]
                if DoesBlipExist(blip) then RemoveBlip(blip) BlipTable[d.Garage_ID] = nil end
                break
            end
        end
    end)

    function PrivateGarageBlips(data)
        local blip = AddBlipForCoord(data.x_1, data.y_1, data.z_1)
        BlipTable[data.Garage_ID] = blip
        SetBlipSprite(blip, Config.Blip[data.Type].sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.Blip[data.Type].scale)
        SetBlipColour(blip, Config.Blip[data.Type].colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(Config.Blip[data.Type].name:sub(1, -2)..': '..data.Garage_ID)
        EndTextCommandSetBlipName(blip)
    end

end
