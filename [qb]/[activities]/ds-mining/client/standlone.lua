QBCore = nil
if Config.Object.usingexport then
    QBCore = exports[Config.Object.CoreName]:GetCoreObject()
else
    TriggerEvent(Config.Object.event, function(obj) QBCore = obj end)
end

HasItem = function(item, qty)
    local hasitem = false
    local PlayerData = QBCore.Functions.GetPlayerData()
    for _, itemData in pairs(PlayerData.items) do
        if itemData and itemData.name == item and (not qty or (qty and itemData.amount >= qty)) then
            hasitem = true
        end
    end
    return hasitem
end

Notify = function(msg, type)
    QBCore.Functions.Notify(msg, type)
end

RegisterNetEvent("ds-mining:sellstuff")
AddEventHandler("ds-mining:sellstuff", function()
    if Config.BulkSelling then
        TriggerServerEvent('ds-mining:server:sellstuff', true)
    else
        local newdx = {}
        for k,v in pairs(Config.SellingPrices) do
            table.insert(newdx, { value = k, text = v.label , label = v.label})
        end

        if Config.Input == 'ox-lib' then

            local dialog = lib.inputDialog(Language['sell_mining'], {
                {type = 'select', label = Language['select_item'], options = newdx, required = true},
                {type = 'number', label = Language['amount'], required = true, min = 1},
            })
            if not dialog then return end
            if tonumber(dialog[2]) > 0 then
                TriggerServerEvent('ds-mining:server:sellstuff',false, dialog[1], tonumber(dialog[2]))
            end

        else
            local dialog = exports['qb-input']:ShowInput({
                header = Language['sell_mining'],
                submitText = Language['sell'],
                inputs = {
                    {
                        text = Language['select_item'],
                        name = "metal",
                        type = "select",
                        options = newdx
                    },

                    {
                        text = Language['amount'],
                        name = "amount",
                        type = "number",
                        isRequired = true
                    },
                },
            })
            if dialog ~= nil then
                if tonumber(dialog['amount']) > 0 then
                    TriggerServerEvent('ds-mining:server:sellstuff',false, dialog['metal'], tonumber(dialog['amount']))
                end
            end
        end
    end
end)


Progressbar = function(label, time)
    local retval = false
    QBCore.Functions.Progressbar(label, label, time, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        retval = true
    end, function() -- Cancel
        retval = false
    end)
    Wait(time+1000)
    return retval
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('ds-mining:server:getdata', function(Data)
        MineData = Data
    end)
    playerjob = QBCore.Functions.GetPlayerData().job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    playerjob = QBCore.Functions.GetPlayerData().job.name
end)

RegisterNetEvent("Startprog")
AddEventHandler("Startprog", function(duration, label)
    local retval = nil
    QBCore.Functions.Progressbar("drugs", label, duration, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function()
        retval = true
    end, function()
        retval = false
    end)

    while retval == nil do
        Wait(1)
    end
    return retval
end)

RegisterNetEvent("ds-mining:openfoodshop")
AddEventHandler("ds-mining:openfoodshop", function()
    local ShopItems = {}
    ShopItems.label = Language['mining_shop']
    ShopItems.items = Config.FoodShopItems
    ShopItems.slots = #Config.FoodShopItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Miningshop_"..math.random(1, 99), ShopItems)
end)

RegisterNetEvent("ds-mining:buystuff")
AddEventHandler("ds-mining:buystuff", function()
    local ShopItems = {}
    ShopItems.label = Language['mining_shop']
    ShopItems.items = Config.MineShopItems
    ShopItems.slots = #Config.MineShopItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Miningshop_"..math.random(1, 99), ShopItems)
end)

