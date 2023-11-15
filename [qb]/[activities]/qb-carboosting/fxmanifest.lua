fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lionh34rt#4305'
description 'qb-carboosting using Ox resources'
version '4.0'

dependencies {
	'oxmysql',
	'ox_lib',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/sh_config.lua',
    'shared/locales.lua'
}

client_scripts {
    'client/cl_utils.lua',
    'client/cl_main.lua',
    'client/cl_boosting.lua',
    'client/cl_crushing.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_utils.lua',
    'server/sv_main.lua',
    'server/sv_boosting.lua',
    'server/sv_crushing.lua'
}

ui_page 'html/html/index.html'

files {
    'locales/*.json',
    'html/html/index.html',
    'html/css/reset.css',
    "html/css/bootstrap-grid.min.css",
    "html/css/bootstrap-reboot.min.css",
    "html/css/bootstrap.min.css",
    "html/js/bootstrap.bundle.min.js",
    "html/js/bootstrap.min.js",
    'html/js/app.js'
}

escrow_ignore {
    'shared/sh_config.lua',
    'shared/locales.lua',
    'locales/*.json',
    'client/cl_utils.lua',
    'client/cl_boosting.lua',
    'client/cl_crushing.lua',
    'server/sv_utils.lua',
    'server/sv_boosting.lua',
    'server/sv_crushing.lua'
}

dependency '/assetpacks'