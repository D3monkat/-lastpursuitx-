resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

files {
	'audioconfig/r35sound_game.dat151.rel',
	'audioconfig/r35sound_sounds.dat54.rel',
	'sfx/dlc_r35sound/r35sound.awc',
	'sfx/dlc_r35sound/r35sound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/r35sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/r35sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_r35sound'

client_script {
    'vehicle_names.lua'
}