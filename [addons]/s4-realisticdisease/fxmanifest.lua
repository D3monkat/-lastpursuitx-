lua54 'yes'
fx_version 'cerulean'
game 'gta5'


client_scripts { 'config.lua', 'client.lua'  }
server_scripts { '@mysql-async/lib/MySQL.lua', 'config.lua', 'server.lua'  }

ui_page 'index.html'

files {
    'index.html',
    'style.css',
    's4.js',
    '*.ttf',
    '*.woff',
    '*.woff2',
    'Human/*.png',
    'items/*.png',
}

shared_scripts {
    '@ox_lib/init.lua',
}


-- lua54 "yes"

escrow_ignore {
    'config.lua', 'client.lua' , 'server.lua', 'config.lua'
} 

-- dependency '/assetpacks'


dependency '/assetpacks'