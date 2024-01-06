fx_version 'adamant'
game 'gta5'

files {
    'data/*.meta'
}

author 'TRClassic'

description 'Police Taurus'

version '1.0'

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

escrow_ignore {
    'stream/*.ytd',
    'stream/tr_pdtaurus_sticker_001.yft',
    'stream/tr_pdtaurus_sticker_002.yft',
    'stream/tr_pdtaurus_sticker_003.yft',
    'stream/tr_pdtaurus_sticker_004.yft',
    'stream/tr_pdtaurus_sticker_005.yft',
    'stream/tr_pdtaurus_sticker_006.yft',
    'stream/tr_pdtaurus_sticker_007.yft',
    'stream/tr_pdtaurus_sticker_008.yft',
    'stream/tr_pdtaurus_sticker_009.yft',
    'stream/tr_pdtaurus_sticker_010.yft',
    'veh_names.lua'
}

client_script 'veh_names.lua'
server_script 'veh_data.lua'

lua54 'yes'
dependency '/assetpacks'