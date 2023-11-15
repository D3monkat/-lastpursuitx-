--- Functions

--- Generates a random contract tier based on the players current boosting class and probabilities
---@param boostingClass string - Current class of the player
---@return tier string - Tier for contract
generateTier = function(boostingClass)
    local random = math.random(100)

    if boostingClass == 1 then -- D
        return 1
    elseif boostingClass == 2 then -- D or C
        if random <= 50 then
            return 1
        else
            return 2
        end
    elseif boostingClass == 3 then -- D, C or B
        if random <= 33 then
            return 1
        elseif random > 33 and random <= 67 then
            return 2
        else
            return 3
        end
    elseif boostingClass == 4 then -- D, C, B or A
        if random <= 25 then
            return 1
        elseif random > 25 and random <= 50 then
            return 2
        elseif random > 50 and random <= 75 then
            return 3
        else
            return 4
        end
    elseif boostingClass == 5 then -- D, C, B, A or S
        if random <= 20 then
            return 1
        elseif random > 20 and random <= 40 then
            return 2
        elseif random > 40 and random <= 60 then
            return 3
        elseif random > 60 and random <= 80 then
            return 4
        else
            return 5
        end
    elseif boostingClass == 6 then -- D, C, B, A, S or S+
        if random <= 18 then
            return 1
        elseif random > 18 and random <= 36 then
            return 2
        elseif random > 36 and random <= 54 then
            return 3
        elseif random > 54 and random <= 72 then
            return 4
        elseif random > 72 and random <= 90 then
            return 5
        elseif random > 90 then
            return 6
        end
    end
end

--- Events

RegisterNetEvent(Shared.Resource .. ':server:SendLocation', function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(source))
    local state = Entity(vehicle).state

    if state.carboosting then
        local players = Framework.Functions.GetQBPlayers()

        for _, Player in pairs(players) do
            if Utils.PlayerIsLeo(Player.PlayerData.job) then
                TriggerClientEvent(Shared.Resource .. ':client:ReceiveLocation', Player.PlayerData.source, GetEntityCoords(vehicle), state.carboosting.vehlabel, state.carboosting.plate)
            end
        end
    end
end)

