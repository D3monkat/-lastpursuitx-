fx_version 'cerulean'
game 'gta5'

description 'dream-pager'
author 'DreamScripts Dkal'
version '1.0.0'

shared_scripts {
	'config.lua',
}

client_scripts {
    'client/cl_callbacks.lua',
    'client/client.lua',
}

server_scripts {
    'server/server_callbacks.lua',
    'server/server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/assets/alert.svg',
    'html/assets/pager.png',
    'html/assets/tones.wav',
}

escrow_ignore {
    'client/cl_callbacks.lua',
    'client/client.lua',
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/assets/alert.svg',
    'html/assets/pager.png',
    'html/assets/tones.wav',
    'server/server_callbacks.lua',
    'server/server.lua',
    'config.lua',
}


lua54 'yes'
dependency '/assetpacks'