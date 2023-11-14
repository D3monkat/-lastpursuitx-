local truckFuelPercentage = PLT.TruckFuelPercentage and PLT.TruckFuelPercentage or 99.9
function SpawnedVehicle(vehicle, needGiveKey, vehicleModelName)
	if needGiveKey then 
		TriggerEvent("vehiclekeys:client:SetOwner", string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1'))
		TriggerServerEvent('garage:addKeys', GetVehicleNumberPlateText(vehicle))
		--TriggerServerEvent("plateEveryone",GetVehicleNumberPlateText(vehicle))
		if vehicleModelName == PLT.Vehicles.forklift or vehicleModelName ==  PLT.Vehicles.telehandler then 
			SetVehicleFuelLevel(vehicle, 99.9) DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
		else -- next line for trucks
			SetVehicleFuelLevel(vehicle, truckFuelPercentage) DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
		end
		--next line vehicle max car mod
		--SetVehicleMod(vehicle, 11, (GetNumVehicleMods(vehicle, tonumber(modType)) - 1), false) SetVehicleMod(vehicle, 12, (GetNumVehicleMods(vehicle, tonumber(modType)) - 1), false) SetVehicleMod(vehicle, 13, (GetNumVehicleMods(vehicle, tonumber(modType)) - 1), false) SetVehicleMod(vehicle, 15, (GetNumVehicleMods(vehicle, tonumber(modType)) - 1), false) SetVehicleMod(vehicle, 16, (GetNumVehicleMods(vehicle, tonumber(modType)) - 1), false) ToggleVehicleMod(vehicle, 18, true)
	end
end
function Notification(type, message, time)
	SendNUIMessage({statu="single", type = type, text = message, duration = time}) 
	--exports['mythic_notify']:DoCustomHudText(type, message, time)
	--exports['okokNotify']:Alert("Lumberjack", message, time, type)
	--TriggerEvent('okokNotify:Alert', "Lumberjack", message, time, type)
	--TriggerEvent('QBCore:Notify', message, type, time)
end
function permenantNotification(msg, thisFrame, beep, duration)
	permenantNotificationText = msg 
	--[[ 	AddTextEntry('pltLumberjackNotify', msg)
	if thisFrame then
		DisplayHelpTextThisFrame('pltLumberjackNotify', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('pltLumberjackNotify')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end ]]
end
RegisterNetEvent('plt_lumberjack:SendNotify')
AddEventHandler('plt_lumberjack:SendNotify', function(type, message, time)
	Notification(type, message, time)
end)
Citizen.CreateThread(function()
	local ActiveText 
	while true do Citizen.Wait(250)
		if permenantNotificationText and ActiveText ~= permenantNotificationText then  SendNUIMessage({statu = "persist",text = permenantNotificationText})  ActiveText = permenantNotificationText Citizen.Wait(1000) end
		if permenantNotificationText == false or permenantNotificationText == "close" then permenantNotificationText = false else permenantNotificationText = "close" end
	end
end)
function CreateNetworkVehicle(modelName, x, y, z, heading)
	local newVehicle = CreateVehicle(LoadVehicle(modelName), x, y, z, heading, true, false)
	local newVehicleNetId = NetworkGetNetworkIdFromEntity(newVehicle)
	SetNetworkIdCanMigrate(newVehicleNetId, false)
	TriggerServerEvent("plt_lumberjack:AddEntity", newVehicleNetId)
	SetEntityAsMissionEntity(newVehicle, true, false)
	SetVehicleHasBeenOwnedByPlayer(newVehicle, true)
	SetVehicleNeedsToBeHotwired(newVehicle, false)
	SetModelAsNoLongerNeeded(model)
	SetVehRadioStation(newVehicle, 'OFF')
	RequestCollisionAtCoord(x,y,z) if not HasCollisionLoadedAroundEntity(newVehicle) then SetEntityCoords(playerPedId, x, y, z) Citizen.Wait(1000) end
	return newVehicle
end
function CreateLocalVehicle(modelName, x, y, z, heading)
	return CreateVehicle(LoadVehicle(modelName), x, y, z, heading, false, false)
end
function CreateNetworkObject(modelName, x, y, z)
	local newObject = CreateObject(LoadModel(modelName), x, y, z, true, true, false)
	local newObjectNetId = NetworkGetNetworkIdFromEntity(newObject)
	SetNetworkIdCanMigrate(newObjectNetId, false)
	TriggerServerEvent("plt_lumberjack:AddEntity", newObjectNetId)
	return newObject
end
function CreateLocalObject(modelName, x, y, z)
	return CreateObject(LoadModel(modelName), x, y, z, false, false, false)
end
function DeleteNetworkEntity(entity)
	local willDeletedEntity = entity
	if willDeletedEntity and DoesEntityExist(willDeletedEntity) then
		DeleteEntity(willDeletedEntity)
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			if DoesEntityExist(willDeletedEntity) then
				TriggerServerEvent("plt_lumberjack:DeleteEntity",NetworkGetNetworkIdFromEntity(willDeletedEntity))
			end
		end)
	end
end
function SetNetworkVehicleExtra(vehicle, extraId, disable)
	--SetVehicleAutoRepairDisabled(vehicle, false) -- if the pallet of lumber on the forklift and logs on the telehandler are not active, try to activate this line
	--SetVehicleFixed(vehicle) -- If you activate the above line but it didn't work, activate this line as well.
	SetVehicleExtra(vehicle, extraId, disable)
end
function SetLocalVehicleExtra(vehicle, extraId, disable)
	SetVehicleExtra(vehicle, extraId, disable)
end