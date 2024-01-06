fx_version 'cerulean'
game 'gta5'

author 'TRClassic'

description 'Police Mustang'

version '1.1'

files {
    'data/*.meta'
}


data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

escrow_ignore {
    'stream/*.ytd',
    'veh_names.lua'
}


 client_script 'veh_names.lua'
 server_script 'veh_data.lua'

lua54 'yes'

dependency '/assetpacks'