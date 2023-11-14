version '2.3'

author 'jaksam1074'

client_scripts {
    -- Utils
    'utils/sh_utils.lua',

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Dialogs
    "utils/dialogs/**/cl_*.lua",

    -- Callbacks
    "callbacks/cl_callbacks.lua",

    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/cl_integrations.lua',

    -- Actual client files
    "client/main.lua",
    "client/menu.lua",
}

server_scripts {
    -- Warnings
    "utils/warnings/sv_*.lua",

    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Callbacks
    "callbacks/sv_callbacks.lua",
    
    -- Integrations
    'integrations/sh_integrations.lua',
    'integrations/sv_integrations.lua',

    -- Utils
    "utils/sv_utils.lua",
    'utils/sh_utils.lua',

    -- Settings
    "utils/settings/sv_settings.lua",

    -- Dialogs
    "utils/dialogs/**/sv_*.lua",

    -- Locales
    'locales/*.lua',

    -- Actual server files
    "server/menu.lua",
    "server/server.lua",
    "server/deferrals.lua",
    "server/steam.lua",
    "server/discord.lua",
    "server/commands.lua",
    "server/queue.lua",
    "server/queue_priority.lua",
    "server/reserved_slots.lua",
    "server/external_informations.lua",
    "server/database.lua"
}

ui_page 'html/index.html'

files {
    'html/menu_translations/*.json',
    'html/index.html',
    'html/index.js',
    'html/index.css',
    "utils/dialogs/**/*.js",
}

fx_version 'cerulean'
game 'gta5'

lua54 'yes' 

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

escrow_ignore {
    "locales/*.lua",
    "integrations/*.lua",

    "server/deferrals.lua",
}
dependency '/assetpacks'