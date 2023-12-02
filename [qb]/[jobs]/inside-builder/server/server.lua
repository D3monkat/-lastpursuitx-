local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('inside-builder:getexperience', function(source, cb, xPlayer)
    local PlayerData = QBCore.Functions.GetPlayer(source)

    local result = exports.oxmysql:executeSync('SELECT * FROM inside_jobs WHERE identifier=@identifier AND job=@job', {['@identifier'] = PlayerData.PlayerData.citizenid, ['@job'] = 'builder'})
    if result[1] ~= nil then
        cb(tonumber(result[1].experience)) 
    else
        exports.oxmysql:execute('INSERT INTO inside_jobs (identifier, experience, job) VALUES (@identifier, @experience, @job)', {
            ['@identifier'] = PlayerData.PlayerData.citizenid,
            ['@experience'] = 0,
            ['@job'] = 'builder'
        })
    end
end)


QBCore.Functions.CreateCallback('inside-builder:payout', function(source, cb, xPlayer, level)
    local PlayerData = QBCore.Functions.GetPlayer(source)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    local money = Config.ExperienceRequirement[level].Payout
    local exp = math.random(Config.ExperienceRequirement[level].MinExpDrop,Config.ExperienceRequirement[level].MaxExpDrop)
    local result = exports.oxmysql:executeSync('SELECT * FROM inside_jobs WHERE identifier=@identifier AND job=@job', {['@identifier'] = PlayerData.PlayerData.citizenid, ['@job'] = 'builder'})
    if result[1] ~= nil then
        playerexp = result[1].experience + exp
        exports.oxmysql:execute('UPDATE inside_jobs SET experience=@experience WHERE identifier=@identifier AND job=@job', {
            ['@experience'] = playerexp, 
            ['@identifier'] = PlayerData.PlayerData.citizenid,
            ['@job'] = 'builder'
        })
    else
        exports.oxmysql:execute('INSERT INTO inside_jobs (identifier, experience, job) VALUES (@identifier, @experience, @job)', {
            ['@identifier'] = PlayerData.PlayerData.citizenid,
            ['@experience'] = 0,
            ['@job'] = 'builder'
        })
    end
	xPlayer.Functions.AddMoney("cash", money)
    cb(money, exp)  
end)
