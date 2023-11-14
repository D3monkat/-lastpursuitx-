PLT = plt_farmer
Info = {}
Objeler = {}
ESX = nil
QBCore = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
Citizen.CreateThread(function(...) 
  if ESX == nil then  Citizen.Wait(2000)
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end) 
  end 
  if ESX == nil then 
    QBCore = exports['qb-core']:GetCoreObject()
  end
end)

RegisterNetEvent("plt_farmer:MissionComplate")
AddEventHandler("plt_farmer:MissionComplate", function(money)
  local src = source
  pltEntityDelete(src)
  if ESX ~= nil then 
    local xPlayer = ESX.GetPlayerFromId(src)
    if PLT.PaymentMethodWithBank  then 
      xPlayer.addAccountMoney('bank', money)
    else
      xPlayer.addMoney(money)
    end   
  elseif QBCore ~= nil then 
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(10) end
    if PLT.PaymentMethodWithBank  then 
      xPlayer.Functions.AddMoney('bank', tonumber(money), 'farmerjob-payment')
    else
      xPlayer.Functions.AddMoney('cash', tonumber(money), 'farmerjob-payment')
    end 
  end   
    TriggerClientEvent('plt_farmer:SendNotify', src, "error",money..PLT.U["won"],9000)
end) 

