if Config.JobCallCommands.ENABLE then

    RegisterServerEvent('cd_dispatch:CallCommand')
    AddEventHandler('cd_dispatch:CallCommand', function(data, data_2)
        local _source = source
        local OnDuty = 0
        
        for c, d in pairs(self) do
            for cc, dd in pairs(data_2.job_table) do
                if d.job == dd and d.on_duty then
                    OnDuty = OnDuty + 1
                    break
                end
            end
            if OnDuty > 0 then break end
        end
        
        if OnDuty > 0 then
            Notif(_source, 2, 'dispatch_callcommand', data_2.job_label, data_2.message)
            if data_2.anonymous then
                TriggerClientEvent('cd_dispatch:AddNotification', -1, {
                    job_table = data_2.job_table,
                    coords = data.coords,
                    title = L('dispatch_call_reply_title'),
                    message = L('dispatch_call_message_2', _source, data.street, data_2.message),
                    flash = 0,
                    unique_id = tostring(math.random(0000000,9999999)),
                    blip = {
                        sprite = 487,
                        scale = 1.5,
                        colour = 3,
                        flashes = true,
                        text = data_2.job_label..' '..L('call'),
                        time = 5,
                        sound = 1,
                        radius = 100,
                    }
                })
            else
                TriggerClientEvent('cd_dispatch:AddNotification', -1, {
                    job_table = data_2.job_table,
                    coords = data.coords,
                    title = L('dispatch_call_reply_title'),
                    message = L('dispatch_call_message_1', data_2.char_name, data_2.phone_number, _source, data.street, data_2.message),
                    flash = 0,
                    unique_id = tostring(math.random(0000000,9999999)),
                    blip = {
                        sprite = 487,
                        scale = 1.5,
                        colour = 3,
                        flashes = true,
                        text = data_2.job_label..' '..L('call'),
                        time = 5,
                        sound = 1,
                        radius = 0,
                    }
                })
            end
            
        else
            Notif(_source, 2, 'dispatch_call_nonduty', data_2.job_label)
        end
    end)


    RegisterServerEvent('cd_dispatch:CallCommand:Reply')
    AddEventHandler('cd_dispatch:CallCommand:Reply', function(data)
        local _source = source
        if GetPlayerName(data.target_id) then
            for c, d in pairs(self) do
                if d.job == data.job and d.on_duty then
                    Notif(d.source, 2, 'dispatch_call_reply_1', data.job_label, data.char_name, data.target_id, data.message)
                end
            end

            Notif(data.target_id, 2, 'dispatch_call_reply_2', data.job_label, data.char_name, data.message)
        else
            Notif(_source, 3, 'player_not_found')
        end
    end)
end