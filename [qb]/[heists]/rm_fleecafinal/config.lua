--RAINMAD SCRIPTS - discord.gg/rccvdkmA5X - rainmad.tebex.io
Config = {}

Config['FleecaHeist'] = {
    ['framework'] = {
        name = 'qb', -- Only ESX or QB.
        scriptName = 'qb-core', -- Framework script name work framework exports. (Example: qb-core or es_extended)
        eventName = 'esx:getSharedObject', -- If your framework using trigger event for shared object, you can set in here.
    },
    ['bagClothesID'] = 45,
    ['buyerFinishScene'] = true,
    ['setjobForPolice'] = 'leo', -- Setjob for check police count and police alert.
    ['requiredPoliceCount'] = 3, -- Required police count for start heist.
    ['cooldown'] = { -- If you set globalCooldown to true, players can rob one Fleeca in same time. Cooldown time is the time it takes to each Fleeca or global.
        globalCooldown = true,
        time = 7200,
    },
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        'bag',
        'drill',
        'big_drill',
        'thermite',
        'hack_usb'
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names. You can add more items for lockboxes.
        {itemName = 'gold', count = 1, sellPrice = 100}, -- For trolly/lockboxes.
        {itemName = 'diamond', count = 1, sellPrice = 100}, -- For lockboxes.
    },
    ['rewardMoneys'] = {
        ['stacks'] = function()
            return math.random(50000, 100000) -- Per grab in stacks.
        end,
    },
    ['rewardLockbox'] = function()
        local random = math.random(#Config['FleecaHeist']['rewardItems'])
        local lockboxBag = {
            item = Config['FleecaHeist']['rewardItems'][random]['itemName'],
            count = math.random(1, 5), -- For lockbox reward items count
        }
        return lockboxBag
    end,
    ['drillTime'] = 30, --Seconds for first door big drill wait time
    ['moneyItem'] = { -- If your server have money item, you can set it here.
        status = false,
        itemName = 'cash'
    },
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore players can change itemName.
        status = false,
        itemName = 'black_money'
    },
    ['finishHeist'] = { -- Heist finish coords.
        buyerPos = vector3(695.941, -1156.4, 23.2873)
    },
}

