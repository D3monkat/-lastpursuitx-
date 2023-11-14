-- polat
fx_version 'cerulean'
game 'gta5'
name 'plt_farmerjob'
version '1.1.8'
description 'Fivem Job Script'
author 'p0lat'
contact 'pltrdgms@hotmail.com'
discord 'https://discord.gg/3h8tebmBeD'
lua54 'yes'

server_scripts {
	'locale.lua',
	'config.lua',
	'server.lua',
	'lockedserver.lua',
}

client_scripts {
	'@menuv/menuv.lua',--if you want to use esx menu delete this set comment line here
	'locale.lua',
	'config.lua',
	'client.lua',
	'lockedclient.lua',
}

escrow_ignore {
	'locale.lua',
	'config.lua',
	'client.lua',
	'server.lua',
  }


dependency '/assetpacks'