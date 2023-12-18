fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'Playlolly Tesla Model X'
description 'Playlolly Tesla Vehicle Add-On including Tesla Model X (2016).'
author 'Playlolly'
version '1.0.6'

dependency {'playlolly-core'}

server_script {'server/**.lua'}

files {'files/**.meta'}

data_file 'HANDLING_FILE' 'files/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'files/**/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'files/**/carvariations.meta'

dependency '/assetpacks'