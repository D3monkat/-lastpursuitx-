function GetMaxHealth(plate)
    if AdvStatsTable and AdvStatsTable[plate] and AdvStatsTable[plate].maxhealth then
        return AdvStatsTable[plate].maxhealth
    else
        return 1000.0
    end
end

function GetAdvStats(plate)
    if AdvStatsTable and AdvStatsTable[plate] then
        return {plate = AdvStatsTable[plate].plate, mileage = AdvStatsTable[plate].mileage, maxhealth = AdvStatsTable[plate].maxhealth}
    else
        local Result = DatabaseQuery('SELECT adv_stats FROM '..FW.vehicle_table..' WHERE plate="'..GetCorrectPlateFormat(plate)..'"')
        if Result and Result[1] and Result[1].adv_stats then
            return json.decode(Result[1].adv_stats)
        end
    end
    return false
end

function GetGarageCount(source, garage_type)
    if garage_type == nil then garage_type = 'car' end
    local Result = DatabaseQuery('SELECT '..FW.vehicle_identifier..' FROM '..FW.vehicle_table..' WHERE '..FW.vehicle_identifier..'="'..GetIdentifier(source)..'" and garage_type="'..garage_type..'"')
    if Result then
        return #Result
    end
    return 0
end

function GetGarageLimit(source)
    if Config.GarageSpace.ENABLE then
        local Result = DatabaseQuery('SELECT garage_limit FROM '..FW.users_table..' WHERE '..FW.users_identifier..'="'..GetIdentifier(source)..'"')
        if Result and Result[1] and Result[1].garage_limit then
            return tonumber(Result[1].garage_limit)
        end
    end
    return 1000
end

function CheckVehicleOwner(source, plate)
    local Result = DatabaseQuery('SELECT '..FW.vehicle_identifier..' FROM '..FW.vehicle_table..' WHERE plate="'..GetCorrectPlateFormat(plate)..'"')
    if Result and Result[1]then
        local data = ConvertData({Result[1].owner, Result[1].citizenid})
        if data then
            if data == GetIdentifier(source) then
                return true
            end
        end
    end
    return false
end