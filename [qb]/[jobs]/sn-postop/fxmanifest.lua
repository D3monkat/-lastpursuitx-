fx_version 'cerulean'
game 'gta5'

name "Sunny Dev - PostOp"
author "Q4D"
version "1.3.2"

server_scripts {
    'server/main.lua',
    'server/functions.lua',
}


shared_scripts {
	'@qb-core/shared/locale.lua',
    'Lang/en.lua', -- change en to your language
	'config.lua'}
client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua'
}

escrow_ignore {
    'client/function.lua',  -- Only ignore one file
    'server/functions.lua',  -- Only ignore one file
    'config.lua',
    'README.MD',
    'Lang/*.lua'
}

lua54 'yes'

dependency '/assetpacks'