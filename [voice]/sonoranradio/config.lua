Config = {}

Config.debug = false
Config.allowUpdateWithPlayers = true
Config.enableCanary = false
Config.updateBranch = "master"
Config.autoUpdateUrl = "https://download.sonoransoftware.com/sonoranradio/version.json"
Config.allowAutoUpdate = true
Config.noPhysicalTowers = false
Config.towerRepairTimer = 20
Config.acePermsForRadio = false
Config.acePermsForTowerRepair = false
Config.enforceRadioItem = false
Config.disableRadioOnDeath = true
Config.restoreRadioStateWhenAlive = true -- Restore the radio on/off status when you revive or respawn
Config.deathDetectionMethod = 'auto' -- auto | manual | qbcore

-- Only Run This on Client
if not IsDuplicityVersion() then
    RegisterNetEvent("SonoranRadio::API:PlayerDeath", function(playerid)
        TriggerEvent("SonoranRadio::PlayerDeath") -- This event will kill the player
    end)
    RegisterNetEvent("SonoranRadio::API:PlayerRevive", function(playerid)
        TriggerEvent("SonoranRadio::PlayerRevive") -- This event will revive the player
    end)
end