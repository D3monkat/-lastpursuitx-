fx_version 'adamant'
version '1.3'
game 'gta5'
author 'CodeStudio'
description 'Code Studio Boss Menu'

ui_page 'ui/index.html'

server_scripts {'@oxmysql/lib/MySQL.lua', 'main/server.lua', 'config/server_function.lua'}
client_scripts {'main/client.lua'}

shared_scripts {'@ox_lib/init.lua', 'config/config.lua', 'config/language.lua', 'main/function.lua'}

files {'ui/**'}

escrow_ignore {'config/*.lua'}

dependencies {
    'oxmysql',
    'ox_lib',
}

lua54 'yes'
dependency '/assetpacks'