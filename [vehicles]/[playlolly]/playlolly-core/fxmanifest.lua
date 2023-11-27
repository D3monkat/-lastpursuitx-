fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly Core'
description 'Join our Discord Server: discord.playlolly.net'
author 'Playlolly'
version '1.0.5'

escrow_ignore {'config.lua'}

shared_script {'shared/locale.lua', 'config.lua'}

server_script {'server/main.lua', 'server/functions.lua'}

client_script {'client/main.lua', 'client/functions.lua', 'client/events.lua'}

ui_page 'files/nui/index.html'

files {'files/**.html', 'files/**.css', 'files/**.js', 'files/**.ogg'}

dependency '/assetpacks'