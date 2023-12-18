function Utils.Functions:CustomFuelExport()
    --[[
        for example:
        return ESX.Math.Round(GetVehicleFuelLevel(HUD.Data.Vehicle), 2)
    ]]
    --
    exports['cdn-fuel']:GetFuel(vehicle)
    -- return false
end

local function SetVehicleCruiseControlState(state)
    Koci.Client.HUD.data.vehicle.cruiseControlStatus = state
end
local function SetVehicleSeatbeltState(state)
    Koci.Client.HUD.data.vehicle.isSeatbeltOn = state
end

function Utils.Functions:GetPedVehicleSeat(ped, vehicle)
    for i = -1, 16 do
        if (GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -1
end

exports("CruiseControlState", function(...)
    SetVehicleCruiseControlState(...)
end)
exports("SeatbeltState", function(...)
    SetVehicleSeatbeltState(...)
end)
