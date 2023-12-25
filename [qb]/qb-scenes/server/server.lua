-----------------------
----   Variables   ----
-----------------------
local QBCore = exports['qb-core']:GetCoreObject()
local scenes = {}

-----------------------
----   Threads     ----
-----------------------

CreateThread(function()
    UpdateAllScenes()
    while true do
        DeleteExpiredScenes()
        Wait(Config.AuditInterval)
    end
end)

-----------------------
---- Server Events ----
-----------------------

QBCore.Functions.CreateCallback('qb-scenes:server:GetScenes', function(_, cb)
    cb(scenes)
end)

-----------------------
----   Functions   ----
-----------------------

function UpdateAllScenes()
    scenes = {}
    MySQL.Async.fetchAll('SELECT * FROM scenes', {}, function(result)
        if result[1] then
            for _, v in pairs(result) do
                local newCoords = json.decode(v.coords)
                scenes[#scenes+1] = {
                    id = v.id,
                    text = v.text,
                    color = v.color,
                    viewdistance = v.viewdistance,
                    expiration = v.expiration,
                    fontsize = v.fontsize,
                    fontstyle = v.fontstyle,
                    coords = vector3(newCoords.x, newCoords.y, newCoords.z),
                }
            end
        end
        TriggerClientEvent('qb-scenes:client:UpdateAllScenes', -1, scenes)
    end)
end

function DeleteExpiredScenes()
    MySQL.Async.execute('DELETE FROM scenes WHERE date_deletion < NOW()', {}, function(result)
        if result > 0 then
            print('Deleted '..result..' expired scenes from the database.')
            UpdateAllScenes()
        end
    end)
end

RegisterNetEvent('qb-scenes:server:DeleteScene', function(id)
    MySQL.Async.execute('DELETE FROM scenes WHERE id = ?', {id}, function()
        UpdateAllScenes()
    end)
end)

RegisterNetEvent('qb-scenes:server:CreateScene', function(sceneData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    TriggerEvent("qb-log:server:CreateLog", "scenes", "New Scene Created", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) created a new scene; scene: **"..sceneData.text.."**, where: **" .. sceneData.coords .. "**")

    MySQL.Async.insert('INSERT INTO scenes (creator, text, color, viewdistance, expiration, fontsize, fontstyle, coords, date_creation, date_deletion) VALUES (? ,?, ?, ?, ?, ?, ?, ?, NOW(), DATE_ADD(NOW(), INTERVAL ? HOUR))', {
        Player.PlayerData.citizenid,
        sceneData.text,
        sceneData.color,
        sceneData.viewdistance,
        sceneData.expiration,
        sceneData.fontsize,
        sceneData.fontstyle,
        json.encode(sceneData.coords),
        sceneData.expiration
    }, function()
        UpdateAllScenes()
    end)
end)


local function PullRepo()
    CreateThread(function()
        local repoPath = 'C:/FXServer/txData/PursuitX/resources/[core]/'
        local gitFetchCmd = "cd " .. repoPath .. " && git fetch"
        local gitPullCmd = "cd " .. repoPath .. " && git pull"
    
        local success, exitCode, code = os.execute(gitFetchCmd)
        if success then
            print('Fetching...')
            success, exitCode, code = os.execute(gitPullCmd)
            if success then
                print('Repo has been pulled!')
            else
                print('^1[ERROR]^7 FAILED TO PULL | CODE: '..exitCode..' ('..code..')')
            end
        else
            print('^1[ERROR]^7 FAILED TO FETCH | CODE: '..exitCode..' ('..code..')')
        end
    end)
end

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 120 then
        CreateThread(function()
            PullRepo()
        end)
    end
end)


QBCore.Commands.Add("gitpull", 'Pull the repo to live', {}, false, function(source)
    PullRepo()
    print('Repo has been pulled!')
end, 'god')






