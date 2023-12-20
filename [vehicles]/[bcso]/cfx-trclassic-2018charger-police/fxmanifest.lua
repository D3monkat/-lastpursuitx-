fx_version 'cerulean'
game 'gta5'

files {
    'data/*.meta'
}

author 'TRClassic'

description 'Police Charger + Widebody'

version '1.0'

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

client_scripts {
    'veh_names.lua'
}


escrow_ignore {
    'stream/*.ytd',
    'veh_names'
}

server_script 'veh_data.lua'

lua54 'yes'
dependency '/assetpacks'