resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

files {
	'audioconfig/s15sound_game.dat151.rel',
	'audioconfig/s15sound_sounds.dat54.rel',
	'sfx/dlc_s15sound/s15sound.awc',
	'sfx/dlc_s15sound/s15sound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/s15sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/s15sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_s15sound'

client_script {
    'vehicle_names.lua'
}