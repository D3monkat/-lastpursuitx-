fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "id_pilotjob"
description "Pilot Job"
author "zeixna#1636"
version "1.0.0"

client_scripts {
    'client/*.lua',
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
    'shared/*.lua',
}

ui_page "web/index.html"

files {
    'web/index.html',
    'web/script.js',
    'web/*.png',
    'web/style.css',
}

dependencies {
	'/onesync',
    'qb-core'
}