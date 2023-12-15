local QBCore = exports['qb-core']:GetCoreObject()
local startedLegalRoute = false
local startedIllegalRoute = false
local passengersBoarded = false
local goodsLoaded = false
local TSE = TriggerServerEvent

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    RemoveBlip(IllegalCheckPoint)
    RemoveBlip(LegalCheckPoint)
    RemoveBlip(LegalCheckPoint2)
end)

local isInside = false
local isHelpTextOpened = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
	    local pedCoords = GetEntityCoords(ped)

        if not startedLegalRoute or not startedIllegalRoute then
            if #(pedCoords.xyz - Config.PilotJob) < 15.0 then
                DrawMarker(33, Config.PilotJob, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 150, 255, 100, false, true, 2, nil, nil, false)
                if #(pedCoords.xyz - Config.PilotJob) < 2.0 then
                    isInside = true
                    while #(GetEntityCoords(ped) - Config.PilotJob) < 2.0 do
                        Wait(0)
                        if not isHelpTextOpened then
                            exports['qb-core']:DrawText(Config.Translation.HelpNotification)
                            isHelpTextOpened = true
                        end
                        if IsControlJustReleased(0, 38) then
                            exports['qb-core']:KeyPressed()
                            isHelpTextOpened = false
                            showUI(true, true)
                        end
                    end
                else
                    if isHelpTextOpened then
                        exports['qb-core']:HideText()
                        isHelpTextOpened = false
                        isInside = false
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
	    local pedCoords = GetEntityCoords(ped)

        if startedLegalRoute then
            if not passengersBoarded then
                if (IsVehicleModel(GetVehiclePedIsUsing(ped), GetHashKey(Config.LegalRoute.VehicleModel))) then
                    if #(pedCoords.xyz - Config.LegalRoute.CheckPoint) < 15.0 then
                        DrawMarker(1, Config.LegalRoute.CheckPoint, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 0, 150, 255, 100, false, true, 2, nil, nil, false)
                        if #(pedCoords.xyz - Config.LegalRoute.CheckPoint) < 2.0 then
                            isInside = true
                            while #(GetEntityCoords(ped) - Config.LegalRoute.CheckPoint) < 2.0 do
                                Wait(0)
                                if not isHelpTextOpened then
                                    exports['qb-core']:DrawText(Config.Translation.HelpBoardPassengers)
                                    isHelpTextOpened = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    exports['qb-core']:KeyPressed()
                                    isHelpTextOpened = false
                                    local cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(ped), 50.0, 50.0, 50.0, 180.0, true, 20)
                                    PointCamAtEntity(cam, PlayerPedId(), 0.0, 0.0, 0.0, true)
                                    RenderScriptCams(true, true, 2000, true, true)
                                    FreezeEntityPosition(GetVehiclePedIsIn(ped), true)
                                    SendNUIMessage({type = "showboardingpassengers", status = true})
                                    Citizen.Wait(10 * 1000) -- 10 seconds
                                    CreateLegalRouteCheckPoint2()
                                    SendNUIMessage({type = "showboardingpassengers", status = false})
                                    PointCamAtEntity(cam, PlayerPedId(), 0.0, 0.0, 0.0, false)
                                    RenderScriptCams(false, true, 2000, false, false)
                                    FreezeEntityPosition(GetVehiclePedIsIn(ped), false)
                                    QBCore.Functions.Notify(Config.Translation.TakePassengersBack)
                                    passengersBoarded = true
                                end
                            end
                        else
                            if isHelpTextOpened then
                                exports['qb-core']:HideText()
                                isHelpTextOpened = false
                                isInside = false
                            end
                        end
                    end
                end
            end
        end

        if passengersBoarded then
            if (IsVehicleModel(GetVehiclePedIsUsing(ped), GetHashKey(Config.LegalRoute.VehicleModel))) then
                if #(pedCoords.xyz - Config.PlaneSpawn.coords) < 15.0 then
                    DrawMarker(1, Config.PlaneSpawn.coords - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 0, 150, 255, 100, false, true, 2, nil, nil, false)
                    if #(pedCoords.xyz - Config.PlaneSpawn.coords) < 2.0 then
                        isInside = true
                        while #(GetEntityCoords(ped) - Config.PlaneSpawn.coords) < 2.0 do
                            Wait(0)
                            if not isHelpTextOpened then
                                exports['qb-core']:DrawText(Config.Translation.HelpDisembarkPassengers)
                                isHelpTextOpened = true
                            end
                            if IsControlJustReleased(0, 38) then
                                exports['qb-core']:KeyPressed()
                                isHelpTextOpened = false
                                local cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(ped), 50.0, 50.0, 50.0, 180.0, true, 20)
                                PointCamAtEntity(cam, PlayerPedId(), 0.0, 0.0, 0.0, true)
                                RenderScriptCams(true, true, 2000, true, true)
                                FreezeEntityPosition(GetVehiclePedIsIn(ped), true)
                                SendNUIMessage({type = "showdisembarkpassengers", status = true})
                                Citizen.Wait(10 * 1000) -- 10 seconds
                                SendNUIMessage({type = "showdisembarkpassengers", status = false})
                                PointCamAtEntity(cam, PlayerPedId(), 0.0, 0.0, 0.0, false)
                                RenderScriptCams(false, true, 2000, false, false)
                                FreezeEntityPosition(GetVehiclePedIsIn(ped), false)
                                QBCore.Functions.Notify(Config.Translation.JobFinished)
                                TSE("id_pilotjob:addFlight")
                                TSE("id_pilotjob:giveMoneyLevel1")
                                RemoveBlip(LegalCheckPoint)
                                RemoveBlip(LegalCheckPoint2)
                                startedLegalRoute = false
                                passengersBoarded = false
                                TSE("id_pilotjob:addLevel")
                                local vehicle = GetVehiclePedIsIn(ped, false)
                                DeleteVehicle(vehicle)
                            end
                        end
                    else
                        if isHelpTextOpened then
                            exports['qb-core']:HideText()
                            isHelpTextOpened = false
                            isInside = false
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while QBCore.Functions.GetPlayerData() == nil do
        Wait(0)
    end

    PlayerData = QBCore.Functions.GetPlayerData()

    if PlayerData.metadata["pilotjob"].level >= 2 then
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                local ped = PlayerPedId()
                local pedCoords = GetEntityCoords(ped)


                if startedIllegalRoute then
                    if not goodsLoaded then
                        if (IsVehicleModel(GetVehiclePedIsUsing(ped), GetHashKey(Config.IllegalRoute.VehicleModel))) then
                            if #(pedCoords.xyz - Config.IllegalRoute.CheckPoint) < 15.0 then
                                DrawMarker(1, Config.IllegalRoute.CheckPoint, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 99, 71, 100, false, true, 2, nil, nil, false)
                                if #(pedCoords.xyz - Config.IllegalRoute.CheckPoint) < 2.0 then
                                    isInside = true
                                    while #(GetEntityCoords(ped) - Config.IllegalRoute.CheckPoint) < 2.0 do
                                        Wait(0)
                                        if not isHelpTextOpened then
                                            exports['qb-core']:DrawText(Config.Translation.HelpLoadGoods)
                                            isHelpTextOpened = true
                                        end
                                        if IsControlJustReleased(0, 38) then
                                            exports['qb-core']:KeyPressed()
                                            isHelpTextOpened = false
                                            local cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(ped), 50.0, 50.0, 50.0, 180.0, true, 20)
                                            PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, true)
                                            RenderScriptCams(true, true, 5000, true, true)
                                            FreezeEntityPosition(GetVehiclePedIsIn(ped), true)
                                            SendNUIMessage({type = "showboardingpassengers", status = true})
                                            SendNUIMessage({action = 'textv2', value = "Wait for illegal goods to be loaded"})
                                            Citizen.Wait(20 * 1000) -- 20 seconds
                                            CreateLegalRouteCheckPoint2()
                                            SendNUIMessage({type = "showboardingpassengers", status = false})
                                            PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, false)
                                            RenderScriptCams(false, true, 5000, false, false)
                                            FreezeEntityPosition(GetVehiclePedIsIn(ped), false)
                                            QBCore.Functions.Notify(Config.Translation.DeliverGoods)
                                            goodsLoaded = true
                                        end
                                    end
                                else
                                    if isHelpTextOpened then
                                        exports['qb-core']:HideText()
                                        isHelpTextOpened = false
                                        isInside = false
                                    end
                                end
                            end
                        end
                    end
                end

                if goodsLoaded then
                    if (IsVehicleModel(GetVehiclePedIsUsing(ped), GetHashKey(Config.IllegalRoute.VehicleModel))) then
                        if #(pedCoords.xyz - Config.PlaneSpawn.coords) < 15.0 then
                            DrawMarker(1, Config.PlaneSpawn.coords - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 99, 71, 100, false, true, 2, nil, nil, false)
                            if #(pedCoords.xyz - Config.PlaneSpawn.coords) < 2.0 then
                                isInside = true
                                while #(GetEntityCoords(ped) - Config.PlaneSpawn.coords) < 2.0 do
                                    Wait(0)
                                    if not isHelpTextOpened then
                                        exports['qb-core']:DrawText(Config.Translation.HelpUnloadGoods)
                                        isHelpTextOpened = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        exports['qb-core']:KeyPressed()
                                        isHelpTextOpened = false
                                        local cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(ped), 50.0, 50.0, 50.0, 180.0, true, 20)
                                        PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, true)
                                        RenderScriptCams(true, true, 5000, true, true)
                                        FreezeEntityPosition(GetVehiclePedIsIn(ped), true)
                                        SendNUIMessage({type = "showdisembarkpassengers", status = true})
                                        SendNUIMessage({action = 'textv3', value = "Wait for illegal goods to be unloaded"})
                                        Citizen.Wait(20 * 1000) -- 20 seconds
                                        SendNUIMessage({type = "showdisembarkpassengers", status = false})
                                        PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, false)
                                        RenderScriptCams(false, true, 2000, false, false)
                                        FreezeEntityPosition(GetVehiclePedIsIn(ped), false)
                                        QBCore.Functions.Notify(Config.Translation.IllegalJobFinished)
                                        TSE("id_pilotjob:giveMoneyLevel2")
                                        RemoveBlip(IllegalCheckPoint)
                                        RemoveBlip(LegalCheckPoint2)
                                        startedIllegalRoute = false
                                        goodsLoaded = false
                                        local vehicle = GetVehiclePedIsIn(ped, false)
                                        DeleteVehicle(vehicle)
                                    end
                                end
                            else
                                if isHelpTextOpened then
                                    exports['qb-core']:HideText()
                                    isHelpTextOpened = false
                                    isInside = false
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- Sets the playerdata when spawned
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()

    if PlayerData.metadata["pilotjob"].level >= 2 then
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                local ped = PlayerPedId()
                local pedCoords = GetEntityCoords(ped)


                if startedIllegalRoute then
                    if not goodsLoaded then
                        if (IsVehicleModel(GetVehiclePedIsUsing(ped), GetHashKey(Config.IllegalRoute.VehicleModel))) then
                            if #(pedCoords.xyz - Config.IllegalRoute.CheckPoint) < 15.0 then
                                DrawMarker(1, Config.IllegalRoute.CheckPoint, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 99, 71, 100, false, true, 2, nil, nil, false)
                                if #(pedCoords.xyz - Config.IllegalRoute.CheckPoint) < 2.0 then
                                    isInside = true
                                    while #(GetEntityCoords(ped) - Config.IllegalRoute.CheckPoint) < 2.0 do
                                        Wait(0)
                                        if not isHelpTextOpened then
                                            exports['qb-core']:DrawText(Config.Translation.HelpLoadGoods)
                                            isHelpTextOpened = true
                                        end
                                        if IsControlJustReleased(0, 38) then
                                            exports['qb-core']:KeyPressed()
                                            isHelpTextOpened = false
                                            local cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(ped), 50.0, 50.0, 50.0, 180.0, true, 20)
                                            PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, true)
                                            RenderScriptCams(true, true, 5000, true, true)
                                            FreezeEntityPosition(GetVehiclePedIsIn(ped), true)
                                            SendNUIMessage({type = "showboardingpassengers", status = true})
                                            SendNUIMessage({action = 'textv2', value = "Wait for illegal goods to be loaded"})
                                            Citizen.Wait(20 * 1000) -- 20 seconds
                                            CreateLegalRouteCheckPoint2()
                                            SendNUIMessage({type = "showboardingpassengers", status = false})
                                            PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, false)
                                            RenderScriptCams(false, true, 5000, false, false)
                                            FreezeEntityPosition(GetVehiclePedIsIn(ped), false)
                                            QBCore.Functions.Notify(Config.Translation.DeliverGoods)
                                            goodsLoaded = true
                                        end
                                    end
                                else
                                    if isHelpTextOpened then
                                        exports['qb-core']:HideText()
                                        isHelpTextOpened = false
                                        isInside = false
                                    end
                                end
                            end
                        end
                    end
                end

                if goodsLoaded then
                    if (IsVehicleModel(GetVehiclePedIsUsing(ped), GetHashKey(Config.IllegalRoute.VehicleModel))) then
                        if #(pedCoords.xyz - Config.PlaneSpawn.coords) < 15.0 then
                            DrawMarker(1, Config.PlaneSpawn.coords - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 99, 71, 100, false, true, 2, nil, nil, false)
                            if #(pedCoords.xyz - Config.PlaneSpawn.coords) < 2.0 then
                                isInside = true
                                while #(GetEntityCoords(ped) - Config.PlaneSpawn.coords) < 2.0 do
                                    Wait(0)
                                    if not isHelpTextOpened then
                                        exports['qb-core']:DrawText(Config.Translation.HelpUnloadGoods)
                                        isHelpTextOpened = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        exports['qb-core']:KeyPressed()
                                        isHelpTextOpened = false
                                        local cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(ped), 50.0, 50.0, 50.0, 180.0, true, 20)
                                        PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, true)
                                        RenderScriptCams(true, true, 5000, true, true)
                                        FreezeEntityPosition(GetVehiclePedIsIn(ped), true)
                                        SendNUIMessage({type = "showdisembarkpassengers", status = true})
                                        SendNUIMessage({action = 'textv3', value = "Wait for illegal goods to be unloaded"})
                                        Citizen.Wait(20 * 1000) -- 20 seconds
                                        SendNUIMessage({type = "showdisembarkpassengers", status = false})
                                        PointCamAtEntity(cam, PlayerPedId(), 0.0, 8.0, 5.0, false)
                                        RenderScriptCams(false, true, 2000, false, false)
                                        FreezeEntityPosition(GetVehiclePedIsIn(ped), false)
                                        QBCore.Functions.Notify(Config.Translation.IllegalJobFinished)
                                        TSE("id_pilotjob:giveMoneyLevel2")
                                        RemoveBlip(IllegalCheckPoint)
                                        RemoveBlip(LegalCheckPoint2)
                                        startedIllegalRoute = false
                                        goodsLoaded = false
                                        local vehicle = GetVehiclePedIsIn(ped, false)
                                        DeleteVehicle(vehicle)
                                    end
                                end
                            else
                                if isHelpTextOpened then
                                    exports['qb-core']:HideText()
                                    isHelpTextOpened = false
                                    isInside = false
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- Sets the playerdata to an empty table when the player has quit or did /logout
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

