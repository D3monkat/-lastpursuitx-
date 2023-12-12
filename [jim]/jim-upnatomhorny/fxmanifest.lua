name "Jim-UpN'Atom&Horny"
author "Jimathy & McKlean"
version "1.0.2"
description "Up'n'Atom and Horny's Script By Jimathy & McKlean"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts { 'locales/*.lua*', 'config.lua', 'shared/*.lua', }
server_scripts { 'server/*.lua', }
client_scripts { '@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/*.lua', }
escrow_ignore { '*.lua*', 'client/*.lua*', 'server/*.lua*', 'locales/*.lua*', }

dependency '/assetpacks'