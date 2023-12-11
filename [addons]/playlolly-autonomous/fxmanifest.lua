fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly Autonomous'
description 'Join our Discord Server: discord.playlolly.net'
author 'Playlolly'
version '1.0.18'

dependency {'playlolly-core'}

escrow_ignore {'config.lua', 'locales/en.lua'}

shared_script {'config.lua', '@playlolly-core/shared/locale.lua', 'locales/en.lua'}

client_script {'client/main.lua', 'client/**.lua'}

server_script {'server/**.lua'}

ui_page 'files/nui/index.html'

files {'files/**.html', 'files/**.css', 'files/**.js', 'files/**.ogg'}

dependency '/assetpacks'