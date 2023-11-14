if Config.PropertyGarages.ENABLE then
    
    if Config.Framework == 'qbcore' then

        local HouseGarages = {}

        RegisterNetEvent('qb-garages:client:houseGarageConfig')
        AddEventHandler('qb-garages:client:houseGarageConfig', function(garageConfig)
            HouseGarages = garageConfig
        end)

        RegisterNetEvent('qb-garages:client:addHouseGarage')
        AddEventHandler('qb-garages:client:addHouseGarage', function(house, garageInfo)
            HouseGarages[house] = garageInfo
        end)

        RegisterNetEvent('qb-garages:client:setHouseGarage')
        AddEventHandler('qb-garages:client:setHouseGarage', function(house, hasKey)
            hasGarageKey = hasKey
        end)


        local pausemenuopen = false
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
                local inZone = false

                for c, d in pairs(HouseGarages) do
                    if hasGarageKey and d.takeVehicle.x and d.takeVehicle.y and d.takeVehicle.z then
                        local dist = #(coords-vector3(d.takeVehicle.x, d.takeVehicle.y, d.takeVehicle.z))
                        if dist <= 5.0 then
                            wait = 5
                            inZone = true
                            GlobalText = '<b>'..L('garage')..'</b></p>'..L('open_garage_1')..'</p>'..L('open_garage_2').. '</p>'..L('notif_storevehicle')
                            if InVehicle() then
                                GlobalText = '<b>'..L('garage')..'</b></p>'..L('notif_storevehicle')
                            end
                            if not CooldownActive then
                                if IsControlJustReleased(0, Config.Keys.QuickChoose_Key) then
                                    TriggerEvent('cd_garage:PropertyGarage', 'quick', nil)
                                elseif IsControlJustReleased(0, Config.Keys.EnterGarage_Key) then
                                    TriggerEvent('cd_garage:PropertyGarage', 'inside', nil)
                                elseif IsControlJustReleased(0, Config.Keys.StoreVehicle_Key) then
                                    TriggerEvent('cd_garage:StoreVehicle_Main', 1, false, false)
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
                Wait(wait)
            end
        end)

    end

end