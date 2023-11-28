Framework = nil

if (Config.FRAMEWORK == 'qb') then
    Framework = Config.GET_CORE
elseif (Config.FRAMEWORK == 'esx') then
    Framework = exports['es_extended']:getSharedObject()
else
    print(Config.PREFIX .. ' Unsupported Framework detected!')
end

---@param pageData { to: number, from: string, message: string }
RegisterServerEvent('dream-pager:server:createPage', function(pageData)
    local to = pageData.to
    TriggerClientEvent('dream-pager:client:createPage', to, pageData)
end)

DreamCore.CreateCallback('dream-pager:server:getPagerData', function(source, cb)
    local playerID = source
    local playerName = getPlayerName(playerID)
    local playerJob = getPlayerJobName(playerID)
    local playerJobGrade = getPlayerJobGrade(playerID)
    local onlineStaff = getOnlinePlayersInJob(playerJob)

    local data = {
        playerID = playerID,
        playerName = playerName,
        playerJob = playerJob,
        playerJobGrade = playerJobGrade,
        onlineStaff = onlineStaff,
    }

    cb(data)
end)

DreamCore.CreateCallback('dream-pager:server:getOnlineStaff', function(source, cb)
    local playerJob = getPlayerJobName(source)
    local onlineStaff = getOnlinePlayersInJob(playerJob)

    local data = {
        onlineStaff = onlineStaff,
    }

    cb(data)
end)

---@param job string
---@return { fullName: string; id: number }[]
function getOnlinePlayersInJob(job)
    local jobTable = {}

    while not Framework do
        Wait(100)
    end

    if (Config.FRAMEWORK == 'qb') then
        for _, v in pairs(Framework.Functions.GetPlayers()) do
            local player = Framework.Functions.GetPlayer(tonumber(v))
            if player ~= nil and player.PlayerData.job.name == job then
                local playerTable = {
                    fullName = player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname,
                    id = player.PlayerData.source,
                }
                table.insert(jobTable, playerTable)
            end
        end
    elseif (Config.FRAMEWORK == 'esx') then
        for _, v in pairs(Framework.GetPlayers()) do
            local xPlayer = Framework.getPlayer(v)
            if xPlayer ~= nil and xPlayer.job.name == job then
                local playerTable = {
                    fullName = xPlayer.getName(),
                    id = xPlayer.source,
                }
                table.insert(jobTable, playerTable)
            end
        end
    end

    return jobTable
end

function getPlayerJobName(playerID)
    local job = ''

    if (Config.FRAMEWORK == 'qb') then
        local Player = Framework.Functions.GetPlayer(playerID)
        job = Player.PlayerData.job.name
    elseif (Config.FRAMEWORK == 'esx') then
        local xPlayer = Framework.GetPlayerFromId(playerID)
        job = xPlayer.job.name
    else
        print(Config.PREFIX .. ' Unsupported Framework detected!')
    end

    return job
end

function getPlayerJobGrade(playerID)
    local job = ''

    if (Config.FRAMEWORK == 'qb') then
        local Player = Framework.Functions.GetPlayer(playerID)
        job = Player.PlayerData.job.grade
    elseif (Config.FRAMEWORK == 'esx') then
        local xPlayer = Framework.GetPlayerFromId(playerID)
        job = xPlayer.job.grade
    else
        print(Config.PREFIX .. ' Unsupported Framework detected!')
    end

    return job
end

function getPlayerName(playerID)
    local fullName = ''
    if (Config.FRAMEWORK == 'qb') then
        local Player = Framework.Functions.GetPlayer(playerID)
        fullName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    elseif (Config.FRAMEWORK == 'esx') then
        local xPlayer = Framework.GetPlayerFromId(playerID)
        fullName = xPlayer.getName()
    else
        print(Config.PREFIX .. ' Unsupported Framework detected!')
    end
    return fullName
end