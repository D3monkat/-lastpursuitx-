local QBCore = exports[Config.CoreName]:GetCoreObject()

function AlertCops()
    exports['ps-dispatch']:PacificBankRobbery()
end

function HasItem(item)
    local has = QBCore.Functions.HasItem(item)
    return has
end

function Minigame(type)
    local success = nil
    if type == 'lightout' then
        success = exports['lightsout']:StartLightsOut(Config.MiniGames['lightout'].grid, Config.MiniGames['lightout'].maxClicks) -- Minigame for lightout
    elseif type ==  'memorygame-access' or type == 'memorygame-thermite' then
        exports["memorygame"]:thermiteminigame(Config.MiniGames[type].correctBlocks, Config.MiniGames[type].incorrectBlocks, Config.MiniGames[type].timetoShow, Config.MiniGames[type].timetoLose,
        function() success = true end, function() success = false end)
    elseif type == 'voltlab' then
        TriggerEvent('ultra-voltlab', Config.MiniGames['voltlab'].time, function(result,reason)
            if result == 1 then success = true else success = false end
        end)
    elseif type == 'laptophack' then
        exports['hacking']:OpenHackingGame(Config.MiniGames['laptophack'].puzzleDuration, Config.MiniGames['laptophack'].puzzleLength, Config.MiniGames['laptophack'].puzzleAmount, function(result) 
            success = result
        end)
    elseif type == 'safecracker' then
        local code = {}
        for i=1,Config.MiniGames['safecracker'].combination,1 do
            table.insert(code, math.random(0,99))
        end
        success = exports["pd-safe"]:createSafe(code)
    elseif type == 'numbers' then
        success = exports['numbers']:StartNumbersGame(Config.MiniGames['numbers'].numbersLength, Config.MiniGames['numbers'].timer, Config.MiniGames['numbers'].showTime)
    elseif type == 'varhack' then
        exports['varhack']:OpenHackingGame(function(result)
            success = result
        end, Config.MiniGames['varhack'].blocks, Config.MiniGames['varhack'].speed)
    elseif type == 'password' then
        local dialog = exports['qb-input']:ShowInput({
            header = "Access-Code",
            submitText = "Submit",
            inputs = {
                {
                    text = "Input access-code", -- text you want to be displayed as a place holder
                    name = "code", -- name of the input should be unique otherwise it might override
                    type = "password", -- type of the input
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    -- default = "password123", -- Default text option, this is optional
                }
            },
        })
        if dialog ~= nil then
            success = dialog.code
        else 
            success = false
        end

    end
    while success == nil do
        Wait(100)
    end
    return success
end
