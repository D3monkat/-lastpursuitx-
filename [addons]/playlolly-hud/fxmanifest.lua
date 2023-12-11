fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly HUD'
description 'Join our Discord Server: discord.playlolly.net'
author 'Playlolly'
version '1.0.2'

dependency {'playlolly-core'}

escrow_ignore {'config.lua'}

shared_script {'config.lua'}

server_script {'server/**.lua'}

client_script {'client/main.lua', 'client/functions.lua', 'client/nui.lua'}

ui_page 'files/nui/index.html'

files {'files/**.html', 'files/**.css', 'files/**.js', 'files/**.png'}

dependency '/assetpacks'