-- This will update all the PlayerData that doesn't get updated with a specific event other than this like the metadata
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.PilotJob)

    SetBlipSprite(blip, Config.Blips.MainBlip.ID)
    SetBlipScale(blip, Config.Blips.MainBlip.Scale)
    SetBlipColour(blip, Config.Blips.MainBlip.Colour)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blips.MainBlip.Label)
    EndTextCommandSetBlipName(blip)
end)

function showUI(bool, bool)
    SetNuiFocus(bool, bool)

    SendNUIMessage({
        type = "show",
        status = bool,
    })

    if PlayerData.metadata["pilotjob"].level >= 2 then
        SendNUIMessage({action = 'levelwhat', value = "LEVEL 2"})
    else
        SendNUIMessage({action = 'levelwhat', value = "LEVEL 1"})
    end

    SendNUIMessage({action = 'progg', value = PlayerData.metadata["pilotjob"].flights })
    SendNUIMessage({action = 'flightsnumber', value = PlayerData.metadata["pilotjob"].flights })
end

function CreateLegalRouteCheckPoint()
	LegalCheckPoint = AddBlipForCoord(Config.LegalRoute.CheckPoint)
  
	SetBlipSprite(LegalCheckPoint, Config.Blips.LegalCheckPoint.ID)
	SetBlipDisplay(LegalCheckPoint, 4)
	SetBlipScale(LegalCheckPoint, Config.Blips.LegalCheckPoint.Scale)
	SetBlipColour(LegalCheckPoint, Config.Blips.LegalCheckPoint.Colour)
	SetBlipAsShortRange(LegalCheckPoint, true)

	BeginTextCommandSetBlipName ("STRING")
	AddTextComponentString (Config.Blips.LegalCheckPoint.Label)
	EndTextCommandSetBlipName(LegalCheckPoint)

    SetNewWaypoint(Config.LegalRoute.CheckPoint)
