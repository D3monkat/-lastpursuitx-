if Config.Mileage.ENABLE then

    AdvStatsTable = {}
    
    CreateThread(function()
        if Config.Mileage.chat_command then
            while not Authorised do Wait(1000) end
            TriggerEvent('chat:addSuggestion', '/'..Config.Mileage.chat_command, L('chatsuggestion_mileage'))
            RegisterCommand(Config.Mileage.chat_command, function()
                TriggerEvent('cd_garage:checkmileage')
            end)
        end
    end)

    function AdvStatsFunction(plate, mileage, maxhealth)
        if AdvStatsTable[plate] == nil then
            AdvStatsTable[plate] = {}
            AdvStatsTable[plate].plate = plate
            AdvStatsTable[plate].mileage = mileage
            AdvStatsTable[plate].maxhealth = maxhealth
        end
    end

    CreateThread(function()
        while true do
            Wait(500)
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false)  then
                local vehicle = GetVehiclePedIsUsing(ped)
                local plate = GetPlate(vehicle)
                local new_pos = GetEntityCoords(ped) 
                if plate ~= nil then
                    if AdvStatsTable ~= nil and AdvStatsTable[plate] ~= nil then
                        if AdvStatsTable[plate].plate == plate then
                            if old_pos == nil then
                                old_pos = new_pos
                            end
                            local dist = #(new_pos-old_pos)
                            if dist > 10.0 then
                                AdvStatsTable[plate].mileage = AdvStatsTable[plate].mileage+GetEntitySpeed(vehicle)*Config.Mileage.mileage_multiplier/100
                                old_pos = new_pos
                            end
                        end
                    end
                end
            else
                Wait(1000)
            end
        end
    end)

    RegisterNetEvent('cd_garage:checkmileage')
    AddEventHandler('cd_garage:checkmileage', function()
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped,false)
            local plate = GetPlate(vehicle)
            local AdvStats = GetAdvStats(plate, false)
            if AdvStats then
                if AdvStats.plate ~= nil then
                    if AdvStats.plate == plate then
                        local maxhealth = GetMaxHealth(AdvStats.mileage)
                        if Config.Mileage.speed_metrics == 'miles' then
                            Notif(2, 'miles_check_miles', roundDecimals(AdvStats.mileage, 2))
                        else
                            Notif(2, 'miles_check_kilometers', roundDecimals(AdvStats.mileage, 2))
                        end
                        if Config.Mileage.show_maxhealth then
                            Notif(2, 'maxhealth_check', Round(maxhealth)..' / 1000')
                        end
                    end
                else
                    Notif(3, 'advstats_nill')
                end
            else
                Notif(3, 'advstats_nill')
            end
        else
            Notif(3, 'get_inside_veh')
        end
    end)

    function GetMaxHealth(mileage)
        if mileage == nil then
            return 1000.0
        end
        if mileage >= 30000.0 and mileage < 45000.0 then
            return  950.0
        elseif mileage >= 45000.0 and mileage < 60000.0 then
            return  900.0
        elseif mileage >= 60000.0 and mileage < 75000.0 then
            return  850.0
        elseif mileage >= 75000.0 and mileage < 90000.0 then
            return  800.0
        elseif mileage >= 90000.0 and mileage < 105000.0 then
            return  750.0
        elseif mileage >= 105000.0 and mileage < 120000.0 then
            return  700.0
        elseif mileage >= 120000.0 and mileage < 135000.0 then
            return  650.0
        elseif mileage >= 135000.0 and mileage < 150000.0 then
            return  600.0
        elseif mileage >= 150000.0 and mileage < 165000.0 then
            return  550.0
        elseif mileage >= 165000.0 and mileage < 180000.0 then
            return  500.0
        elseif mileage >= 180000.0 and mileage < 195000.0 then
            return  450.0
        elseif mileage >= 195000.0 and mileage < 210000.0 then
            return  400.0
        elseif mileage >= 210000.0 then
            return 300.0
        else
            return 1000.0
        end
    end

    RegisterNetEvent('cd_garage:SaveAllMiles')
    AddEventHandler('cd_garage:SaveAllMiles', function()
        TriggerServerEvent('cd_garage:SaveAllMiles', AdvStatsTable)
    end)

end

function GetAdvStats(plate, insidegarage)
    if Config.Mileage.ENABLE then
        if plate ~= nil then
            local result
            if AdvStatsTable[plate] ~= nil then
                if AdvStatsTable[plate].plate == nil then
                    AdvStatsTable[plate].plate = plate
                elseif AdvStatsTable[plate].mileage == nil then
                    AdvStatsTable[plate].mileage = 0.0
                elseif AdvStatsTable[plate].maxhealth == nil then
                    AdvStatsTable[plate].maxhealth = 1000.0
                end
                AdvStatsTable[plate].mileage = roundDecimals(AdvStatsTable[plate].mileage, 2)
                return AdvStatsTable[plate]
            else
                local AdvStats = Callback('mileage', plate)
                local timeout = 0 while not AdvStats and timeout <= 50 do Wait(0) timeout=timeout+1 end
                if AdvStats then
                    AdvStatsFunction(plate, AdvStats.mileage, AdvStats.maxhealth)
                    local timeout = 0 while AdvStatsTable[plate] == nil and timeout <= 50 do Wait(0) timeout=timeout+1 end
                    if AdvStatsTable[plate].plate == nil then
                        AdvStatsTable[plate].plate = plate
                    elseif AdvStatsTable[plate].mileage == nil then
                        AdvStatsTable[plate].mileage = 0.0
                    elseif AdvStatsTable[plate].maxhealth == nil then
                        AdvStatsTable[plate].maxhealth = 1000.0
                    end
                    return AdvStatsTable[plate]
                else
                    if insidegarage then
                        return {mileage = 0.0}
                    else
                        return {plate = plate, mileage = 0.0, maxhealth = 1000.0}
                    end
                end
            end
        else
            return {plate = nil, mileage = 0.0, maxhealth = 1000.0}
        end
    else
        return false
    end
end