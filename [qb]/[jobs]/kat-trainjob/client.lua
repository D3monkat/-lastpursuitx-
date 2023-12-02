local JobTrainStarted,intrain,validate,checkpoint,stop,check,dooropen = false,false,false,false,false,false,false
local train,mission,CurrentStation,ped,currentBlip,doorCount,typeRun
local blips = {}
local speed,distance,arret,nbr = 0,0,0,0
local PlayerJob = {}
local message,messageStop,messagePed,messagePed2
local QBCore = exports['qb-core']:GetCoreObject()
Citizen.CreateThread(function()	
    QBCore.Functions.TriggerCallback('Trainjob:GetTriggers', function(Data) Triggers = Data end)
	if Config.Zone and Config.Zone ~= vector4(0,0,0,0) then
        StartTrainthreadPnj()
    end
	function LoadTrainModels()
        DeleteAllTrains()
        RequestModelSync("freight")
        RequestModelSync("freightcar")
        RequestModelSync("freightcar2")
        RequestModelSync("freightgrain")
        RequestModelSync("freightcont1")
        RequestModelSync("freightcont2")
        RequestModelSync("freighttrailer")
        RequestModelSync("tankercar")
        RequestModelSync("metrotrain")
        RequestModelSync("s_m_m_lsmetro_01")
    end
    function RequestModelSync(mod)
        tempmodel = GetHashKey(mod)
        RequestModel(tempmodel)
        while not HasModelLoaded(tempmodel) do
            RequestModel(tempmodel)
            Citizen.Wait(0)
        end
    end
    SetTrainsForceDoorsOpen(true)
    LoadTrainModels()
	if Config.blipStation then
		for i, v in ipairs(Config.runTrain["train"].stations) do
			local blip = AddBlipForCoord(v.spawn)
			SetBlipSprite(blip, 795)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 0.65)
			SetBlipAsShortRange(blip, true)
			SetBlipColour(blip, 3)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName(Config.Translation[Config.Language]["Train"])
			EndTextCommandSetBlipName(blip)
			table.insert(blips,blip)
		end
		for i, v in ipairs(Config.runTrain["metro"].stations) do
			if not v.retour then
				local blip = AddBlipForCoord(v.spawn)
				SetBlipSprite(blip, 36)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, 0.65)
				SetBlipAsShortRange(blip, true)
				SetBlipColour(blip, 3)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName(Config.Translation[Config.Language]["Metro"])
				EndTextCommandSetBlipName(blip)
				table.insert(blips,blip)
			end
		end
	end
end)
function StartTrainthreadPnj()
    local Waiter
    local distance
    local ped
    local isPedLoaded
    local gang = Config.pedhash
    Citizen.CreateThread(function()
        while true do 
            local playerPed = PlayerPedId()
            distance = GetDistanceBetweenCoords(GetEntityCoords(playerPed),Config.Zone.x,Config.Zone.y,Config.Zone.z,true)
            if distance > 1000 then
                Waiter = 5000
                if isPedLoaded then
                    DeleteEntity(ped)
                    SetModelAsNoLongerNeeded(GetHashKey(ped))
                    isPedLoaded = false
                end
            elseif distance < 1000 and distance > 100 then
                Waiter = 1000
            elseif distance < 100 and distance > 20 then
                Waiter = 100
                if not isPedLoaded then
					RequestModel(GetHashKey(gang))
					while not HasModelLoaded(GetHashKey(gang)) do
						Wait(1)
					end
					ped = CreatePed(4, gang,Config.Zone, false, true)
					FreezeEntityPosition(ped, true)	
					SetEntityInvincible(ped, true)
					SetBlockingOfNonTemporaryEvents(ped, true)                    
					isPedLoaded = true
				end
            elseif distance < 20 and distance > 2 then
                Waiter = 5
                if not isPedLoaded then
					RequestModel(GetHashKey(gang))
					while not HasModelLoaded(GetHashKey(gang)) do
						Wait(1)
					end
					ped = CreatePed(4, gang,Config.Zone, false, true)
					FreezeEntityPosition(ped, true)	
					SetEntityInvincible(ped, true)
					SetBlockingOfNonTemporaryEvents(ped, true)                    
					isPedLoaded = true
				end
                if messagePed then
                    messagePed = false
                    exports['qb-core']:HideText()
                end
            elseif distance < 2 then
                if not isPedLoaded then
					RequestModel(GetHashKey(gang))
					while not HasModelLoaded(GetHashKey(gang)) do
						Wait(1)
					end
					ped = CreatePed(4, gang,Config.Zone, false, true)
					FreezeEntityPosition(ped, true)	
					SetEntityInvincible(ped, true)
					SetBlockingOfNonTemporaryEvents(ped, true)                    
					isPedLoaded = true
				end
                if not messagePed then
                    messagePed = true
                    exports['qb-core']:DrawText(Config.Translation[Config.Language]["Start"], 'left')
                end
                if IsControlJustReleased(0,38) then
                    messagePed = false
                    exports['qb-core']:HideText()
                    RequestAmbientAudioBank("GENERIC_HI")
                    PlayAmbientSpeech1(ped,"GENERIC_HI","SPEECH_PARAMS_STANDARD")
                    StartOrStopTrainjob()
                end
            end
            Citizen.Wait(Waiter)
        end
    end)
