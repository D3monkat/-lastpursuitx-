if Config.InsideGarage.ENABLE then
    
    RegisterNetEvent('cd_garage:StartThread_1')
    AddEventHandler('cd_garage:StartThread_1', function()
        CreateThread(function()
            while true do
                Wait(5)
                if InGarage and MyCars ~= nil then
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local vehicle = GetClosestVehicleData(coords, 5.1)
                    if vehicle.state then
                        for cd = 1, #MyCars do
                            if MyCars[cd] ~= nil then
                                if MyCars[cd].vehicle == vehicle.vehicle then
                                    if Config.InsideGarage.use_spotlight then
                                        DrawSpotlight(vehicle.coords)
                                    end
                                    if IsControlJustReleased(0, Config.Keys.QuickChoose_Key) then
                                        if not Config.Impound or GarageInfo[cd].impound == 0 then
                                            if CheckProperty_inside(cd) then
                                                if not Config.UniqueGarages or CurrentGarage == GarageInfo[cd].garage_id or InProperty == true then
                                                    local streetscheck = CheckVehicleOnStreets(GarageInfo[cd].plate, GarageInfo[cd].in_garage, GarageInfo[cd].vehicle.model)
                                                    if streetscheck.result == 'onstreets' then
                                                        InsideAction(streetscheck.message)
                                                    elseif streetscheck.result == 'outbutnotonstreets' then
                                                        InsideAction(streetscheck.message)
                                                    elseif streetscheck.result == 'canspawn' then
                                                        DoScreenFadeOut(100)
                                                        Wait(150)
                                                        SpawnVehicle(GarageInfo[cd], false, false, true)
                                                        DoScreenFadeIn(500)
                                                    end
                                                else
                                                    InsideAction(L('vehicle_is_in')..' <b>'..L('garage')..' '..GarageInfo[cd].garage_id..'</b>')
                                                end
                                            end
                                        else
                                            InsideAction(L('vehicle_is_in_the')..' <b>'..GetImpoundName(GarageInfo[cd].impound)..'</b>')
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    break
                end
            end
        end)
    end)

    RegisterNetEvent('cd_garage:StartThread_2')
    AddEventHandler('cd_garage:StartThread_2', function()
        CreateThread(function()
            local lastvehicle
            while true do
                Wait(100)
                if InGarage and MyCars ~= nil then
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped, 1)
                    local vehicle = GetClosestVehicleData(coords, 5.1)
                    if vehicle.state then
                        for cd = 1, #MyCars do
                            if MyCars[cd] ~= nil then
                                if MyCars[cd].vehicle == vehicle.vehicle and lastvehicle ~= vehicle.vehicle then
                                    ShowInsideGarage_UI(MyCars[cd])
                                end
                            end
                        end
                    else
                        HideInsideGarage_UI()
                    end
                    lastvehicle = vehicle.vehicle

                    local dist2 = #(vector3(coords.x, coords.y, coords.z)-vector3(shell_coords.x, shell_coords.y, shell_coords.z))
                    if dist2 > 100 then
                        InGarage = false
                        TriggerEvent('cd_garage:Exit', true)
                        DrawTextUI('hide')
                    end
                else
                    break
                end
            end
        end)
    end)

    RegisterNetEvent('cd_garage:Cooldown')
    AddEventHandler('cd_garage:Cooldown', function(time)
        CooldownActive = true
        Wait(time)
        CooldownActive = false
    end)

    function CreateGarage(shell_data)
        local offset
        if shell_data.type == '10cargarage_shell' then
            offset = -2
        elseif shell_data.type == '40cargarage_shell' then
            offset = -4.4
        end

        local ped = PlayerPedId()
        shell_coords = GetEntityCoords(ped)-vector3(0,0,Config.InsideGarage.shell_z_axis)
        local model = GetHashKey(shell_data.type)
        shell = CreateObjectNoOffset(model, shell_coords.x, shell_coords.y, shell_coords.z, false, false, false)
        while not DoesEntityExist(shell) do Wait(0) print('shell does not exist') end
        FreezeEntityPosition(shell, true)
        SetEntityAsMissionEntity(shell, true, true)
        SetModelAsNoLongerNeeded(model)
        shell_door_coords = vector3(shell_coords.x+shell_data.enter_coords.x, shell_coords.y+shell_data.enter_coords.y, shell_coords.z+offset)
        Teleport(ped, shell_door_coords.x, shell_door_coords.y, shell_door_coords.z, shell_data.enter_heading, true)
        ToggleShellTime('enter')
        TriggerEvent('cd_garage:cam', shell_data.type)
        TriggerEvent('cd_garage:CancelCamOption')
        SetPlayerInvisibleLocally(ped, true)
    end

    function GetShellType(garage_count, shell_type)
        if GetResourceState('cd_garageshell2') == 'started' then
            if shell_type ~= nil then
                if shell_type == '10cargarage_shell' then
                    return {type = '10cargarage_shell', max_cars = 10, enter_coords = vector3(7, -19, 0), enter_heading = 82.0}
                elseif shell_type == '40cargarage_shell' then
                    return {type = '40cargarage_shell', max_cars = 40, enter_coords = vector3(0, 7, 0), enter_heading = 355.0}
                end
            else
                if garage_count >= 0 and garage_count <= 10 then
                    return {type = '10cargarage_shell', max_cars = 10, enter_coords = vector3(7, -19, 0), enter_heading = 82.0}
                elseif garage_count > 10 then
                    return {type = '40cargarage_shell', max_cars = 40, enter_coords = vector3(0, 7, 0), enter_heading = 355.0}
                end
            end
        else
            return {type = '10cargarage_shell', max_cars = 10, enter_coords = vector3(7, -19, 0), enter_heading = 82.0}
        end
    end

    function DeleteGarage()
        DeleteObject(shell)
        DeleteEntity(shell)
        SetPlayerInvisibleLocally(PlayerPedId(), false)
    end

    RegisterNetEvent('cd_garage:CancelCamOption')
    AddEventHandler('cd_garage:CancelCamOption', function()
        DrawTextUI('show', '<b>'..L('garage')..'<b/></p>'..L('cancel_cam'))
        while cam ~= nil do
            Wait(5)
            if IsControlJustReleased(0, 18) then
                cam = nil
                DisableCam()
            end
        end
        DrawTextUI('hide')
    end)

    RegisterNetEvent('cd_garage:cam')
    AddEventHandler('cd_garage:cam', function(shell_type)
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', false)
        SetCamActive(cam, true)

        if shell_type == '10cargarage_shell' then
            SetCamParams(cam, shell_door_coords.x-7, shell_door_coords.y+1, shell_door_coords.z+1, 5.27, 0.5186, 300.0, 70.0, 0, 1, 1, 2) --start cam location
            SetCamParams(cam, shell_door_coords.x-8, shell_door_coords.y+27, shell_door_coords.z+1,5.27, 0.5186, 200.0, 70.0, 6000, 0, 0, 2) --end cam location
            RenderScriptCams(true, false, 3000, 1, 1)
            if cam == nil then return end
            Wait(5500)
            if cam == nil then return end
            DoScreenFadeOut(500)
            Wait(500)
            if cam == nil then return end
            DoScreenFadeIn(500)
            if cam == nil then return end
            SetCamParams(cam, shell_door_coords.x-9, shell_door_coords.y+27, shell_door_coords.z+1, 5.27, 0.5186, 100.0, 70.0, 0, 1, 1, 2) --start cam location
            SetCamParams(cam, shell_door_coords.x-8, shell_door_coords.y+1, shell_door_coords.z+1, 5.27, 0.5186, 0.0, 70.0, 6000, 0, 0, 2) --end cam location
            RenderScriptCams(true, false, 3000, 1, 1)
            if cam == nil then return end
            Wait(7000)
            DisableCam()

        elseif shell_type == '40cargarage_shell' then
            SetCamParams(cam, shell_door_coords.x, shell_door_coords.y, shell_door_coords.z+1, 5.27, 0.5186, 300.0, 70.0, 0, 1, 1, 2) --start cam location
            SetCamParams(cam, shell_door_coords.x+43, shell_door_coords.y-8, shell_door_coords.z+1,5.27, 0.5186, 200.0, 70.0, 6000, 0, 0, 2) --end cam location
            RenderScriptCams(true, false, 3000, 1, 1)
            if cam == nil then return end
            Wait(5200)
            if cam == nil then return end
            DoScreenFadeOut(500)
            Wait(500)
            if cam == nil then return end
            DoScreenFadeIn(500)
            if cam == nil then return end
            SetCamParams(cam, shell_door_coords.x, shell_door_coords.y, shell_door_coords.z+1, 5.27, 0.5186, 100.0, 70.0, 0, 1, 1, 2) --start cam location
            SetCamParams(cam, shell_door_coords.x-43, shell_door_coords.y-12, shell_door_coords.z+1, 5.27, 0.5186, 0.0, 70.0, 6000, 0, 0, 2) --end cam location
            RenderScriptCams(true, false, 3000, 1, 1)
            if cam == nil then return end
            Wait(6000)
            DisableCam()
        end
    end)

    function DisableCam()
        in_cam = false
        SetCamActive(cam, false)
        DestroyCam(cam, false)
        RenderScriptCams(false, true, 500, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end

end
