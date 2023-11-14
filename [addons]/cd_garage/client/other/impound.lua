if Config.Impound.ENABLE then

    CreateThread(function()
        while not Authorised do Wait(1000) end
        TriggerEvent('chat:addSuggestion', '/'..Config.Impound.chat_command, L('chatsuggestion_impound'))
        RegisterCommand(Config.Impound.chat_command, function()
            if IsAllowed_Impound() then
                TriggerEvent('cd_garage:ImpoundVehicle')
            else
                Notif(3, 'no_permissions_impounding')
            end
        end)
    end)

    CreateThread(function()
        while not Authorised do Wait(1000) end
        for c, d in pairs (Config.ImpoundLocations) do
            local blip = AddBlipForCoord(d.coords.x, d.coords.y, d.coords.z)
            SetBlipSprite (blip, d.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, d.blip.scale)
            SetBlipColour (blip, d.blip.colour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(d.blip.name)
            EndTextCommandSetBlipName(blip)

            table.insert(Config.Locations, {Dist = 5, ImpoundName = c, x_1 = d.coords.x, y_1 = d.coords.y, z_1 = d.coords.z, EventName1 = 'cd_garage:OpenImpound', Name = '<b>'..L('impound')..'</b></p> '..L('open_impound')})
        end
    end)

    function GetImpoundName(impound)
        for c, d in pairs (Config.ImpoundLocations) do
            if d.ImpoundID == impound then
                return d.blip.name
            end
        end
    end

    function CheckCorrectImpound(garage_type, impound)
        if string.find(impound, 'air') then
            if garage_type == 'air' then
                return true
            else
                return false
            end
        elseif string.find(impound, 'boat') then
            if garage_type == 'boat' then
                return true
            else
                return false
            end
        elseif string.find(impound, 'car') then
           if garage_type == 'car' then
                return true
            else
                return false
            end
        else
            return false
        end
    end
    
    RegisterNetEvent('cd_garage:OpenImpound')
    AddEventHandler('cd_garage:OpenImpound', function()
        ImpoundData = nil
        while ImpoundData == nil and not ServerReplied do Wait(0) end
        ShowImpound_UI(ImpoundData)
        ServerReplied = false
    end)

    RegisterNetEvent('cd_garage:CivUnimpound')
    AddEventHandler('cd_garage:CivUnimpound', function(action, data, impound)
        if action == 'spawn' then
            TriggerServerEvent('cd_garage:ChangeImpoundState', data.plate, impound, data.label)
            ImpoundData = nil
            SpawnVehicle(data, false, false, true)
        elseif action == 'return' then
            TriggerServerEvent('cd_garage:ChangeImpoundState', data.plate, impound, data.label)
            ImpoundData[data.id+1] = nil
            ShowImpound_UI(ImpoundData)
        elseif action == 'disablenui' then
            NUI_status = false
        end
    end)

    RegisterNetEvent('cd_garage:ImpoundVehicle')
    AddEventHandler('cd_garage:ImpoundVehicle', function(chosen_vehicle)
        local ped = PlayerPedId()
        if chosen_vehicle ~= nil and type(chosen_vehicle) == 'number' and DoesEntityExist(chosen_vehicle) then
            vehicle = chosen_vehicle
        else
            vehicle = GetClosestVehicle(5)
        end
        if not IsPedInAnyVehicle(ped, false) then
            if vehicle then
                if IsVehicleEmpty(vehicle) then
                    TaskTurnPedToFaceEntity(ped, vehicle, 1000)
                    Wait(1000)
                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
                    local values = {}
                    for c, d in pairs (Config.ImpoundLocations) do
                        values[#values+1] = {impound = c, name = d.blip.name, vehicle = vehicle}
                    end
                    ChooseImpound_UI(values)
                else
                    Notif(3, 'impound_vehicle_not_empty')
                end
            else
                Notif(3, 'no_vehicle_found')
            end
        else
            Notif(3, 'get_out_veh')
        end
    end)

    RegisterNetEvent('cd_garage:ImpoundVehicle:Direct')
    AddEventHandler('cd_garage:ImpoundVehicle:Direct', function(data)
        local label = GetVehiclesData(data.props.model).name
        local adv_stats = GetAdvStats(data.plate, false)
        TriggerServerEvent('cd_garage:ChangeImpoundState', data.plate, data.impound, label, data.props, adv_stats, data.time, data.description, data.canretrive)
    end)

end