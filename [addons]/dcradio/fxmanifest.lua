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
data_file 'DLC_ITYP_REQUEST' 'stream/[electric_nozzle]/electric_nozzle_typ.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[electric_charger]/electric_charger_typ.ytyp'

escrow_ignore {
	'config.lua'
}
dependency '/assetpacks'