end
function StartTrainThread()
	local Waiter = 7
    local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
		while JobTrainStarted do
            if mission == nil then
                mission = Config.runTrain
                local pedPos = GetEntityCoords(playerPed)
                for i, v in ipairs(mission[typeRun].stations) do
                    distance = GetDistanceBetweenCoords(pedPos,v.ped.x,v.ped.y,v.ped.z,true)
                    if nbr == 0 then
                        nbr = i
                        arret = nbr
                    end
                    if distance < GetDistanceBetweenCoords(pedPos,mission[typeRun].stations[nbr].ped.x,mission[typeRun].stations[nbr].ped.y,mission[typeRun].stations[nbr].ped.z,true) then
                        nbr = i
                        arret = nbr
                    end
                end
                CurrentStation = mission[typeRun].stations[nbr]
                currentBlip = AddBlipForCoord(CurrentStation.ped)
                SetBlipAsFriendly(currentBlip, 1)
                SetBlipColour(currentBlip, 2)
                SetBlipCategory(currentBlip, 3)
                SetBlipRoute(currentBlip, true)
            else
                if not checkpoint then
                    local pedPos = GetEntityCoords(playerPed)
                    distance = GetDistanceBetweenCoords(pedPos,CurrentStation.ped.x,CurrentStation.ped.y,CurrentStation.ped.z,true)
                    if distance < 100 and distance > 2 then
                        DrawMarker(2,CurrentStation.ped.x,CurrentStation.ped.y,CurrentStation.ped.z+2.5, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0,128,0, 50, false, true, 2, nil, nil, false)
                        if not DoesEntityExist(ped) then
                            local skin = mission.peds[GetRandomIntInRange(1, #mission.peds)]
                            RequestModel(skin)
                            while not HasModelLoaded(skin) do
                                Citizen.Wait(0)
                            end
                            ped =  CreatePed(4, skin, CurrentStation.ped, true, true)
                            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, 1)
                        end
                        if messagePed2 then
                            messagePed2 = false
                            exports['qb-core']:HideText()
                        end
                    elseif distance < 2 then
                        if not messagePed2 then
                            messagePed2 = true
                            exports['qb-core']:DrawText(Config.Translation[Config.Language]["Start"],"left")
                        end
                        if IsControlJustReleased(1, 38) then
                            RemoveBlip(currentBlip)
                            if arret == #mission[typeRun].stations then
                                arret = 1
                            else
                                arret = arret + 1
                            end
                            currentBlip = AddBlipForCoord(mission[typeRun].stations[arret].spawn)
                            SetBlipAsFriendly(currentBlip, 1)
                            SetBlipColour(currentBlip, 2)
                            SetBlipCategory(currentBlip, 3)
                            local variation = 25
                            if typeRun == "train" then
                                variation = math.random(1,20)
                            end
                            train = CreateMissionTrain(variation, CurrentStation.spawn, math.random(0,100))
                            local networkId = NetworkGetNetworkIdFromEntity(train)
                            SetNetworkIdCanMigrate(networkId, true)
		                    SetEntityAsMissionEntity(train, true, false)
                            doorCount = GetTrainDoorCount(train)
                            SetTrainSpeed(train, 0)
                            SetTrainCruiseSpeed(train,0)
                            SetPedAsNoLongerNeeded(ped)
                            checkpoint = true
                        end
                    end
                    DrawSub(Config.Translation[Config.Language]["DriveTo"]..CurrentStation.name,1000)
                elseif checkpoint then
                    if not intrain then
                        local pedPos = GetEntityCoords(playerPed)
                        local trainPos = GetWorldPositionOfEntityBone(train,(GetEntityBoneIndexByName(train, "seat_dside_f")))
                        local stopPos 
                        if arret == 1 then
                            stopPos = mission[typeRun].stations[1].ped
                        else
                            stopPos = mission[typeRun].stations[arret-1].ped
                        end
                        DrawMarker(2, trainPos.x, trainPos.y, trainPos.z+1.5, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0,128,0, 50, false, true, 2, nil, nil, false)
                        DrawMarker(2, stopPos.x, stopPos.y, stopPos.z+2.5, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, 0,128,0, 50, false, true, 2, nil, nil, false)
                        if GetDistanceBetweenCoords(pedPos,trainPos.x,trainPos.y,trainPos.z,true) < 2 then
                            if not message then
                                message = true
                                exports['qb-core']:DrawText(Config.Translation[Config.Language]["EnterTrain"],"left")
                            end
                            if IsControlJustReleased(1, 38) then
                                message = false
                                exports['qb-core']:HideText()
                                SetPedAsNoLongerNeeded(ped)
                                SetEntityCleanupByEngine(ped)
                                SetPedIntoVehicle(PlayerPedId(),train,-1)
                                intrain = true
                                StartControl()
                            end
                        elseif GetDistanceBetweenCoords(pedPos,trainPos.x,trainPos.y,trainPos.z,true) > 2 then
                            if message then
                                print("train")
                                message = false
                                exports['qb-core']:HideText()
                            end
                        end
                        if GetDistanceBetweenCoords(pedPos,stopPos,true) < 2 then
                            if not messageStop then
                                messageStop = true
                                exports['qb-core']:DrawText(Config.Translation[Config.Language]["StopRun2"],"left") 
                            end
                            if IsControlJustReleased(1, 38) then
                                exports['qb-core']:HideText()
                                StopTrainjob()
                            end
                        elseif GetDistanceBetweenCoords(pedPos,stopPos,true) > 2 then
                            if messageStop then
                                messageStop = false
                                exports['qb-core']:HideText()
                            end
                        end
                        DrawSub(Config.Translation[Config.Language]["InCar"],1000)
                    else
                        local trainPos = GetEntityCoords(train)
                        distance = GetDistanceBetweenCoords(trainPos,mission[typeRun].stations[arret].spawn,true)
                        if distance > 50 and check then
                            RemoveBlip(currentBlip)
                            if arret < #mission[typeRun].stations then
                                arret = arret + 1
                            elseif arret == #mission[typeRun].stations then
                                arret = 1
                            end 
                            currentBlip = AddBlipForCoord(mission[typeRun].stations[arret].spawn)
                            SetBlipAsFriendly(currentBlip, 1)
                            SetBlipColour(currentBlip, 2)
                            SetBlipCategory(currentBlip, 3)
                            validate = false
                            check = false
                        end
                        if distance < 50 then
                            DrawMarker(6,mission[typeRun].stations[arret].spawn.x,mission[typeRun].stations[arret].spawn.y,mission[typeRun].stations[arret].spawn.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255,255,255, 50, false, true, 2, nil, nil, false)
                            DrawMarker(5,mission[typeRun].stations[arret].spawn.x,mission[typeRun].stations[arret].spawn.y,mission[typeRun].stations[arret].spawn.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255,255,255, 50, false, true, 2, nil, nil, false)
                        end
                        if distance < 10 then
                            if not check then
                                QBCore.Functions.Notify(Config.Translation[Config.Language]["Stop"],"success")
                                check = true
                            end
                            if speed == 0 then
                                stop = true
                                if Config.useProgressBars then
                                    QBCore.Functions.Progressbar('TrainJob', Config.Translation[Config.Language]["InStop"], 10000, false, true, {
                                        disableMovement = false,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = false
                                        }, {}, {}, {}, function()
                                            -- This code runs if the progress bar completes successfully
                                        end, function()
                                            -- This code runs if the progress bar gets cancelled
                                    end)
                                end
                                RemoveBlip(currentBlip)
                                Citizen.Wait(10000)
                                if arret < #mission[typeRun].stations then
                                    arret = arret + 1
                                elseif arret == #mission[typeRun].stations then
                                    arret = 1
                                end 
								QBCore.Functions.Notify(Config.Translation[Config.Language]["Money"]..(Config.Money).." "..Config.currency,"success")
								TriggerServerEvent(Triggers.AddMoney,Config.Money)
                                currentBlip = AddBlipForCoord(mission[typeRun].stations[arret].spawn)
                                SetBlipAsFriendly(currentBlip, 1)
                                SetBlipColour(currentBlip, 2)
                                SetBlipCategory(currentBlip, 3)
								stop = false
								check = false
                            end
                        end
                        DrawSub(Config.Translation[Config.Language]["DriveTo"]..mission[typeRun].stations[arret].name,1000)
                    end
                end
            end
		    Citizen.Wait(Waiter)
		end
	end)
