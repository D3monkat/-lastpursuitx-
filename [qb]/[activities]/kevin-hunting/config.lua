Config = Config or {}

Config.PoliceNeeded = 2
Config.Dispatch = 'ps' -- ps = ps-dispatch / cd = cd_dispatch
Config.UseLocalAnimals = false
Config.UseJob = false -- true/false if you want a specific job to hunt
Config.HuntingJobName = 'hunter' -- name of the job you want to set for unting must be the same as in the core shared jobs
Config.PedHash = `ig_hunter` -- hash of the ped in the store
Config.HunterScenario = 'WORLD_HUMAN_CLIPBOARD_FACILITY'
Config.PedLocation = vector4(-679.38, 5834.06, -17.33, 135.24) -- location for the store ped
Config.PaymentType = 'cash' -- cash / bank
Config.LicenseCost = 4000 -- cost to buy a license from the hunter
Config.LicenseExpireDate = 20 -- 20 days after the license will expiry (this is just a number on the license for police to see when it expires from the date issued)
Config.HuntingLicenseItemName = 'hunterlicense'

-----------BLIPS----------
Config.UseZoneBlip = true -- Show blip for a hunting zone
Config.UseAnimalBlip = true -- Show a blip when the animal is spawned
Config.UseBaitBlip = true -- Adds blip for bait placed
Config.UseStoreBlip = true -- Show a blip for the hunting store/guy

Config.HunterMenuInfo = { -- images for the menu at the hunter
    ['deer'] = {
        [1] = 'https://i.imgur.com/w2D96Gy.png',
        [2] = 'https://i.imgur.com/gELffBg.png',
        [3] = 'https://i.imgur.com/jFGfqLE.png',
        [4] = 'https://i.imgur.com/70kZKA0.png',
    },
    ['coyote'] = {
        [1] = 'https://i.imgur.com/xct8b1G.png',
        [2] = 'https://i.imgur.com/8VB9lfh.png',
        [3] = 'https://i.imgur.com/zQBzqgx.png',
        [4] = 'https://i.imgur.com/7n5jPlx.png',
    },
    ['boar'] = {
        [1] = 'https://i.imgur.com/pSZR8HF.png',
        [2] = 'https://i.imgur.com/GNdBafQ.png',
        [3] = 'https://i.imgur.com/Rrakgby.png',
        [4] = 'https://i.imgur.com/C6lgIkA.png',
    },
    ['mtlion'] = {
        [1] = 'https://i.imgur.com/7rPNTaQ.png',
        [2] = 'https://i.imgur.com/nebWG1s.png',
        [3] = 'https://i.imgur.com/50hGTEx.png',
        [4] = 'https://i.imgur.com/zIjZ4yO.png',
    },
    ['bigfoot'] = {
        [1] = 'https://i.imgur.com/zkuVlZp.png',
    },
    ['hunterslogo'] = {
        [1] = 'https://i.imgur.com/TJo396f.png',
    },
    ['huntingbait'] = {
        [1] = 'https://i.imgur.com/moqTpJG.png',
    },
}

Config.StoreBlipInfo = {
    sprite = 119,
    color = 2,
    scale = 0.75,
    name = 'Hunting Store'
}

Config.MainHuntingZoneBlipInfo = {
    sprite = 141,
    color = 80,
    color2 = 2,
    scale = 0.75,
    shortrange = true,
    name = 'Hunting Grounds',
    coords = vector3(-800.43, 4933.61, 236.5),
    radius = 750.0
}

Config.BaitBlipInfo = {
    sprite = 1,
    color = 43,
    scale = 0.55,
    name = 'Hunting Bait'
}

Config.BigFootBlipInfo = {
    sprite = 671,
    color = 17,
    scale = 0.65,
    blipflash = false,
}

Config.AnimalBlipInfo = {
    sprite = 141,
    color = 2,
    scale = 0.65,
    blipflash = false
}

-----------End BLIPS----------

