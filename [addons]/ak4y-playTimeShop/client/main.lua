---@diagnostic disable: missing-parameter
if AK4Y.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
end

Citizen.CreateThread(function()
    if AK4Y.Framework == "oldqb" then 
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
	elseif AK4Y.Framework == "qb" then
		while QBCore == nil do
            Citizen.Wait(200)
        end
    end
    playTime = GetGameTimer() + (AK4Y.NeededPlayTime * 60000)
	PlayerData = QBCore.Functions.GetPlayerData()
    Wait(1000)
    SendNUIMessage({
        type = 'translate', 
        translate = AK4Y.Language,
    })		
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
    playTime = GetGameTimer() + (AK4Y.NeededPlayTime * 60000)
    Wait(1000)
    SendNUIMessage({
        type = 'translate', 
        translate = AK4Y.Language,
    })	
end)

RegisterNetEvent('kat:openthegates')
AddEventHandler('kat:openthegates', function()
openMenu()
end)


RegisterCommand(AK4Y.OpenCommand, function()
    local Dperms = {"1186511422377709728","947973977580638240"}
    local discordperms = exports.zdiscord:isRolePresent(source, Dperms);
    if discordperms then
	openMenu()
    else 
        QBCore.Functions.Notify('you are not currently boosting.', 'error', 7500)
    end
end)

local openMenuSpamProtect = 0
function openMenu()
    if openMenuSpamProtect < GetGameTimer() then 
        openMenuSpamProtect = GetGameTimer() + 1500
        QBCore.Functions.TriggerCallback("ak4y-playTimeShop:getPlayerDetails", function(result)
            apiKey = result.steamApiKey
            if result.steamid then
                steamID = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. apiKey .. "&steamids=" .. result.steamid
            else
                steamID = 'null'
            end
            local checkTime = tonumber(getNeededPlayTime()*60)
            local remainingTime = disp_time(checkTime)
            local firstname = PlayerData.charinfo.firstname
            local lastname = PlayerData.charinfo.lastname
            SetNuiFocus(true,true)
            SendNUIMessage({
                type = 'openui', 
                coin = result.coin,
                categories = AK4Y.Categories,
                items = AK4Y.Items,
                steamid = steamID,
                firstname = firstname,
                lastname = lastname,
                remaining = remainingTime,
                coinReward = AK4Y.RewardCoin,
                coinList = AK4Y.CoinList,
                topPlayers = result.topPlayers,
            })	
        end)
    end
end

function disp_time(time)
    local days = math.floor(time/86400)
    local remaining = time % 86400
    local hours = math.floor(remaining/3600)
    remaining = remaining % 3600
    local minutes = math.floor(remaining/60)
    remaining = remaining % 60
    local seconds = remaining
    if (hours < 10) then
        hours = "0" .. tostring(hours)
    end
    if (minutes < 10) then
        minutes = "0" .. tostring(minutes)
    end
    if (seconds < 10) then
        seconds = "0" .. tostring(seconds)
    end
    if hours ~= "00" then 
        answer = hours..'h '..minutes..'m'
    else
        answer = minutes..'m'

    end
    return answer
end

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        local checkTime = tonumber(getNeededPlayTime())
        if checkTime <= 0 then
            playTime = GetGameTimer() + (AK4Y.NeededPlayTime * 60000)
            TriggerServerEvent('ak4y-playTimeShop:addCoin', AK4Y.RewardCoin)
        end
    end
end)


getNeededPlayTime = function()
    return math.round((playTime - GetGameTimer()) / 60000, 2)
end

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local buyItemSpamProtect = 0
RegisterNUICallback('buyItem', function(data, cb)
    if buyItemSpamProtect < GetGameTimer() then 
        buyItemSpamProtect = GetGameTimer() + 1500
        QBCore.Functions.TriggerCallback("ak4y-playTimeShop:buyItem", function(result)
            cb(result)
        end, data)
    end
end)

local sendInputProtect = 0
RegisterNUICallback('sendInput', function(data, cb)
    if sendInputProtect < GetGameTimer() then 
        sendInputProtect = GetGameTimer() + 1500
        QBCore.Functions.TriggerCallback("ak4y-playTimeShop:sendInput", function(result)
            cb(result)
        end, data)
    end
end)

RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus(false, false)
end)