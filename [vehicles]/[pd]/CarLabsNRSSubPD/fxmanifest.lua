fx_version 'cerulean'
games {'gta5'}

author 'CarLabs Development https://discord.gg/U2y34bkuqS'
description 'Made by CarLabs#6265'


data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'

data_file 'AUDIO_SYNTHDATA' 'audioconfig/lg100rptorv8_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/lg100rptorv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/lg100rptorv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_lg100rptorv8'

lua54 'yes'


files {
  'vehiclelayouts.meta',
  'handling.meta',
  'vehicles.meta',
  'carcols.meta',
  'carvariations.meta',
  'audioconfig/*.dat151.rel',
  'audioconfig/*.dat54.rel',
  'sfx/**/*.awc',
}

client_script 'vehicle_names.lua'

escrow_ignore {
  'vehiclelayouts.meta',
  'handling.meta',
  'vehicles.meta',
  'carcols.meta',
  'carvariations.meta',
  'vehicle_names.lua',
  'stream/*.ytd',
  'stream/polcharger_livery1.yft',
  'stream/polcharger_livery2.yft',
  'stream/polcharger_livery3.yft',
  'stream/polcharger_livery4.yft',
  'stream/polcharger_livery5.yft',
  'stream/polcharger_livery6.yft',
  'stream/polcharger14_livery1.yft',
  'stream/polcharger14_livery2.yft',
  'stream/polcharger14_livery3.yft',
  'stream/poldurango_livery1.yft',
  'stream/poldurango_livery2.yft',
  'stream/poldurango_livery3.yft',
  'stream/polexplorer_livery1.yft',
  'stream/polexplorer_livery2.yft',
  'stream/polexplorer_livery3.yft',
  'stream/polram_livery1.yft',
  'stream/polram_livery2.yft',
  'stream/polram_livery3.yft',
  'stream/polvictoria_livery1.yft',
  'stream/polvictoria_livery2.yft',
  'stream/polvictoria_livery3.yft',
  'stream/polmustang_livery1.yft',
  'stream/polmustang_livery2.yft',
  'stream/polmustang_livery3.yft',
  'stream/polmustang24_livery1.yft',
  'stream/polmustang24_livery2.yft',
  'stream/polmustang24_livery3.yft',
  'stream/polchallenger_livery1.yft',
  'stream/polchallenger_livery2.yft',
  'stream/polchallenger_livery3.yft',
  'stream/poltaurus_livery1.yft',
  'stream/poltaurus_livery2.yft',
  'stream/poltaurus_livery3.yft',
  'stream/poltahoe_livery1.yft',
  'stream/poltahoe_livery2.yft',
  'stream/poltahoe_livery3.yft',
  'stream/polvette_livery1.yft',
  'stream/polvette_livery2.yft',
  'stream/polvette_livery3.yft',
  'stream/polbike_livery1.yft',
  'stream/polbike_livery2.yft',
  'stream/polbike_livery3.yft',
  'stream/polbike2_livery1.yft',
  'stream/polbike2_livery2.yft',
  'stream/polbike2_livery3.yft',
  'stream/polbike3_livery1.yft',
  'stream/polbike3_livery2.yft',
  'stream/polbike3_livery3.yft',
  'stream/polmache_livery1.yft',
  'stream/polmache_livery2.yft',
  'stream/polmache_livery3.yft',
  'stream/polgt4rs_livery1.yft',
  'stream/polgt4rs_livery2.yft',
  'stream/polgt4rs_livery3.yft',
  'stream/poltahoe21_livery1.yft',
  'stream/poltahoe21_livery2.yft',
  'stream/poltahoe21_livery3.yft',
  'stream/polcamaro_livery1.yft',
  'stream/polcamaro_livery2.yft',
  'stream/polcamaro_livery3.yft',
  'stream/polraptor_livery1.yft',
  'stream/polraptor_livery2.yft',
  'stream/polraptor_livery3.yft',
  'stream/polsilverado_livery1.yft',
  'stream/polsilverado_livery2.yft',
  'stream/polsilverado_livery3.yft',
}
dependency '/assetpacks'