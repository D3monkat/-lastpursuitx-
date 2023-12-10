MineDataGlobal = {}
MineData = {}

RegisterServerEvent('ds-mining:server:settimeout')
AddEventHandler('ds-mining:server:settimeout', function(location, bool)
    local src = source
    if Config.UseGlobalCoolDown then
        MineDataGlobal[location] = bool
        TriggerClientEvent("ds-mining:client:settimeout", -1, MineDataGlobal)
    else
        if MineData[license] then
            local license = GetPlayerLicense(src)
            MineData[license][location] = bool
            TriggerClientEvent("ds-mining:client:settimeout", src, MineData[license])
        else
            local license = GetPlayerLicense(src)
            MineData[license] = {}
            MineData[license][location] = bool
            TriggerClientEvent("ds-mining:client:settimeout", src, MineData[license])
        end
    end
end)

function resetAll()
    if Config.UseGlobalCoolDown then
        MineDataGlobal = {}
        TriggerClientEvent("ds-mining:client:settimeout", -1, MineDataGlobal)
    else
        MineData = {}
        TriggerClientEvent("ds-mining:client:settimeout", -1, MineData)
    end
    Citizen.SetTimeout(Config.CoolDown*60000,function()
        resetAll()
    end)
end


RegisterServerEvent("ds-mining:getunshaped")
AddEventHandler("ds-mining:getunshaped", function(item)

    local src = source
    if item then
        AddItem(source,item,1)
    else
        local washed = false
        local PlayerInventory = GetPlayerInventory(src)
        for k, v in pairs(PlayerInventory) do
            if Config.Washing[v.name] then
                washed = true
                if v.name ~= Config.StoneBreakReward then
                    if RemoveItem(source,v.name, v.amount) then
                        if AddItem(source,Config.Washing[v.name].reward, Config.Washing[v.name].qty*v.amount) then
                        else
                            AddItem(source, v.name, v.amount)
                        end
                    end
                else
                    if RemoveItem(source,v.name, v.amount) then
                    if AddItem(source,Config.RewardOnStone[math.random(0, #Config.RewardOnStone)], math.random(Config.RewardOnStoneQty.Min, Config.RewardOnStoneQty.Max)*v.amount) then
                        else
                            AddItem(source, v.name, v.amount)
                        end
                    end
                end
            end
        end
        if washed then
            Notify(src, Language['metal_washed'], "success")

        else
            Notify(src, Language['no_metal'], "success")
        end
    end
end)

RegisterServerEvent("ds-mining:server:sellstuff")
AddEventHandler("ds-mining:server:sellstuff", function(bulk, item, qty)
    local src = source
    if bulk then
        local totalamount = 0
        for k,v in pairs(Config.SellingPrices) do
            local ItemData = GetItemByName(src, k)
            if ItemData ~= nil and ItemData.amount >= 1 then
                if RemoveItem(source,k, ItemData.amount) then
                    totalamount = totalamount + ItemData.amount
                end
            end
        end
        if totalamount > 0 then
            AddMoney(src, totalamount)
        else
            Notify(src, Language['not_enough'], "success")

        end
    else
        if RemoveItem(source,item, qty) then
            AddMoney(src, Config.SellingPrices[item].price*qty)
        end
    end
end)

RegisterServerEvent("ds-mining:getendreward")
AddEventHandler("ds-mining:getendreward", function(item, qty)
    local src = source
    if Config.ItemProcess[item] then
        if RemoveItem(source,item, qty) then
            if item == 'unshapped_coal' then
                AddItem(source,'coal', Config.ItemProcess[item].qty*qty)
                Notify(src, Language['you_got'].. Config.ItemProcess[item].qty*qty.. " Coal", "success")

            else
                if AddItem(source,Config.ItemProcess[item].reward, Config.ItemProcess[item].qty*qty) then
                    Notify(src, Language['you_got'].. Config.ItemProcess[item].qty*qty.. " "..Config.ItemProcess[item].reward, "success")

                else
                    AddItem(source, item, qty)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(Config.CoolDown*60000)
    resetAll()
end)
