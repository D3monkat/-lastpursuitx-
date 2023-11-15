QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('cfx-trclassic-pursuitmode:server:public', function(class, streetOne, streetTwo)
    local class = class
    local player = QBCore.Functions.GetPlayer(source)
    local first = player.PlayerData.charinfo.firstname
    local last = player.PlayerData.charinfo.lastname
    TriggerEvent('cfx-trclassic-pursuitmode:server:logs', class, first, last, streetOne, streetTwo)
end)