local LoadingDots = {}
LoadingDots.Dot, LoadingDots.Timer = '.', 0

function GetPlate(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    if Config.PlateFormats == 'trimmed' then
        return Trim(plate)

    elseif Config.PlateFormats == 'with_spaces' then
        return plate

    elseif Config.PlateFormats == 'mixed' then
        return string.gsub(plate, "^%s*(.-)%s*$", "%1")

    end
end

function GetAllPlateFormats(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    local data = {
        trimmed = Trim(plate),
        with_spaces = plate,
        mixed = string.gsub(plate, "^%s*(.-)%s*$", "%1")
    }
    return data
end

function SpawnVehicle(data, jobspawn, jobspawn_owned, tp_invehicle)
    InGarage = false
    TriggerEvent('cd_garage:Exit', false)
    Wait(200)
    local ped = PlayerPedId()
    local props
    local model
    if not jobspawn then
        props = data.vehicle
        model = props.model
    else
        model = data.model
    end
    
    local plate = data.plate
    local adv_stats
    if Config.Mileage.ENABLE and not jobspawn and data.adv_stats then
        adv_stats = data.adv_stats
    end

    if not IsModelValid(model) then
        return Notif(3, 'invalid_model')
    end

    LoadModel(model)
    if HasModelLoaded(model) then
        local vehicle = CreateVehicle(model, ExitLocation.x, ExitLocation.y, ExitLocation.z, ExitLocation.h, true, false)
        if jobspawn then
            plate = SetPlateRandom(vehicle, plate, props)
        end
        RegisterEntity(vehicle)

        NetworkFadeInEntity(vehicle, true, true)
        SetVehicleOnGroundProperly(vehicle)

        RequestNetworkControl(vehicle)
        RegisterEntityNetworked(vehicle)

        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetEntityAsMissionEntity(vehicle, true, false)
        local netID = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netID, true)
        SetNetworkIdExistsOnAllMachines(netID, true)
        if tp_invehicle then
            SetPedIntoVehicle(ped, vehicle, -1)
        end
        SetVehicleDirtLevel(vehicle)
        WashDecalsFromVehicle(vehicle, 1.0)
        NetworkRequestControlOfEntity(vehicle)
        SetModelAsNoLongerNeeded(model)

        RequestCollision(ExitLocation, vehicle)

        SetVehRadioStation(vehicle, 'OFF')
        NetworkFadeInEntity(vehicle, true, true)

        

        if not jobspawn then
            if props.fuelLevel == nil then
                props.fuelLevel = 100.0
            end

            SetVehicleProperties(vehicle, props)
            SetFuel(vehicle, plate, props.fuelLevel)

            if Config.Mileage.ENABLE and adv_stats then
                if adv_stats.mileage == nil then
                    adv_stats.mileage = 0
                end
                if adv_stats.maxhealth == nil then
                    adv_stats.maxhealth = 1000.0
                end
                if adv_stats.plate == nil then
                    adv_stats.plate = plate
                end

                local max_health = GetMaxHealth(adv_stats.mileage)

                AdvStatsFunction(plate, adv_stats.mileage, max_health)

                if GetVehicleEngineHealth(vehicle) > max_health then
                    SetVehicleEngineHealth(vehicle, max_health+0.0)
                end
            end
        end
        
        CheckSpawnArea(vehicle, vector3(ExitLocation.x, ExitLocation.y, ExitLocation.z))
        VehicleSpawned(vehicle, plate, props)

        if jobspawn then
            SetFuel(vehicle, plate, 100.0)
            if data.spawn_max then
                SetVehicleMaxMods(vehicle)
            end
        else
            if Config.Mileage.ENABLE then
                TriggerServerEvent('cd_garage:ChangeInGarageState', plate, 0, AdvStatsTable[plate])
            else
                TriggerServerEvent('cd_garage:ChangeInGarageState', plate, 0)
            end
        end
        if jobspawn or jobspawn_owned then
            TriggerServerEvent('cd_garage:JobVehicleCacheKeys', plate)
            if Config.JobVehicles.choose_liverys then
                SetLiverysThread()
            end
        end
        ExitLocation = nil
        return vehicle
    else
        Notif(3, 'loading_failed')
        CloseAllNUI()
        ExitLocation = nil
    end
end

function GetVehicleProperties(vehicle)
    if DoesEntityExist(vehicle) then
        local props
        if Config.Framework == 'esx' then
            props = ESX.Game.GetVehicleProperties(vehicle)
        elseif Config.Framework == 'qbcore' then
            props = QBCore.Functions.GetVehicleProperties(vehicle)
        elseif Config.Framework == 'other' then
            props = GetVehicleProps_OTHER(vehicle)
        end

        props.plate = GetPlate(vehicle)
        
        if not props.bodyHealth then props.bodyHealth = Round(GetVehicleBodyHealth(vehicle)) end
        if not props.engineHealth then props.engineHealth = Round(GetVehicleEngineHealth(vehicle)) end
        if not props.fuelLevel then props.fuelLevel = Round(GetVehicleFuelLevel(vehicle)) end

        if not Config.SaveAdvancedVehicleDamage then
            return props
        end

        props.tyres = {}
        props.doors = {}
        props.windows = {}

        for cd = 1, 7 do
            local tyre1 = IsVehicleTyreBurst(vehicle, cd, true)
            local tyre2 = IsVehicleTyreBurst(vehicle, cd, false)
            if tyre1 or tyre2 then
                props.tyres[cd] = true
            else
                props.tyres[cd] = false
            end
        end

        for cd = 1, 6 do
            local door = IsVehicleDoorDamaged(vehicle, cd-1)
            if door then
                props.doors[cd] = true
            else
                props.doors[cd] = false
            end
        end

        local aids = {[5] = GetEntityBoneIndexByName(vehicle, 'windscreen'), [6] = GetEntityBoneIndexByName(vehicle, 'windscreen_r')}
        for cd = 1, 6 do
            local window
            if cd < 5 then
                window = IsVehicleWindowIntact(vehicle, cd-1)
            else
                window = IsVehicleWindowIntact(vehicle, aids[cd-1])
            end
            if not window then
                props.windows[cd] = true
            else
                props.windows[cd] = false
            end
        end
        return props
    end
end

function SetVehicleProperties(vehicle, props)
    if Config.Framework == 'esx' then
        ESX.Game.SetVehicleProperties(vehicle, props)
    elseif Config.Framework == 'qbcore' then
        QBCore.Functions.SetVehicleProperties(vehicle, props)
    elseif Config.Framework == 'other' then
        SetVehicleProps_OTHER(vehicle, props)
    end

    if props.bodyHealth then SetVehicleBodyHealth(vehicle, props.bodyHealth+0.0) end
    if props.engineHealth then SetVehicleEngineHealth(vehicle, props.engineHealth+0.0) end
    
    if Config.SaveAdvancedVehicleDamage then
        if props.tyres then
            for cd = 1, 7 do
                if props.tyres[cd] then
                    SetVehicleTyreBurst(vehicle, cd, true, 1000)
                end
            end
        end
        
        if props.doors then
            for cd = 1, 6 do
                if props.doors[cd]then
                    SetVehicleDoorBroken(vehicle, cd-1, true)
                end
            end
        end

        if props.windows then
            for cd = 1, 4 do
                if props.windows[cd] then
                    SmashVehicleWindow(vehicle, cd-1)
                end
            end
        end
    end
end

function CheckVehicleOnStreets(plate, in_garage, model)
    if Config.UsingOnesync then
        local result = Callback('onstreetscheck', {plate = plate, shell_coords = shell_coords})
        if result == nil then
            if not in_garage then
                result = 'outbutnotonstreets'
                if Config.Return_Vehicle.ENABLE then
                    local return_price = GetReturnVehiclePrice(model)
                    return {result = result, message = L('return_vehicle')..''..return_price, return_price = return_price}
                else
                    local return_price = GetReturnVehiclePrice(model)
                    return {result = result, message = L('return_vehicle_disabled'), return_price = ''}
                end
            else
                return {result = 'canspawn'}
            end
        else
            SetNewWaypoint(result.coords.x, result.coords.y)
            return result
        end
    else
        local result = nil
        local vehicle = GetGamePool('CVehicle')
        for cd = 1, #vehicle, 1 do
            if DoesEntityExist(vehicle[cd]) then
                if Trim(GetVehicleNumberPlateText(vehicle[cd])) == Trim(plate) then
                    local coords = GetEntityCoords(vehicle[cd])
                    if shell_coords and GetVehicleEngineHealth(vehicle[cd]) > 0 then
                        local dist = #(vector3(coords.x, coords.y, coords.z)-vector3(shell_coords.x, shell_coords.y, shell_coords.z))
                        if dist > 30 then
                            SetNewWaypoint(coords.x, coords.y)
                            result = 'onstreets'
                            return {result = result, message = L('vehicle_onstreets')}
                        end
                    elseif GetVehicleEngineHealth(d) > 0 then
                        SetNewWaypoint(coords.x, coords.y)
                        result = 'onstreets'
                        return {result = result, message = L('vehicle_onstreets')}
                    end
                end
            end
        end
        if result == nil then
            if not in_garage then
                result = 'outbutnotonstreets'
                if Config.Return_Vehicle.ENABLE then
                    local return_price = GetReturnVehiclePrice(model)
                    return {result = result, message = L('return_vehicle')..''..return_price, return_price = return_price}
                else
                    local return_price = GetReturnVehiclePrice(model)
                    return {result = result, message = L('return_vehicle_disabled'), return_price = ''}
                end
            else
                return {result = 'canspawn'}
            end
        end
    end
end

function CheckSpawnArea(veh, coords)
    local new_coords = coords
    local vehicle = GetClosestVehicle_pileupcheck(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end

    local vehicle = GetClosestVehicle_pileupcheck(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end

    local vehicle = GetClosestVehicle_pileupcheck(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end

    local vehicle = GetClosestVehicle_pileupcheck(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end
    new_coords = nil
end

function CD_DeleteVehicle(vehicle)
    if vehicle ~= nil then
        if not DoesEntityExist(vehicle) then
            Notif(3, 'entity_doesnot_exist')
            return
        end
        RemovePersistentVehicle(vehicle, GetPlate(vehicle))
        RequestNetworkControl(vehicle)
        RequestNetworkId(vehicle)
        if NetworkHasControlOfEntity(vehicle) then
            SetEntityAsMissionEntity(vehicle)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            Wait(100)
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
            SetEntityAsNoLongerNeeded(vehicle)
            DeleteEntity(vehicle)
            DeleteVehicle(vehicle)
        else
            TriggerServerEvent('cd_garage:DeleteVehicleADV', NetworkGetNetworkIdFromEntity(vehicle))
        end
    end
end

RegisterNetEvent('cd_garage:DeleteVehicleADV')
AddEventHandler('cd_garage:DeleteVehicleADV', function(net)
    local entity = NetworkGetEntityFromNetworkId(net)
    if NetworkHasControlOfEntity(entity) then
        SetEntityAsNoLongerNeeded(entity)
        Wait(100)
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
        DeleteEntity(entity)
        DeleteVehicle(entity)
    else
        Notif(3, 'no_control_netid')
    end
end)

function GetUpgradeStats(props)
    local stats = {}
    if type(props.modEngine) ~= 'number' then props.modEngine = -1 end
    if type(props.modBrakes) ~= 'number' then props.modBrakes = -1 end
    if type(props.modTransmission) ~= 'number' then props.modTransmission = -1 end
    if type(props.modSuspension) ~= 'number' then props.modSuspension = -1 end
    if (type(props.modTurbo) ~= 'number' and type(props.modTurbo) ~= 'boolean') then props.modTurbo = false end

    stats.engine = props.modEngine+1
    stats.brakes = props.modBrakes+1
    stats.transmission = props.modTransmission+1
    stats.suspension = props.modSuspension+1
    if props.modTurbo == 1 then
        stats.turbo = 1
    elseif props.modTurbo == false then
        stats.turbo = 0
    end
    return stats
end

local function CalculateHandling(handling1, handling2, handling3)
    local calc = (handling1+handling2)
    return (calc*handling3)
end

local function CalculateTopSpeed(topspeed1, topspeed2)
    local calc
    if topspeed2 >= 1.5 then
        calc = 0.9
    elseif topspeed2 >= 1.0 then
        calc = 1.0 
    elseif topspeed2 >= 0.5 then
        calc = 1.1 
    elseif topspeed2 >= 0 then
        calc = 1.2
    end
    return ((topspeed1*calc)*1.1)
end

function GetPerformanceStats(vehicle)
    local data = {}
    data.acceleration = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
    data.brakes = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
    local topspeed1 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel')
    local topspeed2 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDragCoeff')
    data.topspeed = math.ceil(CalculateTopSpeed(topspeed1, topspeed2))
    local handling1 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionBiasFront')
    local handling2 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMax')
    local handling3 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMin')
    data.handling = CalculateHandling(handling1, handling2, handling3)
    return data
end

function GetHealthStats(props)
    local data = {}
    data.engine_health = math.ceil(props.engineHealth)
    data.body_health = math.ceil(props.bodyHealth)
    data.fuel_level = math.ceil(props.fuelLevel)
    return data
end

function RequestCollision(coords, vehicle)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    while not HasCollisionLoadedAroundEntity(vehicle) do
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        Wait(0)
    end
end

function roundDecimals(num, decimals)
    local mult = math.pow(10, decimals or 0)
    return math.floor(num * mult + 0.5) / 100
end

function Teleport(ped, x, y, z, h, freeze)
    RequestCollisionAtCoord(x, y, z)
    while not HasCollisionLoadedAroundEntity(ped) do
        RequestCollisionAtCoord(x, y, z)
        Wait(1)
    end
    DoScreenFadeOut(950)
    Wait(1000)                            
    SetEntityCoords(ped, x, y, z)
    SetEntityHeading(ped, h)
    if freeze then
        FreezeEntityPosition(ped, true)
    end
    Wait(1000)
    DoScreenFadeIn(3000)
end

function InVehicle()
    return IsPedInAnyVehicle(PlayerPedId())
end

function GetClosestVehicleData(coords, distance)
    local t = {}
    t.dist = distance
    t.state = false
    local vehicle = GetGamePool('CVehicle')
    local smallest_distance = 1000
    for cd = 1, #vehicle, 1 do
        local vehcoords = GetEntityCoords(vehicle[cd])
        local dist = #(coords-vehcoords)
        if dist < t.dist and dist < smallest_distance then
            smallest_distance = dist
            t.dist = dist
            t.vehicle = vehicle[cd]
            t.coords = vehcoords
            t.state = true
        end
    end
    t.dist = nil
    return t
end

function GetClosestVehicle_pileupcheck(coords, distance, myveh)
    local vehicles = GetGamePool('CVehicle')
    for cd = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[cd])
        local dist = #(coords-vehicleCoords)
        if dist < distance and vehicles[cd] ~= myveh then
            return true
        end
    end
    return false
end

function GetClosestVehicle(distance)
    local ped = PlayerPedId()
    if InVehicle() then
        return GetVehiclePedIsIn(ped, false)
    else
        local result = false
        local ped_coords = GetEntityCoords(ped)
        local smallest_distance = 1000
        local vehicle = GetGamePool('CVehicle')
        for cd = 1, #vehicle, 1 do
            local vehcoords = GetEntityCoords(vehicle[cd])
            local dist = #(ped_coords-vehcoords)
            if dist < distance and dist < smallest_distance then
                smallest_distance = dist
                result = vehicle[cd]
            end
        end
        return result
    end
end

function FindVehicleInArea(coords, distance, plate)
    local result = false
    local vehicle = GetGamePool('CVehicle')
    for cd = 1, #vehicle, 1 do
        local veh_coords = GetEntityCoords(vehicle[cd])
        local veh_plate = GetCorrectPlateFormat(GetVehicleNumberPlateText(vehicle[cd]))
        local dist = #(coords-veh_coords)
        if dist < distance and plate == veh_plate then
            result = true
        end
    end
    return result
end

function GetClosestPlayer(target_dist)
    local ped = PlayerPedId()
    local mycoords = GetEntityCoords(ped)
    local result = false
    local smallest_distance = 1000
    for c, d in pairs(GetActivePlayers()) do
        local targetped = GetPlayerPed(d)
        local targetcoords = GetEntityCoords(targetped)
        local dist = #(mycoords-targetcoords)
        if dist < target_dist and ped ~= targetped and dist < smallest_distance then
            smallest_distance = dist
            result =  GetPlayerServerId(d)         
        end
    end
    return result
end

function GetPlayersInVehicle(vehicle)
    local temp_table = {}
    local vehicle_coords = GetEntityCoords(vehicle)
    for c, d in pairs(GetActivePlayers()) do
        local targetped = GetPlayerPed(d)
        local dist = #(vehicle_coords-GetEntityCoords(vehicle))
        if dist < 10 then
            local ped_vehicle = GetVehiclePedIsIn(targetped)
            if ped_vehicle == vehicle then
                table.insert(temp_table, GetPlayerServerId(d))  
            end
        end
    end
    return temp_table
end

function IsVehicleEmpty(vehicle)
    if GetVehicleNumberOfPassengers(vehicle) == 0 and IsVehicleSeatFree(vehicle, -1) then
        return true
    else
        return false
    end
end

function InVehicle()
    return IsPedInAnyVehicle(PlayerPedId())
end

function SetVehicleProps_OTHER(vehicle, props)
    if DoesEntityExist(vehicle) then
        SetVehicleModKit(vehicle, 0)

        if props.plate then SetVehicleNumberPlateText(vehicle, props.plate) end
        if props.plateIndex then SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex) end
        if props.bodyHealth then SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0) end
        if props.engineHealth then SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0) end
        if props.fuelLevel then SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0) end
        if props.dirtLevel then SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0) end
        if props.color1 then SetVehicleColours(vehicle, props.color1, props.color2) end
        if props.color2 then SetVehicleColours(vehicle, props.color1, props.color2) end
        if props.pearlescentColor then SetVehicleExtraColours(vehicle, props.pearlescentColor, props.wheelColor) end
        if props.wheelColor then SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor) end
        if props.wheels then SetVehicleWheelType(vehicle, props.wheels) end
        if props.windowTint then SetVehicleWindowTint(vehicle, props.windowTint) end

        if props.neonEnabled then
            SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
            SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
            SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
            SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
        end

        if props.extras then
            for id,enabled in pairs(props.extras) do
                if enabled then
                    SetVehicleExtra(vehicle, tonumber(id), 0)
                else
                    SetVehicleExtra(vehicle, tonumber(id), 1)
                end
            end
        end
        
        if props.neonColor then SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end
        if props.xenonColor then SetVehicleXenonLightsColour(vehicle, props.xenonColor) end
        if props.modSmokeEnabled then ToggleVehicleMod(vehicle, 20, true) end
        if props.tyreSmokeColor then SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end
        if props.modSpoilers then SetVehicleMod(vehicle, 0, props.modSpoilers, false) end
        if props.modFrontBumper then SetVehicleMod(vehicle, 1, props.modFrontBumper, false) end
        if props.modRearBumper then SetVehicleMod(vehicle, 2, props.modRearBumper, false) end
        if props.modSideSkirt then SetVehicleMod(vehicle, 3, props.modSideSkirt, false) end
        if props.modExhaust then SetVehicleMod(vehicle, 4, props.modExhaust, false) end
        if props.modFrame then SetVehicleMod(vehicle, 5, props.modFrame, false) end
        if props.modGrille then SetVehicleMod(vehicle, 6, props.modGrille, false) end
        if props.modHood then SetVehicleMod(vehicle, 7, props.modHood, false) end
        if props.modFender then SetVehicleMod(vehicle, 8, props.modFender, false) end
        if props.modRightFender then SetVehicleMod(vehicle, 9, props.modRightFender, false) end
        if props.modRoof then SetVehicleMod(vehicle, 10, props.modRoof, false) end
        if props.modEngine then SetVehicleMod(vehicle, 11, props.modEngine, false) end
        if props.modBrakes then SetVehicleMod(vehicle, 12, props.modBrakes, false) end
        if props.modTransmission then SetVehicleMod(vehicle, 13, props.modTransmission, false) end
        if props.modHorns then SetVehicleMod(vehicle, 14, props.modHorns, false) end
        if props.modSuspension then SetVehicleMod(vehicle, 15, props.modSuspension, false) end
        if props.modArmor then SetVehicleMod(vehicle, 16, props.modArmor, false) end
        if props.modTurbo then ToggleVehicleMod(vehicle,  18, props.modTurbo) end
        if props.modXenon then ToggleVehicleMod(vehicle,  22, props.modXenon) end
        if props.modFrontWheels then SetVehicleMod(vehicle, 23, props.modFrontWheels, false) end
        if props.modBackWheels then SetVehicleMod(vehicle, 24, props.modBackWheels, false) end
        if props.modPlateHolder then SetVehicleMod(vehicle, 25, props.modPlateHolder, false) end
        if props.modVanityPlate then SetVehicleMod(vehicle, 26, props.modVanityPlate, false) end
        if props.modTrimA then SetVehicleMod(vehicle, 27, props.modTrimA, false) end
        if props.modOrnaments then SetVehicleMod(vehicle, 28, props.modOrnaments, false) end
        if props.modDashboard then SetVehicleMod(vehicle, 29, props.modDashboard, false) end
        if props.modDial then SetVehicleMod(vehicle, 30, props.modDial, false) end
        if props.modDoorSpeaker then SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false) end
        if props.modSeats then SetVehicleMod(vehicle, 32, props.modSeats, false) end
        if props.modSteeringWheel then SetVehicleMod(vehicle, 33, props.modSteeringWheel, false) end
        if props.modShifterLeavers then SetVehicleMod(vehicle, 34, props.modShifterLeavers, false) end
        if props.modAPlate then SetVehicleMod(vehicle, 35, props.modAPlate, false) end
        if props.modSpeakers then SetVehicleMod(vehicle, 36, props.modSpeakers, false) end
        if props.modTrunk then SetVehicleMod(vehicle, 37, props.modTrunk, false) end
        if props.modHydrolic then SetVehicleMod(vehicle, 38, props.modHydrolic, false) end
        if props.modEngineBlock then SetVehicleMod(vehicle, 39, props.modEngineBlock, false) end
        if props.modAirFilter then SetVehicleMod(vehicle, 40, props.modAirFilter, false) end
        if props.modStruts then SetVehicleMod(vehicle, 41, props.modStruts, false) end
        if props.modArchCover then SetVehicleMod(vehicle, 42, props.modArchCover, false) end
        if props.modAerials then SetVehicleMod(vehicle, 43, props.modAerials, false) end
        if props.modTrimB then SetVehicleMod(vehicle, 44, props.modTrimB, false) end
        if props.modTank then SetVehicleMod(vehicle, 45, props.modTank, false) end
        if props.modWindows then SetVehicleMod(vehicle, 46, props.modWindows, false) end
        if props.modLivery then SetVehicleMod(vehicle, 48, props.modLivery, false) end
        if props.modLivery2 then SetVehicleLivery(vehicle, props.modLivery2) end
    end
