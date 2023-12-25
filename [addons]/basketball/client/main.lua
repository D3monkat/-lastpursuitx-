Cache = {
    GameData = {
        Team = false,
        Court = false
    },
    home_bottom = false,
    guest_bottom = false
}

CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(250)
    end

    for court, data in pairs(Config.Courts) do
        if data.blip then
            AddBlip(data.blip, 148, 17, Strings["blip"])
        end

        CreateMarker(data.start - vec3(0.0, 0.0, 1.0), {red = 255, green = 120, blue = 5, alpha = 255}, 0.4, 1.8)
    end

    while true do
        Cache.self = PlayerPedId()
        Cache.id = GetPlayerServerId(PlayerId())

        for court, data in pairs(Config.Courts) do
            while #(GetEntityCoords(Cache.self) - data.start) <= 2.0 do
                Wait(0)
                if not GetBasketData(court, "game") then
                    local home_txt, guest_txt = Strings["join"], Strings["join"]
                    if Cache.GameData.Team == "home" then
                        home_txt = Strings["leave"]
                    elseif Cache.GameData.Team == "guest" then
                        guest_txt = Strings["leave"]
                    end
                    local txt = Strings["join_team"]:format(home_txt, Strings["home"], GetBasketData(court, "queue_home"), guest_txt, Strings["guest"], GetBasketData(court, "queue_guest"))

                    local starting = GetBasketData(court, "starting")
                    if starting then
                        local minutes = math.floor(starting / 60)
                        local seconds = starting - minutes * 60

                        local minute_txt, second_txt = Strings["minute"], Strings["second"]
                        if seconds ~= 1 then
                            second_txt = Strings["seconds"]
                        end
                        if minutes ~= 1 then
                            minute_txt = Strings["minutes"]
                        end
                        txt = txt .. string.format(Strings["starting"], minutes, minute_txt, seconds, second_txt)
                    end

                    HelpText(txt)
                    if IsControlJustReleased(0, 51) then
                        TriggerServerEvent("loaf_basketball:join_team", court, "home")
                        Cache.GameData.Court = court
                        if Cache.GameData.Team == "home" then Cache.GameData.Team = false else Cache.GameData.Team = "home" end
                    elseif IsControlJustReleased(0, 47) then
                        TriggerServerEvent("loaf_basketball:join_team", court, "guest")
                        Cache.GameData.Court = court
                        if Cache.GameData.Team == "guest" then Cache.GameData.Team = false else Cache.GameData.Team = "guest" end
                    end
                elseif not Cache.GameData.Team then
                    local minutes = math.floor(GetBasketData(court, "game") / 60)
                    local seconds = GetBasketData(court, "game") - minutes * 60
                    local minute_txt, second_txt = Strings["minute"], Strings["second"]
                    if seconds ~= 1 then
                        second_txt = Strings["seconds"]
                    end
                    if minutes ~= 1 then
                        minute_txt = Strings["minutes"]
                    end
                    HelpText(string.format(Strings["game_progress"], minutes, minute_txt, seconds, second_txt))
                else
                    break
                end
            end

            if #(GetEntityCoords(Cache.self) - data.start) >= 5.0 and GetBasketData(court, "starting") then
                if Cache.GameData.Team then
                    TriggerServerEvent("loaf_basketball:join_team", court, Cache.GameData.Team)
                    Cache.GameData.Team = false
                    Notify(Strings["left_queue"])
                end
            end
        end

        Wait(500)
    end
end)

RegisterNetEvent("loaf_basketball:game_started")
AddEventHandler("loaf_basketball:game_started", function(court)
    if Cache.GameData.Court == court then
        -- delete old checkpoints
        if Cache.home_bottom then
            DeleteCheckpoint(Cache.home_bottom)
            Cache.home_bottom = false
        end
        if Cache.guest_bottom then
            DeleteCheckpoint(Cache.guest_bottom)
            Cache.guest_bottom = false
        end

        if Cache.GameData.Team == "home" then
            Cache.guest_bottom = CreateMarker(Config.Courts[court].guest[2], {red = 255, green = 0, blue = 0, alpha = 75}, 1.0, 0.6)
        else
            Cache.home_bottom = CreateMarker(Config.Courts[court].home[2], {red = 255, green = 0, blue = 0, alpha = 75}, 1.0, 0.6)
        end

        while not GetBasketData(court, "game") do Wait(500) end -- wait until globalstate updates
        while GetBasketData(court, "game") do Wait(500) end -- wait until match is over
        
        -- remove checkpoints since game is over
        if Cache.home_bottom then
            DeleteCheckpoint(Cache.home_bottom)
            Cache.home_bottom = false
        end
        if Cache.guest_bottom then
            DeleteCheckpoint(Cache.guest_bottom)
            Cache.guest_bottom = false
        end

        ClearPedTasksImmediately(Cache.self)
    end
end)

RegisterNetEvent("loaf_basketball:reset_team")
AddEventHandler("loaf_basketball:reset_team", function(court)
    if Cache.GameData.Court == court then
        Cache.GameData.Team = false
        Cache.ball = nil
    end
end)

