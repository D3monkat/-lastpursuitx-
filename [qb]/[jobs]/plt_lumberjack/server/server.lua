------------------------------------------ ESX & QB-CORE Events --------------------------------------
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
if ESX then 
    function PltAddMoney(src,money,stage)
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
          xPlayer.addAccountMoney('bank', money)
          --xPlayer.addMoney(money)
        else
          print(src, "Couldn't get paid for logging out of the game or something went wrong:"..money)
        end
    end
else
    QBCore = exports['qb-core']:GetCoreObject()
    function PltAddMoney(src,money,stage)
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if xPlayer then
            xPlayer.Functions.AddMoney('bank', tonumber(money), 'lumberjack-payment')
            --xPlayer.Functions.AddMoney('cash', tonumber(money), 'lumberjack-payment')
        else
            print(src, "Couldn't get paid for logging out of the game or something went wrong:"..money)
        end
    end
end
---------------------------------------------------- 0 -----------------------------------------------
------------------------------------------------- vRP 0.5 --------------------------------------------
--If you are using vRP 0.5; delete the lines for esx and qbcore above. activate the following codes and also active '@vrp/lib/utils.lua' line from fxmanifest.lua
--[[ 
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
function PltAddMoney(src,money)
    local user_id = vRP.getUserId(src)
    vRP.giveBankMoney(user_id,money)
end
AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    local job = vRP.getUserGroupByType({user_id,"job"})
    TriggerClientEvent('plt_lumberjack:JobUpdate',user_id,job,false)
  end
end)
AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
  if gtype == "job" then 
    TriggerClientEvent('plt_lumberjack:JobUpdate',user_id, group, false)
  end
end)
 ]]
---------------------------------------------------- 0 -----------------------------------------------
