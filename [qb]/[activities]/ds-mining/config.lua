Config = {}

Config.Object = {
    usingexport = true, --- disable this if you are not using latest qbcore version. Note: Set to false for non qbcore versions.
    CoreName = 'qb-core', --- your core name for export.
    event = "QBCore:GetObject",  -- fill this if you disable usingexport.
}

Config.Input = "ox-lib" --- ("ox-lib", "qb-input") input script will be used for menus (uncomment line no-14 in fxmanifest.lua if you using ox-lib)
Config.UseDrawText = true ---- set to false if you want to use eye target.
Config.UseGlobalCoolDown = true  --- Enable if you want to set mine location cooldown for all players.
Config.EyeTarget = "ox_target"  --- you can use ox_target or qb-target
Config.CoolDown = 30  ---- CoolDown in minutes for reset all locations.
Config.RequireJob = false --- enable this if you want to use job only.
Config.JobName = "mining" --- job name Note: make sure you add job in your server accordingly your framework.
Config.UseburnFire = true --- on/off fire on melting
Config.RandomOre = true ---- if you set this true then player will get random ore from all mining spots.
Config.items = {
    drill = "drill",
    hammer = "weapon_hammer",
    c4 = "c4"
}

Config.UseDefaultSelling = true --- if you disable this then default selling shops and peds will be removed.
Config.UseDefaultBuying = true --- if you disable this then default buying shops and peds will be removed.

Config.DrillChance = 20 --- 20% chance of removed.
Config.HammerChance = 20 --- 20% chance of removed.

Config.Blip = {
    ['main_blip'] = {
        Sprite = 557,
        Scale = 0.9,
        Color = 3,
        Label = 'Mining'
    },
    ['c4_blip'] = {
        Sprite = 624,
        Scale = 0.6,
        Color = 3,
        Label = 'Mine Location'
    }
}

Config.StoneBreakReward = 'unwashed_stone' ---- reward after drilling normal stones

Config.RewardOnStone = { --- reward for drill stone you can add more items here
    'rubber',
    'plastic',
    'steel',
}

Config.CrystalsReward = {
    ['red'] = 'ruby_unshapped',
    ['blue'] = 'aquamarine_unshapped',
    ['green'] = 'greenberyl_unshapped',
    ['diamond'] = 'uncut_diamond',
}


Config.RewardOnStoneQty = { --- this qty will be multi by per stone
    Min = 1,
    Max = 5,
}


Config.BulkSelling = false ---- sell all items at time.
Config.SellingPrices = {
    ["ds_diamond"] = {label = "Diamond", price = math.random(100,150)},
    ["copper_bar"] = {label = "Copper Bar", price = math.random(100,150)},
    ["gold_bar"] = {label = "Gold Bar", price = math.random(100,150)},
    ["iron_bar"] = {label = "Iron Bar", price = math.random(100,150)},
    ["tin_bar"] = {label = "Tin Bar", price = math.random(100,150)},
    ["aquamarine"] = {label = "Aquamarine", price = math.random(100,150)},
    ["greenberyl"] = {label = "Green Beryl", price = math.random(100,150)},
    ["ruby"] = {label = "Ruby", price = math.random(100,150)},
    ["coal"] = {label = "Coal", price = math.random(100,150)},
    ["bauxite"] = {label = "Bauxite", price = math.random(100,150)},
    ["sulfur_bar"] = {label = "Sulfur", price = math.random(100,150)},
    ["lead_ore"] = {label = "Lead  Ore", price = math.random(100,150)},

    --- you can add more it for selling here.
}

Config.Washing = {
    ['unwashed_copper'] = {reward = "unshapped_copper", qty = math.random(1,2)},
    ['unwashed_gold'] = {reward = "unshapped_gold", qty = math.random(1,2)},
    ['unwashed_iron'] = {reward = "unshapped_iron", qty = math.random(1,2)},
    ['unwashed_tin'] = {reward = "unshapped_tin", qty = math.random(1,2)},
    ['unwashed_stone'] = {reward = "unshapped_stone", qty = math.random(1,2)},
    ['unwashed_lead'] = {reward = "unshapped_lead", qty = math.random(1,2)},
    ['unwashed_sulfur'] = {reward = "unshapped_sulfur", qty = math.random(1,2)},
    ['unwashed_bauxite'] = {reward = "unshapped_bauxite", qty = math.random(1,2)},

    ---- add new items for washing here

}

