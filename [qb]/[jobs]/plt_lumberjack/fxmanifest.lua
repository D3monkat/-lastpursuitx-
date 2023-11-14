fx_version 'cerulean'
game 'gta5'
name 'PLT Lumberjack Jobs'
version '1.1'
description 'Fivem Lumberjack Jobs'
author 'p0lat'
contact 'polaterdogmus@hotmail.com'
discord 'https://discord.gg/3h8tebmBeD'
website 'https://polat.tebex.io/'
tutorial'https://polat.gitbook.io/'
lua54 'yes'
ui_page {'html/ui.html'}
files {
	'html/ui.html',
	'html/app.js', 
	'html/style.css',
	'html/img/*.*',
	'html/sounds/*.*',
	'html/*.ttf'
}
shared_script {
	'locals/*.lua',
	'config.lua',
	--'@vrp/lib/utils.lua',-- That line for vrp, If you are not using vrp, do not activate it.
}
server_scripts {
	'server/server.lua',
	'server/locked.lua',
}
client_scripts {
	'client/client.lua',
	'client/locked.lua',
	'client/clothing.lua',
	'client/jobs.lua',
	'client/other.lua',
}
escrow_ignore {
	'locals/*.lua',
	'config.lua',
	'client/client.lua',
	'client/clothing.lua',
	'client/other.lua',
	'client/jobs.lua',
	'server/server.lua',
}


dependency '/assetpacks'