DrawText3Ds = function(x, y, z, text)
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 400
    DrawRect(0.0, 0.0+0.0110, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end


CustomCoolDown = function()
    return true
end

CreateSpotBlips = function(newlocation)
    SpotBlips[currentspot] = {}
    for k,v in pairs(Config.Mining) do
        if v.spot == newlocation then
            local blip = AddBlipForCoord(v.coords)
            SetBlipScale(blip, Config.Blip['c4_blip'].Scale)
            SetBlipSprite(blip, Config.Blip['c4_blip'].Sprite)
            SetBlipColour(blip, Config.Blip['c4_blip'].Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Blip['c4_blip'].Label)
            EndTextCommandSetBlipName(blip)
            table.insert(SpotBlips[currentspot], blip)
        end
    end
end

CreatemineBlip = function(bool)
    if bool then
        mineblip = AddBlipForCoord(vector3(2938.42, 2744.78, 43.26))
        SetBlipScale(mineblip, Config.Blip['main_blip'].Scale)
        SetBlipSprite(mineblip, Config.Blip['main_blip'].Sprite)
        SetBlipColour(mineblip, Config.Blip['main_blip'].Color)
        SetBlipAsShortRange(mineblip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip['main_blip'].Label)
        EndTextCommandSetBlipName(mineblip)
    else
        RemoveBlip(mineblip)
        mineblip = nil
    end
end

RegisterNetEvent("ds-mining:selectdiamond")
AddEventHandler("ds-mining:selectdiamond", function()

    local newdx = {}
    for k,v in pairs(Config.ItemProcess) do
        if not v.usemelt then
            table.insert(newdx, { value = k, text = v.label , label = v.label})
        end
    end

    if Config.Input == 'ox-lib' then

        local dialog = lib.inputDialog(Language['shape_item'], {
            {type = 'select', label = Language['select_item'], options = newdx, required = true},
            {type = 'number', label = Language['amount'], required = true, min = 1},
        })
        if not dialog then return end
        if tonumber(dialog[2]) > 0 then
            TriggerEvent('ds-mining:processdiamonds', dialog[1], tonumber(dialog[2]))
        end

    else
        local dialog = exports['qb-input']:ShowInput({
            header = Language['shape_item'],
            submitText = Language['start_working'],
            inputs = {
                {
                    text = Language['start_working'],
                    name = "metal",
                    type = "select",
                    options = newdx
                },

                {
                    text = "Amount",
                    name = "amount",
                    type = "number",
                    isRequired = true
                },
            },
        })
        if dialog ~= nil then
            if tonumber(dialog['amount']) > 0 then
                TriggerEvent('ds-mining:processdiamonds', dialog['metal'], tonumber(dialog['amount']))
            end
        end
    end
end)


RegisterNetEvent("ds-mining:enteramount")
AddEventHandler("ds-mining:enteramount", function()
    local newdx = {}
    for k,v in pairs(Config.ItemProcess) do
        if v.usemelt then
            table.insert(newdx, { value = k, text = v.label , label = v.label })
        end
    end

    if Config.Input == 'ox-lib' then
        local dialog = lib.inputDialog(Language['melt_metal'], {
            {type = 'select', label = Language['select_item'], options = newdx, required = true},
            {type = 'number', label = Language['amount'], required = true, min = 1},
        })
        if not dialog then return end

        if tonumber(dialog[2]) > 0 then
            TriggerEvent('ds-mining:meltmetals', dialog[1], tonumber(dialog[2]))
        end
    else
        local dialog = exports['qb-input']:ShowInput({
            header = Language['melt_metal'],
            submitText = Language['start_melting'],
            inputs = {
                {
                    text = Language['select_item'],
                    name = "metal",
                    type = "select",
                    options = newdx
                },

                {
                    text = "Amount",
                    name = "amount",
                    type = "number",
                    isRequired = true
                },
            },
        })
        if dialog ~= nil then

            if tonumber(dialog['amount']) > 0 then
                TriggerEvent('ds-mining:meltmetals', dialog['metal'], tonumber(dialog['amount']))
            end
        end
    end
end)
