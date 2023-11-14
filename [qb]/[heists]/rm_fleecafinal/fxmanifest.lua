fx_version 'cerulean'
games { 'rdr3', 'gta5' }

lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
    'editable_server.lua',
	'server.lua'
}

client_scripts {
    'editable_functions.lua',
	'client.lua',
    'safecrack.lua',
    'fingerprint.lua'
}

escrow_ignore {
    'config.lua',
    'editable_functions.lua',
    'editable_server.lua',
    'server.lua'
}

ui_page 'movies/index.html'

files {
    'movies/script.js',
    'movies/style.css',
    'movies/blank.png',
    'movies/retro_intro.gif',
    'movies/retro_success.gif',
    'movies/retro_fail.gif',
    'movies/index.html',
}
dependency '/assetpacks'