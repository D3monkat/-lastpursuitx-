local QBCore = exports['qb-core']:GetCoreObject()

local function PullRepo()
    CreateThread(function()
        local repoPath = 'C:/FXServer/txData/PursuitX/resources/[core]'
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


QBCore.Commands.Add("devpull", 'Pull the repo to live', {}, false, function(source)
    PullRepo()
    print('Repo has been pulled!')
end, 'god')