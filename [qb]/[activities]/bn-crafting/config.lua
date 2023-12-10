Config = Config or {}
local QBCore = exports['qb-core']:GetCoreObject() -- Change to core name

Config.Locations = {
    {coords = vector3(94.97, -1977.03, 20.67), length = 5.5, width = 2, maxZ = 21.67, minZ = 19.47, heading = 321, job = nil, gang = "ballas", name = "ballas_crafting", configFile = Config.Gang},
    {coords = vector3(330.34, -2095.75, 18.24), length = 1.25, width = 0.4, maxZ = 19.64, minZ = 17.24, heading = 300, job = nil, gang = "vagos", name = "vagos_crafting", configFile = Config.Gang},
    {coords = vector3(986.76, -153.24, 74.24), length = 2.2, width = 5.2, maxZ = 75.24, minZ = 73.24, heading = 75, job = nil, gang = "lostmc", name = "lost_crafting", configFile = Config.Gang},
    {coords = vector3(3.57, -1423.66, 30.55), length = 1.3, width = 0.2, maxZ = 31.8, minZ = 29.55, heading = 0, job = nil, gang = "families", name = "gsf_crafting", configFile = Config.Gang},
    {coords = vector3(63.14, -1576.81, 29.6), length = 1, width = 1, maxZ = 30.6, minZ = 26.6, heading = 320, job = nil, gang = nil, name = "allvendingmachine_crafting", configFile = Config.VendingMachine},
    {coords = vector3(-2079.02, -340.48, 13.3), length = 1.9, width = 1.0, maxZ = 13.5, minZ = 12.3, heading = 85, job = "police", gang = nil, name = "police_crafting", configFile = Config.Police},
}

Config.logWebhookData = {
    ["url"] = "https://discord.com/api/webhooks/1142949862472687637/1ULDCoH9lNmdEadWuSu57N4KnK3K2ffvVpfDPJxpTDjbMRIJW_odXNCaLYD1NV2ef0Of",
    ["author"] = "Crafting Bot"
}

-- LOCATIONS:
-- coords = vector3(x, y, z) -- Location of the crafting table
-- width, length, maxZ, minZ, heading are for polyzones, you can change them if you want
-- Set Job and/or gang to "all" if you want a custom location for everyone
-- The Config.Food is a config file. Which is loacted in configs\food.lua, look at Config.Default for an example of how to make a config file
-- Name is the name of the crafting table, which defines what your xp is going to be called for that table. You can use the same name if you want to share xp between tables
Config.RenamedCore = "qb-core"

Config.Inventory = "ox" -- Set this to either "qb" or "ox"

Config.ProgressBar = "ox" -- Set this to either "qb" or "ox" or "custom"
Config.ProgressStyle = "circle" -- Only for ox users

Config.CustomProgressBar = function(data)
    QBCore.Functions.Progressbar("crafting_new", Config.Lang.craftingCancelled, data.selectedItem.time * data.amount, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function()

        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('bn-crafting:server:removeAndAddItems', data)
        canCraft = true
    end, function()
        sendNotify({ title = Config.Lang.craftingCancelled, type = "error"})
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        canCraft = false
    end)
end

Config.Notify = "ox" -- Set this to either "qb" or "ox"

Config.DebugPoly = false -- Used to check if your polyzone is correct, set to true if you want to see it
Config.InventoryImg = "ox_inventory/web/images/" -- Change this to your inventory image path.

Config.Levels = {
    0, -- (1)
    1000, -- (2)
    1300, -- (3)
    1690, -- (4)
    2197, -- (5)
    2856, -- (6)
    3713, -- (7)
    4837, -- (8)
    6288, -- (9)
    8163, -- (10)
    10603, -- (11)
    13785, -- (12)
    17921, -- (13)
    23309, -- (14)
    30202, -- (15)
    39263, -- (16)
    51043, -- (17)
    66357, -- (18)
    86365, -- (19)
    112286, -- (20)
    145881, -- (21)
    189645, -- (22)
    246499, -- (23)
    320449, -- (24)
    416584, -- (25)
    541359, -- (26)
    703708, -- (27)
    914799, -- (28)
    1187249, -- (29)
    1543434, -- (30)
}

Config.CraftingModels = { -- Default crafting locations props/models (You can add more) (if you don't want to use this just remove every prop from the list)
    "prop_toolchest_05",
    "prop_toolchest_04",
    "prop_toolchest_03",
    "prop_toolchest_02"
}

Config.Unliscensed = true -- Set to true if you want guns to be unliscensed when crafted

Config.NoUnliscensed = { -- Weapons that shouldnt have a license when crafted, almost no need to change
    'weapon_unarmed',
    'weapon_dagger',
    'weapon_bat',
    'weapon_bottle',
    'weapon_crowbar',
    'weapon_flashlight',
    'weapon_golfclub',
    'weapon_hammer',
    'weapon_hatchet',
    'weapon_knuckle',
    'weapon_knife',
    'weapon_machete',
    'weapon_switchblade',
    'weapon_nightstick',
    'weapon_wrench',
    'weapon_battleaxe',
    'weapon_poolcue',
    'weapon_briefcase',
    'weapon_briefcase_02',
    'weapon_garbagebag',
    'weapon_handcuffs',
    'weapon_bread',
    'weapon_stone_hatchet',
    'weapon_grenade',
    'weapon_bzgas',
    'weapon_molotov',
    'weapon_stickybomb',
    'weapon_proxmine',
    'weapon_snowball',
    'weapon_pipebomb',
    'weapon_ball',
    'weapon_smokegrenade',
    'weapon_flare',
    'weapon_shoe',
    'weapon_petrolcan',
    'weapon_fireextinguisher',
    'weapon_hazardcan',
}

Config.Lang = {
    polyCraftTarget = "Open Crafting",
    nearCraftingBench = "You are not near a crafting table",
    craftingProgressBar = "Crafting ...",
    craftingCancelled = "Canceled crafting",
    playerIsNotOnline = "Player isn't online",
    unknownMetaData = "Player doesn't exist on this table",
    fillAllArguments = "You need to fill the arguments",
    resetCraftingFor = "You just reset crafting for ",
    notEnoughItems = "You didn't have the items to craft this.",
    notEnoughSpace = "You don't have enough space in your inventory",
}