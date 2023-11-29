fx_version "cerulean"
game "gta5"
lua54 "yes"

author "LB"
description "A radio app for the LB-phone script."

shared_script { "config.lua", "locales.lua" }
client_script "client/**/*"
server_script "server/*.lua"

escrow_ignore {
    "config.lua",
    "locales.lua",
    "client/functions.lua",
    "client/frameworks/*.lua"
}

file "ui/**/*"
ui_page "ui/index.html"

dependency '/assetpacks'