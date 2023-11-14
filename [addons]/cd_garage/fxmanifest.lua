fx_version 'cerulean'
game 'gta5'
author 'discord.gg/codesign'
description 'Garage'
version '4.3.3'
lua54 'yes'

shared_scripts {
    'configs/locales.lua',
    'configs/config.lua',
    --'@ox_lib/init.lua' --⚠️PLEASE READ⚠️; Uncomment this line if you use 'ox_lib'.⚠️
}

client_scripts {
    'client/**/*.lua',
    'configs/client_customise_me.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', --⚠️PLEASE READ⚠️; Remove this line if you don't use 'mysql-async' or 'oxmysql'.⚠️
    'configs/server_customise_me.lua',
    'configs/server_webhooks.lua',
    'server/**/*.lua'
}

ui_page {
    'html/index.html'
}
files {
    'configs/locales_ui.js',
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/js/doorLock.js',
    'html/images/logos/*.png',
    'html/sound/door_lock.wav'
}

exports {
    'GetGarageType',
    'GetAdvStats',
    'GetVehiclesData',
    'GetKeysData',
    'DoesPlayerHaveKeys',
    'GetPlate',
    'GetConfig'
}

server_exports {
    'GetGarageLimit',
    'GetGarageCount',
    'GetMaxHealth',
    'CheckVehicleOwner',
    'GetConfig',
    'GetVehiclesData'
}

dependencies {
    '/server:4960', -- ⚠️PLEASE READ⚠️; Requires at least server build 4960.
    'cd_drawtextui', --⚠️PLEASE READ⚠️; Remove this line if you don't use 'cd_drawtextui' and you have already edited the code accordingly.⚠️
    'cd_garageshell'
}

provide 'qb-garage'

escrow_ignore {
    'client/main/functions.lua',
    'client/other/*.lua',
    'configs/*.lua',
    'dependencies/cd_garageshell/stream/*.ytyp',
    'dependencies/cd_garageshell/stream/*.ydr',
    'dependencies/cd_garageshell/stream/*.ytd',
    'server/main/version_check.lua',
    'server/main/auto_sql_insert.lua',
    'server/other/*.lua'
}

dependency '/assetpacks'