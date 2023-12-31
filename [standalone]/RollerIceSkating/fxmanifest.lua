----------------------- [ MenuV ] -----------------------
-- GitHub: https://github.com/ThymonA/menuv/
-- License: GNU General Public License v3.0
--          https://choosealicense.com/licenses/gpl-3.0/
-- Author: Thymon Arens <contact@arens.io>
-- Name: MenuV
-- Version: 1.0.0
-- Description: FiveM menu libarary for creating menu's
----------------------- [ MenuV ] -----------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version '1.0.0'
author 'Sarish for Patamods'
contact 'https://discord.gg/zmQgVe7'



-- ui_page 'dist/menuv.html'
server_scripts {
	"server.lua"

}

client_scripts {
    "config.lua",
    'client.lua'
}


escrow_ignore {
	"server.lua",
    "config.lua",
    'client.lua',
	'config.lua'
 }
dependency '/assetpacks'