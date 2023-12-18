fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly BMW i4'
description 'Join our Discord Server: discord.playlolly.net'
author 'Playlolly'
version '1.0.0'

dependency {'playlolly-core'}

server_script {'server/**.lua'}

files {'data/*.meta'}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

dependency '/assetpacks'