end

function GetVehicleProps_OTHER(vehicle)
    if DoesEntityExist(vehicle) then
        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
        local extras = {}
        r,g,b = GetVehicleNeonLightsColour(vehicle)
        

        for id=0, 12 do
            if DoesExtraExist(vehicle, id) then
                local state = IsVehicleExtraTurnedOn(vehicle, id) == 1
                extras[tostring(id)] = state
            end
        end

        return {
            model             = GetEntityModel(vehicle),

            plate             = GetPlate(vehicle),   
            plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

            bodyHealth        = GetVehicleBodyHealth(vehicle),
            engineHealth      = GetVehicleEngineHealth(vehicle),
            fuelLevel         = GetVehicleFuelLevel(vehicle),
            dirtLevel         = GetVehicleDirtLevel(vehicle),
            color1            = colorPrimary,
            color2            = colorSecondary,

            pearlescentColor  = pearlescentColor,
            wheelColor        = wheelColor,

            wheels            = GetVehicleWheelType(vehicle),
            windowTint        = GetVehicleWindowTint(vehicle),
            xenonColor        = GetVehicleXenonLightsColour(vehicle),

            neonEnabled       = {
                IsVehicleNeonLightEnabled(vehicle, 0),
                IsVehicleNeonLightEnabled(vehicle, 1),
                IsVehicleNeonLightEnabled(vehicle, 2),
                IsVehicleNeonLightEnabled(vehicle, 3)
            },

            neonColor = {
                r,
                g,
                b
            },

            extras            = extras,
            tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

            modSpoilers       = GetVehicleMod(vehicle, 0),
            modFrontBumper    = GetVehicleMod(vehicle, 1),
            modRearBumper     = GetVehicleMod(vehicle, 2),
            modSideSkirt      = GetVehicleMod(vehicle, 3),
            modExhaust        = GetVehicleMod(vehicle, 4),
            modFrame          = GetVehicleMod(vehicle, 5),
            modGrille         = GetVehicleMod(vehicle, 6),
            modHood           = GetVehicleMod(vehicle, 7),
            modFender         = GetVehicleMod(vehicle, 8),
            modRightFender    = GetVehicleMod(vehicle, 9),
            modRoof           = GetVehicleMod(vehicle, 10),

            modEngine         = GetVehicleMod(vehicle, 11),
            modBrakes         = GetVehicleMod(vehicle, 12),
            modTransmission   = GetVehicleMod(vehicle, 13),
            modHorns          = GetVehicleMod(vehicle, 14),
            modSuspension     = GetVehicleMod(vehicle, 15),
            modArmor          = GetVehicleMod(vehicle, 16),

            modTurbo          = IsToggleModOn(vehicle, 18),

            modSmokeEnabled   = IsToggleModOn(vehicle, 20),
            modXenon          = IsToggleModOn(vehicle, 22),

            modFrontWheels    = GetVehicleMod(vehicle, 23),
            modBackWheels     = GetVehicleMod(vehicle, 24),

            modPlateHolder    = GetVehicleMod(vehicle, 25),
            modVanityPlate    = GetVehicleMod(vehicle, 26),
            modTrimA          = GetVehicleMod(vehicle, 27),
            modOrnaments      = GetVehicleMod(vehicle, 28),
            modDashboard      = GetVehicleMod(vehicle, 29),
            modDial           = GetVehicleMod(vehicle, 30),
            modDoorSpeaker    = GetVehicleMod(vehicle, 31),
            modSeats          = GetVehicleMod(vehicle, 32),
            modSteeringWheel  = GetVehicleMod(vehicle, 33),
            modShifterLeavers = GetVehicleMod(vehicle, 34),
            modAPlate         = GetVehicleMod(vehicle, 35),
            modSpeakers       = GetVehicleMod(vehicle, 36),
            modTrunk          = GetVehicleMod(vehicle, 37),
            modHydrolic       = GetVehicleMod(vehicle, 38),
            modEngineBlock    = GetVehicleMod(vehicle, 39),
            modAirFilter      = GetVehicleMod(vehicle, 40),
            modStruts         = GetVehicleMod(vehicle, 41),
            modArchCover      = GetVehicleMod(vehicle, 42),
            modAerials        = GetVehicleMod(vehicle, 43),
            modTrimB          = GetVehicleMod(vehicle, 44),
            modTank           = GetVehicleMod(vehicle, 45),
            modWindows        = GetVehicleMod(vehicle, 46),
            modLivery         = GetVehicleMod(vehicle, 48),
            modLivery2        = GetVehicleLivery(vehicle)
        }
    else
        return
    end