Config['FleecaSetup'] = {
    [1] = {
        ['main'] = vector3(311.290, -277.73, 54.1646),
        ['doors'] = {
            {coords = vector3(308.803, -282.03, 54.1646), heading = 250.0, locked = true},
            {coords = vector3(312.182, -283.67, 54.1730), heading = 250.0, locked = true},
            {coords = vector3(314.122, -285.52, 54.1429), heading = 159.0, locked = true},
        },
        ['keycard'] = vector3(309.816, -283.90, 54.1647),
        ['trolly'] = {coords = vector3(314.211, -283.37, 53.1430), heading = 160.0},
        ['cashStack'] = {coords = vector3(313.156, -287.61, 54.0), heading = 160.0},
        ['lockboxs'] = {
            {coords = vector3(315.414, -285.03, 54.1430), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(311.618, -288.55, 54.1430), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(311.343, -286.81, 54.1430), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(314.852, -288.28, 54.1431), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(313.421, -289.32, 54.1430), model = 'ch_prop_ch_sec_cabinet_01g'},
        }
    },
    [2] = {
        ['main'] = vector3(147.276, -1039.1, 29.3678),
        ['doors'] = {
            {coords = vector3(144.379, -1043.3, 29.3679), heading = 250.0, locked = true},
            {coords = vector3(147.720, -1045.3, 29.3765), heading = 250.0, locked = true},
            {coords = vector3(149.134, -1047.2, 29.3463), heading = 159.0, locked = true},
        },
        ['keycard'] = vector3(145.498, -1045.5, 29.3680),
        ['trolly'] = {coords = vector3(149.926, -1045.0, 28.3463), heading = 160.0},
        ['cashStack'] = {coords = vector3(148.753, -1049.2, 29.2000), heading = 160.0},
        ['lockboxs'] = {
            {coords = vector3(151.066, -1046.6, 29.3463), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(147.244, -1050.2, 29.3463), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(146.909, -1048.4, 29.3462), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(150.283, -1049.9, 29.3464), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(148.962, -1050.9, 29.3463), model = 'ch_prop_ch_sec_cabinet_01g'},
        }
    },
    [3] = {
        ['main'] = vector3(-354.16, -47.934, 49.0363),
        ['doors'] = {
            {coords = vector3(-356.48, -52.703, 49.0364), heading = 250.0, locked = true},
            {coords = vector3(-353.02, -54.810, 49.0450), heading = 250.0, locked = true},
            {coords = vector3(-351.66, -56.329,  49.0148), heading = 159.0, locked = true},
        },
        ['keycard'] = vector3(-355.26, -54.805, 49.0365),
        ['trolly'] = {coords = vector3(-350.87, -54.180, 48.0148), heading = 160.0},
        ['cashStack'] = {coords = vector3(-351.85, -58.389, 48.8548), heading = 160.0},
        ['lockboxs'] = {
            {coords = vector3(-349.59, -55.795, 49.0148), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(-353.40, -59.398, 49.0148), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(-353.78, -57.781, 49.0148), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(-350.20, -59.135, 49.0148), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(-351.49, -60.107, 49.0148), model = 'ch_prop_ch_sec_cabinet_01g'},
        }
    },
    [4] = {
        ['main'] = vector3(-1215.7, -331.38, 37.7808),
        ['doors'] = {
            {coords = vector3(-1214.3, -336.60, 37.7809), heading = 297.0, locked = true},
            {coords = vector3(-1210.6, -335.50, 37.7895), heading = 297.0, locked = true},
            {coords = vector3(-1208.2, -335.60, 37.7592), heading = 207.0, locked = true},
        },
        ['keycard'] = vector3(-1212.1, -337.24, 37.7810),
        ['trolly'] = {coords = vector3(-1209.5, -333.62, 36.7592), heading = 207.0},
        ['cashStack'] = {coords = vector3(-1207.20, -337.22, 37.6092), heading = 207.0},
        ['lockboxs'] = {
            {coords = vector3(-1207.5, -333.92, 37.7592), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(-1207.5, -339.16, 37.7592), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(-1208.9, -338.23, 37.7592), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(-1205.4, -336.58, 37.7593), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(-1205.7, -338.22, 37.7593), model = 'ch_prop_ch_sec_cabinet_01g'},
        }
    },
    [5] = {
        ['main'] = vector3(1178.20, 2706.10, 38.0878),
        ['doors'] = {
            {coords = vector3(1179.28, 2711.31, 38.0878), heading = 90.0, locked = true},
            {coords = vector3(1175.63, 2712.23, 38.0880), heading = 90.0, locked = true},
            {coords = vector3(1173.48, 2713.31, 38.0662), heading = 0.0, locked = true},
        },
        ['keycard'] = vector3(1177.53, 2712.77, 38.0880),
        ['trolly'] = {coords = vector3(1173.63, 2710.79, 37.0662), heading = 0.0},
        ['cashStack'] = {coords = vector3(1173.17, 2715.1, 37.91363), heading = 0.0},
        ['lockboxs'] = {
            {coords = vector3(1171.85, 2711.87, 38.0662), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(1174.32, 2716.64, 38.0662), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(1175.19, 2715.18, 38.0662), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(1171.33, 2715.28, 38.0663), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(1172.23, 2716.68, 38.0663), model = 'ch_prop_ch_sec_cabinet_01g'},
        }
    },
    [6] = {
        ['main'] = vector3(-2963.25, 479.93, 15.7),
        ['doors'] = {
            {coords = vector3(-2958.18, 477.94, 15.7), heading = -2.0, locked = true},
            {coords = vector3(-2956.66, 481.92, 15.7), heading = -2.0, locked = true},
            {coords = vector3(-2956.77, 484.27, 15.7), heading = -92.0, locked = true},
        },
        ['keycard'] = vector3(-2956.62, 480.18, 15.7),
        ['trolly'] = {coords = vector3(-2958.5, 484.24, 14.7), heading = -90.0},
        ['cashStack'] = {coords = vector3(-2954.16, 484.5, 15.52), heading = -90.0},
        ['lockboxs'] = {
            {coords = vector3(-2957.37, 485.9, 15.7), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(-2952.69, 483.19, 15.7), model = 'ch_prop_ch_sec_cabinet_01d'},
            {coords = vector3(-2954.15, 482.49, 15.7), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(-2953.94, 486.29, 15.7), model = 'ch_prop_ch_sec_cabinet_01a'},
            {coords = vector3(-2952.59, 485.25, 15.7), model = 'ch_prop_ch_sec_cabinet_01g'},
        }
    },
}

Strings = {
    ['grab_stack'] = 'Press ~INPUT_CONTEXT~ to grab stack',
    ['grab_trolly'] = 'Press ~INPUT_CONTEXT~ to grab trolly',
    ['drill'] = 'Press ~INPUT_CONTEXT~ to drill the boxes',
    ['keycard'] = 'Press ~INPUT_CONTEXT~ to start safecrack',
    ['door_1'] = 'Press ~INPUT_CONTEXT~ to place big drill',
    ['door_2'] = 'Press ~INPUT_CONTEXT~ to use keycard or hack usb',
    ['door_3'] = 'Press ~INPUT_CONTEXT~ to plant thermite',
    ['got_keycard'] = 'You got the keycard',
    ['drill_bar'] = 'DRILLING',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Fleeca bank robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    ['buyer_blip'] = 'Buyer',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',

    --For minigames
    ['confirm'] = 'Confirm',
    ['change'] = 'Change vertical',
    ['change_slice'] = 'Change slice',
    ['exit'] = 'Exit',

    ['safecrack'] = "~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_RIGHT~ Rotate\n~INPUT_FRONTEND_RDOWN~ Check",
}