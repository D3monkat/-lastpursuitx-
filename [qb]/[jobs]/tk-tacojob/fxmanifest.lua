fx_version 'cerulean'
game 'gta5'

description 'TK-TacoJob'
version '1.0.5'

shared_scripts {
    'config.lua',
}

server_scripts {
    'server.lua'
}

client_scripts {
	'client.lua'
}

escrow_ignore {
    'config.lua',
    'client.lua'
  }

lua54 'yes'

dependency '/assetpacks'