end

local function Normalize(v)
    local len = math.sqrt( (v.x * v.x)+(v.y * v.y)+(v.z * v.z) )
    return vector3(v.x / len, v.y / len, v.z / len)
end

function DrawSpotlight(pos)
    local lightPos = vector3(pos.x,pos.y,pos.z + 5.0)
    local direction = pos - lightPos
    local normal = Normalize(direction)
    DrawSpotLight(lightPos.x,lightPos.y,lightPos.z, normal.x,normal.y,normal.z, 255,255,255, 100.0, 10.0, 0.0, 25.0, 1.0)
end

function PlayAnimation(anim_dict, anim_name, duration)
    RequestAnimDict(anim_dict)
    while not HasAnimDictLoaded(anim_dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), anim_dict, anim_name, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(anim_dict)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function Draw2DText(text)
    SetTextFont(4)
    SetTextScale(0.0, 0.4)
    SetTextColour(255, 255, 255, 150)
    SetTextCentre(true)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.9)
end

function DrawLiveryText(text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextEntry('STRING')
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.5, 0.05)
end

function AddWaitingDots()
    LoadingDots.Timer = LoadingDots.Timer+1
    if LoadingDots.Timer == 50 then
        if LoadingDots.Dot == '.' then
            LoadingDots.Dot = '..'
        elseif LoadingDots.Dot == '..' then
            LoadingDots.Dot = '...'
        elseif LoadingDots.Dot == '...' then
            LoadingDots.Dot = '.'
        end
        LoadingDots.Timer = 0
        return LoadingDots.Dot
    else
        return LoadingDots.Dot
    end
