fx_version "cerulean"
games { 'gta5' }

author 'G&N_s Studio'
description 'Mount_Zonah'
version '1.4.2'

dependencies {
    '/server:4960',
    '/gameBuild:2189',
    'cfx_gn_ambulance_garage'
}

this_is_a_map 'yes'

escrow_ignore {
    'stream/**/*.ytd',
    'stream/exterior/*.ydr',
    'stream/interior/emergency/gus_hos_main_sign.ydr',
    'stream/exterior/*.ymap',
}
dependency '/assetpacks'