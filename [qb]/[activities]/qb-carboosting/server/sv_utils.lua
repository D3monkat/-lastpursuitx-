Utils = {}

Utils.GeneratePlate = function()
    local plate = Framework.Shared.RandomInt(1) .. Framework.Shared.RandomStr(2) .. Framework.Shared.RandomInt(3) .. Framework.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

Utils.PlayerIsLeo = function(Job)
    -- return Job.name == 'police' and Job.onduty
    return Job.type == 'leo' and Job.onduty
end

Utils.GetCopCount = function()
    local amount = 0
    local players = Framework.Functions.GetQBPlayers()

    for _, Player in pairs(players) do
        if Utils.PlayerIsLeo(Player.PlayerData.job) then
            amount += 1
        end
    end

    return amount
end

Utils.Notify = function(source, message, notifType, timeOut)
    if Shared.Notify == 'qb' then
        TriggerClientEvent(Shared.CoreObject .. ':Notify', source, message, notifType, timeOut)
    elseif Shared.Notify == 'ox' then
        TriggerClientEvent('ox_lib:notify', source, {
            title = Locales['boosting_title'],
            description = message,
            duration = timeOut,
            type = notifType,
            position = 'center-right',
        })
    end
end

Utils.PhoneNotification = function(source, message, timeOut)
    if Shared.PhoneNotification == 'QBCore' then
        TriggerClientEvent('qb-phone:client:CustomNotification', source, Locales['boosting_title'], message, 'fas fa-car', '#ff002f', timeOut)
    elseif Shared.PhoneNotification == 'GKS' then
        exports["gksphone"]:SendNotification(source, {
            title = Locales['boosting_title'], 
            message = message, 
            img = '/html/static/img/icons/messages.png', 
            duration = timeOut
        })
    elseif Shared.PhoneNotification == 'Qs' then
        TriggerClientEvent('qs-smartphone:client:notify', source, {
            title = Locales['boosting_title'],
            text = message,
            icon = "./img/apps/whatsapp.png",
            timeout = timeOut
        })
    elseif Shared.PhoneNotification == 'lb-phone' then
        exports["lb-phone"]:SendNotification(source, {
            app = "Messages",
            title = Locales['boosting_title'],
            content = message,
            --icon = "https://www.example.com/photo.jpg", -- the icon of the notification (optional)
        })
    end
end

Utils.CreateLog = function(logType, title, message)
    TriggerEvent("qb-log:server:CreateLog", logType, title, message)
end
