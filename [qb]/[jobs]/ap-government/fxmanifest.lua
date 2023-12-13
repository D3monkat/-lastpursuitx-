fx_version 'adamant'
games { 'gta5' }

mod 'QB AP GOVERNMENT'
version '1.2'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/*.*'
}

shared_scripts {
  --'@ox_lib/init.lua', -- If you use OX Dialog uncomment this.
  'config.lua',
  'language.lua'
}

client_scripts {
  '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
  'client/main.lua',
  'client/target.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
  'server/functions.lua',
  'server/webhook.lua'
}

server_exports {
	'chargeCityTax',
  'logTax',
  'TaxAmounts',
  'AddToCityhallFunds'
}

escrow_ignore {
	'config.lua',
  'language.lua',
	'client/target.lua',
  'server/functions.lua',
  'server/webhook.lua'
}
dependency '/assetpacks'