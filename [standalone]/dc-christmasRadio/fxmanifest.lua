fx_version 'cerulean'
game 'gta5'

lua54 'yes'

shared_script 'config.lua'
client_script 'client.lua'

files {
	'data/christmassongs_sound.dat54.rel',
	'data/christmassongs_game.dat151.rel',
	'songdirectory/*.awc',
}

data_file 'AUDIO_WAVEPACK' 'songdirectory'
data_file 'AUDIO_SOUNDDATA' 'data/christmassongs_sound.dat'
data_file 'AUDIO_GAMEDATA' 'data/christmassongs_game.dat'
