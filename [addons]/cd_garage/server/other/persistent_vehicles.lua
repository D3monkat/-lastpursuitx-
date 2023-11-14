if Config.PersistentVehicles.ENABLE then
    
    local PersistentVehiclesTable = {}
    
    RegisterServerEvent('cd_garage:AddPersistentVehicles')
    AddEventHandler('cd_garage:AddPersistentVehicles', function(plate, netid)
        local _source = source
        if not plate and not netid then return end
        local plate = GetCorrectPlateFormat(plate)
        local vehicle = NetworkGetEntityFromNetworkId(netid)
        if PersistentVehiclesTable[plate] == nil then
            PersistentVehiclesTable[plate] = {}
            PersistentVehiclesTable[plate].plate = plate
        end
        PersistentVehiclesTable[plate].source = _source
        PersistentVehiclesTable[plate].netid = netid
        PersistentVehiclesTable[plate].coords = GetEntityCoords(vehicle)
        PersistentVehiclesTable[plate].heading = GetEntityHeading(vehicle)
        TriggerClientEvent('cd_garage:PersistentVehicles_GetVehicleProperties', _source, plate, netid)
    end)
    
    RegisterNetEvent('cd_garage:RemovePersistentVehicles')
    AddEventHandler('cd_garage:RemovePersistentVehicles', function(plate)
        if not plate then return end
        local plate = GetCorrectPlateFormat(plate)
        PersistentVehiclesTable[plate] = nil
    end)

    function PersistentVehicle_FakePlate(old_plate, new_plate)
        PersistentVehiclesTable[new_plate] = PersistentVehiclesTable[old_plate]
        PersistentVehiclesTable[new_plate].plate = new_plate
        PersistentVehiclesTable[new_plate].props.plate = new_plate
        PersistentVehiclesTable[old_plate] = nil
    end

    CreateThread(function()
        while not Authorised do Wait(1000) end
        while true do
            local vehicle = GetAllVehicles()
            for cd = 1, #vehicle, 1 do
                if DoesEntityExist(vehicle[cd]) then
                    local plate = GetCorrectPlateFormat(GetVehicleNumberPlateText(vehicle[cd]))
                    if PersistentVehiclesTable[plate] ~= nil then
                        PersistentVehiclesTable[plate].has_despawned = false
                        local coords = GetEntityCoords(vehicle[cd])
                        local dist = #(vector3(coords.x, coords.y, coords.z)-vector3(PersistentVehiclesTable[plate].coords.x, PersistentVehiclesTable[plate].coords.y, PersistentVehiclesTable[plate].coords.z))
                        if dist > 10 then
                            if GetEntitySpeed(vehicle[cd])*2.236936 == 0.0 then
                                PersistentVehiclesTable[plate].coords = coords
                                PersistentVehiclesTable[plate].heading = GetEntityHeading(vehicle[cd])
                                PersistentVehiclesTable[plate].lock_state = GetVehicleDoorLockStatus(vehicle[cd])
                            end
                        end
                    end
                end
            end
            local temp_table = {}
            for c, d in pairs(PersistentVehiclesTable) do
                if d.has_despawned == nil then
                    d.has_despawned = true
                    temp_table[#temp_table+1] = d
                else
                    d.has_despawned = nil
                end
            end
            if #temp_table > 0 then
                RespawnVehicle(temp_table)
            end
            Wait(5000)
        end
    end)

    function RespawnVehicle(data)
        local players = GetPlayers()
        for cd_1 = 1, #data do
            local smallest_distance = 10000
            local closest_player = nil
            for cd_2 = 1, #players do
                local player_coords = GetEntityCoords(GetPlayerPed(players[cd_2]))
                local dist = #(vector3(player_coords.x, player_coords.y, player_coords.z)-vector3(data[cd_1].coords.x, data[cd_1].coords.y, data[cd_1].coords.z))
                if dist < 20 and dist < smallest_distance then
                    smallest_distance = dist
                    closest_player = players[cd_2]
                end
            end
            if smallest_distance ~= 10000 then
                TriggerClientEvent('cd_garage:PersistentVehicles_SpawnVehicle', closest_player, data[cd_1])
                PersistentVehiclesTable[data[cd_1].plate].has_despawned = nil
            end
        end
    end

    RegisterServerEvent('cd_garage:PersistentVehicles_GetVehicleProperties')
    AddEventHandler('cd_garage:PersistentVehicles_GetVehicleProperties', function(plate, props)
        PersistentVehiclesTable[plate].props = props
    end)

end