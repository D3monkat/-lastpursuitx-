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

function AddTimerBar(time, text, cb)
    RequestStreamedTextureDict("timerbars", true)
    while not HasStreamedTextureDictLoaded("timerbars") do
        Citizen.Wait(50)
    end
    timer = true
    percent = 1700
    width = 0.005
    w = width * (percent / 100)
    x = (0.95 - (width * (percent / 100)) / 2) - width / 2
    Citizen.CreateThread(function()
        while timer do
            percent = percent - (1700 / (time * 100))
            width = 0.005
            w = width * (percent / 100)
            x = (0.91 - (width * (percent / 100)) / 2) - width / 2
            DrawSprite('TimerBars', 'ALL_BLACK_bg', 0.95, 0.95, 0.15, 0.0305, 0.0, 255, 255, 255, 180)
            DrawRect(0.95, 0.95, 0.085, 0.0109, 100, 0, 0, 180)
            DrawRect(x + w , 0.95, w, 0.0109, 150, 0, 0, 255)
            SetTextColour(255, 255, 255, 180)
            SetTextFont(0)
            SetTextScale(0.3, 0.3)
            SetTextCentre(true)
            SetTextEntry('STRING')
            AddTextComponentString(text)
            DrawText(0.868, 0.938)
            if percent <= 0 then
                cb(true)
                break
            end
            Wait(0)
        end
        SetStreamedTextureDictAsNoLongerNeeded("timerbars")
    end)
end

RegisterNetEvent('fleeca:client:showNotification')
AddEventHandler('fleeca:client:showNotification', function(str)
    ShowNotification(str)
end)

--This event send to all police players
RegisterNetEvent('fleeca:client:policeAlert')
AddEventHandler('fleeca:client:policeAlert', function(targetCoords)
    local data = exports['cd_dispatch']:GetPlayerInfo()
    TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = {'police', 'sast', 'bcso' }, 
        coords = data.coords,
        title = '10-15 - Bank Robbery',
        message = 'A '..data.sex..' robbing a bank at '..data.street, 
        flash = 1,
        unique_id = data.unique_id,
        sound = 2,
        blip = {
            sprite = 431, 
            scale = 1.2, 
            colour = 3,
            flashes = true, 
            text = '911 - Bank Robbery',
            time = 5,
            radius = 0,
        }
    })
end)
