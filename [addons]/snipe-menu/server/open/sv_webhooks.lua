local WebHooks = {
    ["exploit"] = "https://discord.com/api/webhooks/1185120786080612462/1TApofmCjOhG_F1t3Xgdcsjdl-B4xfduNuF8PM3Lp9c4MfFIuueR56e-hNEedgx_1aKX",
    ["triggered"] = "https://discord.com/api/webhooks/1185120786080612462/1TApofmCjOhG_F1t3Xgdcsjdl-B4xfduNuF8PM3Lp9c4MfFIuueR56e-hNEedgx_1aKX",
    ["report"] = "https://discord.com/api/webhooks/1185120786080612462/1TApofmCjOhG_F1t3Xgdcsjdl-B4xfduNuF8PM3Lp9c4MfFIuueR56e-hNEedgx_1aKX",
    ["transcript"] = "https://discord.com/api/webhooks/1185120786080612462/1TApofmCjOhG_F1t3Xgdcsjdl-B4xfduNuF8PM3Lp9c4MfFIuueR56e-hNEedgx_1aKX",
    ["bans"] = "https://discord.com/api/webhooks/1185120786080612462/1TApofmCjOhG_F1t3Xgdcsjdl-B4xfduNuF8PM3Lp9c4MfFIuueR56e-hNEedgx_1aKX",
}

function SendLogs(source, type, message)
    local colorcode = 5763719
    if type == "exploit" then
        colorcode = 16711680
    end
    local description = ""
    if source == 0 then
        description = "**"..message.."**"
    else
        description = "**"..GetPlayerName(source).."** ("..source..")\n"..message
    end
    if type == "report" then
        description = "**"..GetPlayerName(source).."** ".. message
    end
    local embedData = {
        {
            ["title"] = "Admin Menu Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = description,
            ["author"] = {
            ["name"] = 'Snipe Admin Menu Logs',
            },
        }
    }
    if type == "transcript" then
        embedData[1].title = "Chat Transcript (Closed by "..GetPlayerName(source)..")"
        embedData[1].footer.text = "Closed on "..os.date("%c")
        embedData[1].description = message
        description = ""
    end
    PerformHttpRequest(WebHooks[type], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent("snipe-menu:server:sendLogs", function(type, message)
    if type == "exploit" then
        SendLogs(source, type, message)
    elseif type == "triggered" then
        SendLogs(source, type, message)
    end
end)