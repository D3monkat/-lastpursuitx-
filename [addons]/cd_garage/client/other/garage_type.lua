function GetGarageType(vehicle)
    local hash = GetEntityModel(vehicle)
    local garage_type = 'car'
    if IsThisModelAHeli(hash) or IsThisModelAPlane(hash) then
        garage_type = 'air'
    elseif IsThisModelABoat(hash) or IsThisModelAJetski(hash) or hash == `submersible` or hash == `submersible2` or hash == `avisa` then
        garage_type = 'boat'
    end
    return garage_type
end

RegisterNetEvent('cd_garage:UpdateGarageType')
AddEventHandler('cd_garage:UpdateGarageType', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if IsPedInAnyVehicle(ped, false) then
        TriggerServerEvent('cd_garage:UpdateGarageType', GetGarageType(vehicle), GetAllPlateFormats(vehicle))
    else
        Notif(3, 'get_inside_veh')
    end
end)