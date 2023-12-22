function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
end

RegisterNetEvent('shoprobbery:client:showNotification')
AddEventHandler('shoprobbery:client:showNotification', function(str)
    if not clientStart then
        ShowNotification(str)
    end
end)

--This event send to all police players
--This event send to all police players
RegisterNetEvent('shoprobbery:client:policeAlert')
AddEventHandler('shoprobbery:client:policeAlert', function(targetCoords)
    exports["ps-dispatch"]:CustomAlert({
        message = 'Store Robbery',
        codeName = 'storerobbery',
        description = "Store Robbery",
        code = '10-90',
        radius = 0,
        sprite = 64,
        color = 2,
        scale = 1.0,
        length = 3,
        priority = 2,
        coords = targetCoords,
        camId = camId,
        jobs = { 'leo' }
    })
end)