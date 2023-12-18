fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly Tesla Model S'
description 'Playlolly Tesla Vehicle Add-On including Tesla Model S (2016).'
author 'Playlolly'
version '1.0.7'

dependency {'playlolly-core'}

server_script {'server/**.lua'}

files {'data/*.meta'}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

dependency '/assetpacks'