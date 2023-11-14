if Config.Mileage.ENABLE then

    RegisterServerEvent('cd_garage:SaveAllMiles')
    AddEventHandler('cd_garage:SaveAllMiles', function(AdvStatsTableClient)
        for c, d in pairs (AdvStatsTableClient) do
            DatabaseQuery('UPDATE '..FW.vehicle_table..' SET adv_stats=@adv_stats WHERE plate=@plate', {['@adv_stats'] = json.encode(d), ['@plate'] = d.plate})
        end
    end)
    
end
