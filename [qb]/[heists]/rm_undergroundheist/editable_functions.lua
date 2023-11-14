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

RegisterNetEvent('undergroundheist:client:showNotification')
AddEventHandler('undergroundheist:client:showNotification', function(str)
    ShowNotification(str)
end)

--This event send to all police players
RegisterNetEvent('undergroundheist:client:policeAlert')
AddEventHandler('undergroundheist:client:policeAlert', function(targetCoords)
    ShowNotification(Strings['police_alert'])
    local alpha = 250
    local undergroundBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    SetBlipHighDetail(undergroundBlip, true)
    SetBlipColour(undergroundBlip, 1)
    SetBlipAlpha(undergroundBlip, alpha)
    SetBlipAsShortRange(undergroundBlip, true)

    while alpha ~= 0 do
        Citizen.Wait(500)
        alpha = alpha - 1
        SetBlipAlpha(undergroundBlip, alpha)

        if alpha == 0 then
            RemoveBlip(undergroundBlip)
            return
        end
    end
end)
