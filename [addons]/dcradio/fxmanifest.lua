fx_version 'cerulean'
game 'gta5'

lua54 'yes'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

files {
	'data/dlccustomsongs_sound.dat54.rel',
	'data/dlccustomsongs_game.dat151.rel',
	'songdirectory/*.awc',
}

data_file 'AUDIO_WAVEPACK' 'songdirectory'
data_file 'AUDIO_SOUNDDATA' 'data/dlccustomsongs_sound.dat'
data_file 'AUDIO_GAMEDATA' 'data/dlccustomsongs_game.dat'

escrow_ignore {
	'config.lua'
}
dependency '/assetpacks'