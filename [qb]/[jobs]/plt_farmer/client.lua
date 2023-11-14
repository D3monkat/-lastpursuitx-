PLT = plt_farmer
PlayerData = {}
balyaOnRomorkCoord ={}
balyaOnDorseCoord ={}
balyaAttaching ={}
canIHarvester = false
myArea = false
balyaOrani = nil
bicerDover = false
traktor = false
romork = false
tir = false
dorse = false
waitSV1 = false
waitSV2 = false
bekleamk = false
fixWait = false
sayi = 0
balya = 0
workStage = 0
arpaTable = {}
balyaTable = {}
balyaonRomork = {}
balyablip = {}
arpaBlip = {}
blipID  = false
DeliveryBlip = false
npcID = false
iptalEdiyorum = false
inAnyVeh = false
index1 = math.random(0, 160)
index2 = math.random(0, 160)
pedID = PlayerPedId()
playerPed = GetPlayerPed(-1)
playerToDelVeh = 1000
playerCoord = GetEntityCoords(playerPed)
playerToAction = GetDistanceBetweenCoords(playerCoord,PLT.ActionCoord,false)
playerTo2Action = GetDistanceBetweenCoords(playerCoord,PLT.CloakRoomCoord,false)
menuArea = false
menuAsk = false
menuClothe = false
ESX = nil
QBCore = nil



Citizen.CreateThread(function(...) 
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	if ESX == nil then  Citizen.Wait(2000)
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end) 
	end 
	if ESX ~= nil then 
		while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end
		PlayerData = ESX.GetPlayerData()
		refrehPedBlip()
	else
		QBCore = exports['qb-core']:GetCoreObject()
		while QBCore.Functions.GetPlayerData().job == nil do Citizen.Wait(1000) end
		PlayerData = QBCore.Functions.GetPlayerData()
		refrehPedBlip()
	end
	if ESX ~= nil then 
		RegisterNetEvent('esx:setJob')
		AddEventHandler('esx:setJob', function(job)
			PlayerData.job = job
			refrehPedBlip()
		end)
	elseif QBCore ~= nil then 
		RegisterNetEvent('QBCore:Client:OnJobUpdate')
		AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
			refrehPedBlip()
		end)
	end
end)

if not PLT.UseEsxMenu then
	SelectAreaMenu = MenuV:CreateMenu(false, PLT.U["canable_area"], 'topright', 0, 0, 0, 'size-150', 'example', 'menuv', 'selectable_area')
	SelectAreaMenu:On('close', function(item) menuArea = false end)
	AskMenu = MenuV:CreateMenu(false, PLT.U["ask_menu"], 'topright', 0, 0, 0, 'size-150', 'example', 'menuv', 'ask_menu')
	AskMenu:On('close', function(item) Citizen.Wait(1000) if menuAsk == true then  openAskMenu() end end)
	ClotheMenu = MenuV:CreateMenu(false, PLT.U["gardrope"], 'topright', 0, 0, 0, 'size-150', 'example', 'menuv', 'clothe_menu')
	ClotheMenu:On('close', function(item) menuClothe = false  end)
end

