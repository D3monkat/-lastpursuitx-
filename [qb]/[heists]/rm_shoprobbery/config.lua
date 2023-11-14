Config = {}

Config['ShopRobbery'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Only for QB users.
        eventName = 'esx:getSharedObject', -- Only for ESX users.
    },
    ['setjobForPolice'] = 'leo', -- Setjob for check police count and police alert
    ['requiredPoliceCount'] = 0, -- Required police count for start heist
    ['cooldown'] = { -- If you set globalCooldown to true, players can rob one shop in same time. Cooldown time is the time it takes to each shop or global.
        globalCooldown = false,
        time = 20,
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        {itemName = 'gold', count = math.random(5, 10)}, -- For safecrack reward
        {itemName = 'diamond', count = math.random(5, 10)}, -- For safecrack reward
    },
    ['rewardMoneys'] = {
        ['safecrack'] = function()
            return math.random(50000, 75000) -- For safecrack money reward
        end,
        ['till'] = function() -- For till money reward
            return math.random(5000, 7500)
        end,
    },
    ['tillGrabTime'] = 15000, -- For grab till time (miliseconds)
    ['clerkWeaponChance'] = 25, -- Chance that the clerk will get scared or pull a gun
    ['clerkWeapon'] = GetHashKey('weapon_remington'), -- Clerk weapon
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore players can change itemName
        status = false,
        itemName = 'black_money'
    },
}

Config['ShopRobberySetup'] = {
    [1] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(372.658, 327.282, 102.566), heading = 250.0}, -- For shop clerk settings: Ped model, coords and heading.
        safecrackSetup = {coords = vector3(379.960, 331.858, 102.566), heading = 255.47}, -- For shop safecrack object: Object coords and heading
        lixeiroCharmoso = {marketId = "market_6", tillAmount = 2, remainingTill = 2} -- For lixeiroCharmoso stores script: Market Id from his config file and the amount of tills
    },
    [2] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1391.73, 3606.31, 33.9808), heading = 200.0},
        safecrackSetup = {coords = vector3(1394.57, 3608.57, 33.9808), heading = 200.47},
        lixeiroCharmoso = {marketId = "market_14", tillAmount = 1, remainingTill = 1}
    },
    [3] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-46.675, -1758.3, 28.4210), heading = 50.0},
        safecrackSetup = {coords = vector3(-41.688, -1749.3, 28.4210), heading = 320.47},
        lixeiroCharmoso = {marketId = "market_13", tillAmount = 2, remainingTill = 2}
    },
    [4] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1165.26, -322.95, 68.2050), heading = 100.0},
        safecrackSetup = {coords = vector3(1161.55, -313.43, 68.2050), heading = 10.47},
        lixeiroCharmoso = {marketId = "market_4", tillAmount = 2, remainingTill = 2}
    },
    [5] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-705.62, -913.89, 18.2155), heading = 90.0},
        safecrackSetup = {coords = vector3(-707.70, -904.08, 18.2155), heading = 0.47},
        lixeiroCharmoso = {marketId = "market_1", tillAmount = 2, remainingTill = 2}
    },
    [6] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(24.0687, -1346.2, 28.4970), heading = 270.0},
        safecrackSetup = {coords = vector3(30.45, -1339.88, 28.44), heading = 269.47},
        lixeiroCharmoso = {marketId = "market_2", tillAmount = 2, remainingTill = 2}
    },
    [7] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1728.06, 6416.29, 34.0372), heading = 240.0},
        safecrackSetup = {coords = vector3(1736.66, 6419.02, 34.0372), heading = 243.47},
        lixeiroCharmoso = {marketId = "market_8", tillAmount = 2, remainingTill = 2}
    },
    [8] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(549.554, 2670.23, 41.1564), heading = 100.0},
        safecrackSetup = {coords = vector3(545.07, 2663.47, 41.1564), heading = 96.47},
        lixeiroCharmoso = {marketId = "market_9", tillAmount = 2, remainingTill = 2}
    },
    [9] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-3243.3, 999.759, 11.8307), heading = 350.0},
        safecrackSetup = {coords = vector3(-3249.02, 1006.04, 11.8307), heading = 0.47},
        lixeiroCharmoso = {marketId = "market_7", tillAmount = 2, remainingTill = 2}
    },
    [10] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-1819.5, 794.251, 137.079), heading = 140.0},
        safecrackSetup = {coords = vector3(-1828.23, 799.83, 137.1), heading = 44.47},
        lixeiroCharmoso = {marketId = "market_5", tillAmount = 2, remainingTill = 2}
    },
    [11] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1697.57, 4922.87, 41.0636), heading = 320.0},
        safecrackSetup = {coords = vector3(1706.87, 4919.76, 41.0636), heading = 237.47},
        lixeiroCharmoso = {marketId = "market_12", tillAmount = 2, remainingTill = 2}
    },
    [12] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1959.32, 3740.79, 31.3437), heading = 300.0},
        safecrackSetup = {coords = vector3(1961.32, 3749.37, 31.3437), heading = 300.47},
        lixeiroCharmoso = {marketId = "market_10", tillAmount = 2, remainingTill = 2}
    },
    [13] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(2676.91, 3279.72, 54.2411), heading = 330.0},
        safecrackSetup = {coords = vector3(2674.24, 3287.99, 54.2411), heading = 330.47},
        lixeiroCharmoso = {marketId = "market_11", tillAmount = 2, remainingTill = 2}
    },
    [14] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(2555.68, 380.539, 107.623), heading = 350.0},
        safecrackSetup = {coords = vector3(2550.09, 386.529, 107.623), heading = 357.47},
        lixeiroCharmoso = {marketId = "market_3", tillAmount = 2, remainingTill = 2}
    },
    [15] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-3040.2, 583.874, 6.90893), heading = 25.0},
        safecrackSetup = {coords = vector3(-3047.88, 588.16, 6.90893), heading = 17.47},
        lixeiroCharmoso = {marketId = "market_15", tillAmount = 2, remainingTill = 2}
    },
    [16] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1166.06, 2710.83, 37.16), heading = 178.0},
        safecrackSetup = {coords = vector3(1169.0, 2719.89, 36.16), heading = 350.8},
        lixeiroCharmoso = {marketId = "market_16", tillAmount = 1, remainingTill = 1}
    },
    [17] = { -- 148
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(293.99, -1259.85, 28.45), heading = 180.0},
        safecrackSetup = {coords = vector3(1169.0, 2719.89, -65436.16), heading = 350.8},
        lixeiroCharmoso = {marketId = "market_16", tillAmount = 1, remainingTill = 1}
    },
}

