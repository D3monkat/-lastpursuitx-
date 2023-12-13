fx_version 'adamant'

games { 'gta5' }

lua54 'on'

author 'w204dude#6462'
description 'w204s Mustang GTD - Beta Vehicle'
repository 'https://discord.gg/z6V8HE3566'

files {
	'data/**/vehiclelayouts.meta',
    'data/**/vehicles.meta',
    'data/**/carvariations.meta',
    'data/**/carcols.meta',
    'data/**/handling.meta'

}



data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'




client_script {
    'vehicle_names.lua'
}
dependency '/assetpacks'
dependency '/assetpacks'