end

function LoadModel(model)
    LoadingDots.Timer = 0
    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
            Draw2DText(L('loading_model')..' : '..GetVehicleLabel_model(model)..' '..AddWaitingDots())
        end
    end
end

function RegisterEntity(vehicle)
    timeout = 0
    LoadingDots.Timer = 0
    while not DoesEntityExist(vehicle) and timeout <= 1000 do 
        Wait(0)
        Draw2DText(L('registering_entity')..' '..AddWaitingDots())
    end
    if not DoesEntityExist(vehicle) then
        CD_DeleteVehicle(vehicle)
        Notif(3, 'registering_entity_failed')
    end
end

function RequestNetworkControl(vehicle)
    timeout = 0
    LoadingDots.Timer = 0
    while not NetworkHasControlOfEntity(vehicle) and timeout <= 1000 do 
        Wait(0)
        NetworkRequestControlOfEntity(vehicle)
        Draw2DText(L('registering_network')..' '..AddWaitingDots())
    end
    if not NetworkHasControlOfEntity(vehicle) then
        CD_DeleteVehicle(vehicle)
        Notif(3, 'registering_network_failed')
    end
end

function RegisterEntityNetworked(vehicle)
    timeout = 0
    LoadingDots.Timer = 0
    while not NetworkGetEntityIsNetworked(vehicle) and timeout <= 1000 do 
        Wait(0)
        NetworkRegisterEntityAsNetworked(vehicle)
        Draw2DText(L('registering_entitynetwork')..' '..AddWaitingDots())
    end
    if not NetworkGetEntityIsNetworked(vehicle) then
        CD_DeleteVehicle(vehicle)
        Notif(3, 'registering_entitynetwork_failed')
    end     
