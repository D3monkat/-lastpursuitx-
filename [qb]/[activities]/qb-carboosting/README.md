Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [ox_lib by overextended](https://github.com/overextended/ox_lib)
* [boostinghack](https://github.com/Lionh34rt/boostinghack)

# Shared.lua items
```lua
-- Carboosting
["boostinglaptop"] 		 	 	 = {["name"] = "boostinglaptop",           		["label"] = "Boosting Laptop",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "boostinglaptop.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A laptop used for boosting contracts."},
["boostingdisabler"] 		 	 = {["name"] = "boostingdisabler",           	["label"] = "Tracking Disabler",	 	["weight"] = 1000, 		["type"] = "item", 		["image"] = "boostingdisabler.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "This small tool can disable these pesky trackers."},
```

# qb-core > server > player: Add to meta data
```lua
PlayerData.metadata['boostingrep'] = PlayerData.metadata['boostingrep'] or 0
PlayerData.metadata['boostingclass'] = PlayerData.metadata['boostingclass'] or 1
```

# Database
```sql
ALTER TABLE `player_vehicles` 
ADD COLUMN `vinscratched` INT(11) NOT NULL DEFAULT 0;
```

# Make a log webhook for the 'carboosting' in qb-smallresources > server > logs.lua:
['carboosting'] = 'discord webhook'

# Useable commands:
'makeboost' --> requires ace perms, gives a random boost to first in queue (forces queue)
'boosting_queue' --> requires ace perms, prints position and player name of players in queue
'setboostingrep' --> set the boosting rep of a given playerId (Shared.Permission)