Config.NightStartTime = 1
Config.NightEndTime = 4
Config.AnimalFleeDistanceFromPLayer = 15.0
Config.TimeForAnimalSpawn = math.random(1, 3) -- 1 - 3 minutes till animal spawns
Config.HuntingWeapon = 'weapon_huntingrifle'


-- Names of the Hunting Animals in the shared.lua and price
Config.StoreInfo = { -- DO NOT REARRANGE THE ORDER OF THESE
    [1] = {item = 'deer1',price = 250,},
    [2] = {item = 'deer2',price = 280},
    [3] = {item = 'deer3',price = 330},
    [4] = {item = 'deer4',price = 500},
    [5] = {item = 'coyote1',price = 250},
    [6] = {item = 'coyote2',price = 280},
    [7] = {item = 'coyote3',price = 330},
    [8] = {item = 'coyote4',price = 500},
    [9] = {item = 'boar1',price = 250},
    [10] = {item = 'boar2',price = 280},
    [11] = {item = 'boar3',price = 330},
    [12] = {item = 'boar4',price = 500},
    [13] = {item = 'mtlion1',price = 250},
    [14] = {item = 'mtlion2',price = 280},
    [15] = {item = 'mtlion3',price = 330},
    [16] = {item = 'mtlion4',price = 500},
    [17] = {item = 'bigfoot',price = 1250},
}

-- Shop items 
Config.Items = {
    label = 'Shop',
    slots = 5,
    items = {
        [1] = {
            name = 'huntingbait',
            price = 50,
            amount = 20,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'weapon_huntingrifle',
            price = 250,
            amount = 20,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'snp_ammo',
            price = 30,
            amount = 20,
            info = {},
            type = 'item',
            slot = 3,
        },
        [4] = {
            name = 'sandwich',
            price = 250,
            amount = 20,
            info = {},
            type = 'item',
            slot = 4,
        },
        [5] = {
            name = 'water_bottle',
            price = 250,
            amount = 20,
            info = {},
            type = 'item',
            slot = 5,
        },
        [6] = {
            name = 'whiskey',
            price = 250,
            amount = 20,
            info = {},
            type = 'item',
            slot = 6,
        },
    }
}
--

-- Zones to hunt in (if you want to add more zone you can use the command 'getzone' to get a zone )
Config.HuntingZones = {
    'CMSW',
    'MTCHIL',
    'PALFOR'
}
--

Config.Animals = {
    `a_c_boar`,
    `a_c_coyote`,
    `a_c_deer`,
    `a_c_mtlion`
}

-- Reputation Markers for the different reputaion levels to get better stuff do not set to low if you're not sure how to balance it out with everything else
Config.MidRep = 1000
Config.HighRep = 1500
---
Config.UseAlerts = true -- if you want to use police alerts for illegal animals killed
Config.FourStarAlertChance = 30 -- 30% chance

-- End of Names of the Hunting Animals in the shared.lua and price

--- * DEER PERCENTAGES * ---
-- Percentages to get different rarity of deer Under Config.LowRep Rep
Config.LowRepDeer2Chance = 10 -- 10%
Config.LowRepDeer3Chance = 15
Config.LowRepDeer4Chance = 5
-- Percentages to get different rarity of deer Under Config.MidRep Rep
Config.MidRepDeer2Chance = 45 -- 45%
Config.MidRepDeer3Chance = 35
Config.MidRepDeer4Chance = 10
-- Percentages to get different rarity of deer Over Config.HighRep Rep
Config.HighRepDeer2Chance = 55 -- 55%
Config.HighRepDeer3Chance = 45
Config.HighRepDeer4Chance = 15
--- * END OF DEER PERCENTAGES * ---