Citizen.CreateThread(function()
	Citizen.CreateThread(function()
		while true do Citizen.Wait(0)
			if canIHarvester and not iptalEdiyorum then
				if workStage == 0 then Citizen.Wait(250)
					playerCoord = GetEntityCoords(playerPed)
					playerToAction = GetDistanceBetweenCoords(playerCoord,PLT.ActionCoord,false)
					if PLT.EnableJobClothe then
						playerTo2Action = GetDistanceBetweenCoords(playerCoord,PLT.CloakRoomCoord,false)
					end
				elseif  workStage == 1 then 
					playerCoord = GetEntityCoords(playerPed)
					if bicerDover == false then 
						if traktor and romork then
							traktorFx = GetOffsetFromEntityInWorldCoords(traktor, 0.0, -2.5, -0.5)
							romork1Fx = GetOffsetFromEntityInWorldCoords(romork, 0.0, 4.5, -1.3)
							tractorToRomork =GetDistanceBetweenCoords(traktorFx,romork1Fx,false)
							 if not IsPedInVehicle(pedID,traktor,false) then
								bekleamk = true
								spammingNotify(PLT.U["getin_tractor"])  
								traktorCoord = GetEntityCoords(traktor)
								DrawMarker(20, traktorCoord.x ,traktorCoord.y,traktorCoord.z + 3, 0, 0.50, 0, 0, 0, 0, 2.5,2.5,2.5, 255, 255, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
							elseif tractorToRomork > 1.2 then 
								bekleamk = true
								spammingNotify(PLT.U["tractor_to_romork"])
								DrawMarker(20, traktorFx.x ,traktorFx.y,traktorFx.z,    0, 0.50, 0, 0, 0, 0,     0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
								DrawMarker(20, romork1Fx.x , romork1Fx.y,  romork1Fx.z, 0, 0.50, 0, 180.0, 0, 0, 0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
							else
								bekleamk = true
								spammingNotify(PLT.U["trctor_go_newpoint"])  
								SetNewWaypoint(PLT.Area[myArea][1].x,PLT.Area[myArea][1].y) 
							end 
						end
					else
						bicerDoverCoord = GetEntityCoords(bicerDover)
						if IsPedInVehicle(pedID,traktor,false) then
							bekleamk = true
							spammingNotify(PLT.U["traktor_park"])
						elseif not IsPedInVehicle(pedID,bicerDover,false) then
							bekleamk = true
							spammingNotify(PLT.U["getin_harvester"])
							DrawMarker(20, bicerDoverCoord.x ,bicerDoverCoord.y,bicerDoverCoord.z + 5, 0, 0.50, 0, 0, 0, 0, 2.5,2.5,2.5, 255, 255, 255, 255, 0.0, 0.10, 0, 1, 0, 0.0, 0)  
						else 
							bekleamk = false
							Citizen.Wait(1000)
						end
					end
				elseif  workStage == 2 then 
					if traktor and romork then
						playerCoord = GetEntityCoords(playerPed)
						traktorFx = GetOffsetFromEntityInWorldCoords(traktor, 0.0, -2.5, -0.5)
						romork1Fx = GetOffsetFromEntityInWorldCoords(romork, 0.0, 4.5, -1.3)
						tractorToRomork =GetDistanceBetweenCoords(traktorFx,romork1Fx,false)
						playerToArea = GetDistanceBetweenCoords(playerCoord,PLT.Area[myArea][1].x,PLT.Area[myArea][1].y,PLT.Area[myArea][1].z ,false)
					 	if not IsPedInVehicle(pedID,traktor,false) and not balyaTable[1] then
							bekleamk = true
							spammingNotify(PLT.U["getin_tractor"])  
							traktorCoord = GetEntityCoords(traktor)
							DrawMarker(20, traktorCoord.x ,traktorCoord.y,traktorCoord.z + 3, 0, 0.50, 0, 0, 0, 0, 2.5,2.5,2.5, 255, 255, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
						elseif tractorToRomork > 1.2 then 
							bekleamk = true
							spammingNotify(PLT.U["tractor_to_romork"])
							DrawMarker(20, traktorFx.x ,traktorFx.y,traktorFx.z,    0, 0.50, 0, 0, 0, 0,     0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
							DrawMarker(20, romork1Fx.x , romork1Fx.y,  romork1Fx.z, 0, 0.50, 0, 180.0, 0, 0, 0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
						else
							bekleamk = false
							Citizen.Wait(1000)
						end 
					end
				elseif  workStage == 3 then 
					if traktor ~= false  and (IsPedInVehicle(pedID,traktor,false)) and dorse ~= false then
						spammingNotify(PLT.U["traktortodorce"])
						bekleamk = true
						romork3Fx1 = GetOffsetFromEntityInWorldCoords(romork, 0.0, -3.3, -1.7)
						romork3Fx2 = GetOffsetFromEntityInWorldCoords(romork, 0.0, -0.3, -1.6)
						romork3Fx3 = GetOffsetFromEntityInWorldCoords(romork, 0.0, 2.7, -1.5)
						dorse3Fx1 = GetOffsetFromEntityInWorldCoords(dorse, 0.0,  -7.5, -1.0)
						dorse3Fx2 = GetOffsetFromEntityInWorldCoords(dorse, 0.0, -10.5, -0.9)
						dorse3Fx3 = GetOffsetFromEntityInWorldCoords(dorse, 0.0, -13.5, -0.8)
						local g =  math.floor( 255 - (GetDistanceBetweenCoords(dorse3Fx1,romork3Fx1,false) * 20) )
						local r = 255- g
						local b = 0

						DrawMarker(6,romork3Fx1.x,romork3Fx1.y,romork3Fx1.z,0.0, 0.0, 0.0, -90,-90,-90, 5.0,5.0,5.0,255,0.0,0.0,100,false, true, 2, false, false, false, false) 
						DrawMarker(6,romork3Fx1.x,romork3Fx1.y,romork3Fx1.z,0.0, 0.0, 0.0, -90, -90, -90, 5.0, 5.0, 5.0, r, g, b,255,    false, false, 2, false, false, false, false) 
						DrawMarker(6,romork3Fx2.x,romork3Fx2.y,romork3Fx2.z,0.0, 0.0, 0.0, -90, -90, -90, 4.0, 4.0, 4.0, r, g, b,255,false, false, 2, false, false, false, false) 
						DrawMarker(6,romork3Fx3.x,romork3Fx3.y,romork3Fx3.z,0.0, 0.0, 0.0, -90, -90, -90, 3.0, 3.0, 3.0, r, g, b,255,false, false, 2, false, false, false, false) 
						DrawMarker(6,dorse3Fx1.x,dorse3Fx1.y,dorse3Fx1.z,   0.0, 0.0, 0.0, -90, -90, -90, 5.0, 5.0, 5.0, r, g, b,255,    false, false, 2, false, false, false, false) 
						DrawMarker(6,dorse3Fx2.x,dorse3Fx2.y,dorse3Fx2.z,   0.0, 0.0, 0.0, -90, -90, -90, 4.0, 4.0, 4.0, r, g, b,255,false, false, 2, false, false, false, false) 
						DrawMarker(6,dorse3Fx3.x,dorse3Fx3.y,dorse3Fx3.z,   0.0, 0.0, 0.0, -90, -90, -90, 3.0, 3.0, 3.0, r, g, b,255,false, false, 2, false, false, false, false) 
					else
						bekleamk = false
						Citizen.Wait(1000)
					end
				elseif  workStage == 4 then 
					playerCoord = GetEntityCoords(playerPed)
					tirFx = GetOffsetFromEntityInWorldCoords(tir, 0.0, -3.3, 0.5)
					dorse1Fx = GetOffsetFromEntityInWorldCoords(dorse, 0.0, 4.75, -0.4)
					tirToDorse = GetDistanceBetweenCoords(tirFx,dorse1Fx,false)
					if not IsPedInVehicle(pedID,tir,false) then
						if GetDistanceBetweenCoords(playerCoord,PLT.DeliveryCoords,false) > 75.0 then 
							bekleamk = true
							spammingNotify(PLT.U["getin_truck"])  
							tirCoord = GetEntityCoords(tir)
							DrawMarker(20, tirCoord.x ,tirCoord.y,tirCoord.z + 4.5, 0, 0.50, 0, 0, 0, 0, 2.5,2.5,2.5, 255, 255, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
						end
					elseif tirToDorse > 1.2 then 
						bekleamk = true
						spammingNotify(PLT.U["dorcetotruck"])
						DrawMarker(20, tirFx.x ,tirFx.y,tirFx.z,    0, 0.50, 0, 0, 0, 0,     0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
						DrawMarker(20, dorse1Fx.x , dorse1Fx.y,  dorse1Fx.z, 0, 0.50, 0, 180.0, 0, 0, 0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
					else
						bekleamk = false
						Citizen.Wait(1000)
					end 
				elseif  workStage == 5 then 
					playerCoord = GetEntityCoords(playerPed)
					tirFx = GetOffsetFromEntityInWorldCoords(tir, 0.0, -3.3, 0.5)
					dorse1Fx = GetOffsetFromEntityInWorldCoords(dorse, 0.0, 4.75, -0.4)
					tirToDorse = GetDistanceBetweenCoords(tirFx,dorse1Fx,false)
					if not IsPedInVehicle(pedID,tir,false) then
						bekleamk = true
						spammingNotify(PLT.U["getin_truck"])  
						tirCoord = GetEntityCoords(tir)
						DrawMarker(20, tirCoord.x ,tirCoord.y,tirCoord.z + 4.5, 0, 0.50, 0, 0, 0, 0, 2.5,2.5,2.5, 255, 255, 255, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					elseif tirToDorse > 1.2 then 
						bekleamk = true
						spammingNotify(PLT.U["dorcetotruck"])
						DrawMarker(20, tirFx.x ,tirFx.y,tirFx.z,    0, 0.50, 0, 0, 0, 0,     0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
						DrawMarker(20, dorse1Fx.x , dorse1Fx.y,  dorse1Fx.z, 0, 0.50, 0, 180.0, 0, 0, 0.5,0.5,0.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)  
					else
						bekleamk = false
						Citizen.Wait(1000)
					end 
				end
			else
				Citizen.Wait(1000)
			end
		end
	end)
	while true do Citizen.Wait(1000)
		if canIHarvester then
			while workStage == 0 and not bekleamk and not iptalEdiyorum do Citizen.Wait(0)
				if playerToAction < 1 then 
					spammingNotify(PLT.U["for_action"])
					DrawMarker(27, PLT.ActionCoord.x,PLT.ActionCoord.y,PLT.ActionCoord.z - 0.95, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, 0.0, 0.10, 0, 0.0, 0, 0.0, 0)  
					DrawText3Ds(PLT.ActionCoord.x,PLT.ActionCoord.y,PLT.ActionCoord.z, 0.35, 0.35,  "~b~(~y~-~g~E~y~-~b~) ~b~[~y~- ~y~ "..PLT.U["start_job"].." ~y~-~b~]")
					DrawText3Ds(PLT.PedCoord.x,PLT.PedCoord.y,PLT.PedCoord.z + 1 , 0.35, 0.35,  "~b~[~y~- ~g~ "..PLT.U["ped_text"].." ~y~-~b~]")
					if PLT.EnableJobClothe then
						DrawMarker(27, PLT.CloakRoomCoord.x,PLT.CloakRoomCoord.y,PLT.CloakRoomCoord.z - 0.95, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, 0.0, 0.10, 0, 0.0, 0, 0.0, 0)  
						DrawText3Ds(PLT.CloakRoomCoord.x,PLT.CloakRoomCoord.y,PLT.CloakRoomCoord.z, 0.35, 0.35,  "~w~[~o~- ~b~ "..PLT.U["clothe_action"].." ~o~-~w~]")
					end
					if IsControlPressed(0,46) then
						TriggerServerEvent("plt_farmer:CheckAvailableArea")
						menuArea = true
						while playerToAction < 1 and menuArea do Citizen.Wait(100) end 	if PLT.UseEsxMenu then ESX.UI.Menu.CloseAll() else SelectAreaMenu:Close() end break
					end
				elseif PLT.EnableJobClothe and playerTo2Action < 1 then 
					DrawMarker(27, PLT.ActionCoord.x,PLT.ActionCoord.y,PLT.ActionCoord.z - 0.95, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, 0.0, 0.10, 0, 0.0, 0, 0.0, 0)  
					DrawText3Ds(PLT.ActionCoord.x,PLT.ActionCoord.y,PLT.ActionCoord.z, 0.35, 0.35,  "~w~[~o~- ~b~ "..PLT.U["job_action"].." ~o~-~w~]")
					if PLT.EnableJobClothe then
						spammingNotify(PLT.U["for_action"])
						DrawMarker(27, PLT.CloakRoomCoord.x,PLT.CloakRoomCoord.y,PLT.CloakRoomCoord.z - 0.95, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, 0.0, 0.10, 0, 0.0, 0, 0.0, 0)  
						DrawText3Ds(PLT.CloakRoomCoord.x,PLT.CloakRoomCoord.y,PLT.CloakRoomCoord.z, 0.35, 0.35,  "~b~(~y~-~g~E~y~-~b~) ~b~[~y~- ~y~ "..PLT.U["change_clothe"].." ~y~-~b~]")
						if IsControlPressed(0,46) then
							OpenCloakroomMenu()
							menuClothe = true
							while menuClothe do Citizen.Wait(10) end
						end
					end
				elseif playerToAction > 100 then  
					Citizen.Wait(2500) 
				elseif playerToAction > 20 then  
					Citizen.Wait(1000) 
					break
				elseif playerToAction > 1 then
					DrawMarker(27, PLT.ActionCoord.x,PLT.ActionCoord.y,PLT.ActionCoord.z - 0.95, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, 0.0, 0.10, 0, 0.0, 0, 0.0, 0)  
					DrawText3Ds(PLT.ActionCoord.x,PLT.ActionCoord.y,PLT.ActionCoord.z, 0.35, 0.35,  "~w~[~o~- ~b~ "..PLT.U["job_action"].." ~o~-~w~]")
					if PLT.EnableJobClothe then
						DrawMarker(27, PLT.CloakRoomCoord.x,PLT.CloakRoomCoord.y,PLT.CloakRoomCoord.z - 0.95, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, 0.0, 0.10, 0, 0.0, 0, 0.0, 0)  
						DrawText3Ds(PLT.CloakRoomCoord.x,PLT.CloakRoomCoord.y,PLT.CloakRoomCoord.z, 0.35, 0.35,  "~w~[~o~- ~b~ "..PLT.U["clothe_action"].." ~o~-~w~]")
					end
				end 
			end
			while workStage == 1 and not bekleamk and not iptalEdiyorum do Citizen.Wait(0)
				if arpaTable[1] ~= nil then 
					spammingNotify(PLT.U["hartoaction"],nil,false)
					playerCoord = GetEntityCoords(playerPed)
					arpa1Coord = GetEntityCoords(arpaTable[1])
					arpa2Coord = GetEntityCoords(arpaTable[3])
					arpa3Coord = GetEntityCoords(arpaTable[5])
					bicerDover1Fx = GetOffsetFromEntityInWorldCoords(bicerDover, 0.0, 2.0, -0.8)
					DrawMarker(1, arpa1Coord.x , arpa1Coord.y,  arpa1Coord.z - 1, 0, 0.50, 0, 0.0, 0, 0, 4.5,4.5,1.50, 0, 100, 0, 255, 0.0, 0.10, 0, 1, 0, 0.0, 0)
					DrawMarker(1, arpa2Coord.x , arpa2Coord.y,  arpa2Coord.z - 1, 0, 0.50, 0, 0.0, 0, 0, 2.5,2.5,1.40, 0, 100, 0, 150, 0.0, 0.10, 0, 1, 0, 0.0, 0)
					DrawMarker(1, arpa3Coord.x , arpa3Coord.y,  arpa3Coord.z - 1, 0, 0.50, 0, 0.0, 0, 0, 1.5,2.5,1.35, 0, 100, 0, 100, 0.0, 0.10, 0, 1, 0, 0.0, 0)
					local uzaklik = GetDistanceBetweenCoords(bicerDover1Fx,arpa1Coord,false)
					if uzaklik < 1.45 then 
						Citizen.Wait(100)
						DeleteEntity(arpaTable[1])
						table.remove(arpaTable,1)
						sayi = sayi + 1
						if balyaOrani and sayi >= balyaOrani and balya < #balyaOnRomorkCoord then 
							balya = balya + 1 
							sayi = sayi - balyaOrani
							Citizen.CreateThread(function()
								local balyaVikCoord = arpa1Coord
								if arpaTable[5] then 
									local sonrakiBalya = arpaTable[5]
									while DoesEntityExist(sonrakiBalya) do Citizen.Wait(100) end
								end
								while GetDistanceBetweenCoords(playerCoord,balyaVikCoord,false) < 10.0  and not iptalEdiyorum  do Citizen.Wait(100) end
								if not iptalEdiyorum then 
									local retval =	CreateObject(GetHashKey("prop_haybale_03"), balyaVikCoord.x,balyaVikCoord.y,balyaVikCoord.z-1.0, true , false, false)
									TriggerServerEvent("plt_farmer:AddEntity", NetworkGetNetworkIdFromEntity(retval),myArea)
									FreezeEntityPosition(retval,true)
									table.insert(balyaTable,{objeId = retval, coord = GetEntityCoords(retval) })
									createBlipforBale(retval)
								end
							end)
						end
					elseif uzaklik > 25 then 
						DrawMarker(20, arpa1Coord.x ,arpa1Coord.y,arpa1Coord.z + 4, 0, 0.50, 0, 0, 0, 0, 2.5,2.5,2.5, 100, 0, 0, 255,true, 0.10, 0, 1, 0, 0.0, 0)  
					end
				elseif balya > 9 then 
					DoScreenFadeOut(1000)
					Citizen.Wait(1000)
					SetEntityAsMissionEntity(bicerDover, false, true) DeleteVehicle(bicerDover)
					bicerDover = false
					Citizen.Wait(250)
					DoScreenFadeIn(1000)
					balya1Coord = balyaTable[1].coord
					workStage = 2
				else
					spammingNotify(PLT.U["gonewaypoint"])
					SetNewWaypoint(PLT.Area[myArea][1].x,PLT.Area[myArea][1].y)
				end
			end  
			while workStage == 2 and not bekleamk and not iptalEdiyorum do Citizen.Wait(0) 
				if balyaTable[1] then 
					spammingNotify(PLT.U["takebale"],nil,false)
					for Pkt,Pvt in pairs(balyaTable) do
						playerCoord = GetEntityCoords(playerPed)
						balya1Coord = Pvt.coord
						playerToBalya = GetDistanceBetweenCoords(balya1Coord,playerCoord,false)
						DrawMarker(20, balya1Coord.x ,balya1Coord.y,balya1Coord.z + 2, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 250, 255, true, 0.10, 0, 1, 0, 0.0, 0)
						if playerToBalya < 1.75 then
							for k,v in pairs(balyaOnRomorkCoord) do 
								if v.used == false then 
									SetEntityNoCollisionEntity(Pvt.objeId, v.used, true)
									SetEntityNoCollisionEntity(Pvt.objeId, v.used, true)
									SetEntityNoCollisionEntity(Pvt.objeId, v.used, true)
									SetEntityNoCollisionEntity(Pvt.objeId, v.used, true)
									SetEntityHeading(pedID, GetHeadingFromVector_2d(balya1Coord.x-playerCoord.x,balya1Coord.y-playerCoord.y))
									RequestAnimSet( "move_ped_crouched" )	while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do Citizen.Wait( 100 )end 
									SetPedMovementClipset( playerPed, "move_ped_crouched", 0.45 )
									Citizen.Wait(500)	
									local boneIndex = GetPedBoneIndex(playerPed, 57005)
									ResetPedMovementClipset( playerPed, 0.45 )
									Citizen.Wait(222)	
									AttachEntityToEntity(Pvt.objeId, playerPed, boneIndex, 0.75, 0.75, 0.0, 0.0, 0.0, 100.0, true, true, false, true, 1, true)
									loadAnimDict('anim@heists@box_carry@')Citizen.Wait(50)
									TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
									RequestAnimSet( "move_ped_crouched" )	while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do Citizen.Wait( 100 )end 
									romork2Fx = GetOffsetFromEntityInWorldCoords(romork, v.offx, v.offy, v.offz)
									local goanim = true
									Citizen.CreateThread(function()
										while goanim do 
											if not IsEntityPlayingAnim(playerPed, "anim@heists@box_carry@", "walk", 3) then 
												loadAnimDict('anim@heists@box_carry@')
												TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
											end
											Citizen.Wait(10)
										end
									end)
									while GetDistanceBetweenCoords(playerCoord, romork2Fx, false) > 3.5 and not iptalEdiyorum do Citizen.Wait(0) 
										spammingNotify(PLT.U["outbale"],nil,false)
										DrawMarker(20, romork2Fx.x ,romork2Fx.y,romork2Fx.z, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)
										playerCoord = GetEntityCoords(playerPed) 
										romork2Fx = GetOffsetFromEntityInWorldCoords(romork, v.offx, v.offy, v.offz)
									end
									local new  = GetOffsetFromEntityInWorldCoords(romork, v.x, v.y, v.z)
									local heading = GetEntityHeading(romork) + v.head
									TaskGoStraightToCoord(playerPed, romork2Fx.x ,romork2Fx.y,romork2Fx.z, 2.0, 3000, heading, 0.5)
									while GetDistanceBetweenCoords(playerCoord, romork2Fx, false) > 1.0 do Citizen.Wait(0) playerCoord = GetEntityCoords(playerPed) romork2Fx = GetOffsetFromEntityInWorldCoords(romork, v.offx, v.offy, v.offz) end
									ClearPedTasks(playerPed)
									SetEntityHeading(pedID, heading)
									goanim = false
									TaskJump(GetPlayerPed(-1), false, true, false)
									RequestAnimDict('amb@prop_human_movie_bulb@exit')
									while not HasAnimDictLoaded("amb@prop_human_movie_bulb@exit") do RequestAnimDict("amb@prop_human_movie_bulb@exit");Citizen.Wait(0); end
									TaskPlayAnim(pedID, 'amb@prop_human_movie_bulb@exit', 'exit', 8.0, 8.0, -1, 48, 1, false, false, false)
									Citizen.Wait(100)
									DetachEntity(Pvt.objeId)
									local ex = GetEntityCoords(Pvt.objeId)
									local pltX =  new.x - ex.x
									local pltY =  new.y - ex.y
									local pltZ =  new.z - ex.z
									if pltZ < 0.7 then pltZ = 0.7 end
									local heyding = GetEntityHeading(Pvt.objeId)
									local headingekle = (GetEntityHeading(romork) - heyding) / #balyaAttaching
									for k2,v2 in pairs(balyaAttaching) do Citizen.Wait(20)
										SetEntityCoords(Pvt.objeId, ex.x + ((pltX / 100) * v2.x), ex.y + ((pltY / 100) * v2.y), ex.z + ((pltZ / 100) * v2.z), false, false, false, false)
										SetEntityHeading(Pvt.objeId, heyding + (headingekle * k2))
									end	
									AttachEntityToEntity(Pvt.objeId, romork, 0, v.x, v.y, v.z, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
									v.used = Pvt.objeId
									table.remove(balyaTable,Pkt)
									ClearPedTasks(playerPed)
									ClearPedTasksImmediately(playerPed)
									Citizen.Wait(1000)
									break
								end
							end
						end	
					end
				else
					traktorCoord = GetEntityCoords(traktor)
					if GetDistanceBetweenCoords(traktorCoord,PLT.ActionCoord,false) < 45.0 then 
						if PLT.CanDoHalfJob then
							menuAsk = true
							openAskMenu()
							while menuAsk do Citizen.Wait(100) end
						else
							workStage = 3
							spawnTir()
						end
					else
						spammingNotify(PLT.U["getbalewaypoint"])
						SetNewWaypoint(PLT.VehicleDelete.x,PLT.VehicleDelete.y)
					end
				end	
			end 
			while workStage == 3 and not bekleamk and not iptalEdiyorum do Citizen.Wait(0) 
				sBalyaOnRmrk = balyaOnRomorkCoord[#balyaOnRomorkCoord]
				if sBalyaOnRmrk then 
					spammingNotify(PLT.U["getdorcetoromork"],nil,false)
					playerCoord = GetEntityCoords(playerPed)
					balyaSonCoord = GetEntityCoords(sBalyaOnRmrk.used)
					if sBalyaOnRmrk.z < 1 then 
						balyaSonCoord2 = GetOffsetFromEntityInWorldCoords(romork,sBalyaOnRmrk.x, sBalyaOnRmrk.y - 1, sBalyaOnRmrk.z)
					else
						balyaSonCoord2 = GetOffsetFromEntityInWorldCoords(romork,sBalyaOnRmrk.x, sBalyaOnRmrk.y - 2, 0.7)
					end
					playerToBalya = GetDistanceBetweenCoords(balyaSonCoord2,playerCoord,true)
					DrawMarker(20, balyaSonCoord2.x ,balyaSonCoord2.y,balyaSonCoord2.z , 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 250, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					if playerToBalya < 1.0 then
						for k,v in pairs(balyaOnDorseCoord) do 
							if v.used == false then Citizen.Wait(250)
								SetEntityNoCollisionEntity(tir, sBalyaOnRmrk.used, true)
								SetEntityNoCollisionEntity(dorse, sBalyaOnRmrk.used, true)
								SetEntityNoCollisionEntity(traktor, sBalyaOnRmrk.used, true)
								SetEntityNoCollisionEntity(romork, sBalyaOnRmrk.used, true)
								if sBalyaOnRmrk.z < 1 then
									SetEntityHeading(pedID, GetHeadingFromVector_2d(balyaSonCoord.x-playerCoord.x,balyaSonCoord.y-playerCoord.y))
									RequestAnimSet( "move_ped_crouched" )	while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do Citizen.Wait( 100 )end 
									SetPedMovementClipset( playerPed, "move_ped_crouched", 0.45 )
									Citizen.Wait(650)	
									ResetPedMovementClipset( playerPed, 0.45 )
									local boneIndex = GetPedBoneIndex(playerPed, 57005)
									AttachEntityToEntity(sBalyaOnRmrk.used, playerPed, boneIndex, 0.75, 0.75, 0.0, 0.0, 0.0, 100.0, false, false, false, true, 1, true)
									loadAnimDict('anim@heists@box_carry@')Citizen.Wait(50)
									TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
								else
									local slmheading = GetHeadingFromVector_2d(balyaSonCoord.x-playerCoord.x,balyaSonCoord.y-playerCoord.y)
									SetEntityHeading(pedID, slmheading) Citizen.Wait(25)	
									RequestAnimDict("missminuteman_1ig_2") while not HasAnimDictLoaded("missminuteman_1ig_2") do Citizen.Wait(0) end
									TaskPlayAnim(pedID, "missminuteman_1ig_2", "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
									Citizen.Wait(444)
									local boneIndex = GetPedBoneIndex(playerPed, 57005)
									AttachEntityToEntity(sBalyaOnRmrk.used, playerPed, boneIndex, 0.9, 0.1, -0.75, 0.0, 91.0, 0.0, false, false, false, true, 1, true)
									TaskAchieveHeading(pedID, slmheading - 180, 1000)
									Citizen.Wait(1000)
									StopAnimTask(pedID, 'missminuteman_1ig_2', 'handsup_enter', 1.0)
									Citizen.Wait(400)	
									loadAnimDict('anim@heists@box_carry@')Citizen.Wait(50)
									TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
									DetachEntity(sBalyaOnRmrk.used)	
									AttachEntityToEntity(sBalyaOnRmrk.used, playerPed, boneIndex, 0.75, 0.75, 0.0, 0.0, 0.0, 100.0, false, false, false, true, 1, true)
								end
								dorse2Fx = GetOffsetFromEntityInWorldCoords(dorse, v.x, v.y, v.z)
								if v.z < 2 then
									dorse2MarkFx = GetOffsetFromEntityInWorldCoords(dorse, v.x,v.y -1.3, v.z)
								else
									dorse2MarkFx = GetOffsetFromEntityInWorldCoords(dorse, v.x,v.y -3.0, 1.33)
								end
								local goanim = true
								Citizen.CreateThread(function()
									while goanim do 
										if not IsEntityPlayingAnim(playerPed, "anim@heists@box_carry@", "walk", 3) then 
											loadAnimDict('anim@heists@box_carry@')
											TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
										end
										Citizen.Wait(0)
									end
									StopAnimTask(pedID, 'anim@heists@box_carry@', 'walk', 1.0)
								end)
								while GetDistanceBetweenCoords(playerCoord, dorse2MarkFx, true) > 1.5 do Citizen.Wait(0) 
									spammingNotify(PLT.U["baletodorce"],nil,false)
									DrawMarker(20, dorse2MarkFx.x ,dorse2MarkFx.y  ,dorse2MarkFx.z, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)
									playerCoord = GetEntityCoords(playerPed) 
								end
								TaskGoStraightToCoord(playerPed, dorse2MarkFx.x ,dorse2MarkFx.y ,dorse2MarkFx.z, 1.4, 1000, GetEntityHeading(dorse), 0.5)
								while GetDistanceBetweenCoords(playerCoord, dorse2MarkFx.x ,dorse2MarkFx.y,dorse2MarkFx.z, false) > 1.0 do Citizen.Wait(10) playerCoord = GetEntityCoords(playerPed) end
								ClearPedTasks(playerPed)
								Citizen.Wait(50)
								SetEntityHeading(pedID, GetEntityHeading(dorse))
								if v.z < 2 then
									RequestAnimSet( "move_ped_crouched" )	while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do Citizen.Wait( 0 )end 
									SetPedMovementClipset( playerPed, "move_ped_crouched", 0.45 )
									Citizen.Wait(800)	
									DetachEntity(sBalyaOnRmrk.used)	
									goanim = false
								else
									goanim = false
									RequestAnimDict('amb@prop_human_movie_bulb@exit')
									while not HasAnimDictLoaded("amb@prop_human_movie_bulb@exit") do RequestAnimDict("amb@prop_human_movie_bulb@exit");Citizen.Wait(0); end
									TaskPlayAnim(pedID, 'amb@prop_human_movie_bulb@exit', 'exit', 8.0, 8.0, -1, 48, 1, false, false, false)
									Citizen.Wait(100)
									DetachEntity(sBalyaOnRmrk.used)
									local new  = GetOffsetFromEntityInWorldCoords(dorse, v.x, v.y, v.z)
									local ex = GetEntityCoords(sBalyaOnRmrk.used)
									local pltX =  new.x - ex.x
									local pltY =  new.y - ex.y
									local pltZ =  new.z - ex.z
									if pltZ < 0.7 then pltZ = 0.7 end
									local heyding = GetEntityHeading(sBalyaOnRmrk.used)
									local headingekle = (GetEntityHeading(dorse) - heyding) / #balyaAttaching
									for k2,v2 in pairs(balyaAttaching) do Citizen.Wait(20)
										SetEntityCoords(sBalyaOnRmrk.used, ex.x + ((pltX / 100) * v2.x), ex.y + ((pltY / 100) * v2.y), ex.z + ((pltZ / 100) * v2.z), false, false, false, false)
										SetEntityHeading(sBalyaOnRmrk.used, heyding + (headingekle * k2))
									end	
								end
								v.used = sBalyaOnRmrk.used
								AttachEntityToEntity(sBalyaOnRmrk.used, dorse, 0, v.x, v.y , v.z , 0.0, 0.0, 0.0, false, false, true, false, 0, true)
								ResetPedMovementClipset( playerPed, 0.45 )
								table.remove(balyaOnRomorkCoord,#balyaOnRomorkCoord)
								Citizen.Wait(1000)								
								break
							end
						end
					end
				else
					workStage = 4
					DoScreenFadeOut(1000)
					Citizen.Wait(1000)
					SetEntityAsMissionEntity(traktor, false, true) DeleteVehicle(traktor)
					traktor = false
					SetEntityAsMissionEntity(romork, false, true) DeleteVehicle(romork)
					romork = false
					DoScreenFadeIn(1000)
					createBlipforDelivery()
					tirCoord = GetEntityCoords(traktor)
				 	while GetDistanceBetweenCoords(tirCoord,PLT.DeliveryPoints[1].x,PLT.DeliveryPoints[1].y,PLT.DeliveryPoints[1].z,false) > 75.0 and not iptalEdiyorum do Citizen.Wait(25)
						while bekleamk and not iptalEdiyorum do Citizen.Wait(1000) end
						spammingNotify(PLT.U["getdelivery"])
						tirCoord = GetEntityCoords(tir)
						SetNewWaypoint(PLT.DeliveryPoints[1].x,PLT.DeliveryPoints[1].y)
					end
					 Citizen.CreateThread(function()
						for k,v in pairs(PLT.DeliveryPoints) do 
							while GetDistanceBetweenCoords(tirCoord,v,false) > 10  and not iptalEdiyorum do Citizen.Wait(0)
								while bekleamk and not iptalEdiyorum do Citizen.Wait(1000) end
								spammingNotify(PLT.U["followtomarker"],nil,false)
								tirCoord = GetEntityCoords(tir)
								DrawMarker(1, PLT.DeliveryPoints[k].x , PLT.DeliveryPoints[k].y,  PLT.DeliveryPoints[k].z -       1, 0, 0.50, 0, 0.0, 0, 0, 4.5,4.5,1.33, 0, 0,150, 255, true, 0.10, 0, 1, 0, 0.0, 0)
								if PLT.DeliveryPoints[k+1] then 
								DrawMarker(1, PLT.DeliveryPoints[k+1].x , PLT.DeliveryPoints[k+1].y,  PLT.DeliveryPoints[k+1].z - 1, 0, 0.50, 0, 0.0, 0, 0, 2.5,2.5,1.0,  0, 0, 150, 200, 0.0, 0.10, 0, 1, 0, 0.0, 0)
								end
								if PLT.DeliveryPoints[k+2] then 
								DrawMarker(1, PLT.DeliveryPoints[k+2].x , PLT.DeliveryPoints[k+2].y,  PLT.DeliveryPoints[k+2].z - 1, 0, 0.50, 0, 0.0, 0, 0, 1.5,1.5,0.66, 0, 0, 150, 150, 0.0, 0.10, 0, 1, 0, 0.0, 0)
								end
							end
						end
					end)
				end
			end
			while workStage == 4 and not bekleamk and not iptalEdiyorum do Citizen.Wait(0) 
				sBalyaOnDorse = balyaOnDorseCoord[#balyaOnDorseCoord]
				if sBalyaOnDorse then 
					spammingNotify(PLT.U["balefromdorce"],nil,false)
					playerCoord = GetEntityCoords(playerPed)
					dorse4Mark = GetOffsetFromEntityInWorldCoords(dorse, sBalyaOnDorse.offx,sBalyaOnDorse.offy, sBalyaOnDorse.offz)
					balyaSonCoord = GetEntityCoords(sBalyaOnDorse.used)
					playerToBalya = GetDistanceBetweenCoords(dorse4Mark,playerCoord,true)
					DrawMarker(20, dorse4Mark.x ,dorse4Mark.y,dorse4Mark.z + 2, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 0, 0, 250, 255, true, 0.10, 0, 1, 0, 0.0, 0)
					if playerToBalya < 2.0 then Citizen.Wait(500)
						local slmheading = GetHeadingFromVector_2d(balyaSonCoord.x-playerCoord.x,balyaSonCoord.y-playerCoord.y)
						SetEntityHeading(pedID, slmheading) Citizen.Wait(25)	
						RequestAnimDict("missminuteman_1ig_2") while not HasAnimDictLoaded("missminuteman_1ig_2") do Citizen.Wait(0) end
						TaskPlayAnim(pedID, "missminuteman_1ig_2", "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
						Citizen.Wait(444)
						local boneIndex = GetPedBoneIndex(playerPed, 57005)
						AttachEntityToEntity(sBalyaOnDorse.used, playerPed, boneIndex, 0.9, 0.1, -0.75, 0.0, 91.0, 0.0, false, false, false, true, 1, true)
						TaskAchieveHeading(pedID, slmheading - 180, 1000)
						Citizen.Wait(1000)
						StopAnimTask(pedID, 'missminuteman_1ig_2', 'handsup_enter', 1.0)
						Citizen.Wait(400)				
						loadAnimDict('anim@heists@box_carry@')Citizen.Wait(50)
						TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
						DetachEntity(sBalyaOnDorse.used)
						AttachEntityToEntity(sBalyaOnDorse.used, playerPed, boneIndex, 0.75, 0.75, 0.0, 0.0, 0.0, 100.0, false, false, false, true, 1, true)
						local goanim = true
						Citizen.CreateThread(function()
							while goanim do 
								if not IsEntityPlayingAnim(playerPed, "anim@heists@box_carry@", "walk", 3) then 
									loadAnimDict('anim@heists@box_carry@')
									TaskPlayAnim(pedID, "anim@heists@box_carry@", "walk", 1.0, 1.0, -1, 1 | 16 | 32, 0.0, 0, 0, 0)
								end
								Citizen.Wait(0)
							end
							StopAnimTask(pedID, 'anim@heists@box_carry@', 'walk', 1.0)
						end)
						while GetDistanceBetweenCoords(playerCoord, PLT.DeliveryCoords, true) > 2.0 do Citizen.Wait(0) 
							spammingNotify(PLT.U["outbalemark"],nil,false)
							DrawMarker(20, PLT.DeliveryCoords.x ,PLT.DeliveryCoords.y ,PLT.DeliveryCoords.z, 0, 0.50, 0, 0, 0, 0, 1.5,1.5,1.5, 255, 0, 0, 255, true, 0.10, 0, 1, 0, 0.0, 0)
							playerCoord = GetEntityCoords(playerPed) 
						end
						TaskGoStraightToCoord(playerPed, PLT.DeliveryCoords.x ,PLT.DeliveryCoords.y,PLT.DeliveryCoords.z, 1.4, 5000, 0, 0.5)
						while GetDistanceBetweenCoords(playerCoord, PLT.DeliveryCoords.x ,PLT.DeliveryCoords.y ,PLT.DeliveryCoords.z, false) > 1.0 do Citizen.Wait(10) playerCoord = GetEntityCoords(playerPed) end
						ClearPedTasks(playerPed)
						goanim = false
						DeleteObject(sBalyaOnDorse.used)
						ClearPedTasks(pedID)
						table.remove(balyaOnDorseCoord,#balyaOnDorseCoord)
						Citizen.Wait(100)
					end
				else
					RemoveBlip(DeliveryBlip)
					DeliveryBlip = false
					workStage = 5
				end
			end
			while workStage == 5 and not bekleamk and not iptalEdiyorum do Citizen.Wait(0) 
				spammingNotify(PLT.U["movetruckback"])
				tirCoord = GetEntityCoords(tir)
				if GetDistanceBetweenCoords(tirCoord,PLT.VehicleDelete,false) < 30.0 then 
					DrawMarker(6,PLT.VehicleDelete.x,PLT.VehicleDelete.y,PLT.VehicleDelete.z-1,0.0, 0.0, 0.0,-90,-90,-90, 5.0,5.0,5.0,255,0.0,0.0,100,false, true, 2, false, false, false, false) 
					if GetDistanceBetweenCoords(tirCoord,PLT.VehicleDelete,false) < 3 then
						DoScreenFadeOut(1000)
						Citizen.Wait(1000)
						SetEntityAsMissionEntity(tir, false, true) DeleteVehicle(tir)
						tir = false
						SetEntityAsMissionEntity(dorse, false, true) DeleteVehicle(dorse)
						dorse = false
						DoScreenFadeIn(1000)
						Citizen.Wait(250)
						iptalEt()
						TriggerServerEvent('plt_farmer:MissionComplate',PLT.FullPayment)
						break
					end
				else
					SetNewWaypoint(PLT.VehicleDelete.x,PLT.VehicleDelete.y)
				end
			end
		else
			Citizen.Wait(1000)
		end 
	end
end)

Citizen.CreateThread(function()	-- prohibition of getting into occupational vehicles
	local curveh
	local plate 
	while true do Citizen.Wait(500)
		curveh = GetVehiclePedIsTryingToEnter(playerPed)
		if curveh ~= nil and curveh ~= 0 then
			plate = GetVehicleNumberPlateText(curveh)
			if plate:sub(1, 5) == "HRVTR" then 
				if myArea then 
					if plate:sub(1, 6) == "HRVTR"..myArea then
						Citizen.Wait(1000)
					else
						singleNotify('error', PLT.U["not_yours"] ,7500)
						ClearPedTasks(playerPed)
					end
				else
					singleNotify('error', PLT.U["not_yours_cant"] ,7500)
					ClearPedTasks(playerPed)
				end
			else
				Citizen.Wait(2500)
			end
		elseif inAnyVeh then
			Citizen.Wait(2500)
		end
	end
end) 

Citizen.CreateThread(function() -- if too many away from area cancel events
	local min = 300
	local max = 375
	while true do 
		while workStage ~= 0 and not iptalEdiyorum do 
			playerPed = GetPlayerPed(-1)
			playerCoord = GetEntityCoords(playerPed)
			if bicerDover ~= false then 
				playerToBiverdover = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(bicerDover),true)
				if playerToBiverdover > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToBiverdover > min then
					spammingNotify(PLT.U["warning__harvester"])  
				end
			end
			if traktor ~= false then 
				playerToTraktor = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(traktor),true)
				if playerToTraktor > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToTraktor > min then
					spammingNotify(PLT.U["warning__tractor"])  
				end
			end
			if romork ~= false then 
				playerToRomork = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(romork),true)
				if playerToRomork > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToRomork > min then
					spammingNotify(PLT.U["warning__romork"])  
				end
			end
			if tir ~= false then 
				playerToTir = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(tir),true)
				if playerToTir > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToTir > min then
					spammingNotify(PLT.U["warning__tir"])  
				end
			end
			if dorse ~= false then 
				playerToDorse = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(dorse),true)
				if playerToDorse > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToDorse > min then
					spammingNotify(PLT.U["warning__dorce"])  
				end
			end
			for k,v in pairs(arpaTable) do
				playerToArpa = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(v),true)
				if playerToArpa > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToArpa > min then
					spammingNotify(PLT.U["warning__area"])  
				end
			end
			for k,v in pairs(arpaTable) do
				playerToArpa = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(v),true)
				if playerToArpa > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToArpa > min then
					spammingNotify(PLT.U["warning__area"])  
				end
			end
			for k,v in pairs(balyaTable) do
				playerToBalya = GetDistanceBetweenCoords(playerCoord,v.coord,true)
				if playerToBalya > max then 
					if iptalEdiyorum == false then
						singleNotify('error', PLT.U["canceled_area"] ,25000)
						iptalEt()
						break
					end
				elseif playerToBalya > min then
					spammingNotify(PLT.U["warning__area"])  
				end
			end
			Citizen.Wait(1000)
		end
		Citizen.Wait(1000)
	end
end) 

Citizen.CreateThread(function()
	while true do Citizen.Wait(1000)
		if workStage ~= 0 then	
			playerPed = GetPlayerPed(-1)
			playerCoord = GetEntityCoords(playerPed)
			for k,v in pairs(balyaTable) do Citizen.Wait(100)
				if v.objeId ~= false and not iptalEdiyorum then 
					local playerToBalya = GetDistanceBetweenCoords(playerCoord,GetEntityCoords(v.objeId),true)
					if playerToBalya > 75 and not iptalEdiyorum then 
						DeleteEntity(v.objeId)
						TriggerServerEvent("plt_farmer:DeleteEntity",NetworkGetNetworkIdFromEntity(v.objeId))
						v.objeId = false
						Citizen.CreateThread(function()
							while not iptalEdiyorum do Citizen.Wait(1000)
								playerCoord = GetEntityCoords(playerPed)
								local playerToBalya = GetDistanceBetweenCoords(playerCoord,v.coord,true)
								if  playerToBalya < 75 and not iptalEdiyorum then
									local retval =	CreateObject(GetHashKey("prop_haybale_03"), v.coord.x,v.coord.y,v.coord.z - 1, true , false, false)
									TriggerServerEvent("plt_farmer:AddEntity", NetworkGetNetworkIdFromEntity(retval),myArea)
									FreezeEntityPosition(retval,true)
									v.objeId = retval
									createBlipforBale(retval)
									break
								end
							end	
						end)
					end
				end
			end
		else
			Citizen.Wait(2500)
		end
	end
end)


if PLT.HarvesterVehicleWheelEasyMode then 
	local deger = 0
	local ekle = 0.05
	local pltTersteker = false
	Citizen.CreateThread(function()
		while true do Citizen.Wait(1000)
			if canIHarvester then
				if workStage == 1 then
					if (IsPedInVehicle(pedID,bicerDover,false)) then
						pltTersteker = true
					else
						pltTersteker = false
					end	
				elseif 	pltTersteker then 
					pltTersteker = false	
				end
			elseif pltTersteker then
				pltTersteker = false
			else
				Citizen.Wait(2500)
			end
		end
	end)
	Citizen.CreateThread(function()
		while true do Citizen.Wait(0)
			if pltTersteker then
				DisableControlAction(0, 59, true )
				if IsControlPressed( 0, 34 )   then
					deger = deger - ekle
				elseif deger < 0.0 then 
					deger = 0.0
				end

				if IsControlPressed( 0, 30 ) then
					deger = deger + ekle
				elseif deger > 0.0 then 
					deger = 0.0
				end 

				if deger < -1.0 then deger =  -1.0 elseif  deger > 1.0 then  deger = 1.0 end
				SetVehicleSteerBias(bicerDover, deger)
			else
				Citizen.Wait(1000)
			end
		end
	end)
end




RegisterNetEvent('plt_farmer:OpenAvailableAreaMenu')
AddEventHandler('plt_farmer:OpenAvailableAreaMenu', function(info)
	if PLT.UseEsxMenu then 
		local elemanlar = {}
		for k,v in pairs(info) do 
			if v.source == nil then 
			  table.insert(elemanlar, {label = ('[<span style="color:green;"> ') .. PLT.U["area"]..v.number.. ('</span> ]'), value = k})
			else
			  table.insert(elemanlar, {label = ('[<span style="color:red;"> ') ..PLT.U["area"]..v.number.. ('</span> ]'), value = false})
			end
		end
		table.insert(elemanlar, {label = PLT.U["cancel"], value = "iptal"})
	  ESX.UI.Menu.Open('default', "plt_farmer", 'selecet', {
		title    = PLT.U["canable_area"],
		align    = 'top-left',
		elements = elemanlar
	  }, function(data, menu)

		  if data.current.value == 'iptal' then
			  	menu.close()
			  	menuArea = false
		  elseif data.current.value == false then
			  	singleNotify('error', PLT.U["selecet_correct"]  ,10000)
		  else
			  	menu.close()
			  	TriggerServerEvent("plt_farmer:CanISelecetThis", data.current.value)
			  	menuArea = false
		  end
  
	  end, function(data, menu)
		  		menu.close()
			  	menuArea = false
	  end)
	else
		SelectAreaMenu:Close() 
		SelectAreaMenu:ClearItems()
		for k, v in pairs(info) do
			if v.source == nil then 
				SelectAreaMenu:AddButton({ 
					icon = '✔️',
					label = ('<span style="color:green;"> ') .. PLT.U["area"]..v.number.. ('</span> '),
					value = "SAM"..k,
					description = ('<span style="color:green;"> ') .. PLT.U["selectable"]..('</span> '),
					select = function(i) SelectAreaMenu:Close() TriggerServerEvent("plt_farmer:CanISelecetThis", v.number) end 
				})
			else
				SelectAreaMenu:AddButton({ 
					icon = '❌',
					label = ('<span style="color:red;"> ') ..PLT.U["area"]..v.number.. ('</span>'),
					value = "SAM"..k,
					description = ('<span style="color:red;"> ') ..PLT.U["no_selectable"]..('</span>'),
					select = function(i) singleNotify('error', PLT.U["selecet_correct"]  ,10000)end 
				})
			end
		end
		SelectAreaMenu:AddButton({ 
			icon = '⛔',
			label = ('<span style="color:red;"> ') ..PLT.U["cancel"].. ('</span> '),
			value = "cancel",
			description =('<span style="color:red;"> ') ..PLT.U["cancel"].. ('</span> '),
			select = function(i)   SelectAreaMenu:Close() singleNotify('error', PLT.U["canceled"]  ,10000)end 
		})
		MenuV:OpenMenu(SelectAreaMenu)
	end
end)

function openAskMenu()
	if PLT.UseEsxMenu then 
		local elemanlar = {}
		table.insert(elemanlar, {label = ('<span style="color:green;"> ') ..PLT.U["menu_go"].. ('</span> <span style="color:red;"> ') ..PLT.FullPayment.. ('</span>  $'), value = 1})
		table.insert(elemanlar, {label = ('<span style="color:green;"> ') ..PLT.U["menu_finish"].. ('</span> <span style="color:red;"> ') ..PLT.HalfPayment.. ('</span>  $'), value = 2})
	  ESX.UI.Menu.Open('default', "plt_farmer", 'selecet', {
		title    = PLT.U["ask_menu"],
		align    = 'top-left',
		elements = elemanlar
	  }, function(data, menu)

		  if data.current.value == 1 then
			menuAsk = false
			workStage = 3
			menu.close()
			spawnTir()
			
		  elseif data.current.value == 2 then
			menuAsk = false
			  menu.close()
			  iptalEt()
			  TriggerServerEvent('plt_farmer:MissionComplate',PLT.HalfPayment)
		  end
  
	  	end, function(data, menu)
			menuAsk = false
			menu.close()
			iptalEt()
			TriggerServerEvent('plt_farmer:MissionComplate',PLT.HalfPayment) 
	  end)
	else
		AskMenu:Close() 
		Citizen.Wait(1000)
		AskMenu:ClearItems()
		AskMenu:AddButton({ 
			icon = '⛔',
			label = ('<span style="color:green;"> ') ..PLT.U["menu_go"].. ('</span> <span style="color:red;"> ') ..PLT.FullPayment.. ('</span>$'),
			value = "cancel",
			description =('<span style="color:green;"> ') ..PLT.U["menu_go_desc"].. ('</span> <span style="color:red;"> ') ..PLT.FullPayment.. ('</span>$'),
			select = function(i)   
				menuAsk = false
				AskMenu:Close() 
				workStage = 3
				spawnTir()
			end 
		})

		AskMenu:AddButton({ 
			icon = '⛔',
			label = ('<span style="color:green;"> ') ..PLT.U["menu_finish"]..('</span> <span style="color:red;"> ')..PLT.HalfPayment.. ('</span>$'),
			value = "cancel",
			description =('<span style="color:green;"> ') ..PLT.U["menu_finish_desc"]..('</span> <span style="color:red;"> ')..PLT.HalfPayment.. ('</span>$'),
			select = function(i)  
				menuAsk = false 
				AskMenu:Close()
				iptalEt()	
				TriggerServerEvent('plt_farmer:MissionComplate',PLT.HalfPayment)
			end 
		})

		MenuV:OpenMenu(AskMenu)
	end
end

function OpenCloakroomMenu()
	if PLT.UseEsxMenu then 
		ESX.UI.Menu.CloseAll()
		local elements = {
			{ label = PLT.U["citizen_clothe"], value = 'citizen_wear' },
			{ label = PLT.U["work_clothe"], value = 'job_wear' },
			{ label = PLT.U["cancel"], value = 'cancel' },
		}
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom_actions',
			{
				css = 'unknownstory',
				title = PLT.U["gardrope"],
				align = 'top-left',
				elements = elements
			}, function(data, _)
				if data.current.value == 'citizen_wear' then
					WearCitizen()
				elseif data.current.value == 'job_wear' then
					WearJob()
				end
				menuClothe = false
				_.close()
			end, function(_, menu)
				menu.close()
				menuClothe = false
		end)
	else
		ClotheMenu:Close() 
		ClotheMenu:ClearItems()
		ClotheMenu:AddButton({ 
			icon = '👘👖',
			label = ('<span style="color:yellow;"> ') ..PLT.U["citizen_clothe"]..('</span>'),
			value = "cancel",
			description =('<span style="color:yellow;"> ') ..PLT.U["citizen_clothe"].. ('</span>'),
			select = function(i)   
				ClotheMenu:Close() 	
				WearCitizen()
			end 
		})

		ClotheMenu:AddButton({ 
			icon = '👨‍🌾🚜',
			label = ('<span style="color:green;"> ') ..PLT.U["work_clothe"]..('</span>'),
			value = "cancel",
			description = ('<span style="color:green;"> ') ..PLT.U["work_clothe"]..('</span>'),
			select = function(i)  
				ClotheMenu:Close() 			
				WearJob()
			end 
		})

		ClotheMenu:AddButton({ 
			icon = '⛔',
			label = ('<span style="color:red;"> ') ..PLT.U["cancel"].. ('</span> '),
			value = "cancel",
			description =('<span style="color:red;"> ') ..PLT.U["cancel"].. ('</span> '),
			select = function(i)   ClotheMenu:Close() singleNotify('error', PLT.U["canceled"]  ,10000)end 
		})
		MenuV:OpenMenu(ClotheMenu)
	end
end

RegisterNetEvent('plt_farmer:Startjob')
AddEventHandler('plt_farmer:Startjob', function(canIdo)
	if spawnTraktor(canIdo) then 
		workStage = 1
		sayi = 0
		balya = 0
		myArea = canIdo
		spawnHarvesterProp()
	else
		TriggerServerEvent("plt_farmer:CancelWork")
		workStage = 0
		myArea = false
		singleNotify('error', PLT.U["cleararea"],10000)
	end
end)

function refrehPedBlip()
	if DoesEntityExist(npcID) then  DeletePed(npcID)  npcID = false end
	if blipID then RemoveBlip(blipID) bliID = false end
	if workStage ~= 0 then iptalEt()	end
	iptalEdiyorum = true bekleamk = true workStage = nil
	if PLT.jobRequired then 
		if PlayerData.job.name == PLT.jobName then
			canIHarvester = true
			createPedBlip()
		else
			canIHarvester = false
		end
	else
		canIHarvester = true
		createPedBlip()
	end
	Citizen.Wait(1000)
	iptalEdiyorum = false bekleamk = false workStage = 0
end

function createPedBlip()
	local hash = GetHashKey("a_m_m_farmer_01")
	RequestModel(hash) while not HasModelLoaded(hash) do  Wait(1) end
	local ped = CreatePed(2, hash, PLT.PedCoord.x, PLT.PedCoord.y, PLT.PedCoord.z - 1, PLT.PedCoord.w, false, true)
	npcID = ped
	Citizen.Wait(1000)
	SetEntityHeading(ped, PLT.PedCoord.w)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	local blip = AddBlipForEntity(npcID)
	SetBlipSprite (blip, PLT.JobBlipSprite)
	SetBlipColour (blip, PLT.JobBlipColor)
	SetBlipScale  (blip, 0.75)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(PLT.U["Blip_Name"])
	EndTextCommandSetBlipName(blip)
	blipID = blip
	TaskStartScenarioInPlace(npcID, "PROP_HUMAN_PARKING_METER", 0, true)
end


RegisterNetEvent('plt_farmer:SendNotify')
AddEventHandler('plt_farmer:SendNotify', function(type, message, time)
	singleNotify(type, message, time)
end)

RegisterCommand(PLT.CommandFixVehicle, function(source, args, rawCommand)
	if PLT.jobRequired == false or  PlayerData.job.name == PLT.jobName then
		if fixWait == false then  
			if workStage ~= 0 then 
				local vehicle22 = GetVehiclePedIsIn(playerPed, false)
				if vehicle22 == traktor or vehicle22 == tir or vehicle22 == bicerDover then
					fixWait = true
					local vehicle22Coord = GetEntityCoords(vehicle22)
					SetEntityCoords(vehicle22, vehicle22Coord.x + math.random(-3, 3), vehicle22Coord.y + math.random(-3, 3), vehicle22Coord.z + 2, false, false, false, true)
					SetEntityHeading(vehicle22,GetEntityHeading(vehicle22) + 90)
					Citizen.CreateThread(function()
						Citizen.Wait(PLT.CommandFixVehicleWait*1000)
						fixWait = false
					end)
				else
					singleNotify('error', PLT.U["cant_this_veh"] ,10000)
				end
			else
				singleNotify('error', PLT.U["can_workout"] ,10000)
			end
		else
			singleNotify('error', PLT.U["wait_some"] ,10000)
		end
	else
		singleNotify('error', PLT.U["only_farmer"] ,10000)
	end
end,false)

RegisterCommand(PLT.CommandCancelJob, function(source, args, rawCommand)
	if PLT.jobRequired == false or  PlayerData.job.name == PLT.jobName then
		iptalEt()
	else
		singleNotify('error', PLT.U["only_farmer"] ,10000)
	end
end,false)

AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos) 
	if workStage ~= 0 then
		singleNotify('error', PLT.U["cancelfordead"] ,10000)
		iptalEt()
	end
end)


RegisterNetEvent('plt_farmer:SetCancelJob')
AddEventHandler('plt_farmer:SetCancelJob', function()
	if workStage ~= 0 then
		iptalEt()
	end
end)

function WearCitizen()
	if PLT.UseEsxSkin then 
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end) 
	else--shouldbeintegrated If you are using other skin, you should fix it here.
		TriggerServerEvent("qb-clothes:loadPlayerSkin")
	end
end

function WearJob()
	if PLT.UseEsxSkin then 
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, PLT.Uniforms["male"])
			else
				TriggerEvent('skinchanger:loadClothes', skin, PLT.Uniforms["female"])
			end
		end) 
	else --shouldbeintegrated If you are using other skin, you should fix it here.
		local model = GetEntityModel(PlayerPedId())
		if model == 1885233650 then -- boy
			local data = {
			["outfitName"] =  PLT.U["Blip_Name"],
			["outfitData"] = {
				["pants"]       = { item = 106, texture = 19},  -- Pantolon
				["arms"]        = { item = 67, texture = 0},  -- Kollar
				["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
				["vest"]        = { item = 0, texture = 0},  -- Zırh
				["torso2"]      = { item = 9, texture = 11},  -- Gövde
				["shoes"]       = { item = 28, texture = 0},  -- Ayakkabılar
				["decals"]      = { item = 0, texture = 0},  -- Çıkartmalar
				["accessory"]   = { item = 0, texture = 0},  -- Kolye
				["bag"]         = { item = 0, texture = 0},  -- Çanta
				["hat"]         = { item = 148, texture = 0},  -- Şapka
				["glass"]       = { item = 0, texture = 0},  -- Gözlük
				["ear"]         = { item = -1, texture = 0},  -- Kulak Aksesuarı
				["mask"]        = { item = 0, texture = 0},  -- Maske
				["watch"]       = { item = -1, texture = 0},  -- Kulak Aksesuarı
				["bracelet"]    = { item = -1, texture = 0},  -- Maske
				}
			}
			TriggerEvent("qb-clothing:client:loadOutfit",data)
		elseif model == -1667301416 then --- girl
			local data = {
				["outfitName"] = PLT.U["Blip_Name"],
				["outfitData"] = {
					["pants"]       = { item = 119, texture = 19},  -- Pantolon
					["arms"]        = { item = 80, texture = 0},  -- Kollar
					["t-shirt"]     = { item = 17, texture = 0},  -- T Shirt
					["vest"]        = { item = 0, texture = 0},  -- Zırh
					["torso2"]      = { item = 135, texture = 0},  -- Gövde
					["shoes"]       = { item = 104, texture = 2},  -- Ayakkabılar
					["decals"]      = { item = 0, texture = 0},  -- Çıkartmalar
					["accessory"]   = { item = -1, texture = 0},  -- Kolye
					["bag"]         = { item = 0, texture = 0},  -- Çanta
					["hat"]         = { item = -1, texture = 0},  -- Şapka
					["glass"]       = { item = -1, texture = 0},  -- Gözlük
					["ear"]         = { item = -1, texture = 0},  -- Kulak Aksesuarı
					["mask"]        = { item = 0, texture = 0},  -- Maske
					["watch"]       = { item = -1, texture = 0},  -- Kulak Aksesuarı
					["bracelet"]    = { item = -1, texture = 0},  -- Maske
					}
				}
			TriggerEvent("qb-clothing:client:loadOutfit",data)
		end
	end
end

function spammingNotify(msg, thisFrame, beep, duration)
	AddTextEntry('pltHarvesterNotify', msg)
	if thisFrame then
		DisplayHelpTextThisFrame('pltHarvesterNotify', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('pltHarvesterNotify')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end
end

function singleNotify(type, message, time)
	exports['mythic_notify']:DoCustomHudText(type, message, time)
end

function DrawText3Ds(x,y,z, sx, sy, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(sx, sy)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 500
	DrawRect(_x,_y+0.0125, 0.0002+ factor, 0.025, 0, 0, 0, 50)
end

function AddVehiclePlate(vehicle)
	TriggerServerEvent('garage:addKeys', GetVehicleNumberPlateText(vehicle))
	TriggerServerEvent("plateEveryone",GetVehicleNumberPlateText(vehicle))
	TriggerEvent("vehiclekeys:client:SetOwner", string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1'))
	--exports["LegacyFuel"]:SetFuel(SumoCar, 99.9)
end
