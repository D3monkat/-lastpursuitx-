RegisterNetEvent("loaf_basketball:set_dribbler")
AddEventHandler("loaf_basketball:set_dribbler", function(court, shooting)
    local src = source

    if GetBasketData(court, "ball") and DoesEntityExist(NetworkGetEntityFromNetworkId(GetBasketData(court, "ball"))) then
        if GetBasketData(court, "dribbler") ~= src then
            SetBasketData(court, "dribbler", src)
        elseif GetBasketData(court, "dribbler") == src then
            if shooting then
                SetBasketData(court, "dribbler", 9999999) -- if someone has source 9999999 you really need to restart your server..
                Wait(1000)
                SetBasketData(court, "dribbler", false)
            else
                SetBasketData(court, "dribbler", false)
            end
        end
    end
end)

RegisterNetEvent("loaf_basketball:set_ball")
AddEventHandler("loaf_basketball:set_ball", function(court, netid)
    if not GetBasketData(court, "ball") or not DoesEntityExist(NetworkGetEntityFromNetworkId(GetBasketData(court, "ball"))) then
        SetBasketData(court, "ball", netid)
    end
end)

RegisterNetEvent("loaf_basketball:score")
AddEventHandler("loaf_basketball:score", function(court, team)
    SetBasketData(court, "points_"..team, GetBasketData(court, "points_"..team) + 1)
end)

RegisterNetEvent("loaf_basketball:join_team")
AddEventHandler("loaf_basketball:join_team", function(court, team)
    local src = source
    if team == "home" or team == "guest" and Config.Courts[court] then
        ToggleQueue(src, court, team)
    end
end)

CreateThread(function()
    while true do
        for court, data in pairs(Config.Courts) do
            if (GetBasketData(court, "queue_home") < data.queue.minimum or GetBasketData(court, "queue_guest") < data.queue.minimum) then
                if GetBasketData(court, "game") then
                    ResetCourt(court)
                else
                    SetBasketData(court, "starting", false)
                    SetBasketData(court, "game", false)
                end
            else
                if GetBasketData(court, "starting") then
                    SetBasketData(court, "starting", GetBasketData(court, "starting") - 1)
                    if GetBasketData(court, "starting") <= 0 then
                        SetBasketData(court, "starting", false)
                        SetBasketData(court, "game", data.queue.game)

                        FindBallSpawner(court)

                        TriggerClientEvent("loaf_basketball:game_started", -1, court)
                    end
                elseif GetBasketData(court, "game") then
                    SetBasketData(court, "game", GetBasketData(court, "game") - 1)
                    if GetBasketData(court, "game") <= 0 then
                        local points_home, points_guest = GetBasketData(court, "points_home"), GetBasketData(court, "points_guest")
                        for team, users in pairs(Queue[tostring(court)]) do
                            for user, inqueue in pairs(users) do
                                if inqueue then
                                    if points_guest == points_home then
                                        TriggerClientEvent("loaf_basketball:notify", tonumber(user), Strings["tie"])
                                    else
                                        winner = (points_home > points_guest and "home" or "guest")
                                        if team == winner then
                                            TriggerClientEvent("loaf_basketball:notify", tonumber(user), Strings["you_won"])
                                        else
                                            TriggerClientEvent("loaf_basketball:notify", tonumber(user), Strings["you_lost"])
                                        end
                                    end
                                end
                            end
                        end

                        ResetCourt(court)
                    else
                        local netid = GetBasketData(court, "ball")
                        if not netid or not DoesEntityExist(NetworkGetEntityFromNetworkId(netid)) then
                            FindBallSpawner(court)
                        end
                    end
                elseif GetBasketData(court, "queue_home") >= data.queue.minimum and GetBasketData(court, "queue_guest") >= data.queue.minimum then
                    SetBasketData(court, "starting", data.queue.timer)
                end
            end
        end
        
        Wait(1000)
    end
end)