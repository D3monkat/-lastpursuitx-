fx_version 'cerulean'

games {"gta5", "rdr3"}

author "Banannus"
version '1.1.0'

lua54 'yes'

ui_page 'web/build/index.html'

client_script "client/**/*"
server_script {
  "server/**/*",
  '@oxmysql/lib/MySQL.lua'
}

shared_script "configs/**/*"

shared_script {
  '@ox_lib/init.lua',
  "config.lua"
}

files {
  'web/build/index.html',
  'web/build/**/*'
}

escrow_ignore {
  'config.lua',  -- Only ignore one file
  'configs/**/*'
}
dependency '/assetpacks'