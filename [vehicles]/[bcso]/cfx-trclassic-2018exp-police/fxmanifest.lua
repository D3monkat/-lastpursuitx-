fx_version 'adamant'
game 'gta5'

files {
    'data/*.meta'
}

author 'TRClassic'

description 'Police EXP'

version '1.0'

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

escrow_ignore {
    'stream/*.ytd',
    'stream/tr_pdexp_sticker_001.yft',
    'stream/tr_pdexp_sticker_002.yft',
    'stream/tr_pdexp_sticker_003.yft',
    'stream/tr_pdexp_sticker_004.yft',
    'stream/tr_pdexp_sticker_005.yft',
    'stream/tr_pdexp_sticker_006.yft',
    'stream/tr_pdexp_sticker_007.yft',
    'stream/tr_pdexp_sticker_008.yft',
    'stream/tr_pdexp_sticker_009.yft',
    'stream/tr_pdexp_sticker_010.yft',
    'stream/tr_pdexp_sticker_011.yft',
    'stream/tr_pdexp_sticker_012.yft',
    'stream/tr_pdexp_sticker_013.yft',
    'stream/tr_pdexp_sticker_014.yft',
    'stream/tr_pdexp_sticker_015.yft',
    'stream/tr_pdexp_sticker_016.yft',
    'stream/tr_pdexp_sticker_017.yft',
    'stream/tr_pdexp_sticker_018.yft',
    'stream/tr_pdexp_sticker_019.yft',
    'stream/tr_pdexp_sticker_020.yft',
    'stream/tr_pdexp_sticker_021.yft',
    'stream/tr_pdexp_sticker_022.yft',
    'stream/tr_pdexp_sticker_023.yft',
    'stream/tr_pdexp_sticker_024.yft',
    'stream/tr_pdexp_sticker_025.yft',
    'stream/tr_pdexp_sticker_026.yft',
    'stream/tr_pdexp_sticker_027.yft',
    'stream/tr_pdexp_sticker_028.yft',
    'stream/tr_pdexp_sticker_029.yft',
    'stream/tr_pdexp_sticker_030.yft',
    'stream/tr_pdexp_sticker_031.yft',
    'stream/tr_pdexp_sticker_032.yft',
    'stream/tr_pdexp_sticker_033.yft',
    'stream/tr_pdexp_sticker_034.yft',
    'stream/tr_pdexp_sticker_035.yft',
    'stream/tr_pdexp_sticker_036.yft',
    'stream/tr_pdexp_sticker_037.yft',
    'stream/tr_pdexp_sticker_038.yft',
    'stream/tr_pdexp_sticker_039.yft',
    'stream/tr_pdexp_sticker_040.yft',
    'stream/tr_pdexp_sticker_041.yft',
    'stream/tr_pdexp_sticker_042.yft',
    'stream/tr_pdexp_sticker_043.yft',
    'stream/tr_pdexp_sticker_044.yft',
    'stream/tr_pdexp_sticker_045.yft',
    'stream/tr_pdexp_sticker_046.yft',
    'stream/tr_pdexp_sticker_047.yft',
    'stream/tr_pdexp_sticker_048.yft',
    'stream/tr_pdexp_sticker_049.yft',
    'stream/tr_pdexp_sticker_050.yft',
    'veh_names.lua'
}

client_script 'veh_names.lua'
server_script 'veh_data.lua'

lua54 'yes'
dependency '/assetpacks'