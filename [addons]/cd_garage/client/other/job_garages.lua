if Config.JobVehicles.ENABLE then

    function SetPlateRandom(vehicle, plate)
        local plate = Trim(plate:upper())
        local length = #plate
        local result = 8-length
        if result ~= 0 then
            random = 0
            if result == 8 then
                random = math.random(00000000,99999999)
            elseif result == 7 then
                random = math.random(0000000,9999999)
            elseif result == 6 then
                random = math.random(000000,999999)
            elseif result == 5 then
                random = math.random(00000,99999)
            elseif result == 4 then
                random = math.random(0000,9999)
            elseif result == 3 then
                random = math.random(000,999)
            elseif result == 2 then
                random = math.random(00,99)
            elseif result == 1 then
                random = math.random(0,9)
            end
            SetVehicleNumberPlateText(vehicle, plate..''..random)
            return plate..''..random
        else
            SetVehicleNumberPlateText(vehicle, plate)
            return plate
        end
    end
    
    function SetVehicleMaxMods(vehicle)
        SetVehicleModKit(vehicle, 0)
        SetVehicleMod(vehicle, 11, 3, false)--engine
        SetVehicleMod(vehicle, 12, 2, false)--brakes
        SetVehicleMod(vehicle, 13, 2, false)--transmission
        SetVehicleMod(vehicle, 15, 2, false)--suspension
        SetVehicleMod(vehicle, 16, 4, false)--armor
        ToggleVehicleMod(vehicle,  18, true)--turbo
    end

    local function ChangeLivery(action, vehicle)
        local liveryCount = GetVehicleLiveryCount(vehicle)
        local livery = GetVehicleLivery(vehicle)
        if action == 'right' then
            livery = livery+1
            if livery == liveryCount then
                livery = 0
            end
            SetVehicleLivery(vehicle, livery)
    
        elseif action == 'left' then
                livery = livery-1
            if livery == -1 then
                livery = liveryCount-1
            end
            SetVehicleLivery(vehicle, livery)
        end
    end

    function SetLiverysThread()
        CreateThread(function()
            while true do
                Wait(5)
                local ped = PlayerPedId()
                if InVehicle() then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    DrawLiveryText('⬅️ '..L('pre_livery')..'. ➡️ '..L('next_livery')..'.\n ~b~['..L('enter')..']~w~ '..L('confirm')..'.')
                    if IsControlJustReleased(0, 174) then
                        ChangeLivery('left', vehicle)
                    elseif IsControlJustReleased(0, 175) then
                        ChangeLivery('right', vehicle)
                    elseif IsControlJustReleased(0, 191) then
                        break
                    end
                else
                    break
                end
            end
        end)
    end

    CreateThread(function()
        while not Authorised do Wait(1000) end
        local alreadyEnteredZone = false
        local GlobalText = nil
        local GlobalText_last = nil
        local wait = 5
        while true do
            wait = 5
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local job = GetJob().name
            local inZone = false
            if Config.JobVehicles.Locations[job] ~= nil and on_duty then
                for cd = 1, #Config.JobVehicles.Locations[job] do
                    local self = Config.JobVehicles.Locations[job][cd]
                    local dist = #(coords-vector3(self.coords.x, self.coords.y, self.coords.z))
                    if dist <= self.distance then
                        wait = 5
                        inZone = true
                        GlobalText = '<b>'..L('job_garage')..'</b></p>'..L('open_garage_1').. '</p>'..L('notif_storevehicle')
                        if InVehicle() then
                            GlobalText = '<b>'..L('job_garage')..'</b></p>'..L('notif_storevehicle')
                        end

                        if not CooldownActive then
                            if IsControlJustReleased(0, Config.Keys.QuickChoose_Key) then
                                if not InVehicle() then
                                    TriggerEvent('cd_garage:Cooldown', 3000)
                                    if Config.JobVehicles.ENABLE and self.method == 'societyowned' then
                                        TriggerEvent('cd_garage:JobVehicleSpawn', 'owned', job, self.garage_type, true, self.spawn_coords)
                                    elseif Config.JobVehicles.ENABLE and self.method == 'personalowned' then
                                        TriggerEvent('cd_garage:JobVehicleSpawn', 'owned', job, self.garage_type, false, self.spawn_coords)
                                    elseif self.method == 'regular' then
                                        TriggerEvent('cd_garage:JobVehicleSpawn', 'not_owned', job, self.garage_type, Config.JobVehicles.RegularMethod[job], self.spawn_coords)
                                    end
                                else
                                    Notif(3, 'get_out_veh')
                                end
                            elseif IsControlJustReleased(0, Config.Keys.StoreVehicle_Key) then
                                TriggerEvent('cd_garage:Cooldown', 1000)
                                if Config.JobVehicles.ENABLE and self.method == 'societyowned' then
                                    TriggerEvent('cd_garage:StoreVehicle_Main', false, job, false)
                                elseif Config.JobVehicles.ENABLE and self.method == 'personalowned' then
                                    TriggerEvent('cd_garage:StoreVehicle_Main', false, false, false)
                                elseif self.method == 'regular' then
                                    local vehicle = GetClosestVehicle(5)
                                    if vehicle then
                                        if IsPedInVehicle(ped, vehicle, true) then
                                            TaskLeaveVehicle(ped, vehicle, 0)
                                            while IsPedInVehicle(ped, vehicle, true) do
                                                Wait(0)
                                            end
                                        end
                                        CD_DeleteVehicle(vehicle)
                                        Notif(1, 'vehicle_stored')
                                    else
                                        Notif(3, 'no_vehicle_found')
                                    end
                                end
                            end
                        end
                        if not pausemenuopen and IsPauseMenuActive() then
                            pausemenuopen = true
                            DrawTextUI('hide')
                        elseif pausemenuopen and not IsPauseMenuActive() then
                            pausemenuopen = false
                            DrawTextUI('show', GlobalText)
                        end
                        break
                    else
                        wait = 1000
                    end
                end
                
                if not pausemenuopen then
                    if inZone and not alreadyEnteredZone then
                        alreadyEnteredZone = true
                        DrawTextUI('show', GlobalText)
                    end

                    if GlobalText_last ~= GlobalText then
                        DrawTextUI('show', GlobalText)
                    end

                    if not inZone and alreadyEnteredZone then
                        alreadyEnteredZone = false
                        DrawTextUI('hide')
                    end
                    GlobalText_last = GlobalText
                end
            else
                if alreadyEnteredZone or inZone then
                    alreadyEnteredZone, inZone, pausemenuopen = false, false, false
                    DrawTextUI('hide')
                end
                wait = 5000
            end
            Wait(wait)
        end
    end)

    RegisterNetEvent('cd_garage:SetJobOwnedVehicle')
    AddEventHandler('cd_garage:SetJobOwnedVehicle', function(action)
        if action == 'personal' or action == 'society' then
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if IsPedInAnyVehicle(ped, false) then
                TriggerServerEvent('cd_garage:SetJobOwnedVehicle', action, GetAllPlateFormats(vehicle))
            else
                Notif(3, 'get_inside_veh')
            end
        else
            print('wrong action type - SetJobOwnedVehicle')
        end
    end)

    --[[
    --A chat command for a player to convert their personal vehicle into a personal owned/society owned job vehicle.
    --Uncomment this if you want players to be able to use this.
    RegisterCommand('JobVehicles', function(source, args)
        if args[1] == 'personal' or args[1] == 'society' then
            TriggerEvent('cd_garage:SetJobOwnedVehicle', args[1])
        else
            print('invalid option')
        end
    end)
    ]]
    
end
