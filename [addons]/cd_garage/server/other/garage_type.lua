RegisterServerEvent('cd_garage:UpdateGarageType')
AddEventHandler('cd_garage:UpdateGarageType', function(garage_type, all_plates)
    if garage_type == 'car' or garage_type == 'boat' or garage_type == 'air' then
        local default_garage_id
        for c, d in ipairs(Config.Locations) do
            if d.Type == garage_type then
                default_garage_id = d.Garage_ID
                break
            end
        end
        DatabaseQuery('UPDATE '..FW.vehicle_table..' SET garage_type="'..garage_type..'", garage_id="'..default_garage_id..'" WHERE plate="'..all_plates.trimmed..'" or plate="'..all_plates.with_spaces..'" or plate="'..all_plates.mixed..'"')
    else
        print('cd_garage:UpdateGarageType - Invalid garage_type: '..garage_type)
    end
end)