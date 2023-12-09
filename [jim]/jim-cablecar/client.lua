CreateThread(function()
    -- Load the things we need
    loadModel("p_cablecar_s")
    loadModel("p_cablecar_s_door_l")
    loadModel("p_cablecar_s_door_r")
    loadModel("p_cablecar_s")

    RequestScriptAudioBank("CABLE_CAR", false, -1)
    RequestScriptAudioBank("CABLE_CAR_SOUNDS", false, -1)
    LoadStream("CABLE_CAR", "CABLE_CAR_SOUNDS")
    LoadStream("CABLE_CAR_SOUNDS", "CABLE_CAR")

    -- Spawn all them entities and attach the doors to the cars
    for i = 0, 1 do
        if i == 0 then
            CABLE_CARS[i].entity = makeProp({prop = "p_cablecar_s", coords = vec4(-740.911, 5599.341, 47.25, 90.0)}, true, true)
            CABLE_CARS[i].cam = createTempCam(CABLE_CARS[i].entity, PlayerPedId())
        else
            CABLE_CARS[i].entity = makeProp({prop = "p_cablecar_s", coords = vec4(446.291, 5566.377, 786.75, 270.0)}, true, true)
            CABLE_CARS[i].cam = createTempCam(CABLE_CARS[i].entity, PlayerPedId())
        end
        CABLE_CARS[i].doorLL = makeProp({prop = "p_cablecar_s_door_l", coords = vec4(-740.911, 5599.341, 47.25, 0.0)}, false, true)
        CABLE_CARS[i].doorLR = makeProp({prop = "p_cablecar_s_door_r", coords = vec4(-740.911, 5599.341, 47.25, 0.0)}, false, true)
        AttachEntityToEntity(CABLE_CARS[i].doorLL, CABLE_CARS[i].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
        AttachEntityToEntity(CABLE_CARS[i].doorLR, CABLE_CARS[i].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
        CABLE_CARS[i].doorRL = makeProp({prop = "p_cablecar_s_door_l", coords = vec4(-740.911, 5599.341, 47.25, 0.0)}, false, true)
        CABLE_CARS[i].doorRR = makeProp({prop = "p_cablecar_s_door_r", coords = vec4(-740.911, 5599.341, 47.25, 0.0)}, false, true)
        AttachEntityToEntity(CABLE_CARS[i].doorRL, CABLE_CARS[i].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
        AttachEntityToEntity(CABLE_CARS[i].doorRR, CABLE_CARS[i].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)

        --CABLE_CARS[i].seat1 = makeProp({prop = "v_ilev_ph_bench", coords = vec4(-740.911, 5599.341, 47.25, 0.0)}, false, true)
        --AttachEntityToEntity(CABLE_CARS[i].seat1, CABLE_CARS[i].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)

        CABLE_CARS[i].state = "MOVE_TO_IDLE_TOP"
        if true then
            local TramBlip1 = AddBlipForEntity(CABLE_CARS[i].entity)
            SetBlipSprite (TramBlip1, 36)
            SetBlipDisplay(TramBlip1, 4)
            SetBlipScale  (TramBlip1, 0.8)
            SetBlipColour (TramBlip1, 3)
            SetBlipAsShortRange(TramBlip1, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Pala Springs Tramway")
            EndTextCommandSetBlipName(TramBlip1)
        end

        CreateThread(function()
            local ped = PlayerPedId()
            for p = 1, 2 do
                local inZone = false
                local zone = PolyZone:Create(CABLE_CARS[i].zones[p].poly, { name = "zone"..i..p, debugPoly = false })
                zone:onPlayerInOut(function(isPointInside)
                    inZone = isPointInside
                    CreateThread(function()
                        while inZone do
                            if not CABLE_CARS[i].moving and #(GetEntityCoords(ped) - CABLE_CARS[i].position) <= 6.0 then
                                if CABLE_CARS[i].is_player_seated == false then
                                    exports["qb-core"]:DrawText("Press E to Enter", 'left')
                                    if IsControlJustPressed(0, 38) then
                                        FreezeEntityPosition(ped, true)
                                        AttachEntityToEntity(ped, CABLE_CARS[i].entity, 0, (GetEntityCoords(ped) - CABLE_CARS[i].position), GetEntityRotation(ped, 0), 0, 0, 0, 1, 0, 0)
                                        CABLE_CARS[i].is_player_seated = true
                                    end
                                elseif CABLE_CARS[i].is_player_seated == true then
                                    exports["qb-core"]:DrawText("Press E to Exit", 'left')
                                    if IsControlJustPressed(0, 38) then
                                        FreezeEntityPosition(ped, false)
                                        DetachEntity(ped, 0, 0)
                                        CABLE_CARS[i].is_player_seated = false
                                    end
                                end
                            else exports["qb-core"]:HideText() end
                            Wait(5)
                        end
                        exports["qb-core"]:HideText()
                    end)
                end)

            end
            local wait = 25
            while true do
                if CABLE_CARS[i].state == "IDLE_BOTTOM" or CABLE_CARS[i].state == "IDLE_TOP" then wait = 0 else wait = 20 end
                UpdateCablecarMovement(CABLE_CARS[i])
                Wait(wait)
            end
        end)
    end
end)

RegisterNetEvent("omni:cablecar:forceState", function(index, state)
    local cablecar = CABLE_CARS[index]
    if state == "IDLE_BOTTOM" then
        cablecar.state = "MOVE_TO_IDLE_BOTTOM"
        cablecar.run_timer = 0.0
    end
    if state == "IDLE_TOP" then
        cablecar.state = "MOVE_TO_IDLE_TOP"
        cablecar.run_timer = 0.0
    end
    if state == "MOVE_DOWN" then
        cablecar.state = "IDLE_TO_MOVE_DOWN"
        cablecar.gradient = #TRACKS[index]
        cablecar.gradient_distance = 0.0
        cablecar.run_timer = 0.0
    end
    if state == "MOVE_UP" then
        cablecar.state = "IDLE_TO_MOVE_UP"
        cablecar.gradient = 1
        cablecar.gradient_distance = 0.0
        cablecar.run_timer = 0.0
    end
end)

AddEventHandler("onResourceStop", function(r) if GetCurrentResourceName() ~= r then return end
    for i = 0, 1 do
        if CABLE_CARS[i].is_player_seated then
            KickPlayerOutOfMyCablecar(CABLE_CARS[i])
        end
        DeleteEntity(CABLE_CARS[i].entity)
        DeleteEntity(CABLE_CARS[i].doorLL)
        DeleteEntity(CABLE_CARS[i].doorLR)
        DeleteEntity(CABLE_CARS[i].doorRL)
        DeleteEntity(CABLE_CARS[i].doorRR)
    end
end)

-- Control the movements of a car
function UpdateCablecarMovement(cablecar)

    if cablecar.state == "MOVE_UP" then
        cablecar.direction = 1.0 -- Assign a directional value used to determine the moving direction of the car

        -- Get the previous node and the next node (basically the two points of the track on each side of us)
        local _prev, _next = TRACKS[cablecar.index][cablecar.gradient], TRACKS[cablecar.index][cablecar.gradient + 1]

        -- Initialize the segment distance if there is none already
        cablecar.gradient_distance = cablecar.gradient_distance == 0.0 and #(_prev - _next) or cablecar.gradient_distance

        -- Calculate the speed we want to move between segments
        local speed = ((1.0 / cablecar.gradient_distance) * Timestep()) * cablecar.speed
		local distanceFromOrigin = #(TRACKS[cablecar.index][#TRACKS[cablecar.index]] - cablecar.position)
		local distanceFromDestin = #(TRACKS[cablecar.index][1] - cablecar.position)
		if distanceFromOrigin <= cablecar.maxSpeedDistance then speed = speed * math.abs(distanceFromOrigin + 1)/cablecar.maxSpeedDistance
		elseif distanceFromDestin <= cablecar.maxSpeedDistance then speed = speed * math.abs(distanceFromDestin + 1)/cablecar.maxSpeedDistance end

        -- Add the speed to the timer
        cablecar.run_timer += speed

        -- Check if we've reached the end of the segment
        if cablecar.run_timer > 1.0 then
            cablecar.gradient += 1 -- Add one to the current node index we're at
            -- Get the next set of nodes
            _prev, _next = TRACKS[cablecar.index][cablecar.gradient], TRACKS[cablecar.index][cablecar.gradient + 1]
            cablecar.gradient_distance = GetDistanceBetweenCoords(_prev, _next, true)
            cablecar.run_timer = 0.0
            -- Check if we've reached the top
            if cablecar.gradient >= #TRACKS[cablecar.index] then cablecar.state = "MOVE_TO_IDLE_TOP" cablecar.gradient_distance = 0.0 return end
            -- Update the cars hook angle
            UpdateCablecarGradient(cablecar)
        else
            -- Update the position of the car
            cablecar.position = VecLerp(_prev.x, _prev.y, _prev.z, _next.x, _next.y, _next.z, cablecar.run_timer, true)
        end

        -- Add a bit of "hang" on the long segments since the cable sags slightly (ATTENTION TO DETAIL!! xd)
        local zLerp = 0.0
        if cablecar.gradient_distance > 30.0 then zLerp = (-1.0 + math.abs(Lerp(1.0, -1.0, cablecar.run_timer))) * 0.25 end

        -- Set the position of the car
        SetEntityCoords(cablecar.entity, cablecar.position + cablecar.offset + vec3(0.0, 0.0, zLerp), 1, false, 0, 1)
        cablecar.moving = true
    elseif cablecar.state == "MOVE_DOWN" then

        -- Assign a directional value used to determine the moving direction of the car
        cablecar.direction = -1.0

        -- Get the previous node and the next node (basically the two points of the track on each side of us)
        local _prev, _next = TRACKS[cablecar.index][cablecar.gradient], TRACKS[cablecar.index][cablecar.gradient - 1]

        -- Initialize the segment distance if there is none already
        cablecar.gradient_distance = cablecar.gradient_distance == 0.0 and #(_prev - _next) or cablecar.gradient_distance

        -- Calculate the speed we want to move between segments
        local speed = ((1.0 / cablecar.gradient_distance) * Timestep()) * cablecar.speed

		local distanceFromOrigin = #(TRACKS[cablecar.index][#TRACKS[cablecar.index]] - cablecar.position)
		local distanceFromDestin = #(TRACKS[cablecar.index][1] - cablecar.position)
		if distanceFromOrigin <= cablecar.maxSpeedDistance then speed = speed * math.abs(distanceFromOrigin + 1)/cablecar.maxSpeedDistance
		elseif distanceFromDestin <= cablecar.maxSpeedDistance then speed = speed * math.abs(distanceFromDestin + 1)/cablecar.maxSpeedDistance end

        -- Add the speed to the timer
        cablecar.run_timer += speed

        -- Check if we've reached the end of the segment
        if cablecar.run_timer > 1.0 then
            -- Take one from the current node index we're at, since we're going backwards
            cablecar.gradient -= 1

            -- Get the next set of nodes
            _prev, _next = TRACKS[cablecar.index][cablecar.gradient], TRACKS[cablecar.index][cablecar.gradient - 1]
            cablecar.gradient_distance = GetDistanceBetweenCoords(_prev, _next, true)
            cablecar.run_timer = 0.0

            -- Check if we've reached the bottom again
            if cablecar.gradient <= 1 then
                -- Set to raw idle to do nothing and ask the server to sync cars
                cablecar.state = "IDLE"
                cablecar.gradient_distance = 0.0
                TriggerServerEvent("omni:cablecar:host:sync", cablecar.index, "IDLE_BOTTOM")
                return
            end

            -- Update the cars hook angle
            UpdateCablecarGradient(cablecar)
        else
            cablecar.position = VecLerp(_prev.x, _prev.y, _prev.z, _next.x, _next.y, _next.z, cablecar.run_timer, true)
        end

        -- Add a bit of "hang" on the long segments since the cable sags slightly (ATTENTION TO DETAIL!! xd)
        local zLerp = 0.0
        if cablecar.gradient_distance > 20.0 then zLerp = (-1.0 + math.abs(Lerp(1.0, -1.0, cablecar.run_timer))) * 0.25 end

        -- Set the position of the car
        SetEntityCoords(cablecar.entity, cablecar.position + cablecar.offset + vec3(0.0, 0.0, zLerp), 1, false, 0, 1)
        cablecar.moving = true

    elseif cablecar.state == "IDLE_TO_MOVE_UP" then

        cablecar.gradient = 1
        cablecar.gradient_distance = 0.0
        cablecar.run_timer = 0.0

        if cablecar.is_player_seated then
            -- add scenic camera
        else
            CheckIfPlayerShouldBeKickedOut(cablecar)
        end

        -- Close doors
        SetCablecarDoors(cablecar, false)

        cablecar.audio = GetSoundId()
        PlaySoundFromEntity(cablecar.audio, "Running", cablecar.entity, "CABLE_CAR_SOUNDS", 0, 0)

        cablecar.state = "MOVE_UP"

    elseif cablecar.state == "IDLE_TO_MOVE_DOWN" then

        cablecar.gradient = #TRACKS[cablecar.index]
        cablecar.gradient_distance = 0.0
        cablecar.run_timer = 0.0

        if cablecar.is_player_seated then
            -- add scenic camera
        else
            CheckIfPlayerShouldBeKickedOut(cablecar)
        end

        -- Close doors
        SetCablecarDoors(cablecar, false)

        cablecar.audio = GetSoundId()
        PlaySoundFromEntity(cablecar.audio, "Running", cablecar.entity, "CABLE_CAR_SOUNDS", 0, 0)

        cablecar.state = "MOVE_DOWN"

    elseif cablecar.state == "MOVE_TO_IDLE_TOP" then

        cablecar.position = TRACKS[cablecar.index][#TRACKS[cablecar.index]]
        SetEntityCoords(cablecar.entity, cablecar.position + cablecar.offset + vec3(0.0, 0.0, 0.0), 1, false, 0, 1)

        if cablecar.is_player_seated then
            -- kick player out
            -- KickPlayerOutOfMyCablecar(cablecar)
            -- cablecar.is_player_seated = false
        end

        -- Open doors
        SetCablecarDoors(cablecar, true)

        ReleaseRunningSound(cablecar)

        cablecar.state = "IDLE_TOP"
        cablecar.run_timer = 0.0

    elseif cablecar.state == "MOVE_TO_IDLE_BOTTOM" then

        cablecar.position = TRACKS[cablecar.index][1]
        SetEntityCoords(cablecar.entity, cablecar.position + cablecar.offset + vec3(0.0, 0.0, 0.0), 1, false, 0, 1)

        if cablecar.is_player_seated then
            -- kick player out
            -- KickPlayerOutOfMyCablecar(cablecar)
            -- cablecar.is_player_seated = false
        end

        -- Open doors
        SetCablecarDoors(cablecar, true)

        ReleaseRunningSound(cablecar)

        cablecar.state = "IDLE_BOTTOM"
        cablecar.run_timer = 0.0

    elseif cablecar.state == "IDLE_TOP" then

        -- Idle state for idling at the top station

        -- Wait 10 seconds (if that's even how it works lmao)
        cablecar.run_timer = cablecar.run_timer + (Timestep() / 20.0)

        -- If the time is up we start moving down
        if cablecar.run_timer > 1.0 then
            cablecar.state = "IDLE_TO_MOVE_DOWN"
            cablecar.run_timer = 0.0
        end
        cablecar.moving = false

    elseif cablecar.state == "IDLE_BOTTOM" then

        -- Idle state for idling at the bottom station

        -- Wait 10 seconds (if that's even how it works lmao)
        cablecar.run_timer = cablecar.run_timer + (Timestep() / 20.0)

        -- If the time is up we start moving up
        if cablecar.run_timer > 1.0 then
            cablecar.state = "IDLE_TO_MOVE_UP"
            cablecar.run_timer = 0.0
        end

        cablecar.moving = false

    elseif cablecar.state == "IDLE" then

        -- Just a default state, it does absolutely fuck all
        -- Used to halt movement until host and server sync is done

    end
end


function ReleaseRunningSound(cablecar)
    if cablecar.audio ~= -1 and cablecar.audio ~= nil then
        StopSound(cablecar.audio)
        ReleaseSoundId(cablecar.audio)
        cablecar.audio = -1
    end
end

function CheckIfPlayerShouldBeKickedOut(cablecar)
    local ply = PlayerPedId()
    local pos = cablecar.position + vec3(0.0, 0.0, -5.3)
    local plypos = GetEntityCoords(ply, true)
    local dist = #(pos - plypos)
    if dist < 3.0 then
        KickPlayerOutOfMyCablecar(cablecar)
    end
end

function KickPlayerOutOfMyCablecar(cablecar)
    local ply = PlayerPedId()
    cablecar.is_player_seated = false
    FreezeEntityPosition(ply, false)
    DetachEntity(ply, 0, 0)
    local _, rightvec, _ = GetEntityMatrix(cablecar.entity)
    local right = vec3(rightvec.x * 3.5, rightvec.y * 3.5, rightvec.z * 3.5)
    SetEntityCoords(ply, cablecar.position + right + vec3(0.0, 0.0, -5.3), xAxis, yAxis, zAxis, clearArea)
end


function SetCablecarDoors(cablecar, state)
    local doorClosePos = 0.95
	local doorOpenDist = 0.9
    if state == true then
        doorStart = doorClosePos
		doorDirect = 1
        PlaySoundFromEntity(-1, "Arrive_Station", cablecar.entity, "CABLE_CAR_SOUNDS", 0, 0)
        PlaySoundFromEntity(-1, "DOOR_OPEN", cablecar.entity, "CABLE_CAR_SOUNDS", 0, 0)
    else
        doorStart = doorClosePos + doorOpenDist
		doorDirect = -1
        PlaySoundFromEntity(-1, "Leave_Station", cablecar.entity, "CABLE_CAR_SOUNDS", 0, 0)
        PlaySoundFromEntity(-1, "DOOR_CLOSE", cablecar.entity, "CABLE_CAR_SOUNDS", 0, 0)
    end

	for i = 0, 100, 1 do
		local doorPos = doorStart + doorDirect * doorOpenDist * (i / 100)
		DetachEntity(cablecar.doorLL, 0, 0)
		DetachEntity(cablecar.doorLR, 0, 0)
		DetachEntity(cablecar.doorRL, 0, 0)
		DetachEntity(cablecar.doorRR, 0, 0)
		AttachEntityToEntity(cablecar.doorLL, cablecar.entity, 0, 0.0, -doorPos, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
		AttachEntityToEntity(cablecar.doorLR, cablecar.entity, 0, 0.0, doorPos, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
		AttachEntityToEntity(cablecar.doorRL, cablecar.entity, 0, 0.0, doorPos, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
		AttachEntityToEntity(cablecar.doorRR, cablecar.entity, 0, 0.0, -doorPos, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
		Wait(10)
	end
	Wait(2000)
end

-- Check what direction the specific car is going
function WhatDirectionDoesMyCablecarGo(cablecar)
    if cablecar.index == 0 then
        cablecar.direction = cablecar.direction >= 0 and 0 or 1
    else
        cablecar.direction = cablecar.direction >= 0 and 1 or 0
        -- since they start on opposing ends, the right car is reversed and treats up as down and down as up
    end
end

-- Set the hook angle using magical anims, doesn't work properly backwards but eh whatever
function UpdateCablecarGradient(cablecar)
    local text = "C" .. (cablecar.index + 1)
    if WhatDirectionDoesMyCablecarGo(cablecar) == 0 then
        local _data = {
            [0] = "_up_9",
            [1] = "_up_1",
            [3] = "_up_3",
            [5] = "_up_4",
            [7] = "_up_5",
            [9] = "_up_6",
            [11] = "_up_8",
            [12] = "_up_9",
        }
        if _data[cablecar.gradient - 1] then
            text = text .. _data[cablecar.gradient - 1]
        else
            return 0
        end
    else
        local _data = {
            [0] = "_down_1",
            [1] = "_down_2",
            [3] = "_down_3",
            [5] = "_down_4",
            [7] = "_down_5",
            [9] = "_down_6",
            [11] = "_down_8",
            [12] = "_down_9",
        }
        if _data[cablecar.gradient - 1] then
            text = text .. _data[cablecar.gradient - 1]
        else
            return 0
        end
    end
    --PlayEntityAnim(cablecar.entity, text, "p_cablecar_s", 8.0, false, 1, 0, 0, 0)
    return 1
end
