local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("id_pilotjob:addFlight")
AddEventHandler("id_pilotjob:addFlight", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        local pilotJobTable = xPlayer.PlayerData.metadata["pilotjob"]
    
        if pilotJobTable.flights + 1 < 101 then
            pilotJobTable.flights = pilotJobTable.flights + 1
        end
        xPlayer.Functions.SetMetaData('pilotjob', pilotJobTable)
    end
end)

RegisterNetEvent("id_pilotjob:addLevel")
AddEventHandler("id_pilotjob:addLevel", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        local pilotJobTable = xPlayer.PlayerData.metadata["pilotjob"]
    
        if pilotJobTable.flights + 1 == 100 then
            pilotJobTable.level = 2
        end
        xPlayer.Functions.SetMetaData('pilotjob', pilotJobTable)
    end
end)

RegisterNetEvent("id_pilotjob:giveMoneyLevel1")
AddEventHandler("id_pilotjob:giveMoneyLevel1", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    xPlayer.Functions.AddMoney("cash", Config.Level1Reward, "legal_pilotjob_reward")
end)

RegisterNetEvent("id_pilotjob:giveMoneyLevel2")
AddEventHandler("id_pilotjob:giveMoneyLevel2", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if Config.Level2Reward == "cash" then
        xPlayer.Functions.AddMoney("cash", Config.Level2RewardCashAmount, "illegal_pilotjob_reward")
    end

    if Config.Level2Reward == "markedbills" then
        if xPlayer.Functions.AddItem("markedbills", Config.Level2RewardMarkedBillAmount) then
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["markedbills"], "add")
        else
            TriggerClientEvent("QBCore:Notify", source, Config.Translation.InventoryFull, "error")
        end
    end
end)