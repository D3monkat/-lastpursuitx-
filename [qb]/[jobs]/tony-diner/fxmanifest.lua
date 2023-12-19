name "Frosty-LastTrain"
author "AntisFrosty"
version "1.0.0"
description "LastTrain Job Script By Frosty"
fx_version "cerulean"
game "gta5"
lua54 'yes'

server_scripts { 'server/*.lua' }
shared_scripts { 'config.lua', 'locales/*.lua', 'shared/*.lua' }
client_scripts { '@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/*.lua', }
dependency '/assetpacks'