RegisterNetEvent("loaf_basketball:notify")
AddEventHandler("loaf_basketball:notify", function(msg)
    if msg == Strings["you_lost"] then
        PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS", 1)
    elseif msg == Strings["you_won"] then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    Notify(msg)
end)

ShootBall = function(force)
    ClearPedTasksImmediately(Cache.self)
    if DoesEntityExist(Cache.ball) then
        TaskPlayAnim(Cache.self, LoadDict("amb@prop_human_movie_bulb@exit"), "exit", 8.0, -8.0, -1, 16, 0.0, false, false, false)

        DetachEntity(Cache.ball)
        SetEntityVelocity(Cache.ball, ForwardX() * force * 10, ForwardY() * force * 10, force * 10)

        SetTimeout(400, function()
            ClearPedTasksImmediately(Cache.self)
        end)

        local opposite = (Cache.GameData.Team == "home" and "guest") or "home"
        local top, bottom = Config.Courts[Cache.GameData.Court][opposite][1], Config.Courts[Cache.GameData.Court][opposite][2]

        local timer = GetGameTimer() + 400
        while IsEntityInAir(Cache.ball) or timer >= GetGameTimer() do
            Wait(0)
            local dist = #(GetEntityCoords(Cache.ball) - top)

            if dist <= 0.3 then
                print("passed goal test 1")
                if Config.easy_mode then return true end
                local timer = GetGameTimer() + 750
                while timer >= GetGameTimer() do
                    Wait(0)
                    dist = #(GetEntityCoords(Cache.ball) - bottom)
                    if dist <= 0.3 then
                        print("passed goal test 2")
                        return true
                    end
                end
            end
        end
    end
end

SetOwner = function(obj)
    if DoesEntityExist(obj) then
        while not NetworkHasControlOfEntity(obj) do
            NetworkRequestControlOfEntity(obj)
            Wait(0)
        end
    end
end

