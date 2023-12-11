fx_version 'cerulean'
games {'gta5'}

this_is_a_map 'yes'

lua54 'yes'

before_level_meta 'roxpop.meta'

client_scripts
{
    'water.lua',
	'streetnames.lua',
	'birdheight.lua'
}

file 'roxpop.meta'
file 'roxwood_game.dat151.rel'
file 'water.xml'
file 'heightmap.dat'
file 'stream/amb_rox_stage_1_lod/amb_rox_stage_1_lod.ytyp'
file 'stream/amb_rox_01/amb_rox_01.ytyp'
file 'gtxd.meta'
file 'popzonerox.ipl'
file 'zonebind.ymt'

data_file 'AUDIO_GAMEDATA' 'roxwood_game.dat'
data_file 'DLC_ITYP_REQUEST' 'stream/amb_rox_01/amb_rox_01.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/amb_rox_stage_1_lod/amb_rox_stage_1_lod.ytyp'
data_file 'GTXD_PARENTING_DATA' 'gtxd.meta'
data_file 'ZONEBIND_FILE' 'zonebind.ymt'

dependency '/assetpacks'