fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly Tesla Cybertruck & Cyberquad'
description 'Playlolly Tesla Vehicle Add-On including Tesla Cybertruck & Cyberquad (2022).'
author 'Playlolly'
version '1.0.8'

dependency {'playlolly-core'}

server_script {'server/**.lua'}

files {'data/*.meta'}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

dependency '/assetpacks'