end

function CreateLegalRouteCheckPoint2()
	LegalCheckPoint2 = AddBlipForCoord(Config.PlaneSpawn.coords)
  
	SetBlipSprite(LegalCheckPoint2, Config.Blips.LegalCheckPoint2.ID)
	SetBlipDisplay(LegalCheckPoint2, 4)
	SetBlipScale(LegalCheckPoint2, Config.Blips.LegalCheckPoint2.Scale)
	SetBlipColour(LegalCheckPoint2, Config.Blips.LegalCheckPoint2.Colour)
	SetBlipAsShortRange(LegalCheckPoint2, true)

	BeginTextCommandSetBlipName ("STRING")
	AddTextComponentString (Config.Blips.LegalCheckPoint2.Label)
	EndTextCommandSetBlipName(LegalCheckPoint2)
    SetNewWaypoint(Config.PlaneSpawn.coords)
end

function CreateIllegalRouteCheckPoint()
	IllegalCheckPoint = AddBlipForCoord(Config.IllegalRoute.CheckPoint)
  
	SetBlipSprite(IllegalCheckPoint, Config.Blips.IllegalCheckPoint.ID)
	SetBlipDisplay(IllegalCheckPoint, 4)
	SetBlipScale(IllegalCheckPoint, Config.Blips.IllegalCheckPoint.Scale)
	SetBlipColour(IllegalCheckPoint, Config.Blips.IllegalCheckPoint.Colour)
	SetBlipAsShortRange(IllegalCheckPoint, true)

	BeginTextCommandSetBlipName ("STRING")
	AddTextComponentString (Config.Blips.IllegalCheckPoint.Label)
	EndTextCommandSetBlipName(IllegalCheckPoint)

    SetNewWaypoint(Config.IllegalRoute.CheckPoint)
