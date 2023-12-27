fx_version 'bodacious'
game 'gta5'

author 'molo modding'
description 'SEWER'
version '1.0.0'

this_is_a_map 'yes'
lua54 'yes'

client_script {
    'client/*.lua',
    'config.lua'
}

escrow_ignore {
    'config.lua'
}   'models/props/molo_sewer_sewerplaque.ydr'
dependency '/assetpacks'