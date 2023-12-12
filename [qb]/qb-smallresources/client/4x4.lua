local fourwheelsc = true -- Default to 4x4 off

-- Vehicle class identifiers
local SUVClass = 2
local OffRoadClass = 9
local VanClass = 12
local Class8 = 18

RegisterCommand("4x4", function(source, args, rawCommand)
    Toggle4x4Mode()
end)

function IsSUVOrVanOrOffroad(vehicle)
    local vehicleClass = GetVehicleClass(vehicle)
    return vehicleClass == SUVClass or vehicleClass == OffRoadClass or vehicleClass == VanClass or vehicleClass == Class8
end

function Toggle4x4Mode()
    local playerPed = PlayerPedId()
    local playerCar = GetVehiclePedIsIn(playerPed, false)
    local veh = GetVehiclePedIsIn(playerPed)

    if IsSUVOrVanOrOffroad(veh) then
        if IsPedSittingInAnyVehicle(playerPed) then
            if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then
                fourwheelsc = not fourwheelsc
                if fourwheelsc then
                    Apply4x4Effects(veh)
                    TriggerEvent("chatMessage", "^2[Info]^7 4x4 mode is ^2ON^7")
                else
                    Apply2WDEffects(veh)
                    TriggerEvent("chatMessage", "^2[Info]^7 4x4 mode is ^1OFF^7")
                end
            end
        end
    else
        TriggerEvent("chatMessage", "^1[Error]^7 This vehicle is not an SUV, van, or off-road vehicle")
    end
end

function Apply2WDEffects(vehicle)
    local newHandling = 0.000000 -- All power to rear wheels
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fDriveBiasFront', newHandling)
    
    local defaultAcceleration = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fInitialDriveForce', defaultAcceleration)
    
    local defaultTopSpeed = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel')
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel', defaultTopSpeed)
    
    local defaultEnginePower = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEnginePowerMultiplier')
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fEnginePowerMultiplier', defaultEnginePower)
    
    -- You can reset any other effects here
end

function Apply4x4Effects(vehicle)
    local newHandling = 0.400000
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fDriveBiasFront', newHandling)
    
    local newAcceleration = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce') * 1.5
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fInitialDriveForce', newAcceleration)
    
    -- Adjust top speed (not a perfect representation of power boost, but similar)
    local newMaxSpeed = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel') * 1.2
    SetVehicleHandlingField(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel', newMaxSpeed)
end

-- Automatically apply 4x4 mode effects when entering a suitable vehicle
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Adjust the interval as needed
        local playerPed = PlayerPedId()
        local veh = GetVehiclePedIsIn(playerPed, false)
        if IsSUVOrVanOrOffroad(veh) then
            if IsPedSittingInAnyVehicle(playerPed) then
                if fourwheelsc then
                    Apply4x4Effects(veh)
                else
                    Apply2WDEffects(veh)
                end
            end
        end
    end
end)
