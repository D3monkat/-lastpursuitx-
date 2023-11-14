function SpawnVehicle(veh)
	Wait(1500)
	if not Vehicle then
		local maxe = GetHashKey(Config.Vehicle[veh].hash)
		RequestModel(maxe)
		while not HasModelLoaded(maxe) do
			Citizen.Wait(0)
		end
		Vehicle = CreateVehicle(maxe, Config.Vehicle[veh].pos.x, Config.Vehicle[veh].pos.y, Config.Vehicle[veh].pos.z, Config.Vehicle[veh].pos.w, true, false)
		local plate = "PSTOP"..tostring(math.random(100, 999))
		Plate = plate
		SetVehicleNumberPlateText(Vehicle, Plate)
		TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
		SetEntityAsMissionEntity(Vehicle, true, true)
		exports['ps-fuel']:SetFuel(Vehicle, 100.0)
		TriggerEvent('vehiclekeys:client:SetOwner', Plate)
		local group = exports["ps-playergroups"]:GetGroupID()
		TriggerServerEvent('sn-postop:server:syncveh', group, plate)
	else
		QBCore.Functions.Notify(Lang:t("error.vehicle"), 'error')
	end
end