end

RegisterNUICallback("close", function(data)
    showUI(false, false)
end)

RegisterNUICallback("legalroute", function(data)
    showUI(false, false)

    local playerPed = PlayerPedId()
    local foundSpawn, spawnPoint = GetAvailableSpawnPointLocation()

    if foundSpawn then
        QBCore.Functions.SpawnVehicle(Config.LegalRoute.VehicleModel, function(veh)
            SetEntityHeading(veh, Config.PlaneSpawn.heading)
            exports['cdn-fuel']:SetFuel(veh, 100.0)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            SetVehicleEngineOn(veh, true, true)
            SetEntityAsMissionEntity(veh, true, true)
            TaskWarpPedIntoVehicle(playerPed, veh, -1)
        end, Config.PlaneSpawn.coords, true)

        startedLegalRoute = true
    
        CreateLegalRouteCheckPoint()
    
        QBCore.Functions.Notify(Config.Translation.GoTakePassengers)
    end
end)

RegisterNUICallback("illegalroute", function(data)
    showUI(false, false)

    
    if PlayerData.metadata["pilotjob"].level >= 2 then
        local playerPed = PlayerPedId()
        local foundSpawn, spawnPoint = GetAvailableSpawnPointLocation()

        if foundSpawn then
            QBCore.Functions.SpawnVehicle(Config.IllegalRoute.VehicleModel, function(veh)
                SetEntityHeading(veh, Config.PlaneSpawn.heading)
                exports['LegacyFuel']:SetFuel(veh, 100.0)
                TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                SetVehicleEngineOn(veh, true, true)
                SetEntityAsMissionEntity(veh, true, true)
                TaskWarpPedIntoVehicle(playerPed, veh, -1)
            end, Config.PlaneSpawn.coords, true)
    
            startedIllegalRoute = true
        
            CreateIllegalRouteCheckPoint()
        
            QBCore.Functions.Notify(Config.Translation.GoLoadGoods)
        end
    else
        QBCore.Functions.Notify(Config.Translation.NotLevel2, 'error')
    end
end)

local function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
	local nearbyEntities = {}

	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		local playerPed = PlayerPedId()
		coords = GetEntityCoords(playerPed)
	end

	for k,entity in pairs(entities) do
		local distance = #(coords - GetEntityCoords(entity))

		if distance <= maxDistance then
			nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
		end
	end

	return nearbyEntities
end

local function GetVehiclesInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(GetGamePool('CVehicle'), false, coords, maxDistance)
end

local function IsSpawnPointClear(coords, maxDistance)
	return #GetVehiclesInArea(coords, maxDistance) == 0
end

function GetAvailableSpawnPointLocation()
	local found, foundSpawnPoint = false, nil

	if IsSpawnPointClear(Config.PlaneSpawn.coords, 10) then
		found, foundSpawnPoint = true, Config.PlaneSpawn
	end

	if found then
		return true, foundSpawnPoint
	else
        startedLegalRoute = false
        startedIllegalRoute = false
        RemoveBlip(IllegalCheckPoint)
        RemoveBlip(LegalCheckPoint)
        RemoveBlip(LegalCheckPoint2)
        QBCore.Functions.Notify(Config.Translation.SpawnPointNotAvailable)
		return false
	end
end