fx_version 'cerulean'
lua54 'yes'
game 'gta5'
this_is_a_map 'yes'

name 'Playlolly Elon Store'
description 'Join our Discord Server: discord.playlolly.net'
author 'Playlolly'

version '1.0.1'

dependency {'playlolly-core'}

escrow_ignore {'config.lua'}

shared_script {'config.lua'}

client_script {'client/**.lua'}

server_script {'server/**.lua'}

data_file 'DLC_ITYP_REQUEST' 'stream/assets/playlollydealer.ytyp'

dependency '/assetpacks'