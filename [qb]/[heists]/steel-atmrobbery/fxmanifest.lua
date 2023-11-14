fx_version "cerulean"

description "Steel Store"
author "Gllorysz#8504"
version "1.0.0"
repository "https://discord.gg/hdEQeCdxN3"

data_file "DLC_ITYP_REQUEST" "stream/loq_atm.ytyp"

lua54 "yes"

game "gta5"

shared_script "config.lua"

client_script "client/main.lua"

client_script "client/editable.lua"

server_script "server/main.lua"

escrow_ignore { 
   "config.lua"
}
dependency '/assetpacks'