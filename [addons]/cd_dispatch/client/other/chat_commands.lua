if Config.JobCallCommands.ENABLE then

    for c, d in pairs(Config.JobCallCommands.Civilian_Commands) do
        TriggerEvent('chat:addSuggestion', '/'..d.command, L('chatsuggestion_jobcommands', d.job_label), {{ name=L('chatsuggestion_message_1'), help=L('chatsuggestion_message_2')}})
        RegisterCommand(d.command, function(source, args)
            local message = table.concat(args, ' ')
            if message then
                TriggerServerEvent('cd_dispatch:CallCommand', GetPlayerInfo(), {job_label = d.job_label, job_table = d.job_table, anonymous = d.anonymous, message = message, phone_number = SourceInfo.phone_number, char_name = SourceInfo.char_name})
                PlayAnimation('cellphone@', 'cellphone_call_listen_base', 5000)
            else
                Notif(3, 'enter_message_1', d.job_label)
            end
        end)
    end

    local function JobCallCommandReplyData(job)
        for c, d in pairs(Config.JobCallCommands.Civilian_Commands) do
            for cc, dd in pairs(d.job_table) do
                if dd == job then
                    return {job_table = d.job_table, job_label = d.job_label}
                end
            end
        end
    end

    TriggerEvent('chat:addSuggestion', '/'..Config.JobCallCommands.JobReply_Command, L('chatsuggestion_jobreply'), {{ name=L('chatsuggestion_playerid_1'), help=L('chatsuggestion_playerid_1')}, { name=L('chatsuggestion_message_1'), help=L('chatsuggestion_message_2')}})
    RegisterCommand(Config.JobCallCommands.JobReply_Command, function(source, args)
        local job = GetJob()
        local data = JobCallCommandReplyData(job)
        if data then
            local target_id = args[1]
            if target_id then
                local message = table.concat(args, ' '):sub(tonumber(#target_id+1))
                if #message > 0 then
                    TriggerServerEvent('cd_dispatch:CallCommand:Reply', {job = job, job_label = data.job_label, job_table = data.job_table, target_id = tonumber(target_id), message = message, char_name = SourceInfo.char_name})
                else
                    Notif(3, 'enter_message_2')
                end
            else
                Notif(3, 'enter_playerid')
            end
        else
            Notif(3, 'no_perms')
        end
    end)

end