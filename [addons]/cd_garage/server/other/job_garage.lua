if Config.JobVehicles.ENABLE then

    RegisterServerEvent('cd_garage:SetJobOwnedVehicle')
    AddEventHandler('cd_garage:SetJobOwnedVehicle', function(action, all_plates)
        local _source = source
        local job = GetJob(_source)
        if not job then return end
        if action == 'personal' then
            DatabaseQuery('UPDATE '..FW.vehicle_table..' SET job_personalowned="'..job..'" WHERE plate="'..all_plates.trimmed..'" or plate="'..all_plates.with_spaces..'" or plate="'..all_plates.mixed..'"')

        elseif action == 'society' then
            DatabaseQuery('UPDATE '..FW.vehicle_table..' SET '..FW.vehicle_identifier..'="'..job..'" WHERE plate="'..all_plates.trimmed..'" or plate="'..all_plates.with_spaces..'" or plate="'..all_plates.mixed..'"')
        end
    end)

end



RegisterCommand('cd_garage_jobvehicles', function(source)
    if source == 0 then
        DatabaseQuery('UPDATE owned_vehicles SET impound=0 WHERE impound=1')
        print('^1DO NOT RESTART THE SCRIPT OR RESTART YOUR SERVER!!!!!!^0')
        local Result = DatabaseQuery('SELECT owner, plate FROM owned_vehicles WHERE job_personalowned=1')
        DatabaseQuery('ALTER TABLE owned_vehicles MODIFY COLUMN job_personalowned VARCHAR(50)')
        DatabaseQuery('ALTER TABLE owned_vehicles ALTER job_personalowned SET DEFAULT ""')
        DatabaseQuery('UPDATE owned_vehicles SET job_personalowned="" WHERE job_personalowned="0"')
        for cd = 3, 1, -1 do
            print('^1STARTING IN '..cd..' ^0')
            Wait(1000)
        end
        print('^1CODESIGN JOB VEHICLE CONVERSION STARTING ...^0')
        for cd = 1, #Result do
            local Result_2 = DatabaseQuery('SELECT job FROM users WHERE identifier="'..Result[cd].owner..'"')
            DatabaseQuery('UPDATE owned_vehicles SET job_personalowned="'..Result_2[1].job..'" WHERE owner="'..Result[cd].owner..'" and plate="'..Result[cd].plate..'"')
            print(string.format('^1%s^0/^1%s^0 ^3Identifier:^0%s ^3Plate:^0%s ^3Job:^0%s', cd, #Result, Result[cd].owner, Result[cd].plate, Result_2[1].job))
        end
        print('^2CODESIGN JOB VEHICLE CONVERSION FINISHED!^0')
    end
end)