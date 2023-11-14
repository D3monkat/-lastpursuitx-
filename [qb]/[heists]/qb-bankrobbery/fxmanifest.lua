fx_version 'cerulean'
game 'gta5'

author "Renewed Scripts | FjamZoo#0001"
description 'Bankrobbery System for QBCore'
version '1.0.0'

lua54 'yes'

shared_script { 
	'config.lua',
	--'@qb-core/import.lua', -- If you use a old core then use this and set config to "old" in versions
}

client_scripts {
	'client/cl_fleeca.lua',
	'client/cl_paleto.lua',
	'client/cl_pacific.lua',
	'client/cl_lowervault.lua',
	'client/drilling.lua',
	'client/doorlocks.lua',
	'client/cl_target.lua',
	'client/cl_powerplants.lua',
	'client/open.lua',
	'client/cl_paletosecond.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/main.lua',
	'server/secret.lua',
	'server/open.lua',
} 

escrow_ignore {
	'config.lua',
	'server/*.lua',
	'client/*.lua'
}


dependency '/assetpacks'