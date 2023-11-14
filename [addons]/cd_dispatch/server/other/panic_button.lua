if Config.PanicButton.ENABLE then

    RegisterServerEvent('cd_dispatch:CallCommand:Panic')
    AddEventHandler('cd_dispatch:CallCommand:Panic', function(data, data_2)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = data_2.job_table,
            coords = data.coords,
            title = L('panic_title'),
            message = L('panic_message', data_2.char_name, data.street),
            flash = 1,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 58,
                scale = 1.5,
                colour = 3,
                flashes = true,
                text = L('panic_bliptext'),
                time = 5,
                sound = 4,
                radius = 0,
            }
        })
    end)

    RegisterServerEvent('cd_dispatch:PanicSoundInDistance')
    AddEventHandler('cd_dispatch:PanicSoundInDistance', function(players)
        for c, d in pairs(players) do
            TriggerClientEvent('cd_dispatch:PanicSoundInDistance', d)
        end
    end)

end