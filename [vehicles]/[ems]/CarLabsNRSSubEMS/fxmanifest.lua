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
  'stream/emstahoe21_livery1.yft',
  'stream/emstahoe21_livery2.yft',
  'stream/emstahoe21_livery3.yft',
  'stream/emsambulance_livery1.yft',
  'stream/emsambulance_livery2.yft',
  'stream/emsambulance_livery3.yft',
  'stream/emscharger_livery1.yft',
  'stream/emscharger_livery2.yft',
  'stream/emscharger_livery3.yft',
  'stream/emsexplorer_livery1.yft',
  'stream/emsexplorer_livery2.yft',
  'stream/emsexplorer_livery3.yft',
  'stream/emsraptor_livery1.yft',
  'stream/emsraptor_livery2.yft',
  'stream/emsraptor_livery3.yft',
}
dependency '/assetpacks'