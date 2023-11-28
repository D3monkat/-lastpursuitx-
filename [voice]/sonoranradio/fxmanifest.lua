-- Release fxmanifest.lua --
fx_version 'cerulean'
game 'gta5'

author 'Sonoran Software Systems LLC'
description 'Sonoran Radio FiveM Integration'
version '1.6.2'

shared_scripts {
    'config.lua',
    'lua/**/sh_*.lua'
}

server_scripts {
    'lua/**/sv_*.lua',
    'lua/update/unzip.js',
    'lua/update/updater.lua'
}

client_scripts {
    'lua/**/cl_*.lua'
}

-- setup for nui
files {
    'dist/**/*',
    'static/**/*'
} 
ui_page 'dist/ui.html'

-- setup for streamed files
files {
    'data/vehicles.meta',
    'data/carvariations.meta',
}
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/prop_radio_tower.ytyp'