Config.ItemProcess = {
    ['unshapped_tin'] = {label = "Tin", reward = "tin_bar", qty = math.random(2,2), usemelt = true},
    ['unshapped_iron'] = {label = "Iron", reward = "iron_bar", qty = math.random(1,2), usemelt = true},
    ['unshapped_gold'] = {label = "Gold", reward = "gold_bar", qty = math.random(1,2), usemelt = true},
    ['unshapped_copper'] = {label = "Copper", reward = "copper_bar", qty = math.random(1,2), usemelt = true},
    ['aquamarine_unshapped'] = {label = "Aquamarine", reward = "aquamarine", qty = math.random(1,2), usemelt = false},
    ['greenberyl_unshapped'] = {label = "Greenberyl", reward = "greenberyl", qty = math.random(1,2), usemelt = false},
    ['ruby_unshapped'] = {label = "Ruby", reward = "ruby", qty = math.random(1,2), usemelt = false},
    ['unshapped_coal'] = {label = "Coal", reward = "coal", qty = math.random(1,2), usemelt = false},
    ['unshapped_sulfur'] = {label = "Sulfur", reward = "sulfur_bar", qty = math.random(1,2), usemelt = true},
    ['unshapped_bauxite'] = {label = "Bauxite", reward = "bauxite", qty = math.random(1,2), usemelt = true},
    ['unshapped_lead'] = {label = "Lead Ore", reward = "lead_ore", qty = math.random(1,2), usemelt = true},
    ['uncut_diamond'] = {label = "Diamond", reward = "ds_diamond", qty = math.random(1,2), usemelt = false},

    ---- add new items for melting here
}



