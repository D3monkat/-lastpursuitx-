RegisterServerEvent("omni:cablecar:host:sync", function(index, state) local src = source
    if src == tonumber(GetPlayers()[1]) then
        TriggerClientEvent("omni:cablecar:forceState", -1, index, state)
    end
end)
