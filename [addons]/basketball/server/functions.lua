GetBasketData = function(court, key)
    return GlobalState[GetCurrentResourceName() .. court .. key]
end

SetBasketData = function(court, key, value)
    GlobalState[GetCurrentResourceName() .. court .. key] = value
end

Queue = {}

ResetCourt = function(court)
    local ball_net = GetBasketData(court, "ball")
    if ball_net and DoesEntityExist(NetworkGetEntityFromNetworkId(ball_net)) then
        DeleteEntity(NetworkGetEntityFromNetworkId(ball_net))
    end

    SetBasketData(court, "ball", false) -- net id (or false) of the basketball
    SetBasketData(court, "dribbler", false) -- source (or false) of player currently dribbling

    SetBasketData(court, "starting", false) -- how many seconds until game starts, or false if not in queue
    SetBasketData(court, "game", false) -- how many seconds until game finishes, or false if no game is in progress

    SetBasketData(court, "points_home", 0) -- how many points home has
    SetBasketData(court, "points_guest", 0) -- how many points guest has

    SetBasketData(court, "queue_home", 0) -- how many ppl are in the queue for team "home"
    SetBasketData(court, "queue_guest", 0) -- how many ppl are in the queue for team "guest"

    Queue[tostring(court)] = {
        home = {},
        guest = {},
    }

    TriggerClientEvent("loaf_basketball:reset_team", -1, court)
end

for court, data in pairs(Config.Courts) do
    ResetCourt(court)
end

ToggleQueue = function(source, court, team)
    if not Queue[tostring(court)][team][tostring(source)] then
        Queue[tostring(court)][team][tostring(source)] = true
        SetBasketData(court, "queue_"..team, GetBasketData(court, "queue_"..team) + 1) -- joined queue
    else
        Queue[tostring(court)][team][tostring(source)] = nil
        SetBasketData(court, "queue_"..team, GetBasketData(court, "queue_"..team) - 1) -- left queue
    end

    local opposite = (team == "home" and "guest") or "home"
    if Queue[tostring(court)][opposite][tostring(source)] then
        Queue[tostring(court)][opposite][tostring(source)] = nil
        SetBasketData(court, "queue_"..opposite, GetBasketData(court, "queue_"..opposite) - 1) -- joined a new team; remove from old queue
    end
end

AddEventHandler("playerDropped", function()
    local src = source

    for court, data in pairs(Config.Courts) do
        if GetBasketData(court, "dribbler") == src then
            SetBasketData(court, "dribbler", src)
        end
    end

    for court, data in pairs(Queue) do
        for team, users in pairs(data) do
            for user, inqueue in pairs(users) do
                if user == tostring(src) and inqueue then
                    Queue[court][team][user] = nil
                    SetBasketData(court, "queue_"..team, GetBasketData(court, "queue_"..team) - 1)
                end
            end
        end
    end
end)

FindBallSpawner = function(court)
    local break_early = false
    for k, v in pairs(Queue[tostring(court)]) do
        for k, v in pairs(v) do
            if GetPlayerName(tonumber(k)) then
                TriggerClientEvent("loaf_basketball:spawn_ball", tonumber(k), court)
                break_early = true
                break
            end
        end

        if break_early then
            break
        end
    end
end