Utils = {}

Utils.AlertPolice = function(plate, veh)
    -- Standard QBCore police alert
    -- TriggerServerEvent('police:server:policeAlert', 'Vehicle Theft: ' .. plate)
    
    -- Project-Sloth Dispatch
    if GetResourceState('ps-dispatch') ~= 'started' then return end
    exports['ps-dispatch']:CarBoosting(veh)
end

Utils.Notify = function(message, notifType, timeOut)
    if Shared.Notify == 'qb' then
        Framework.Functions.Notify(message, notifType, timeOut)
    elseif Shared.Notify == 'ox' then
        lib.notify({
            title = Locales['boosting_title'],
            description = message,
            duration = timeOut,
            type = notifType,
            position = 'center-right',
        })
    end
end

Utils.PhoneNotification = function(message, timeOut)
    if Shared.PhoneNotification == 'QBCore' then
        TriggerEvent('qb-phone:client:CustomNotification', Locales['boosting_title'], message, 'fas fa-car', '#ff002f', timeOut)
    elseif Shared.PhoneNotification == 'GKS' then
        exports['gksphone']:SendNotification({
            title = Locales['boosting_title'], 
            message = message, 
            img= '/html/static/img/icons/messages.png', 
            duration = timeOut
        })
    elseif Shared.PhoneNotification == 'Qs' then
        TriggerEvent('qs-smartphone:client:notify', {
            title = Locales['boosting_title'],
            text = message,
            icon = './img/apps/whatsapp.png',
            timeout = timeOut
        })
    elseif Shared.PhoneNotification == 'lb-phone' then
        exports['lb-phone']:SendNotification({
            app = 'Messages',
            title = Locales['boosting_title'],
            content = message,
        })
    end
end

Utils.CreateAreaBlip = function(coords)
    local blipOffset = 200.0
    local offsetSign = math.random(-100, 100) / 100
    local blip = AddBlipForRadius(coords.x + (offsetSign * blipOffset), coords.y + (offsetSign * blipOffset), coords.z + (offsetSign * blipOffset), 300.00)

    SetBlipHighDetail(blip, true)
    SetBlipAlpha(blip, 100)
    SetBlipColour(blip, 3)

    return blip
end

Utils.CreateDropOffBlip = function(coords)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 227)
    SetBlipColour(blip, 2)
    SetBlipScale(blip, 0.80)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(Locales['blip_dropoff'])
    EndTextCommandSetBlipName(blip)

    return blip
end