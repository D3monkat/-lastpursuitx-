fx_version 'cerulean'
game 'gta5'

description 'amir_expert#1911 - Spawn'

version '1.0.9'

shared_scripts {
	'config.lua',
	-- '@qb-apartments/config.lua' -- If you use ps-housing, comment this line
    '@ps-housing/shared/config.lua' -- If you use qb-houses, comment this line
}

client_script 'client.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/script.js',
	'html/reset.css',
	'html/*.png',
}

lua54 'yes'

escrow_ignore {
    'client.lua',
    'server.lua',
    'config.lua',
    'README.md',
    'LICENSE',
}
dependency '/assetpacks'