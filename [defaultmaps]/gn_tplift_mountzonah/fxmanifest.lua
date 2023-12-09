fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description "Teleport lift resource G&N's Studio"
author "Dolu"
version '1.0.0'

client_scripts {
   'config.lua',

   'lib/rageui/RageUI.lua',
   'lib/rageui/Menu.lua',
   'lib/rageui/MenuController.lua',
   'lib/rageui/components/*.lua',
   'lib/rageui/elements/*.lua',
   'lib/rageui/items/*.lua',

   'client/client.lua',
   'client/menu.lua'
}

escrow_ignore {
   'config.lua',
   'lib/rageui/RageUI.lua',
   'lib/rageui/Menu.lua',
   'lib/rageui/MenuController.lua',
   'lib/rageui/components/*.lua',
   'lib/rageui/elements/*.lua',
   'lib/rageui/items/*.lua',
   'client/client.lua',
   'client/menu.lua'
}
dependency '/assetpacks'