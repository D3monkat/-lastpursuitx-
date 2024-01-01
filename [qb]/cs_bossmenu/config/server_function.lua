if CodeStudio.ServerType == "QB" then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif CodeStudio.ServerType == "ESX" then 
    ESX = exports['es_extended']:getSharedObject()
end



function GetPlayer(src)
    if CodeStudio.ServerType == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player
    elseif CodeStudio.ServerType == 'ESX' then
        local Player = ESX.GetPlayerFromId(src)
        return Player
    end
end


function GetIdentifier(Player)
    if CodeStudio.ServerType == 'QB' then
        local ident = Player.PlayerData.citizenid
        return ident
    elseif CodeStudio.ServerType == 'ESX' then
        local ident = Player.identifier
        return ident
    end
end


function GetPlayerJob(src)
    if CodeStudio.ServerType == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        local Job = Player.PlayerData.job.name
        local Label = Player.PlayerData.job.label
        local Grade = Player.PlayerData.job.grade
        return Job, Label, Grade
    elseif CodeStudio.ServerType == 'ESX' then
        local Player = ESX.GetPlayerFromId(src)
        local Job = Player.job.name
        local Label = Player.job.label
        local Grade = Player.job.grade
        return Job, Label, Grade
    end
end


function GetPlayerGang(src)  -- ONLY QB
    if CodeStudio.ServerType == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        local Job = Player.PlayerData.gang.name
        local Label = Player.PlayerData.gang.label
        local Rank = Player.PlayerData.gang.grade
        return Job, Label, Rank
    end
end


function GetPlayerName(Player)
    if CodeStudio.ServerType == 'QB' then
        local Name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname
        return Name
    elseif CodeStudio.ServerType == 'ESX' then
        local Name = Player.getName()
        return Name
    end
end


function SetPlayerJob(Player, job, rank)
    if CodeStudio.ServerType == 'QB' then
        Player.Functions.SetJob(job, rank)
    elseif CodeStudio.ServerType == 'ESX' then
        Player.setJob(tostring(job), rank)
    end
end



function AddPlayerMoney(Player, amount)
    if CodeStudio.ServerType == 'QB' then
        Player.Functions.AddMoney("cash", amount)
    elseif CodeStudio.ServerType == 'ESX' then
        Player.addAccountMoney('money', amount)
    end
end


function RemovePlayerMoney(Player, amount)
    if CodeStudio.ServerType == 'QB' then
        if Player.Functions.RemoveMoney("cash", amount) then
            return true
        end
    elseif CodeStudio.ServerType == 'ESX' then
        if amount <= Player.getAccount('money').money then
            Player.removeAccountMoney('money', amount)
            return true
        end
    end
end



-- This triggers when you fire an employee. Put your Multijob Events here to remove them from the multijob -- 

function FirePlayer(identifier, job, online) 
    --[identifier = Player Identifier, job = Player Job, online = PLayer Online/Offline Status]--
    
    TriggerEvent('cs:multijob:removeJob', identifier, job)  -- This is CodeStudio Multijob [https://codestudio.tebex.io/package/5380051]
end





--- Discord Logs ---

function SendDiscordLog(action, data)
    local webHook = CodeStudio.DicordLogs.WebHook
    local embedData
    if action == 'money' then
        if data.add then
            embedData = {
                {
                    ['title'] = data.type,
                    ['color'] = 65280,
                    ['footer'] = {
                        ['text'] = os.date('%c'),
                    },
                    ['description'] = '**Money Added By: **' ..GetPlayerName(data.Ply).."\n**Amount: **$"..data.amount..'\n**Account Name: **'..data.account
                }
            }
        else
            embedData = {
                {
                    ['title'] = data.type,
                    ['color'] = 16711680,
                    ['footer'] = {
                        ['text'] = os.date('%c'),
                    },
                    ['description'] = '**Money Deducted By: **' ..GetPlayerName(data.Ply).."\n**Amount: **$"..data.amount..'\n**Account Name: **'..data.account
                }
            }

        end
    elseif action == 'recruit' then
        embedData = {
            {
                ['title'] = 'Player Recruitment',
                ['color'] = 16777215,
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = '**Player Recruited By: **' ..GetPlayerName(data.Ply).."\n**Player Recruited: **"..GetPlayerName(data.target)..'\n**Job Name: **'..data.job..'\n**Type: **'..data.type
            }
        }
    elseif action == 'fire' then
        embedData = {
            {
                ['title'] = 'Player Fired',
                ['color'] = 16744192,
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = '**Player Fired By: **' ..GetPlayerName(data.Ply).."\n**Fired Player: **"..GetPlayerName(data.target)..'\n**Job Name: **'..data.job..'\n**Type: **'..data.type
            }
        }
    elseif action == 'rank' then
        embedData = {
            {
                ['title'] = 'Player Rank Changed',
                ['color'] = 16776960,
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = '**Player Action By: **' ..GetPlayerName(data.Ply).."\n**Managed Player: **"..GetPlayerName(data.target)..'\n**Job Name: **'..data.job..'\n**New Rank: **'..data.rank..'\n**Type: **'..data.type
            }
        }
    end
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'Boss Menu Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
end



-- [ox_inventory] Boss Inventory Creation --

RegisterNetEvent('cs:bossmenu:oxInventory', function(job)
	exports.ox_inventory:RegisterStash("boss_" .. job, 'Stash', 20, 20000, job)
end)