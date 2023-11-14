if Config.GangGarages.ENABLE then

    local GangBlipsTable = {}
    GangBlipsTable.blips = {}
    GangBlipsTable.last_gang_name = nil

    local function DisableGangGarage()
        if not Config.GangGarages.ENABLE then
            return true
        end
    end

    local function DeleteGangBlips()
        for c, d in pairs(GangBlipsTable.blips) do
            if DoesBlipExist(d) then
                RemoveBlip(d)
            end
        end
        GangBlipsTable.blips = {}
    end

    function UpdateGangGarageBlips()
        local gang_name = GetGang().name
        if gang_name == Config.GangGarages.not_in_gang_name then DeleteGangBlips() GangBlipsTable.last_gang_name = Config.GangGarages.not_in_gang_name return end
        if gang_name == GangBlipsTable.last_gang_name then return end
        if gang_name ~= GangBlipsTable.last_gang_name then DeleteGangBlips() end
        
        for c, d in pairs(Config.GangGarages.Locations) do
            if d.gang == gang_name then
                local blip = AddBlipForCoord(d.coords.x, d.coords.y, d.coords.z)
                GangBlipsTable.blips[#GangBlipsTable.blips+1] = blip
                SetBlipSprite(blip, Config.GangGarages.Blip.sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, Config.GangGarages.Blip.scale)
                SetBlipColour(blip, Config.GangGarages.Blip.colour)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(Config.GangGarages.Blip.name..d.garage_id)
                EndTextCommandSetBlipName(blip)
            end
        end
        GangBlipsTable.last_gang_name = gang_name
    end
    
    CreateThread(function()
        while not Authorised do Wait(1000) end

        for cc, dd in pairs(Config.Locations) do
            for c, d in pairs(Config.GangGarages.Locations) do
                if dd.Garage_ID == d.garage_id then
                    Config.GangGarages.ENABLE = false
                    print('^1[error_code-3459]')
                    break
                end
            end
            if DisableGangGarage() then break end
        end
        if DisableGangGarage() then return end
        UpdateGangGarageBlips()
    end)

    CreateThread(function()
        while not Authorised do Wait(1000) end
        if DisableGangGarage() then return end
        local alreadyEnteredZone = false
        local GlobalText = nil
        local GlobalText_last = nil
        local wait = 5
        while true do
            wait = 5
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local gang_name = GetGang().name
            local inZone = false
            local valid_gang_garage = false
            for cd = 1, #Config.GangGarages.Locations do
                local self = Config.GangGarages.Locations[cd]
                if self.gang == gang_name then
                    valid_gang_garage = true
                    local dist = #(coords-vector3(self.coords.x, self.coords.y, self.coords.z))
                    if dist <= self.distance then
                        wait = 5
                        inZone = true
                        GlobalText = '<b>'..L('gang_garage')..'</b></p>'..L('open_garage_1').. '</p>'..L('notif_storevehicle')
                        if InVehicle() then
                            GlobalText = '<b>'..L('gang_garage')..'</b></p>'..L('notif_storevehicle')
                        end

                        if not CooldownActive then
                            if IsControlJustReleased(0, Config.Keys.QuickChoose_Key) then
                                if not InVehicle() then
                                    TriggerEvent('cd_garage:Cooldown', 3000)
                                    TriggerEvent('cd_garage:GangGarageSpawn', self.garage_type, self.spawn_coords, self.garage_id)
                                else
                                    Notif(3, 'get_out_veh')
                                end
                            elseif IsControlJustReleased(0, Config.Keys.StoreVehicle_Key) then
                                TriggerEvent('cd_garage:Cooldown', 1000)
                                TriggerEvent('cd_garage:StoreVehicle_Main', false, false, self)
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

            if not valid_gang_garage then
                if alreadyEnteredZone or inZone then
                    alreadyEnteredZone, inZone, pausemenuopen = false, false, false
                    DrawTextUI('hide')
                end
                wait = 5000
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