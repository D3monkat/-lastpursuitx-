function IsDispatcher()
    local job = GetJob()
    local grade = GetJob_grade()
    if Config.Dispatcher.Perms[job] ~= nil then
        if grade >= Config.Dispatcher.Perms[job] then
            return true
        end
    end
    return false
end

function ChangeRadio(new_channel)
    if Config.Dispatcher.VoipResource == 'toko' then
        local player_name = GetPlayerName(PlayerId())
        local current_channel = exports['tokovoip_script']:getPlayerData(playerName, 'radio:channel')

        if new_channel ~= tonumber(current_channel) then
            exports['tokovoip_script']:removePlayerFromRadio(current_channel)
            exports['tokovoip_script']:setPlayerData(player_name, 'radio:channel', new_channel, true);
            exports['tokovoip_script']:addPlayerToRadio(new_channel, true)
            TriggerServerEvent('dispatch:GetRadioChannel', new_channel)
        else
            print('already on this channel')
        end

    elseif Config.Dispatcher.VoipResource == 'mumble' then
        exports['mumble-voip']:SetRadioChannel(0)
        exports['mumble-voip']:SetRadioChannel(new_channel)
        exports['mumble-voip']:SetMumbleProperty('radioEnabled', true)
        TriggerServerEvent('dispatch:GetRadioChannel', new_channel)

    elseif Config.Dispatcher.VoipResource == 'pmavoice' then
        exports['pma-voice']:setRadioChannel(new_channel)
        exports['pma-voice']:setVoiceProperty('radioEnabled', true)
        TriggerServerEvent('dispatch:GetRadioChannel', new_channel)

    elseif Config.Dispatcher.VoipResource == 'other' then
        --add your own code.
    end
end

function LeaveRadio()
    if Config.Dispatcher.VoipResource == 'toko' then
        local player_name = GetPlayerName(PlayerId())
        local current_channel = exports['tokovoip_script']:getPlayerData(player_name, 'radio:channel')
        if current_channel ~= 'nil' then
            exports['tokovoip_script']:removePlayerFromRadio(current_channel)
            exports['tokovoip_script']:setPlayerData(player_name, 'radio:channel', 'nil', true)
            TriggerServerEvent('dispatch:GetRadioChannel', 0)
        else
            print('not in any radio')
        end
        

    elseif Config.Dispatcher.VoipResource == 'mumble' then
        exports['mumble-voip']:SetRadioChannel(0)
        exports['mumble-voip']:SetMumbleProperty('radioEnabled', false)
        TriggerServerEvent('dispatch:GetRadioChannel', 0)

    elseif Config.Dispatcher.VoipResource == 'pmavoice' then
        exports['pma-voice']:setRadioChannel(0)
        exports['pma-voice']:setVoiceProperty('radioEnabled', false)
        TriggerServerEvent('dispatch:GetRadioChannel', 0)

    elseif Config.Dispatcher.VoipResource == 'other' then
        --add your own code.
    end
end