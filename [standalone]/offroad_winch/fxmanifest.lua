fx_version 'cerulean'

game 'gta5'
lua54 'yes'

name "Space101-Winch"
description "Realistic offroad winch for vehicles."
author "Space101 Team"
version "1.0.0"

escrow_ignore {
  "config.lua",
  'lang.lua',
  'About.txt'
}

shared_scripts {
  'config.lua'
}

client_script {
    "config.lua",
    'lang.lua',
    'client/*.lua'
}

server_scripts {
	'server/*.lua',
}
dependency '/assetpacks'