--- * BOAR PERCENTAGES * ---
-- Percentages to get different rarity of deer Under 50 Rep
Config.LowRepBoar2Chance = 10 -- 10%
Config.LowRepBoar3Chance = 15
Config.LowRepBoar4Chance = 5
-- Percentages to get different rarity of deer Under 100 Rep
Config.MidRepBoar2Chance = 45 -- 45%
Config.MidRepBoar3Chance = 35
Config.MidRepBoar4Chance = 10
-- Percentages to get different rarity of deer Over 100 Rep
Config.HighRepBoar2Chance = 55 -- 55%
Config.HighRepBoar3Chance = 45
Config.HighRepBoar4Chance = 15
--- * END OF BOAR PERCENTAGES * ---

--- * COYOTE PERCENTAGES * ---
-- Percentages to get different rarity of deer Under 50 Rep
Config.LowRepCoyote2Chance = 10 -- 10%
Config.LowRepCoyote3Chance = 15
Config.LowRepCoyote4Chance = 5
-- Percentages to get different rarity of deer Under 100 Rep
Config.MidRepCoyote2Chance = 45 -- 45%
Config.MidRepCoyote3Chance = 35
Config.MidRepCoyote4Chance = 10
-- Percentages to get different rarity of deer Over 100 Rep
Config.HighRepCoyote2Chance = 55 -- 55%
Config.HighRepCoyote3Chance = 45
Config.HighRepCoyote4Chance = 15
--- * END OF Coyote PERCENTAGES * ---

--- * MOUNTAIN LION PERCENTAGES * ---
-- Percentages to get different rarity of deer Under 50 Rep
Config.LowRepMtlion2Chance = 10 -- 10%
Config.LowRepMtlion3Chance = 15
Config.LowRepMtlion4Chance = 5
-- Percentages to get different rarity of deer Under 100 Rep
Config.MidRepMtlion2Chance = 45 -- 45%
Config.MidRepMtlion3Chance = 35
Config.MidRepMtlion4Chance = 10
-- Percentages to get different rarity of deer Over 100 Rep
Config.HighRepMtlion2Chance = 55 -- 55%
Config.HighRepMtlion3Chance = 45
Config.HighRepMtlion4Chance = 15
--- * END OF MOUNTAIN LION PERCENTAGES * ---

-- Reputation amount to be given after catching animal
Config.OneStarRep = math.random(3, 5)
Config.TwoStarRep = math.random(5, 8)
Config.ThreeStarRep = math.random(8, 11)
Config.FourStarRep = math.random(14, 20)
Config.FiveStarRep = math.random(50, 75) -- This is only for Big foot the chance of getting him is like 5% so the rep can be a bit more here
--

--- * Big Foot* ---
Config.UseBigFoot = true --true/false
Config.UseBigFootNightOnly = true
Config.BigFootAlertChance = 50 -- 50% chance
Config.BigFootChance = 5 -- 5% Best to leave low unless you want people making mad money
Config.BigFootHash = `ig_orleans` -- big foot hash name 
--- * END OF Big Foot* ---

Config.BodyPartsPedHash = `s_f_y_factory_01`
Config.BodyPartsPedCoords = vector4(-32.53, -614.28, 35.08, 121.25)
Config.OrgansChance = 30 -- 30% chance of getting organs from local dead bodies
Config.AlertChance = 45 -- 45% chance to get alerted when looting bodies

Config.BodyParts = {
    ['heart'] = { -- item name
        price = 1500,
        quality = math.random(40, 100), -- quality of the item given
    },
    ['lungs'] = {
        price = 700,
        quality = math.random(40, 100),
    },
    ['brain'] = {
        price = 2500,
        quality = math.random(40, 100),
    },
    ['intestines'] = {
        price = 500,
        quality = math.random(40, 100),
    },
    ['kidneys'] = {
        price = 1800,
        quality = math.random(40, 100),
    },
    ['stomach'] = {
        price = 1000,
        quality = math.random(40, 100),
    },
    ['liver'] = {
        price = 1200,
        quality = math.random(40, 100),
    },
    ['humanmeat'] = {
        price = 1200,
        quality = math.random(60, 100),
    },
}

Config.MaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true
}

Config.FemaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true
}
