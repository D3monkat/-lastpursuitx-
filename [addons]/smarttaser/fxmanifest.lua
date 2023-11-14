fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'An updated and realistic taser framework experience'
version '1.0.0'
lua54 'yes'

client_scripts {
    'config.lua',
    'cl_utils.lua',
    'cl_smarttaser.lua',
}

server_scripts {
    -- "@vrp/lib/utils.lua",
    'config.lua',
    'sv_utils.lua',
    'sv_smarttaser.lua', 
}

shared_script '@es_extended/imports.lua'

files {
    'sounds/index.html',
    'sounds/*.ogg',
    '*.meta',
}

ui_page 'sounds/index.html'

escrow_ignore {
    'stream/*.ytd',
    'cl_utils.lua',
    'sv_utils.lua',
    'config.lua',
    'sounds/**',
    '*.meta',
}

data_file 'WEAPONINFO_FILE' '*.meta'

export 'enableSafety'
export 'enableLaser'
export 'enableFlash'
dependency '/assetpacks'