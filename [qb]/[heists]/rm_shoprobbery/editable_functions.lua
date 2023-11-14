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
RegisterNetEvent('shoprobbery:client:policeAlert')
AddEventHandler('shoprobbery:client:policeAlert', function(targetCoords)
    TriggerEvent('qb-scoreboard:server:SetActivityBusy', "storerobbery", true)
    exports["ps-dispatch"]:CustomAlert({
        coords = vector3(targetCoords.x, targetCoords.y, targetCoords.z),
        message = "Store Robbery",
        dispatchCode = "10-90 - Store Robbery",
        description = "Robbery in progress",
        radius = 0,
        sprite = 161,
        priority = 2, -- priority
        color = 2,
        scale = 1.0,
        length = 3,
    })
    Wait(500)
    TriggerEvent('qb-scoreboard:server:SetActivityBusy', "storerobbery", false)
    
    -- ShowNotification(Strings['police_alert'])
    -- local alpha = 250
    -- local shopBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    -- SetBlipHighDetail(shopBlip, true)
    -- SetBlipColour(shopBlip, 1)
    -- SetBlipAlpha(shopBlip, alpha)
    -- SetBlipAsShortRange(shopBlip, true)

    -- while alpha ~= 0 do
    --     Citizen.Wait(500)
    --     alpha = alpha - 1
    --     SetBlipAlpha(shopBlip, alpha)

    --     if alpha == 0 then
    --         RemoveBlip(shopBlip)
    --         return
    --     end
    -- end


end)