RegisterNetEvent(Shared.Resource .. ':server:CompleteDropOff', function(contractId)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if not Player then return end

    local data = getContractData(contractId)
    if not data then return end

    if data.citizenid == Player.PlayerData.citizenid and data.current == Shared.Contracts[data.tier].hacks then
        if #(GetEntityCoords(data.entity) - data.dropoff) < 5.0 then
            -- Set completed
            boosts[data.id].state = 'completed'

            Wait(8000)

            -- Delete Vehicle
            DeleteEntity(data.entity)

            -- Reward
            local payout = math.random(Shared.Contracts[data.tier].reward.min, Shared.Contracts[data.tier].reward.max)
            Utils.Notify(src, (Locales['reward_payout']):format(payout) .. ' ' .. Shared.MoneyType, 'success', 3000)
            Player.Functions.AddMoney(Shared.MoneyType, payout)

            -- Update Exp
            local newRep = Player.PlayerData.metadata['boostingrep'] + Shared.Contracts[data.tier].exp.payout

            if newRep < 0 then
                newRep = 0
            elseif newRep > Shared.Ranks[#Shared.Ranks].maxRep then
                newRep = Shared.Ranks[#Shared.Ranks].maxRep
            end

            Player.Functions.SetMetaData('boostingrep', newRep)
            Player.Functions.SetMetaData('boostingclass', getBoostingClass(newRep))

            -- Log
            if Shared.Debug then print('^3[' .. Shared.Resource .. '] ^5' .. Player.PlayerData.name .. ' completed boost, ' .. 'Tier: ' .. data.tier .. ' NewRep: ' .. newRep .. '^7') end
            Utils.CreateLog('carboosting', 'Successful Dropoff', '**' .. Player.PlayerData.name .. '** (citizenid: *' .. Player.PlayerData.citizenid .. '* | id: *' .. src .. '*) Completed drop-off: \n**Tier:** ' .. data.tier .. ' \n**Reward:** ' .. payout .. ' ' .. Shared.MoneyType .. ' \n**Rep:**' .. Shared.Contracts[data.tier].exp.payout)
        end
    end
end)

RegisterNetEvent(Shared.Resource .. ':server:CompleteVinScratch', function(contractId, props)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if not Player then return end

    local data = getContractData(contractId)
    if not data then return end
    
    if data.citizenid == Player.PlayerData.citizenid and data.current == Shared.Contracts[data.tier].hacks then
        if #(GetEntityCoords(data.entity) - Shared.ScratchLocations[data.dropoff].coords) < 5.0 then
            boosts[data.id].state = 'completed'

            if DoesEntityExist(data.entity) then
                Entity(data.entity).state.carboosting = nil

                local hash = GetEntityModel(data.entity)
                local model = Framework.Shared.VehicleHashes[hash].model

                MySQL.insert([[
                    INSERT INTO `player_vehicles` (license, citizenid, vehicle, hash, mods, plate, state, vinscratched) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                ]], {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    model,
                    hash,
                    json.encode(props),
                    data.plate,
                    0,
                    1
                })

                Utils.CreateLog('carboosting', 'Added VIN Vehicle', '**' .. Player.PlayerData.name .. '** (citizenid: *' .. Player.PlayerData.citizenid .. '* | id: *' .. src .. '*) Added vehicle to garage: \n**Model:** ' .. model .. ' \n**Plate:** ' .. data.plate)
                if Shared.Debug then print('^3[' .. Shared.Resource .. '] ^5' .. Player.PlayerData.name .. ' added VIN vehicle: ' .. model .. ' plate: ' .. data.plate .. '^7') end
            end

            -- Reward
            local payout = math.random(Shared.Contracts[data.tier].reward.min, Shared.Contracts[data.tier].reward.max)
            Utils.Notify(src, (Locales['reward_payout']):format(payout) .. ' ' .. Shared.MoneyType, 'success', 3000)
            Player.Functions.AddMoney(Shared.MoneyType, payout)

            -- Update Exp
            local newRep = Player.PlayerData.metadata['boostingrep'] + Shared.Contracts[data.tier].exp.payout

            if newRep < 0 then
                newRep = 0
            elseif newRep > Shared.Ranks[#Shared.Ranks].maxRep then
                newRep = Shared.Ranks[#Shared.Ranks].maxRep
            end

            Player.Functions.SetMetaData('boostingrep', newRep)
            Player.Functions.SetMetaData('boostingclass', getBoostingClass(newRep))

            -- Log
            if Shared.Debug then print('^3[' .. Shared.Resource .. '] ^5' .. Player.PlayerData.name .. ' completed boost, ' .. 'Tier: ' .. data.tier .. ' NewRep: ' .. newRep .. '^7') end
            Utils.CreateLog('carboosting', 'Successful VIN', '**' .. Player.PlayerData.name .. '** (citizenid: *' .. Player.PlayerData.citizenid .. '* | id: *' .. src .. '*) Completed vin-scratch: \n**Tier:** ' .. data.tier .. ' \n**Rep:**' .. Shared.Contracts[data.tier].exp.payout)
        end
    end
end)

RegisterNetEvent(Shared.Resource .. ':server:CheckVin', function(plate)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if not Player then return end

    if Utils.PlayerIsLeo(Player.PlayerData.job) then
        local result = MySQL.scalar.await('SELECT vinscratched FROM player_vehicles WHERE plate = ?', { plate })
        local message = result == 1 and Locales['vin_scratched'] or Locales['vin_notscratched']

        TriggerClientEvent('chat:addMessage', Player.PlayerData.source,  {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>VIN Check: </strong> {0}<br><strong>Result: </strong> {1}</div></div>',
            args = {
                plate,
                message
            }
        })
    else
        Utils.Notify(src, Locales['police_only'], 'error', 2500)
    end
end)

--- Callbacks

lib.callback.register(Shared.Resource .. ':server:CanDropOff', function(source, contractId)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)

    local data = getContractData(contractId)
    if not data then return false end

    if data.citizenid == Player.PlayerData.citizenid then
        if Utils.GetCopCount() < Shared.Contracts[data.tier].dropCops then
            return false, Locales['not_enough_cops']
        else
            if Player.Functions.RemoveMoney(Shared.MoneyType, data.price) then
                local newRep = Player.PlayerData.metadata['boostingrep'] - Shared.Contracts[data.tier].exp.buyin
                if newRep < 0 then newRep = 0 end
    
                Player.Functions.SetMetaData('boostingrep', newRep)
                Player.Functions.SetMetaData('boostingclass', getBoostingClass(newRep))
    
                TriggerClientEvent(Shared.Resource .. ':client:StartContract', src, data.id, data.tier, data.location, false)

                boosts[contractId].state = 'started'

                return true
            else
                return false, (Locales['insufficient_money']:format(Locales['ui_moneyType']))
            end
        end
    end
end)

lib.callback.register(Shared.Resource .. ':server:CanVinScratch', function(source, contractId)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)

    local data = getContractData(contractId)
    if not data then return false end

    if data.citizenid == Player.PlayerData.citizenid then
        if Utils.GetCopCount() < Shared.Contracts[data.tier].vinCops then
            return false, Locales['not_enough_cops']
        else
            if Player.Functions.RemoveMoney(Shared.MoneyType, data.price + Shared.Contracts[data.tier].vinPrice) then
                local newRep = Player.PlayerData.metadata['boostingrep'] - Shared.Contracts[data.tier].exp.buyin
                if newRep < 0 then newRep = 0 end
    
                Player.Functions.SetMetaData('boostingrep', newRep)
                Player.Functions.SetMetaData('boostingclass', getBoostingClass(newRep))
    
                TriggerClientEvent(Shared.Resource .. ':client:StartContract', src, data.id, data.tier, data.location, false)

                boosts[contractId].state = 'started'
                boosts[contractId].vinscratch = true
                boosts[contractId].dropoff = math.random(#Shared.ScratchLocations)

                return true
            else
                return false, (Locales['insufficient_money']:format(Locales['ui_moneyType']))
            end
        end
    end
end)

--- Items

Framework.Functions.CreateUseableItem(Shared.LaptopItem, function(source, item)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    if not Player then return end

    if Shared.DisablePolice then
        if Utils.PlayerIsLeo(Player.PlayerData.job) then
            Utils.Notify(src, Locales['not_as_cop'], 'error', '2500')
        else
            TriggerClientEvent(Shared.Resource .. ':client:UseLaptop', src)
        end
    else
        TriggerClientEvent(Shared.Resource .. ':client:UseLaptop', src)
    end
end)

Framework.Functions.CreateUseableItem('boostingdisabler', function(source, item)
    TriggerClientEvent(Shared.Resource .. ':client:UseDisabler', source)
end)
