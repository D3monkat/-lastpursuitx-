currentZone = nil

RegisterCommand('coords', function()
	print("-----\nCoords: ^5" .. GetEntityCoords(PlayerPedId()) .. GetEntityHeading(PlayerPedId()) .. "^7\n-----\n")
end, false)

-- Main Loop
CreateThread(function()
	AddTextEntry('gn-teleporter', MARKER_NOTIFICATION)

	while true do
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		for name, zone in pairs(ZONES) do

			-- If player within render distance
			if #(playerCoords - zone.coords.xyz) <= zone.renderDistance then
				if not RageUI.Visible(MainMenu) then
					DrawMarker(30, zone.coords.x, zone.coords.y, zone.coords.z - 0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 80, 200, 250, 200, false, true, 2, true, nil, nil, false)
				end

				-- If player within interact distance
				if #(playerCoords - zone.coords.xyz) <= zone.interactDistance then

					if not RageUI.Visible(MainMenu) then
						DisplayHelpTextThisFrame('gn-teleporter')

						if IsControlJustPressed(0, 38) then
							currentZone = ZONES[zone]
							openTeleportMenu(name)
						end
					end
				-- If player not anymore within interact distance
				elseif currentZone == zone and RageUI.Visible(MainMenu) then
					RageUI.Visible(MainMenu, false) -- Force close the menu
					Wait(500)
				end
			end
		end
		Wait(0)
	end
end)

function teleportPlayer(coords)
	if not coords then return end

	DoScreenFadeOut(650)
	while not IsScreenFadedOut() do Wait(0) end

	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped, false)
	FreezeEntityPosition(vehicle > 0 and vehicle or ped, true)

	Wait(500)
	SetPedCoordsKeepVehicle(ped, coords.x + 0.0, coords.y + 0.0, coords.z + 0.0)
	if coords.w then SetEntityHeading(ped, coords.w + 0.0) end

	Wait(1500)
	DoScreenFadeIn(650)
	while not IsScreenFadedIn() do Wait(0) end

	FreezeEntityPosition(vehicle > 0 and DoesEntityExist(vehicle) and vehicle or ped, false)
end