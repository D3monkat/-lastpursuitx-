local QBCore = exports[Config.Core]:GetCoreObject()

local function getReward(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local repAmount = Player.PlayerData.metadata['jobrep'][Config.RepName]

    for k, _ in pairs(Config.RepLevels) do
        if repAmount >= Config.RepLevels[k]['repNeeded'] then
            return Config.RepLevels[k]['reward']
        end
    end
end

local function getMultiplier(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local repAmount = Player.PlayerData.metadata['jobrep'][Config.RepName]

    for k, _ in pairs(Config.RepLevels) do
        if repAmount >= Config.RepLevels[k]['repNeeded'] then
            return Config.RepLevels[k]['reward']
        end
    end
end

function notification(source, title, msg, action)
    if Config.NotificationStyle == 'phone' then
        TriggerClientEvent('qb-phone:client:CustomNotification', source, title, msg, 'fas fa-user', '#b3e0f2', 5000)
    elseif Config.NotificationStyle == 'qbcore' then
        TriggerClientEvent('QBCore:Notify', source, msg, action)
    end
end

function createVehicle(source)
    while not QBCore do Wait(250) end

    local Player = QBCore.Functions.GetPlayer(source)
    local metaData = Player.PlayerData.metadata['jobrep'][Config.RepName] or 0

    local vehicle = {}
    local class = nil
    local chance = math.random(1, 100)

    if chance <= Config.RepLevels['S']['chance'] then
        if metaData >= Config.RepLevels['S']['repNeeded'] then
            class = 'S'
        else
            createVehicle(source)
        end
    elseif chance <= Config.RepLevels['A']['chance'] then
        if metaData >= Config.RepLevels['A']['repNeeded'] then
            class = 'A'
        else
            createVehicle(source)
        end
    elseif chance <= Config.RepLevels['B']['chance'] then
        if metaData >= Config.RepLevels['B']['repNeeded'] then
            class = 'B'
        else
            createVehicle(source)
        end
    elseif chance <= Config.RepLevels['C']['chance'] then
        if metaData >= Config.RepLevels['C']['repNeeded'] then
            class = 'C'
        else
            createVehicle(source)
        end
    else
        class = 'D'
    end

    Wait(0)

    if not class then return createVehicle(source) end

    -- Define what cars you want pulled from your shared here!
    for k, v in pairs(QBCore.Shared.Vehicles) do
        if Config.UseTierVehicles and v[Config.SharedTierName] and v[Config.SharedTierName] == class then
            vehicle[#vehicle + 1] = k
        else
            vehicle[#vehicle + 1] = k
        end
    end
    if vehicle == 0 then return false end
    local index = vehicle[math.random(1, #vehicle)]
    local vehicle = QBCore.Shared.Vehicles[index]['model']
    if Config.Debug then print('Creating Vehicle: '..vehicle) end
    return vehicle
end

function moneyEarnings(source, class, inGroup)
    if not class then class = 'D' or 1 end
    if Config.Debug then print('Vehicle Class: '..class) end
    local Player = QBCore.Functions.GetPlayer(source)

    if Config.PayoutType == 'custom' and not Config.UseTierVehicles then Config.PayoutType = 'standard' end
    local payout = Config.Payout[Config.PayoutType][class]['payout']
    if not payout then payout = Config.BasePay end
    
    if Config.GroupExtraMoney and inGroup then
        local groupExtra = Config.GroupExtraMoney
        payout = payout + (math.ceil(payout * groupExtra))
    end

    -- You can remove this if you want no multiplier!
    if Config.PayoutType == 'custom' and Config.UseTierVehicles then
        local multiplier = Config.RepLevels[class]['multiplier']
        payout = payout + (math.ceil(payout * multiplier))
    end

    Player.Functions.AddMoney('cash', math.ceil(payout))
    TriggerClientEvent('QBCore:Notify', source, Config.Lang['primary'][11]..''..payout)
end

function metaEarnings(source, inGroup)
    local Player = QBCore.Functions.GetPlayer(source)
    local reward = getReward(source)

    if Config.AllowRep then
        local extra = getMultiplier(source)
        reward += extra
    end

    if Config.GroupExtraRep and inGroup then
        local groupExtra = Config.GroupExtraRep
        reward = reward + (math.ceil(reward * groupExtra))
    end

    Player.Functions.AddJobReputation(math.ceil(reward))
    TriggerClientEvent('QBCore:Notify', source, Config.Lang['primary'][12]..' x'..reward..' reputation')
end

-- Queue related

RegisterNetEvent('brazzers-tow:server:depotVehicle', function(plate, class, netID)
    if not plate then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Config.MarkedVehicleOnly then
        local isMarked = isVehicleMarked(netID)
        if not isMarked then return TriggerClientEvent('QBCore:Notify', src, Config.Lang['error'][20], 'error') end
    end

    if DoesEntityExist(NetworkGetEntityFromNetworkId(netID)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(netID))
    end

    if not Config.RenewedPhone then
        -- Reset Blip
        TriggerClientEvent('brazzers-tow:client:leaveQueue', src, false)

        moneyEarnings(src, class)
        
        if not Config.AllowRep then return end
        if Config.RepForMissionsOnly and not isMissionEntity(netID) then return end
        metaEarnings(src)

        if isMissionEntity(netID) then
            if not Config.ReQueue then
                endMission(src, group) -- DEFINE GROUP HERE
                return
            end
            TriggerClientEvent('brazzers-tow:client:reQueueSystem', src)
        end

        return
    end

    local group = exports[Config.Phone]:GetGroupByMembers(src)
    if not group then return end

    local members = exports[Config.Phone]:getGroupMembers(group)
    if not members then return end

    local size = exports[Config.Phone]:getGroupSize(group)
    local inGroup = false

    for i=1, #members do
        if members[i] then
            local groupMembers = QBCore.Functions.GetPlayer(members[i])
            if groupMembers.PlayerData.job.name == Config.Job then
                -- Reset Blip
                TriggerClientEvent('brazzers-tow:client:leaveQueue', members[i], false)

                if size > Config.GroupLimit then
                    TriggerClientEvent('QBCore:Notify', members[i], Config.Lang['error'][21], "error")
                end

                if size <= Config.GroupLimit then
                    if size > 1 then inGroup = true end
                    moneyEarnings(members[i], class, inGroup)
                else
                    if exports[Config.Phone]:isGroupLeader(members[i], group) then
                        moneyEarnings(members[i], class, false)
                    end
                end

                if not Config.AllowRep then 
                    if isMissionEntity(netID) then
                        if not Config.ReQueue then
                            endMission(src, group)
                            return
                        end
                        if exports[Config.Phone]:isGroupLeader(members[i], group) then
                            TriggerClientEvent('brazzers-tow:client:reQueueSystem', members[i])
                        end
                    end
                    return 
                end
                if Config.RepForMissionsOnly and not isMissionEntity(netID) then return end

                if size <= Config.GroupLimit then
                    if size > 1 then inGroup = true end
                    metaEarnings(members[i], inGroup)
                else
                    if exports[Config.Phone]:isGroupLeader(members[i], group) then
                        metaEarnings(members[i], false)
                    end
                end
            end
        end
    end

    if isMissionEntity(netID) then
        if not Config.ReQueue then
            endMission(src, group)
            return
        end

        for i=1, #members do
            if members[i] then
                if exports[Config.Phone]:isGroupLeader(members[i], group) then
                    TriggerClientEvent('brazzers-tow:client:reQueueSystem', members[i])
                end
            end
        end
    end
end)