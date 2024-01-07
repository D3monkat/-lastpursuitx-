local vehicle = nil
local numgears = nil
local topspeedGTA = nil
local topspeedms = nil
local acc = nil
local hash = nil
local selectedgear = 0
local hbrake = nil
local manualon = false
local incar = false
local currspeedlimit = nil
local ready = false

RegisterNetEvent("hrsgears:SetManualMode", function(data)
    manualon = data
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if manualon then
            local ped = PlayerPedId()
            local newveh = GetVehiclePedIsIn(ped, false)
            local class = GetVehicleClass(newveh)
            if newveh == vehicle then
            elseif newveh == 0 and vehicle ~= nil then
                resetvehicle()
            else
                if GetPedInVehicleSeat(newveh, -1) == ped then
                    if class ~= 13 and class ~= 14 and class ~= 15 and class ~= 16 and class ~= 21 then
                        vehicle = newveh
                        hash = GetEntityModel(newveh)
                        if GetVehicleMod(vehicle, 13) < 0 then
                            numgears = GetVehicleHandlingInt(newveh, "CHandlingData", "nInitialDriveGears")
                        else
                            numgears = GetVehicleHandlingInt(newveh, "CHandlingData", "nInitialDriveGears") + 1
                        end
                        hbrake = GetVehicleHandlingFloat(newveh, "CHandlingData", "fHandBrakeForce")
                        topspeedGTA = GetVehicleHandlingFloat(newveh, "CHandlingData", "fInitialDriveMaxFlatVel")
                        topspeedms = (topspeedGTA * 1.32) / 3.6
                        acc = GetVehicleHandlingFloat(newveh, "CHandlingData", "fInitialDriveForce")
                        --SetVehicleMaxSpeed(newveh,topspeedms)
                        selectedgear = 0
                        Citizen.Wait(50)
                        ready = true
                    end
                end
            end
        end
    end
end)

function resetvehicle()
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", acc)
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", topspeedGTA)
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
    SetVehicleHighGear(vehicle, numgears)
    ModifyVehicleTopSpeed(vehicle, 1)
    --SetVehicleMaxSpeed(vehicle,topspeedms)
    SetVehicleHandbrake(vehicle, false)
    vehicle = nil
    numgears = nil
    topspeedGTA = nil
    topspeedms = nil
    acc = nil
    hash = nil
    hbrake = nil
    selectedgear = 0
    currspeedlimit = nil
    ready = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if manualon == true and vehicle ~= nil then
            DisableControlAction(0, 36, true)
            DisableControlAction(0, 21, true)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if manualon == true and vehicle ~= nil then
            if vehicle ~= nil then
                -- Shift up and down
                if ready == true then
                    if IsDisabledControlJustPressed(0, 21) then
                        if selectedgear <= numgears - 1 then
                            DisableControlAction(0, 71, true)
                            Wait(300)
                            selectedgear = selectedgear + 1
                            DisableControlAction(0, 71, false)
                            SimulateGears()
                        end
                    elseif IsDisabledControlJustPressed(0, 36) then
                        if selectedgear > -1 then
                            DisableControlAction(0, 71, true)
                            Wait(300)
                            selectedgear = selectedgear - 1
                            DisableControlAction(0, 71, false)
                            SimulateGears()
                        end
                    end
                end
            end
        end
    end