Strings = {
    ['grab_till'] = 'Press ~INPUT_CONTEXT~ to grab till',
    ['safecrack'] = 'Press ~INPUT_CONTEXT~ to start safecrack',
    ['pickup'] = 'Press ~INPUT_CONTEXT~ to pickup bag',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Shop robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    ['not_near'] = 'There is no shop nearby',
    ['safecrack_help'] = '~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_RIGHT~ Rotate\n~INPUT_FRONTEND_RDOWN~ Check',
    ['charmoso_log_title'] = 'Money stolen',
    ['charmoso_store_being_robbed'] = 'Your store is being robbed!',
    ['charmoso_no_owner_online'] = 'This store is closed!',
}

-- Set this as true if you're using the "Stores" script from LixeiroCharmoso (https://discord.gg/U5YDgbh). 
-- When enabled, the reward items and the money will be got from stores stocks and stores money. If the stores does not have owner, it wil be the values you configured in rewardMoneys and rewardItems
-- ATTENTION: remove the -- from this line "@mysql-async/lib/MySQL.lua" inside the server_scripts on fxmanifest.lua
-- If you need any support related to this, send a DM on discord: Lixeiro Charmoso#1104
Config['enableLixeiroCharmosoMarkets'] = false
Config['LixeiroCharmosoMarketsSettings'] = {
    money_percentage_earned = 0.7, -- Amount of money that will be taken from store bank in %
    items_percentage_earned = 0.7, -- Amount of items that will be taken from store stock in %
	require_owner_be_online = true -- true: the store can only be robbed if the owner is online | false: the store can be robbed at any time
}