end
RegisterNetEvent('Trainjob:startRun')
AddEventHandler('Trainjob:startRun', function()
	StartOrStopTrainjob()
end)
function StartOrStopTrainjob()
	if JobTrainStarted then
		StopTrainjob()
	else
		if Config.JobRequire ~= false then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == Config.JobRequire then
                    StartTrainjob()
                else
                    QBCore.Functions.Notify(Config.Translation[Config.Language]["JobCheck"],"error")
                end
            end)
		else
			StartTrainjob()
		end
	end
end
function StartTrainjob()
	ClearCurrentTrainMission()
	ShowLoadingPromt(Config.Translation[Config.Language]["StartRun"], 5000, 3)
    exports['qb-menu']:openMenu({
        {
            header = 'Metro',
            icon = 'fa-solid fa-train-tram',
            params = {
                event = 'Trainjob:StartJob',
                args = {
                    typeRun = "metro"
                }
            }
        },
        {
            header = 'Train',
            icon = 'fa-solid fa-train',
            params = {
                event = 'Trainjob:StartJob',
                args = {
                    typeRun = "train"
                }
            }
        }
    })
end
RegisterNetEvent('Trainjob:StartJob', function(data)
    typeRun = data.typeRun
    JobTrainStarted = true
    StartTrainThread()
end)
function StopTrainjob()
	ShowLoadingPromt(Config.Translation[Config.Language]["StopRun"], 5000, 3)
	ClearCurrentTrainMission()
	JobTrainStarted = false
