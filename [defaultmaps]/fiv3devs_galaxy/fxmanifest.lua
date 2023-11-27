fx_version 'adamant'
games {'gta5'}
this_is_a_map 'yes'
lua54 'yes'

author 'Fiv3Devs'
description 'Galaxy Nightclub'
version '1.0.4'


client_script {
  'entitysets.lua',
  'client.lua'
 }
 
data_file 'AUDIO_GAMEDATA' 'audio/int_nightclub_game.dat' -- dat151
data_file 'AUDIO_DYNAMIXDATA' 'audio/int_nightclub_mix.dat' -- dat15

files {
  'audio/int_nightclub_game.dat151.rel',
  'audio/int_nightclub_mix.dat15.rel',
}


escrow_ignore {
  'entitysets.lua'
}
dependency '/assetpacks'