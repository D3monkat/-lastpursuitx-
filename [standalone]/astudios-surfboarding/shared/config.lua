Config = {}
Config.Debug = false -- True / False for Debug System

-- Notifications
Config.NotificationType = { -- 'qbcore' / 'astudios'
    server = 'astudios',
    client = 'astudios' 
}

-- Settings
Config.BoardItem = 'surfboard'

Config.Language = {
    Progressbar = {
        ['placing'] = 'Placing Surfboard...',
        ['removing'] = 'Removing Surfboard...',
    },
    Error = {
        ['too_far_or_in_use'] = 'Too far from the surfboard or someone is using it',
    }
}