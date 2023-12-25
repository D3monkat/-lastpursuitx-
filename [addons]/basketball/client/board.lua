local scale = 1.25

local DrawTxt = function(entry, txt, r, g, b, a)
    BeginTextCommandDisplayText(entry)
    AddTextComponentSubstringPlayerName(txt)
    SetTextFont(4)
    SetTextCentre()
    SetTextOutline()
    SetTextJustification(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    EndTextCommandDisplayText(0.5, 0.3)
end

CreateThread(function()
    AddTextEntry("HOME_SCORE", "~a~")
    AddTextEntry("GUEST_SCORE", "~a~")
    AddTextEntry("TIME", "~a~")

    local nearby = false

    CreateThread(function()
        while true do
            for court, data in pairs(Config.Courts) do
                if data.board then
                    while nearby == court do
                        local txt
                        if GetBasketData(court, "game") then
                            local timer = GetBasketData(court, "game")
                            local minutes = math.floor(timer / 60)
                            local seconds = timer - minutes * 60
                            minutes = tostring(minutes)
                            seconds = tostring(seconds)
                            if #minutes == 1 then minutes = "0" .. minutes end
                            if #seconds == 1 then seconds = "0" .. seconds end
                            txt = string.format("%s:%s", minutes, seconds)
                        end

                        exports.floatydraw:FloatyDraw(data.board.time, data.board.heading, function(index)
                            DrawTxt("TIME", txt or Strings["waiting"], 213, 161, 41, 175)
                        end)

                        exports.floatydraw:FloatyDraw(data.board.guest, data.board.heading, function(index)
                            DrawTxt("GUEST_SCORE", tostring(GetBasketData(court, "points_guest")), 165, 27, 24, 175)
                        end)

                        exports.floatydraw:FloatyDraw(data.board.home, data.board.heading, function(index)
                            DrawTxt("HOME_SCORE", tostring(GetBasketData(court, "points_home")), 165, 27, 24, 175)
                        end)

                        Wait(0)
                    end
                end
            end

            Wait(50)
        end
    end)

    CreateThread(function()
        while true do
            for court, data in pairs(Config.Courts) do
                if data.board then
                    if #(GetEntityCoords(PlayerPedId()) - data.board.main) <= 50.0 then
                        local visible = false
                        for k, v in pairs(data.board) do
                            if type(v) == "vector3" and k ~= "main" then
                                local on_screen, x, y = GetScreenCoordFromWorldCoord(v.x, v.y, v.z)
                                if on_screen then 
                                    visible = true
                                    break
                                end
                            end
                        end

                        local width, height = GetActiveScreenResolution()
                        if width <= 1280 then
                            scale = 2.75
                        elseif width <= 1920 then
                            scale = 2.0
                        elseif width <= 2560 then
                            scale = 1.4
                        end

                        if visible then
                            nearby = court
                        else
                            nearby = false
                        end
                    else
                        nearby = false
                    end
                end
            end

            Wait(50)
        end
    end)
end)