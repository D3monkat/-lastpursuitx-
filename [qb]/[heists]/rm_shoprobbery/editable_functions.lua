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
    exports['ps-dispatch']:StoreRobbery(camId)
    -- local data = exports['cd_dispatch']:GetPlayerInfo()
    -- TriggerServerEvent('cd_dispatch:AddNotification', {
    --     job_table = {'police', 'sast', 'bcso' }, 
    --     coords = data.coords,
    --     title = '10-15 - Store Robbery',
    --     message = 'A '..data.sex..' robbing a store at '..data.street, 
    --     flash = 0,
    --     unique_id = data.unique_id,
    --     sound = 1,
    --     blip = {
    --         sprite = 431, 
    --         scale = 1.2, 
    --         colour = 3,
    --         flashes = true, 
    --         text = '911 - Store Robbery',
    --         time = 5,
    --         radius = 0,
    --     }
    -- })
    
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