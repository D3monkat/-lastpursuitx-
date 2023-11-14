fx_version "cerulean"
game "gta5"
lua54 "yes"

title "LB Phone - Lookup App"
description "An person & vehicle lookup app for LB Phone."
author "Breze & Loaf"
version "1.1.0"

client_script "client/*.lua"
shared_script {
    "config.lua",
    "locales.lua"
}
server_script {
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua"
}

escrow_ignore {
    "client/functions.lua",
    "config.lua",
    "locales.lua"
}

files {
    "ui/dist/**/*",
    "ui/images/*.png"
}

ui_page "ui/dist/index.html"

dependency '/assetpacks'