end

function RequestNetworkId(vehicle)
    local timeout = 0
    LoadingDots.Timer = 0
    local netID = NetworkGetNetworkIdFromEntity(vehicle)
    while not NetworkHasControlOfNetworkId(netID) and timeout <= 1000 do 
        Wait(0)
        NetworkRequestControlOfNetworkId(netID)
        Draw2DText(L('requesting_netid')..AddWaitingDots())
    end
end

function CheckBlips(EnableBlip, JobRestricted)
    if EnableBlip == false then
        return false
    elseif JobRestricted == nil then
        return true
    elseif JobRestricted ~= nil then
        local myjob = GetJob().name
        for c, d in ipairs(JobRestricted) do
            if myjob == d then
                return true
            end
        end
        return false
    end
end

function GenerateSpacesInPlate(new_plate)
    local ws = ' '
    if #new_plate ~= 8 then
        if #new_plate == 7 then
            return new_plate..''..ws
        elseif #new_plate == 6 then
            return ws..''..new_plate..''..ws
        elseif #new_plate == 5 then
            return ws..''..ws..''..new_plate..''..ws
        elseif #new_plate == 4 then
            return ws..''..ws..''..new_plate..''..ws..''..ws
        elseif #new_plate == 3 then
            return ws..''..ws..''..new_plate..''..ws..''..ws..''..ws
        elseif #new_plate == 2 then
            return ws..''..ws..''..ws..''..new_plate..''..ws..''..ws..''..ws
        elseif #new_plate == 1 then
            return ws..''..ws..''..ws..''..ws..''..new_plate..''..ws..''..ws..''..ws
        end
    else
        return new_plate
    end
