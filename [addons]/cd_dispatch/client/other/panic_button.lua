if Config.PanicButton.ENABLE then

    local function IsAllowed_panic(job)
        for c, d in pairs(Config.PanicButton.job_table) do
            if job == d and on_duty then
                return Config.PanicButton.job_table
            end
        end
        return false
    end

    TriggerEvent('chat:addSuggestion', '/'..Config.PanicButton.command, L('panic_description'))
    RegisterCommand(Config.PanicButton.command, function(source, args)
        TriggerEvent('cd_dispatch:PanicButtonEvent')
    end)

    RegisterNetEvent('cd_dispatch:PanicButtonEvent')
    AddEventHandler('cd_dispatch:PanicButtonEvent', function()
        local job = GetJob()
        local allowed_jobs = IsAllowed_panic(job)
        if allowed_jobs then
            TriggerServerEvent('cd_dispatch:CallCommand:Panic', GetPlayerInfo(), {job = job, job_table = allowed_jobs, char_name = SourceInfo.char_name})
            PlayAnimation('random@arrests', 'generic_radio_chatter', 1000)
        else
            Notif(3, 'no_perms')
        end
    end)

end