fx_version 'cerulean'
games { 'gta5' }

author 'tunasayin'
description 'Loading screen with a modern elegant UI.'
version '1.0.0'

shared_script 'config.lua'

loadscreen 'UI/index.html'

loadscreen_cursor 'yes'

server_script 'Server/*.lua'

lua54 'yes'

files {
    'UI/index.html',
    'UI/styles/*.css',
    'UI/scripts/*.js',
    'UI/images/**/*.png',
    'UI/images/**/*.svg',
}

escrow_ignore {
    'config.lua',
    'Server/*.lua',
    'UI/index.html',
    'UI/styles/*.css',
    'UI/scripts/*.js',
    'UI/images/**/*.png',
    'UI/images/**/*.svg',
}
dependency '/assetpacks'