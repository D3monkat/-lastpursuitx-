-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝
                                                                                          
fx_version 'cerulean'
game 'gta5'
author 'Apex Studios'
description 'Apex Studios | Libary'
version '1.1.1'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
    'config.lua',
}

client_scripts {
    'client/main.lua',
    'client/functions.lua',
    'client/exports.lua',
    'client/builtin/overlay.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/functions.lua',
    'server/exports.lua',
    'server/builtin/overlay.lua',
} 

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/assets/**/*.css',
    'html/assets/**/*.js',
}

escrow_ignore {
    'html/index.html',
    'html/assets/**/*.css',
    'html/assets/**/*.js',
    'config.lua'
}
dependency '/assetpacks'