AttachBall = function(rotation)
    AttachEntityToEntity(Cache.ball, Cache.self, GetPedBoneIndex(Cache.self, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, rotation or 0.0, true, true, true, false, 0.0, false)
end

Dribble = function(factor1, factor2, z1, z2, delay1, delay2)
    SetOwner(Cache.ball)
    DetachEntity(Cache.ball)
    SetEntityVelocity(Cache.ball, ForwardX() * factor1, ForwardY() * factor1, z1)
    Wait(delay1)
    if Cache.GameData.Court and GetBasketData(Cache.GameData.Court, "dribbler") == Cache.id then
        SetEntityVelocity(Cache.ball, ForwardX() * factor2, ForwardY() * factor2, z2)
        Wait(delay2)
        if Cache.GameData.Court and GetBasketData(Cache.GameData.Court, "dribbler") == Cache.id then
            AttachBall()
            Wait(50)
        end
    end
end

Dunk = function(pos)
    if Config.allow_dunking then
        SetEntityHasGravity(Cache.self, false)
        TaskPlayAnimAdvanced(Cache.self, LoadDict("anim@veh@technical@turret@base"), "turn_right_fast_aim_down", pos.xyz, 0.0, 0.0, pos.w, 8.0, -8.0, -1, 0, 0.0)
        Wait(200)
        SetEntityCoords(Cache.ball, GetEntityCoords(Cache.self))
        Wait(200)
        SetEntityHasGravity(Cache.self, true)

        PlaySoundFrontend(-1, "GOLF_NEW_RECORD", "HUD_AWARDS", 1)
        Notify(Strings["goal"])
        TriggerServerEvent("loaf_basketball:score", Cache.GameData.Court, Cache.GameData.Team)
        DetachEntity(Cache.ball)
    end
end

CreateThread(function()
    while true do
        Wait(500)

        local court = Cache.GameData.Court
        if court and GetBasketData(court, "game") then
            while GetBasketData(court, "game") and Cache.GameData.Team and GetBasketData(court, "dribbler") == Cache.id do
                Wait(0) 

                HelpText(Strings["ball_info"])
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 257, true)
                DisableControlAction(0, 73, true)

                if IsDisabledControlJustReleased(0, 73) then -- x (drop ball)
                    TriggerServerEvent("loaf_basketball:set_dribbler", Cache.GameData.Court)
                elseif IsDisabledControlJustReleased(0, 24) then -- lmb (shoot)
                    TriggerServerEvent("loaf_basketball:set_dribbler", Cache.GameData.Court, true)
                    while Cache.GameData.Court and GetBasketData(Cache.GameData.Court, "dribbler") == Cache.id do
                        Wait(0)
                    end
                    ClearPedTasksImmediately(Cache.self)
                    if ShootBall(0.8 + (#(GetEntityVelocity(Cache.self).xy) * 0.1)) then
                        PlaySoundFrontend(-1, "GOLF_NEW_RECORD", "HUD_AWARDS", 1)
                        Notify(Strings["goal"])
                        TriggerServerEvent("loaf_basketball:score", Cache.GameData.Court, Cache.GameData.Team)
                    end
                elseif IsDisabledControlJustReleased(0, 47) and Config.allow_dunking and Config.Courts[Cache.GameData.Court].dunking then -- g (dunk)
                    local dunk_to_use = Config.Courts[Cache.GameData.Court].dunking[(Cache.GameData.Team == "home" and "guest") or "home"]
                    if #(GetEntityCoords(Cache.self) - dunk_to_use.xyz) <= 3.0 then
                        if math.random(1, 100) <= Config.dunk_percent then
                            TriggerServerEvent("loaf_basketball:set_dribbler", Cache.GameData.Court, true)
                            while Cache.GameData.Court and GetBasketData(Cache.GameData.Court, "dribbler") == Cache.id do
                                Wait(0)
                            end
                            ClearPedTasksImmediately(Cache.self)
                            Dunk(dunk_to_use)
                            DetachEntity(Cache.ball)
                        else
                            Notify(Strings["better_luck_dunk"])
                            Wait(500)
                        end
                    end
                end
            end

            if IsEntityPlayingAnim(Cache.self, "anim@move_m@trash", "walk", 3) then
                ClearPedTasksImmediately(Cache.self)
            end

            if IsEntityAttachedToEntity(Cache.ball, Cache.self) then
                DetachEntity(Cache.ball)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        local court = Cache.GameData.Court
        if court and GetBasketData(court, "game") then
            while GetBasketData(court, "game") and Cache.GameData.Court do
                Wait(0)

                while DoesEntityExist(Cache.ball) do
                    Wait(0)

                    if not GetBasketData(court, "dribbler") then
                        while #(GetEntityCoords(Cache.self) - GetEntityCoords(Cache.ball)) <= 2.0 and not GetBasketData(court, "dribbler") do
                            Wait(0)
                            DrawText3D(GetEntityCoords(Cache.ball), Strings["pickup_ball"])
                            if IsControlJustReleased(0, 51) then
                                TriggerServerEvent("loaf_basketball:set_dribbler", Cache.GameData.Court)
                            end
                        end
                    elseif Cache.GameData.Court and GetBasketData(Cache.GameData.Court, "dribbler") == Cache.id then
                        if IsPedWalking(Cache.self) then
                            Dribble(2, 1.9, -3.0, 3.2, 250, 350)
                        elseif IsPedRunning(Cache.self) then
                            Dribble(6, 4.2, -5.0, 4.0, 150, 250)
                        elseif IsPedSprinting(Cache.self) then
                            Dribble(9, 8, -8.0, 2.5, 150, 250)
                        elseif not IsEntityAttachedToEntity(Cache.ball, Cache.self) then
                            SetOwner(Cache.ball)
                            AttachBall()
                        end

                        if not IsEntityPlayingAnim(Cache.self, "anim@move_m@trash", "walk", 3) then
                            TaskPlayAnim(Cache.self, LoadDict("anim@move_m@trash"), "walk", 8.0, 8.0, -1, 51, 1, false, false, false)
                            while not IsEntityPlayingAnim(Cache.self, "anim@move_m@trash", "walk", 3) do Wait(0) end
                        end
                    else
                        while #(GetEntityCoords(Cache.self) - GetEntityCoords(Cache.ball)) <= 1.0 and GetBasketData(court, "dribbler") and GetBasketData(court, "dribbler") ~= Cache.id do
                            Wait(0)
                            DrawText3D(GetEntityCoords(Cache.ball), Strings["steal_ball"])
                            if IsControlJustReleased(0, 51) then
                                if HasEntityClearLosToEntityInFront(Cache.self, Cache.ball) then
                                    if math.random(1, 100) <= Config.snatch_ball then
                                        TaskPlayAnim(Cache.self, LoadDict("anim@am_hold_up@male"), "shoplift_mid", 8.0, 8.0, -1, 52, 1, false, false, false)
                                        Wait(300)
                                        TriggerServerEvent("loaf_basketball:set_dribbler", Cache.GameData.Court)
                                    else
                                        Wait(500)
                                        Notify(Strings["better_luck"])
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)

        local court = Cache.GameData.Court
        if court and GetBasketData(court, "game") then
            local netid = GetBasketData(court, "ball")
            if netid and NetworkDoesNetworkIdExist(netid) then
                Cache.ball = NetToObj(netid)
            end
        else
            Cache.ball = false
        end
    end
end)

RegisterNetEvent("loaf_basketball:spawn_ball")
AddEventHandler("loaf_basketball:spawn_ball", function(court)
    local data = Config.Courts[court]
    ClearAreaOfObjects(data.ball.x, data.ball.y, data.ball.z, 50.0, 1)

    local model = LoadModel(GetHashKey("prop_bskball_01"))
    if model.loaded then
        local spawned_ball = CreateObject(model.model, data.ball, true)
        NetworkRegisterEntityAsNetworked(spawned_ball)
        local netid = ObjToNet(spawned_ball)
        SetNetworkIdExistsOnAllMachines(netid, true)
        SetNetworkIdCanMigrate(netid, true)

        TriggerServerEvent("loaf_basketball:set_ball", court, netid)
    end
end)