end)
function SimulateGears()
    local engineup = GetVehicleMod(vehicle, 11)

    if selectedgear > 0 then
        local ratio
        if Config.vehicles[hash] ~= nil then
            if selectedgear ~= 0 and selectedgear ~= nil then
                if numgears ~= nil and selectedgear ~= nil then
                    ratio = Config.vehicles[hash][numgears][selectedgear] * (1 / 0.9)
                else
                    ratio = Config.gears[numgears][selectedgear] * (1 / 0.9)
                end
            end
        else
            if selectedgear ~= 0 and selectedgear ~= nil then
                if numgears ~= nil and selectedgear ~= nil then
                    ratio = Config.gears[numgears][selectedgear] * (1 / 0.9)
                else

                end
            end
        end

        if ratio ~= nil then
            SetVehicleHighGear(vehicle, 1)
            newacc = ratio * acc
            newtopspeedGTA = topspeedGTA / ratio
            newtopspeedms = topspeedms / ratio

            --if GetEntitySpeed(vehicle) > newtopspeedms then
            --selectedgear = selectedgear + 1
            --else

            SetVehicleHandbrake(vehicle, false)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", newacc)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", newtopspeedGTA)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
            ModifyVehicleTopSpeed(vehicle, 1)
            --SetVehicleMaxSpeed(vehicle,newtopspeedms)
            currspeedlimit = newtopspeedms
            --end
        end
    elseif selectedgear == 0 then
        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", 0.0)
    elseif selectedgear == -1 then
        --if GetEntitySpeedVector(vehicle,true).y > 0.1 then
        --selectedgear = selectedgear + 1
        --else
        SetVehicleHandbrake(vehicle, false)
        SetVehicleHighGear(vehicle, numgears)
        SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", acc)
        SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", topspeedGTA)
        SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
        ModifyVehicleTopSpeed(vehicle, 1)

        --SetVehicleMaxSpeed(vehicle,topspeedms)
        --end
    end
    SetVehicleMod(vehicle, 11, engineup, false)
    TriggerEvent("0r-hud:Client:SetManualGear", getinfo(selectedgear))
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if manualon == true and vehicle ~= nil then
            if selectedgear == -1 then
                if GetVehicleCurrentGear(vehicle) == 1 then
                    DisableControlAction(0, 71, true)
                end
            elseif selectedgear > 0 then
                if GetEntitySpeedVector(vehicle, true).y < 0.0 then
                    DisableControlAction(0, 72, true)
                end
            elseif selectedgear == 0 then
                SetVehicleHandbrake(vehicle, true)
                if IsControlPressed(0, 76) == false then
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                else
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                end
            end
        else
            Citizen.Wait(100)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if vehicle ~= nil and selectedgear ~= 0 then
            local speed = GetEntitySpeed(vehicle)

            if currspeedlimit ~= nil then
                if speed >= currspeedlimit then
                    if Config.enginebrake == true then
                        if speed / currspeedlimit > 1.1 then
                            --print('dead')
                            local hhhh = speed / currspeedlimit
                            SetVehicleCurrentRpm(vehicle, hhhh)
                            SetVehicleCheatPowerIncrease(vehicle, -100.0)
                            --SetVehicleBurnout(vehicle,true)
                        else
                            --SetVehicleBurnout(vehicle,false)
                            SetVehicleCheatPowerIncrease(vehicle, 0.0)
                        end
                    else
                        SetVehicleCheatPowerIncrease(vehicle, 0.0)
                    end


                    --SetVehicleHandbrake(vehicle, true)
                    --if IsControlPressed(0, 76) == false then
                    --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                    -- else
                    --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end
                else
                    --SetVehicleHandbrake(vehicle, false)
                    --if IsControlPressed(0, 76) == false then

                    --else
                    --SetVehicleHandbrake(vehicle, true)
                    --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end
                end
            else
                if speed >= topspeedms then
                    SetVehicleCheatPowerIncrease(vehicle, 0.0)
                    --SetVehicleHandbrake(vehicle, true)
                    --if IsControlPressed(0, 76) == false then
                    --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                    --else
                    --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end
                else
                    --SetVehicleHandbrake(vehicle, false)
                    --if IsControlPressed(0, 76) == false then

                    --else
                    --SetVehicleHandbrake(vehicle, true)
                    --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end
                end
            end
        end
    end
end)

function getinfo(gea)
    if gea == 0 then
        return "N"
    elseif gea == -1 then
        return "R"
    else
        return gea
    end
end
function round(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10 ^ numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end
