fx_version 'cerulean'
game 'gta5'
author 'discord.gg/codesign'
description 'Police Dispatch'
version '4.2.5'
lua54 'yes'

shared_scripts {
    'configs/locales.lua',
    'configs/config.lua'
}

client_scripts {
    'configs/client_customise_me.lua',
    'client/**/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', --⚠️PLEASE READ⚠️; Remove this line if you don't use 'mysql-async' or 'oxmysql'.⚠️
    'configs/server_customise_me.lua',
    'server/**/*.lua'
}

ui_page {
    'html/index.html'
}
files {
    'configs/locales_ui.js',
    'configs/config_ui.js',
    'html/index.html',
    'html/css/*.css',
    'html/images/*.png',
    'html/images/*.svg',
    'html/images/*.jpg',
    'html/**/*.js',
    'html/js/libraries/*.js',
    'html/sound/*.wav'
}

exports {
    'GetPlayerInfo',
    'GetPlayerNotifications',
    'GetPlayersDispatchData',
    'GetConfig',
}

server_exports {
    'GetPlayersDispatchData',
    'GetConfig',
}


dependency '/server:4960' -- ⚠️PLEASE READ⚠️; Requires at least server build 4960.

escrow_ignore {
    'client/main/functions.lua',
    'client/other/*.lua',
    'configs/*.lua',
    'server/main/version_check.lua',
    'server/main/auto_sql_insert.lua',
    'server/other/*.lua'
}
dependency '/assetpacks'