
fx_version 'cerulean'
games { 'gta5' }

author 'TRClassic#0001'
description 'Pursuit Mode Script By TRClassic'
version '2.0.0'

shared_scripts {
	'shared/*.lua',
	'@ox_lib/init.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

escrow_ignore {
    'shared/sh_config.lua',
	'client/cl_police.lua',
    'server/sv_webhook.lua', -- Disabled atm
    'server/sv_webhook_link.lua', -- Disabled atm
    'readme.md'
}

lua54 'yes'
dependency '/assetpacks'