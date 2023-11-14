fx_version "cerulean"
game "gta5"

author "Forosty's Development"
description "Sanitation"

lua54 "yes"

client_script {
    "client/*.lua",
    "@PolyZone/client.lua",
    "@PolyZone/BoxZone.lua"
}

server_script {
    "server/*.lua",
    "config/server.lua"
}

shared_script {
    "@ox_lib/init.lua",
    "config/shared.lua"
}

escrow_ignore { 
    "client/*.lua",
    "server/*.lua",
    "config/*.lua",
    "*.*",
}
dependency '/assetpacks'