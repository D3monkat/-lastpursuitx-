fx_version 'adamant'
game 'gta5'

author 'TRClassic'

description 'EMS EXP'

version '1.0'

data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

files {
    'data/vehiclelayouts.meta',
    'data/handling.meta',
    'data/vehicles.meta',
    'data/carcols.meta',
    'data/carvariations.meta',
  }

escrow_ignore {
    'stream/*.ytd',
    'stream/tr_emsambo_name_1a.yft',
    'stream/tr_emsambo_name_2a.yft',
    'veh_names.lua'
}

client_script 'veh_names.lua'
server_script 'veh_data.lua'

lua54 'yes'
dependency '/assetpacks'