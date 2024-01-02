fx_version 'bodacious'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--

Author 'Ayazwai#3900 - Wais Development'
version '1.0.2'
scriptname 'wais-npcdialog'

--[[ Resource Information ]]--

client_scripts {'config.lua','client.lua'}

server_script 'server.lua'

escrow_ignore {
    'config.lua',
}

ui_page "html/dist/index.html"
files {
    'html/dist/*.js',
    'html/dist/index.html',

    'html/public/*.png',
    'html/public/*.json',
    'html/public/css/*.*',
    'html/public/fonts/*.*',
    'html/public/weapons/*.*',
    'html/public/menu-items/*.*',
    'html/public/notification/*.*',
    'html/public/carhud-images/*.*',
}
dependency '/assetpacks'