end

function OpenTextBox(generate_whitespaces)
    AddTextEntry('FMMC_KEY_TIP8s', L('enter_plate'))
    DisplayOnscreenKeyboard(false, 'FMMC_KEY_TIP8s', '', '', '', '', '', 8)
    while UpdateOnscreenKeyboard() == 0 do DisableAllControlActions(0) Wait(0) end
    if GetOnscreenKeyboardResult() then
        local result = GetOnscreenKeyboardResult()
        if result and (#result > 0 and #result <= 8) then
            local plate = string.gsub(GetCorrectPlateFormat(result:upper()), "^%s*(.-)%s*$", "%1")
            if Config.PlateFormats == 'with_spaces' and #plate ~= 8 and generate_whitespaces then
                return GenerateSpacesInPlate(plate)
            else
                return plate
            end
        end
    else
        return nil
    end
end

function JobRestrictNotif(c, blip)
    local text = ''
    for c, d in ipairs(c) do
        text = text..' '..d..','
    end
    text = text:sub(1, -2):sub(2)
    if not blip then
        Notif(3, 'job_restricted', text)
    else
        return text
    end
end

function Callback(action, data)
    CB_id = CB_id + 1
    TriggerServerEvent('cd_garage:Callback', CB_id, action, data)
    local timeout = 0 while CB[CB_id] == nil and timeout <= 50 do Wait(0) timeout=timeout+1 end
    return CB[CB_id]
end

RegisterNetEvent('cd_garage:Callback')
AddEventHandler('cd_garage:Callback', function(id, result)
    CB[id] = result
    Wait(5000)
    CB[id] = nil
end)

RegisterNetEvent('cd_garage:ToggleNUIFocus')
AddEventHandler('cd_garage:ToggleNUIFocus', function()
    NUI_status = true
    while NUI_status do
        SetNuiFocus(NUI_status, NUI_status)
        Wait(100)
    end
    SetNuiFocus(false, false)
end)

RegisterNetEvent('cd_garage:ToggleNUIFocus2')
AddEventHandler('cd_garage:ToggleNUIFocus2', function()
    NUI_status = true
    while NUI_status do
        SetNuiFocus(NUI_status, false)
        Wait(100)
    end
    SetNuiFocus(false, false)
end)
