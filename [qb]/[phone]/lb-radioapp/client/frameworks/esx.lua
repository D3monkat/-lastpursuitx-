CreateThread(function()
    if Config.Framework ~= "esx" then
        return
    end

    local export, ESX = pcall(function()
        return exports.es_extended:getSharedObject()
    end)
    if not export then
        while not ESX do
            TriggerEvent("esx:getSharedObject", function(obj)
                ESX = obj
            end)
            Wait(500)
        end
    end

    RegisterNetEvent("esx:playerLoaded", function(playerData)
        ESX.PlayerData = playerData
    end)

    RegisterNetEvent("esx:setJob", function(job)
        ESX.PlayerData.job = job
    end)

    function GetJob()
        return ESX.PlayerData.job.name
    end
end)
