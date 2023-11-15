fx_version 'adamant'
game 'gta5'

files {
    'data/*.meta'
}

author 'TRClassic'

description 'Police Crown Vic'

version '1.1'

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

escrow_ignore {
    'stream/*.ytd',
    'stream/tr_pdvic_sticker_200.yft',
    'stream/tr_pdvic_sticker_201.yft',
    'stream/tr_pdvic_sticker_202.yft',
    'stream/tr_pdvic_sticker_203.yft',
    'stream/tr_pdvic_sticker_204.yft',
    'stream/tr_pdvic_sticker_205.yft',
    'stream/tr_pdvic_sticker_206.yft',
    'stream/tr_pdvic_sticker_207.yft',
    'stream/tr_pdvic_sticker_208.yft',
    'stream/tr_pdvic_sticker_209.yft',
    'stream/tr_pdvic_sticker_210.yft',
    'stream/tr_pdvic_sticker_211.yft',
    'stream/tr_pdvic_sticker_212.yft',
    'stream/tr_pdvic_sticker_213.yft',
    'veh_names.lua'
}

client_script 'veh_names.lua'
server_script 'veh_data.lua'

lua54 'yes'
dependency '/assetpacks'