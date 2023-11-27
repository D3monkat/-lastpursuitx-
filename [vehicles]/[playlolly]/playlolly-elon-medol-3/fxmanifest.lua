fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly Elon Medol 3'
description 'Join our Discord Server: discord.playlolly.net'
author 'Playlolly'
version '1.0.5'

dependency {'playlolly-core'}

server_script {'server/**.lua'}

files {'data/*.meta'}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'

dependency '/assetpacks'