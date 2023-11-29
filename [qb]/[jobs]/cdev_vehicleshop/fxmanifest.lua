fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'cDev Development Team'
description 'A fully featured vehicle dealership resource'
version '2.0.3'

client_scripts {
    -- Dependencies
    '@cdev_lib/shared/external.lua',

    -- Public scripts
    'shared/misc.lua',
    'public/config/config.lua',
    'public/client/api.lua',

    -- Escrowed scripts
    'client/main.lua',
    'data/languages/*.lua',
    'client/utils.lua',
    'client/shop.lua',
    'client/creator.lua',
}

server_scripts {
    -- Dependencies
    '@cdev_lib/shared/external.lua',

    -- Public scripts
    'shared/misc.lua',
    'public/config/config.lua',
    'public/server/api.lua',

    -- Escrowed scripts
    'server/main.lua',
    'server/job.lua',
    'server/thumbnail_server.lua',
    'data/languages/*.lua',
}

escrow_ignore {
    'public/config/config.lua',
    'public/client/api.lua',
    'public/server/api.lua',
    'data/languages/*.lua',
}

dependencies {
    '/server:4752',
    'cdev_lib',
}

dependency '/assetpacks'