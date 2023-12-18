-- Configuration settings for the GPS system.
Config            = {}

-- Debug print setting for displaying debug messages.
Config.DebugPrint = false

-- Locale setting for language localization.
Config.Locale     = "en"

-- ("esx" | "qb") -- > The latest version is always used.
Config.FrameWork  = "esx"

-- ("esx_notify" | "qb_notify" | "custom_notify") -- > System to be used
Config.NotifyType = "esx_notify"

Config.Settings   = {
    StatusBars = {
        voice = {
            active = true
        },
        health = {
            active = true
        },
        armor = {
            active = true
        },
        hunger = {
            active = true
        },
        thirst = {
            active = true
        },
        stress = {
            active = false
        },
        terminal = {
            active = false
        },
        leaf = {
            active = false
        },
        oxygen = {
            active = true
        },
        stamina = {
            active = true
        },
    },
    VehicleHUD = {
        active = true,
        kmH = true -- true = kmH, false = mpH
    }
}

Config.HelpGuides = {
    [1] = {
        title = "Command: /hudclose <number>",
        description = "Hidden any hud element."
    },
    [2] = {
        title = "Command: /hudopen <number>",
        description = "Show any hud element."
    },
}
