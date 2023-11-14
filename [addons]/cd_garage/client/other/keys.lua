if Config.VehicleKeys.ENABLE then

    local KeysTable = {}

    function CacheVehicle(plate, vehicle)
        if KeysTable[plate] == nil then
            KeysTable[plate] = {}
            KeysTable[plate].vehicle = vehicle
        end
    end

    function AddKey(plate)
        if KeysTable[plate] ~= nil then
            KeysTable[plate].has_key = true
        else
            KeysTable[plate] = {}
            KeysTable[plate].has_key = true
        end
    end

    function RemoveKey(plate)
        if KeysTable[plate] ~= nil then
            KeysTable[plate].has_key = false
        else
            KeysTable[plate] = {}
            KeysTable[plate].has_key = false
        end
    end

    RegisterNetEvent('cd_garage:AddKeys')
    AddEventHandler('cd_garage:AddKeys', function(plate)
        if not plate then return end
        AddKey(GetCorrectPlateFormat(plate))
    end)

    RegisterNetEvent('cd_garage:AddKeys_playerload')
    AddEventHandler('cd_garage:AddKeys_playerload', function(data)
        if type(data) ~= 'table' then return end
        for c, d in pairs(data) do
            AddKey(GetCorrectPlateFormat(d))
        end
    end)

    RegisterNetEvent('cd_garage:RemoveKeys')
    AddEventHandler('cd_garage:RemoveKeys', function(plate)
        if not plate then return end
        RemoveKey(GetCorrectPlateFormat(plate))
    end)

    RegisterNetEvent('cd_garage:GiveVehicleKeys')
    AddEventHandler('cd_garage:GiveVehicleKeys', function(plate, vehicle)
        GiveVehicleKeys(plate, vehicle)
    end)


    TriggerEvent('chat:addSuggestion', '/'..Config.VehicleKeys.Commands.temporary_key, L('chatsuggestion_keytemp'))
    RegisterCommand(Config.VehicleKeys.Commands.temporary_key, function()
        local vehicle = GetClosestVehicle(5)
        if vehicle then
            local plate = GetPlate(vehicle)
            if DoesPlayerHaveKeys(plate) then
                local target_source = GetClosestPlayer(5)
                if target_source then
                    TriggerServerEvent('cd_garage:GiveKeys', 'temp', plate, target_source)
                else
                    Notif(3, 'no_player_found')
                end
            else
                Notif(3, 'no_keys')
            end
        else
            Notif(3, 'no_vehicle_found')
        end
    end)
    
    TriggerEvent('chat:addSuggestion', '/'..Config.VehicleKeys.Commands.database_key, L('chatsuggestion_keysave'))
    RegisterCommand(Config.VehicleKeys.Commands.database_key, function()
        local vehicle = GetClosestVehicle(5)
        if vehicle then
            local plate = GetPlate(vehicle)
            if DoesPlayerHaveKeys(plate) then
                local target_source = GetClosestPlayer(5)
                if target_source then
                    TriggerServerEvent('cd_garage:GiveKeys', 'save', plate, target_source)
                else
                    Notif(3, 'no_player_found')
                end
            else
                Notif(3, 'no_keys')
            end
        else
            Notif(3, 'no_vehicle_found')
        end
    end)

    TriggerEvent('chat:addSuggestion', '/'..Config.VehicleKeys.Commands.remove_key, L('chatsuggestion_keyremove'))
    RegisterCommand(Config.VehicleKeys.Commands.remove_key, function()
        TriggerServerEvent('cd_garage:ShowKeys')
    end)

    RegisterNetEvent('cd_garage:ShowKeys')
    AddEventHandler('cd_garage:ShowKeys', function(data)
        TriggerEvent('cd_garage:ToggleNUIFocus')
        ShowKeysUI(data)
    end)

    RegisterNUICallback('removekey', function(data)
        TriggerServerEvent('cd_garage:RemoveKeys', data.value)
    end)

    function GetKeysData()
        return KeysTable
    end

    function DoesPlayerHaveKeys(plate)
        local plate_formatted = GetCorrectPlateFormat(plate)
        if type(plate) == 'string' then
            if KeysTable and KeysTable[plate_formatted] and KeysTable[plate_formatted].has_key then
                return true
            end
        end
        return false
    end

    RegisterNetEvent('cd_garage:SaveAllVehicleDamage')
    AddEventHandler('cd_garage:SaveAllVehicleDamage', function()
        local data = {}
        for c, d in pairs(KeysTable) do
            if d.vehicle then
                data[#data+1] = GetVehicleProperties(d.vehicle)
            end
        end
        TriggerServerEvent('cd_garage:SaveAllVehicleDamage', data)
    end)
    


    CreateThread(function()
        while not Authorised do Wait(1000) end
        local show_notif = false
        while true do
            wait = 500
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                local plate = GetPlate(vehicle)
                CacheVehicle(plate, vehicle)
                if Config.VehicleKeys.Hotwire.ENABLE then
                    local data = KeysTable[plate]
                    if data then
                        if data.vehicle == nil then KeysTable[plate].vehicle = vehicle end
                        if data.has_key then
                            if not data.engine_enabled then
                                SetVehicleEngineOn(vehicle, true, false, false)
                                KeysTable[plate].engine_enabled = true
                            end
                        else
                            if not show_notif then
                                Notif(2, 'hotwire_info')
                                show_notif = true
                            end
                            wait = 5
                            SetVehicleEngineOn(vehicle, false, false, true)
                        end
                    else
                        SetVehicleEngineOn(vehicle, false, false, true)
                    end
                end
            end
            Wait(wait)
        end
    end)

    function StartCarAlarm(vehicle)
        CreateThread(function()
            StartVehicleAlarm(vehicle)
            SetVehicleAlarm(vehicle, true)
            SetVehicleAlarmTimeLeft(vehicle, 1*60*1000) --2 mins
            SetVehicleIndicatorLights(vehicle, 1, true)
            SetVehicleIndicatorLights(vehicle, 0, true)
            for cd = 1, 60 do
                SetVehicleLights(vehicle, 2)
                Wait(500)
                SetVehicleLights(vehicle, 0)
                Wait(500)
            end
            SetVehicleIndicatorLights(vehicle, 1, false)
            SetVehicleIndicatorLights(vehicle, 0, false)
        end)
    end
    
    if Config.VehicleKeys.Hotwire.ENABLE then

        CreateThread(function()
            while not Authorised do Wait(1000) end
            local result = nil
            while true do
                wait = 500
                local ped = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(ped)
                if GetPedInVehicleSeat(vehicle, -1) == ped then
                    local plate = GetPlate(vehicle)
                    local data = KeysTable[plate]
                    if data then
                        wait = 5
                        if not data.has_key and GetVehicleClass(vehicle) ~= 13 and IsControlJustReleased(0, Config.Keys.StartHotwire_Key) then
                            TriggerEvent('cd_garage:ToggleNUIFocus')
                            StartCarAlarm(vehicle)
                            for c, d in ipairs(Config.VehicleKeys.Hotwire.ActionBar) do
                                result = ActionBar(d.seconds, d.size, d.chances)
                                if not result then
                                    break
                                else
                                    Wait(3000)
                                end
                            end
                        end

                        NUI_status = false
                        if result then
                            AddKey(plate)
                            result = nil
                        end
                    end
                end
                Wait(wait)
            end
        end)

    end



    if Config.VehicleKeys.Lock.ENABLE then

        CreateThread(function()
            while not Authorised do Wait(1000) end
            RegisterKeyMapping(Config.VehicleKeys.Lock.command, L('chatsuggestion_vehiclelock'), 'keyboard', Config.VehicleKeys.Lock.key)
            TriggerEvent('chat:addSuggestion', '/'..Config.VehicleKeys.Lock.command, L('chatsuggestion_vehiclelock'))
            RegisterCommand(Config.VehicleKeys.Lock.command, function()
                TriggerEvent('cd_garage:ToggleVehicleLock') --The event to toggle the vehicle lock.
            end)

            if Config.VehicleKeys.Lock.lock_from_inside then
                while true do
                    Wait(500)
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if InVehicle() then
                        if GetVehicleDoorLockStatus(vehicle) == 2 then
                            SetVehicleDoorsLocked(vehicle, 4)
                        end
                    else
                        if GetVehicleDoorLockStatus(vehicle) == 4 then
                            SetVehicleDoorsLocked(vehicle, 2)
                        end
                    end
                end
            end
        end)

        function LockVehicle(vehicle, play_animation)
            Notif(3, 'vehicle_locked')
            if not InVehicle() and play_animation then
                PlayAnimation('mp_common', 'givetake1_a', 1000)
            end
            SetVehicleDoorsLocked(vehicle, 2)
            SetVehicleDoorsLockedForAllPlayers(vehicle, true)
            if IsVehicleEmpty(vehicle) then
                TriggerServerEvent('cd_garage:SyncVehicleLock', NetworkGetNetworkIdFromEntity(vehicle), 2)
            else
                TriggerServerEvent('cd_garage:SyncVehicleLock', NetworkGetNetworkIdFromEntity(vehicle), 2, GetPlayersInVehicle(vehicle))
            end
            LockLights(2, vehicle)
        end

        function UnLockVehicle(vehicle, play_animation)
            Notif(1, 'vehicle_unlocked')
            if not InVehicle() and play_animation then
                PlayAnimation('mp_common', 'givetake1_a', 1000)
            end
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            if IsVehicleEmpty(vehicle) then
                TriggerServerEvent('cd_garage:SyncVehicleLock', NetworkGetNetworkIdFromEntity(vehicle), 1)
            else
                TriggerServerEvent('cd_garage:SyncVehicleLock', NetworkGetNetworkIdFromEntity(vehicle), 1, GetPlayersInVehicle(vehicle))
            end
            LockLights(1, vehicle)
        end

        local cooldown = false
        RegisterNetEvent('cd_garage:ToggleVehicleLock')
        AddEventHandler('cd_garage:ToggleVehicleLock', function()
            while not Authorised do Wait(1000) end
            if not cooldown then
                local vehicle = GetClosestVehicle(5)
                if vehicle then
                    local plate = GetPlate(vehicle)
                    CacheVehicle(plate, vehicle)
                    if KeysTable[plate].has_key then
                        local lock = GetVehicleDoorLockStatus(vehicle)
                        cooldown = true
                        if lock == 0 or lock == 1 then
                            LockVehicle(vehicle, true)
                        else
                            UnLockVehicle(vehicle, true)
                        end
                        Wait(500)
                        cooldown = false
                    else
                        Notif(3, 'no_keys')
                    end
                else
                    Notif(3, 'no_vehicle_found')
                end
            else
                Notif(3, 'lock_cooldown')
            end
        end)

        RegisterNetEvent('cd_garage:SyncVehicleLock')
        AddEventHandler('cd_garage:SyncVehicleLock', function(netid, lock)
            local vehicle = NetworkGetEntityFromNetworkId(netid)
            if lock == 2 then
                SetVehicleDoorsLocked(vehicle, 2)
                SetVehicleDoorsLockedForAllPlayers(vehicle, true)
            elseif lock == 1 then
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            end
        end)

        function LockLights(state, vehicle)
            CreateThread(function()
                LockDoorSound()
                if state == 2 then
                    SetVehicleInteriorlight(vehicle, false)
                    SetVehicleLights(vehicle, 2)
                    Wait(500)
                    SetVehicleLights(vehicle, 0)
                    Wait(500)
                    SetVehicleLights(vehicle, 2)
                    Wait(2000)
                    SetVehicleLights(vehicle, 0)
                elseif state == 1 then
                    SetVehicleInteriorlight(vehicle, true)
                    SetVehicleLights(vehicle, 2)
                    Wait(500)
                    SetVehicleLights(vehicle, 0)
                    Wait(500)
                    SetVehicleLights(vehicle, 2)
                    Wait(500)
                    SetVehicleLights(vehicle, 0)
                end
            end)
        end
    end


    
    if Config.VehicleKeys.Lockpick.ENABLE then

        if Config.VehicleKeys.Lockpick.command.ENABLE then
            TriggerEvent('chat:addSuggestion', '/'..Config.VehicleKeys.Lockpick.command.chat_command, L('chatsuggestion_lockpick'))
            RegisterCommand(Config.VehicleKeys.Lockpick.command.chat_command, function()
                TriggerEvent('cd_garage:LockpickVehicle', false)
            end)
        end

        local doing_animation = false
        local function LockpickAnimation(vehicle)
            doing_animation = true
            CreateThread(function()
                local ped = PlayerPedId()
                TaskTurnPedToFaceEntity(ped, vehicle, 1000)
                RequestAnimDict('veh@break_in@0h@p_m_one@')
                while not HasAnimDictLoaded('veh@break_in@0h@p_m_one@') do Wait(0) end
                FreezeEntityPosition(ped, true)
                while doing_animation do
                    TaskPlayAnim(ped, 'veh@break_in@0h@p_m_one@', 'low_force_entry_ds', 2.0, -2.0, -1, 1, 0, 0, 0, 0 )
                    Wait(1000)
                    ClearPedTasks(ped)
                end
                FreezeEntityPosition(ped, false)
                RemoveAnimDict('veh@break_in@0h@p_m_one@')
            end)
        end

        RegisterNetEvent('cd_garage:LockpickVehicle')
        AddEventHandler('cd_garage:LockpickVehicle', function(used_usable_item)
            local vehicle = GetClosestVehicle(5)
            if vehicle then
                local plate = GetPlate(vehicle)
                CacheVehicle(plate, vehicle)
                if not KeysTable[plate].has_key then
                    local lock = GetVehicleDoorLockStatus(vehicle)
                    if lock > 1 then
                        if used_usable_item then
                            TriggerServerEvent('cd_garage:LockpickVehicle:RemoveItem')
                        end
                        LockpickAnimation(vehicle)
                        StartCarAlarm(vehicle)
                        local hacking = exports['cd_keymaster']:StartKeyMaster()
                        if hacking then
                            UnLockVehicle(vehicle, false)
                        else
                            Notif(3, 'lockpicking_failed')
                        end
                        ClearPedTasks(PlayerPedId())
                        doing_animation = false
                    else
                        Notif(3, 'vehicle_not_locked')
                    end
                else
                    Notif(3, 'cant_lockpick_have_keys')
                end
            else
                Notif(3, 'no_vehicle_found')
            end
        end)

    end

    RegisterNetEvent('vehiclekeys:client:SetOwner')
    AddEventHandler('vehiclekeys:client:SetOwner', function(plate)
        AddKey(GetCorrectPlateFormat(plate))
    end)

    RegisterNetEvent('qb-vehiclekeys:client:AddKeys')
    AddEventHandler('qb-vehiclekeys:client:AddKeys', function(plate)
        AddKey(GetCorrectPlateFormat(plate))
    end)

end