Config.FoodShopItems = { -- Food Shop
    [1] = {
        name = "sandwich", -- Item name
        price = 4, -- Price per item
        amount = 50, -- Stock amount
        info = {},
        type = "item",
        slot = 1, -- Inventory slot item will be displayed
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
}


Config.MineShopItems = { -- Food Shop
    [1] = {
        name = "c4", -- Item name
        price = 20, -- Price per item
        amount = 50, -- Stock amount
        info = {},
        type = "item",
        slot = 1, -- Inventory slot item will be displayed
    },
    [2] = {
        name = "drill",
        price = 100,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "weapon_hammer",
        price = 100,
        amount = 50,
        info = {},
        type = "weapon",
        slot = 3,
    },
}


CreateEntityTarget = function(data) --- Eye Target Function chnage if you are using diffrent script
   if  Config.EyeTarget == 'qb-target' then
        if data.work == 'first' then
            exports['qb-target']:AddEntityZone("mining-"..data.object, data.object, {
                name = "mining-"..data.object,
                heading = GetEntityHeading(data.object),
                debugPoly = false,
            }, {
                options = {
                    {
                        type = "client",
                        event = data.event,
                        icon = "fas fa-eye",
                        label = data.label,
                        object = data.object,
                        area = data.area,
                        propno = data.propno

                    },
                },
                distance = 2.5
            })
        else
            exports['qb-target']:AddEntityZone("mining-"..data.object, data.object, {
                name = "mining-"..data.object,
                heading = GetEntityHeading(data.object),
                debugPoly = false,
            }, {
                options = {
                    {
                        type = "client",
                        event = data.event,
                        icon = "fas fa-eye",
                        label = data.label,
                        object = data.object,
                    },
                },
                distance = 2.5
            })
        end
    elseif Config.EyeTarget == 'ox_target' then
        if data.work == 'first' then
            exports.ox_target:addLocalEntity(data.object, {
                label = data.label,
                name = "mining-"..data.object,
                icon = "fas fa-eye",
                distance = 2.5,
                event = data.event,
                object = data.object,
                area = data.area,
                propno = data.propno
            })
        else
            exports.ox_target:addLocalEntity(data.object, {
                label = data.label,
                name = "mining-"..data.object,
                icon = "fas fa-eye",
                distance = 2.5,
                event = data.event,
                object = data.object,
            })
        end
    end

end


CreateBoxTarget = function(createdPed,v) --- Eye Target Function chnage if you are using diffrent script
    if Config.EyeTarget == "qb-target" then
        if v.type == 'buying' then
            exports['qb-target']:AddBoxZone("buying", v.coordinates, 0.70, 0.70, {
                name="buying",
                heading= v.heading,
                debugPoly=false,
                minZ=v.coordinates.z-0.9,
                maxZ=v.coordinates.z+0.9,
                }, {
                    options = {
                        {
                            type = "client",
                            event = 'ds-mining:buystuff',
                            icon = "fas fa-eye",
                            label = Language['buy_mining'],
                        },
                    },
                    distance = 3.5
            })
        elseif v.type == 'selling' then
            exports['qb-target']:AddBoxZone("selling", v.coordinates, 0.70, 0.70, {
                name="selling",
                heading= v.heading,
                debugPoly=false,
                minZ=v.coordinates.z-0.9,
                maxZ=v.coordinates.z+0.9,
                }, {
                    options = {
                        {
                            type = "client",
                            event = 'ds-mining:sellstuff',
                            icon = "fas fa-eye",
                            label = Language['sell_stuff'],
                        },

                    },
                    distance = 3.5
            })
        else
            exports['qb-target']:AddBoxZone(v.label, v.coords, v.length, v.width, {
                name = v.label,
                heading = v.heading,
                debugPoly = false,
                minZ = v.coords.z-0.9,
                maxZ = v.coords.z+0.9,
            }, {
                options = {
                    {
                        type = v.type,
                        event = v.event,
                        icon = "fas fa-eye",
                        label = v.label,
                    },
                },
                distance = 2.5
            })
        end
    elseif Config.EyeTarget == 'ox_target' then
        if v.type == 'buying' then
            exports.ox_target:addLocalEntity(createdPed, {
                label = Language['buy_mining'],
                name = "mining-buying",
                icon = "fas fa-eye",
                distance = 2.5,
                event = 'ds-mining:buystuff',
            })

        elseif v.type == 'selling' then

            exports.ox_target:addLocalEntity(createdPed, {
                label = Language['sell_stuff'],
                name = "mining-selling",
                icon = "fas fa-eye",
                distance = 2.5,
                event = 'ds-mining:sellstuff',
            })
        else
            exports.ox_target:addBoxZone({
                coords = v.coords,
                size = vec3(v.length, v.width, 2),
                rotation = v.heading,
                debug = false,
                options = {
                    {
                        name = v.label,
                        icon = "fas fa-eye",
                        label = v.label,
                        items =  false,
                        distance = 2,
                        event = v.event,
                    }
                }
            })
        end
    end
end

Config.Peds = {
    [1] = {
        npc = "a_m_m_farmer_01",
        coordinates = vector3(2949.01, 2751.78, 43.35),
        heading =  177.8,
        type = "buying"
    },
    [2] = {
        npc = "a_m_m_farmer_01",
        coordinates = vector3(2569.19, 2720.38, 42.96),
        heading =  212.57,
        type = "selling"
    },
}

Config.Targets = {
    [1] = {coords = vector3(2922.68, 2656.51, 43.12), heading = 311.41, length = 1.5, width = 1.5, type = 'client', event = "ds-mining:washmetals", label = "Wash Metal"},
    [2] = {coords = vector3(2922.36, 2653.42, 43.1), heading = 271.27, length = 2.5, width = 2.5, type = 'client', event = "ds-mining:enteramount", label = "Melt Metal"},
    [3] = {coords = vector3(2918.85, 2647.05, 43.17), heading = 211.07, length = 1.0, width = 2.5, type = 'client', event = "ds-mining:pourmetals", label = "Pour Molten Metal"},
    [4] = {coords = vector3(2918.74, 2655.24, 43.17), heading = 44.58, length = 1.0, width = 0.8, type = 'client', event = "ds-mining:selectdiamond", label = "Shape Ore"},
    [5] = {coords = vector3(2920.3, 2647.94, 43.15), heading = 209.08, length = 0.9, width = 0.5, type = 'client', event = "ds-mining:openfoodshop", label = "Open Shop"},
}


Config.MiningSpot = {
    [1] = {coords = vector3(2902.12, 2719.27, 43.9), radius = 15.0},
    [2] = {coords = vector3(2923.18, 2695.6, 43.84), radius = 18.0},
    [3] = {coords = vector3(2899.73, 2677.35, 44.49), radius = 14.0},
    [4] = {coords = vector3(2874.67, 2670.8, 48.2), radius = 12.0}, --- emereld
    [5] = {coords = vector3(2828.19, 2604.54, 33.22), radius = 17.0}, --- gold
    [6] = {coords = vector3(2811.77, 2642.8, 37.13), radius = 20.0}, --- gold
    [7] = {coords = vector3(2887.15, 2645.24, 38.83), radius = 21.0}, --- gold
    [8] = {coords = vector3(2851.51, 2674.71, 41.57), radius = 23.0}, --- iron
    [9] = {coords = vector3(2879.42, 2693.95, 46.98), radius = 15.0}, --- iron

}

Config.Mining = {

    [1] = {
        coords = vector3(2896.26, 2717.5, 43.80),
        heading = 109.35,
        rot = "40",
        xadd = -0.3,
        yadd = 0.3,
        props = {'k4mb1_coal'},
        proppos = {{z = 0.5, y = 1.0, empty = 'k4mb1_emptyore2'}},
        reward = "unshapped_coal",
        c4rot = false,
        spot = 1,
        time = 1400

    },
    [2] = {
        coords =  vector3(2899.9, 2711.04, 47.36),
        heading = 130.95,
        rot = "40",
        xadd = -0.5,
        yadd = 0.5,
        props = {'k4mb1_coal'},
        proppos = {{z = 0.5, y = 1.0, empty = 'k4mb1_emptyore2'}},
        reward = "unshapped_coal",
        c4rot = false,
        spot = 1,
        time = 1000


    },
    [3] = {
        coords =  vector3(2902.95, 2708.69, 47.32),
        heading = 148.37,
        rot = "20",
        xadd = -0.8,
        yadd = 0.8,
        props = {'k4mb1_coal', 'k4mb1_coal2'},
        proppos = {{z = 0.5, y = 1.0, empty = 'k4mb1_emptyore2'}, {z = 0.9, y = 1.0, empty = 'k4mb1_emptyore2'}},
        reward = "unshapped_coal",
        c4rot = false,
        spot = 1,
        time = 500


    },
    [4] = {
        coords = vector3(2905.86, 2722.85, 44.22),
        heading = 304.65,
        rot = "0",
        xadd = 0.25,
        yadd = -0.25,
        props = {'k4mb1_coal', 'k4mb1_coal2'},
        proppos = {{z = 0.5, y = 1.0, empty = 'k4mb1_emptyore2'}, {z = 0.9, y = 1.0, empty = 'k4mb1_emptyore2'}},
        reward = "unshapped_coal",
        c4rot = true,
        spot = 1,
        time = 1000


    },
    [5] = {
        coords = vector3(2912.59, 2714.69, 44.13),
        heading = 299.3,
        rot = "0",
        xadd = 0.40,
        yadd = -0.40,
        props = {'k4mb1_coal', 'k4mb1_coal2'},
        proppos = {{z = 0.5, y = 1.0, empty = 'k4mb1_emptyore2'}, {z = 0.9, y = 1.0, empty = 'k4mb1_emptyore2'}},
        reward = "unshapped_coal",
        c4rot = true,
        spot = 1,
        time = 1000


    },

    ---- next ore
    [6] = {
        coords = vector3(2910.11, 2699.76, 45.25),
        heading = 82.38,
        rot = "0",
        xadd = -0.45,
        yadd = 0.45,
        props = {'k4mb1_copperore', 'k4mb1_copperore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_copper",
        c4rot = false,
        spot = 2,
        time = 1000


    },
    [7] = {
        coords = vector3(2911.99, 2695.65, 44.84),
        heading = 122.72,
        rot = "0",
        xadd = -0.35,
        yadd = 0.35,
        props = {'k4mb1_copperore', 'k4mb1_copperore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_copper",
        c4rot = false,
        spot = 2,
        time = 1000


    },
    [8] = {
        coords = vector3(2910.22, 2692.17, 45.83),
        heading = 146.85,
        rot = "0",
        xadd = -0.90,
        yadd = 0.40,
        props = {'k4mb1_copperore', 'k4mb1_copperore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_copper",
        c4rot = false,
        spot = 2,
        time = 1000


    },
    [9] = {
        coords = vector3(2920.96, 2688.28, 43.6),
        heading = 166.56,
        rot = "0",
        xadd = -0.40,
        yadd = 0.40,
        props = {'k4mb1_copperore', 'k4mb1_copperore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_copper",
        c4rot = false,
        spot = 2,
        time = 1000


    },
    [10] = {
        coords = vector3(2930.92, 2697.05, 44.18),
        heading = 299.24,
        rot = "0",
        xadd = 0.40,
        yadd = -0.40,
        props = {'k4mb1_copperore', 'k4mb1_copperore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_copper",
        c4rot = true,
        spot = 2,
        time = 1000


    },

    --- next
    [11] = {
        coords = vector3(2890.35, 2670.23, 46.5),
        heading = 107.66,
        rot = "20",
        xadd = -0.20,
        yadd = 0.20,
        props = {'k4mb1_tinore', 'k4mb1_tinore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_tin",
        c4rot = false,
        spot = 3,
        time = 1000



    },
    [12] = {
        coords = vector3(2887.51, 2682.39, 47.5),
        heading = 107.66,
        rot = "-20",
        xadd = -0.35,
        yadd = 0.35,
        props = {'k4mb1_tinore', 'k4mb1_tinore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_tin",
        c4rot = false,
        spot = 3,
        time = 1500


    },
    [13] = {
        coords = vector3(2908.4, 2673.05, 42.74),
        heading = 346.29,
        rot = "0",
        xadd = 0.38,
        yadd = -0.38,
        props = {'k4mb1_tinore', 'k4mb1_tinore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_tin",
        c4rot = true,
        spot = 3,
        time = 1000



    },
    [14] = {
        coords = vector3(2904.57, 2681.99, 46.98),
        heading = 291.08,
        rot = "0",
        xadd = 0.20,
        yadd = -0.20,
        props = {'k4mb1_tinore', 'k4mb1_tinore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_tin",
        c4rot = true,
        spot = 3,
        time = 1000

    },
    [15] = {
        coords = vector3(2864.3, 2665.12, 47.28),
        heading = 143.63,
        rot = "0",
        xadd = -0.30,
        yadd = 0.30,
        props = {'k4mb1_crystalblue', 'k4mb1_crystalgreen','k4mb1_crystalred', 'k4mb1_diamond'},
        reward = "emereld",
        c4rot = false,
        spot = 4,
        time = 1000,
        pedpos = vector3(2865.4, 2665.69, 47.29),
        pedheading = 212.44,
        customcoords = vector3(2865.9, 2665.0, 47.3)
    },
    [16] = {
        coords = vector3(2825.21, 2589.65, 30.27),
        heading = 230.02,
        rot = "0",
        xadd = 0.30,
        yadd = -0.30,
        props = {'k4mb1_goldore', 'k4mb1_goldore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = true,
        spot = 5,
        time = 500



    },
    [18] = {
        coords = vector3(2829.11, 2597.36, 32.84),
        heading = 257.98,
        rot = "0",
        xadd = 0.15,
        yadd = -0.15,
        props = {'k4mb1_goldore', 'k4mb1_goldore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = true,
        spot = 5,
        time = 1000



    },
    [19] = {
        coords = vector3(2836.13, 2601.6, 34.77),
        heading = 248.9,
        rot = "0",
        xadd = 0.30,
        yadd = -0.30,
        props = {'k4mb1_goldore2'},
        proppos = { {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = true,
        spot = 5,
        time = 1800



    },
    [20] = {
        coords = vector3(2823.02, 2609.77, 37.53),
        heading = 57.54,
        rot = "0",
        xadd = -0.30,
        yadd = 0.30,
        props = {'k4mb1_goldore', 'k4mb1_goldore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = false,
        spot = 5,
        time = 1800



    },
    [21] = {
        coords = vector3(2817.33, 2600.37, 32.77),
        heading = 97.72,
        rot = "0",
        xadd = -0.20,
        yadd = 0.20,
        props = {'k4mb1_goldore', 'k4mb1_goldore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = false,
        spot = 5,
        time = 1000



    },
    [22] = {
        coords = vector3(2823.61, 2648.95, 39.93),
        heading = 346.41,
        rot = "20",
        xadd = 0.60,
        yadd = -0.60,
        props = {'k4mb1_leadore', 'k4mb1_leadore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_lead",
        c4rot = true,
        spot = 6,
        time = 500

    },
    [23] = {
        coords = vector3(2802.39, 2630.91, 40.10),
        heading = 203.67,
        rot = "0",
        xadd = 0.60,
        yadd = -0.60,
        props = {'k4mb1_leadore', 'k4mb1_leadore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_lead",
        c4rot = true,
        spot = 6,
        time = 1000
    },
    [24] = {
        coords = vector3(2796.66, 2641.94, 37.65),
        heading = 48.04,
        rot = "0",
        xadd = -0.35,
        yadd = 0.35,
        props = {'k4mb1_bauxiteore', 'k4mb1_bauxiteore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_bauxite",
        c4rot = false,
        spot = 6,
        time = 1000

    },
    [25] = {
        coords = vector3(2805.6, 2646.49, 38.33),
        heading = 38.21,
        rot = "0",
        xadd = -0.20,
        yadd = 0.20,
        props = {'k4mb1_bauxiteore', 'k4mb1_bauxiteore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_bauxite",
        c4rot = false,
        spot = 6,
        time = 1000

    },
    [26] = {
        coords = vector3(2896.32, 2628.82, 35.43),
        heading = 93.31,
        rot = "0",
        xadd = -0.25,
        yadd = 0.25,
        props = {'k4mb1_crystalblue', 'k4mb1_crystalgreen','k4mb1_crystalred', 'k4mb1_diamond'},
        reward = "emereld",
        c4rot = false,
        spot = 7,
        time = 1000,
        pedpos = vector3(2896.65, 2628.41, 35.51),
        pedheading = 131.93,
        customcoords = vector3(2896.13, 2628.04, 35.46)
    },
    [27] = {
        coords = vector3(2889.01, 2651.33, 39.79),
        heading = 340.26,
        rot = "0",
        xadd = 0.40,
        yadd = -0.40,
        props = {'k4mb1_goldore', 'k4mb1_goldore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = true,
        spot = 7,
        time = 500

    },
    [28] = {
        coords = vector3(2873.22, 2644.12, 37.98),
        heading = 27.99,
        rot = "0",
        xadd = -0.30,
        yadd = 0.30,
        props = {'k4mb1_goldore', 'k4mb1_goldore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_gold",
        c4rot = false,
        spot = 7,
        time = 1000

    },
    [29] = {
        coords = vector3(2866.21, 2678.27, 46.63),
        heading = 247.11,
        rot = "0",
        xadd = 0.25,
        yadd = -0.25,
        props = {'k4mb1_ironore', 'k4mb1_ironore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_iron",
        c4rot = true,
        spot = 8,
        time = 1000

    },
    [30] = {
        coords = vector3(2863.75, 2674.91, 46.18),
        heading = 247.11,
        rot = "0",
        xadd = 0.22,
        yadd = -0.22,
        props = {'k4mb1_ironore', 'k4mb1_ironore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_iron",
        c4rot = true,
        spot = 8,
        time = 1000

    },
    [31] = {
        coords = vector3(2858.79, 2667.56, 44.73),
        heading = 262.49,
        rot = "0",
        xadd = 0.20,
        yadd = -0.20,
        props = {'k4mb1_ironore', 'k4mb1_ironore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_iron",
        c4rot = true,
        spot = 8,
        time = 1000

    },
    [32] = {
        coords = vector3(2846.33, 2677.14, 40.70),
        heading = 31.18,
        rot = "0",
        xadd = -0.80,
        yadd = 0.80,
        props = {'k4mb1_ironore', 'k4mb1_ironore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_iron",
        c4rot = false,
        spot = 8,
        time = 1000

    },
    [33] = {
        coords = vector3(2879.81, 2686.15, 46.91),
        heading = 163.25,
        rot = "0",
        xadd = -0.60,
        yadd = 0.60,
        props = {'k4mb1_ironore', 'k4mb1_ironore2'},
        proppos = {{z = 0.9, y = 1.5, empty = 'k4mb1_emptyore'}, {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_iron",
        c4rot = false,
        spot = 9,
        time = 1000

    },
    [34] = {
        coords = vector3(2866.63, 2695.92, 46.67),
        heading = 50.57,
        rot = "0",
        xadd = -0.10,
        yadd = 0.10,
        props = {'k4mb1_sulfur'},
        proppos = { {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_sulfur",
        c4rot = false,
        spot = 9,
        time = 1000

    },
    [35] = {
        coords = vector3(2883.34, 2705.16, 48.0),
        heading = 357.15,
        rot = "0",
        xadd = -0.65,
        yadd = 0.65,
        props = {'k4mb1_sulfur'},
        proppos = { {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_sulfur",
        c4rot = false,
        spot = 9,
        time = 700

    },
    [36] = {
        coords = vector3(2892.11, 2701.65, 48.80),
        heading = 304.05,
        rot = "0",
        xadd = 0.30,
        yadd = -0.30,
        props = {'k4mb1_sulfur'},
        proppos = { {z = 0.9, y = 0.8, empty = 'k4mb1_emptyore2'}},
        reward = "unwashed_sulfur",
        c4rot = true,
        spot = 9,
        time = 1000
    },
}