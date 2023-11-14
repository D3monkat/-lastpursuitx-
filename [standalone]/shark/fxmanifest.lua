fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script 'config.lua'

client_scripts { 
	'@es_extended/imports.lua', -- Uncomment if using esx
	'client/*.lua',
}

server_scripts { 
	'@es_extended/imports.lua', -- Uncomment if using esx
	'server/*.lua',
}

escrow_ignore {
	'config.lua',
	'server/*.lua',
	'client/*.lua',
}

dependency '/assetpacks'