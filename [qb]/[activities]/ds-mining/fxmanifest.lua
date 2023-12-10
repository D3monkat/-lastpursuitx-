fx_version 'cerulean'
game 'gta5'

description 'mining'
version '1.1'


shared_scripts {
    'config.lua',
    'language.lua'
}

client_scripts {
    '@ox_lib/init.lua',
    'client/client.lua',
    'client/standlone.lua',
}

server_scripts {
	'server/server.lua',
	'server/standlone.lua'
}

escrow_ignore {
    'config.lua',
    'language.lua',
    'client/standlone.lua',
    'server/standlone.lua',
    'server/server.lua',
}


lua54 'yes'


dependency '/assetpacks'