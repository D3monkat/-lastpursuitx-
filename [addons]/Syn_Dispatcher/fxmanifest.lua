lua54 'yes'
fx_version 'cerulean'
game 'gta5'

author 'entarukun'
description 'Advanced dispatching system'
version '1.0'

ui_page 'html/form.html'

files {
    'html/form.html',
	'html/script.js',
    'sounds/*.ogg',
    'sounds/*.wav',
}

client_scripts{
    'config.lua',
    'client/main.lua',
    'client/edit.lua',
}

server_scripts{
    'config.lua',
    'server/main.lua',
}




escrow_ignore {
  'config.lua',

  'html/form.html',
  'html/script.js',

  'client/edit.lua',
  'server/main.lua',
}

dependency '/assetpacks'