end
function ClearCurrentTrainMission()
	if DoesBlipExist(currentBlip) then
        RemoveBlip(currentBlip)
    end
    SetPedAsNoLongerNeeded(ped)
    DeleteMissionTrain(train)
    speed,arret,nbr,distance = 0,0,0,0
    ped,train,mission,CurrentStation = nil,nil,nil,nil
    intrain,validate,dooropen,checkpoint,stop = false,false,false,false,false
end
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
function ShowLoadingPromt(msg, time, type)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		BeginTextCommandBusyString("STRING")
		AddTextComponentString(msg)
		EndTextCommandBusyString(type)
		Citizen.Wait(time)

		RemoveLoadingPrompt()
	end)
end
function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true)
end
function DrawSub(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time, 1)
end
function StartControl()
    local wait = 0
    Citizen.CreateThread(function()
        while intrain do
            if not stop then
                if IsControlJustReleased(0, 23) and speed < 5 then
                    speed = 0
                    TaskLeaveVehicle(PlayerPedId(), train, 0)
                    intrain = false
                end
                if IsControlPressed(0,71) and speed < 24 then
                    speed = speed + 0.08
                elseif IsControlPressed(0,72) and speed > 0 then
                    speed = speed - 0.60
                end
                if speed < 0 then
                    speed = 0
                end
                SetTrainCruiseSpeed(train,speed)
            end
            Citizen.Wait(wait)
        end
    end)
end