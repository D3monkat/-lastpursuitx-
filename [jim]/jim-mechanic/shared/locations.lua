Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ Rex ]]--
    Enabled = true,
    job = "rexmech",
    zones = {
        vec2(2545.2998046875, 2633.1081542969),
        vec2(2545.4338378906, 2643.2319335938),
        vec2(2525.4377441406, 2643.5991210938),
        vec2(2516.6645507812, 2634.7263183594),
        vec2(2516.3186035156, 2610.7668457031),
        vec2(2551.884765625, 2609.3415527344)
    },
    autoClock = { enter = true, exit = false, },
    stash = {
        { coords = vector4(2529.88, 2641.44, 37.95, 265.1), w = 0.6, d = 3.6, },
        { coords = vector4(2518.8, 2621.55, 37.95, 91.2), w = 0.6, d = 3.6, },
    },
    store = {
		{ coords = vector4(2542.69, 2634.81, 37.95, 264.52), w = 1.0, d = 1.4, },
	},
    crafting = {
        { coords = vector4(2521.4, 2635.84, 37.96, 45.21), w = 1.4, d = 2.2, },
    },
    clockin     = {
        { coords = vector4(2537.78, 2640.7, 37.95, 270.97), prop = false, },
    },
    carLift = {
        -- { coords = vec4(-334.65, -136.87, 39.00, 340), use = false }, -- Bay 4 [GTA Prop]
        { coords = vector4(2524.14, 2631.08, 38.01, 227.64), use = true }, -- Bay 3 [GTA Prop]
        { coords = vector4(2528.17, 2639.67, 38.01, 176.77), use = true }, -- Bay 2 [GTA Prop]
    },
    manualRepair = {
        { coords = vector4(2525.51, 2619.96, 37.95, 87.35), prop = false, },
    },
	-- garage = { -- requires jim-jobgarge
    --     spawn = vec4(-49.14, -1031.25, 27.76, 339.67),
    --     out = vec4(-42.38, -1035.11, 28.52, 68.01),
    --     list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
    --     prop = true, -- spawn a prop (if there isn't alreaady one available in the current MLO at the location)
    -- },
    payments = {
        img = "<center><p><img src=https://i.imgur.com/74UVnCb.jpeg width=150px></p>",
        { coords = vector4(2542.98, 2640.09, 37.95, 92.61), prop = false },
    },
    -- Restrictions = { -- Remove what you DON'T what the location to be able to edit
    --     Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
    --     Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
    -- },
    nosrefill = {
        { coords = vector4(2518.94, 2634.26, 37.95, 224.57) }
    },
    blip = {
        coords = vector3(2525.51, 2619.96, 37.95),
        label = "Rex Workshop",
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    discord = {
        link = "https://discord.com/api/webhooks/1188891878037393458/WbuZlzqWjWAqJ1Pakw55JOGCac-YSTe01dqMjfQd79ISYZcodCkn8LsUPSOmMSLujqgE",
        color = 16711680,
    }
}

Config.Locations[#Config.Locations+1] = { --[[ Lux ]]--
    Enabled = true,
    job = "shoplux",
    zones = {
        vec2(140.53567504882, -1110.80859375),
        vec2(115.85746765136, -1110.6535644532),
        vec2(115.85834503174, -1090.9049072266),
        vec2(127.2694015503, -1090.9012451172),
        vec2(129.41340637208, -1088.216796875),
        vec2(140.53732299804, -1088.838256836)
    },
    autoClock = { enter = false, exit = false, },
    stash = {
        { coords = vec4(131.51, -1088.72, 29.2, 359.2), w = 0.6, d = 3.6, },
    },
    store = {
		{ coords = vec4(139.72, -1100.41, 29.2, 268.31), w = 1.0, d = 1.4, },
	},
    crafting = {
        { coords = vec4(139.79, -1108.8, 29.2, 273.61), w = 1.4, d = 2.2, },
    },
    clockin     = {
        { coords = vec4(124.15, -1091.46, 29.2, 359.5), prop = false, },
    },
    carLift = {
        -- { coords = vec4(-334.65, -136.87, 39.00, 340), use = false }, -- Bay 4 [GTA Prop]
    },
    manualRepair = {
        { coords = vec4(120.62, -1090.83, 29.2, 182.64), prop = false, },
    },
	-- garage = { -- requires jim-jobgarge
    --     spawn = vec4(-49.14, -1031.25, 27.76, 339.67),
    --     out = vec4(-42.38, -1035.11, 28.52, 68.01),
    --     list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
    --     prop = true, -- spawn a prop (if there isn't alreaady one available in the current MLO at the location)
    -- },
    payments = {
        img = "<center><p><img src=https://i.imgur.com/74UVnCb.jpeg width=150px></p>",
        { coords = vec4(133.77, -1088.93, 29.2, 177.89), prop = false },
        { coords = vec4(-344.19, -125.77, 39.01, 340), prop = false },
        { coords = vec4(-361.8, -100.09, 39.55, 340), prop = false },
    },
    -- Restrictions = { -- Remove what you DON'T what the location to be able to edit
    --     Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
    --     Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
    -- },
    nosrefill = {
        { coords = vec4(140.64, -1089.23, 29.2, 95.02) }
    },
    blip = {
        coords = vec3(123.82, -1099.78, 29.2),
        label = "Bennys Workshop",
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    discord = {
        link = "https://discord.com/api/webhooks/1188891878037393458/WbuZlzqWjWAqJ1Pakw55JOGCac-YSTe01dqMjfQd79ISYZcodCkn8LsUPSOmMSLujqgE",
        color = 16711680,
    }
}

Config.Locations[#Config.Locations+1] = { --[[ REDLINE ]]--
    Enabled = true,
    job = "redline",
    zones = {
        vec2(-548.77136230469, -940.03454589844),
        vec2(-541.89007568359, -918.62713623047),
        vec2(-555.16174316406, -918.66186523438),
        vec2(-555.02508544922, -910.86804199219),
        vec2(-581.12786865234, -911.25476074219),
        vec2(-581.49353027344, -913.33721923828),
        vec2(-587.48864746094, -913.96276855469),
        vec2(-587.51678466797, -939.09588623047)
    },
    autoClock = { enter = true, exit = false, },
    stash = {
        { coords = vec4(-576.54, -938.91, 23.89, 2.67), w = 5.5, d = 1.0 },
    },
    store = {
        { coords = vec4(-590.56, -939.01, 28.14, 274.17), w = 1.0, d = 1.4, },
    },
    crafting = {
        { coords = vec4(-584.08, -939.58, 23.0, 270.0), w = 4.0, d = 1.0 },
        { coords = vec4(-587.25, -932.33, 23.0, 88.12), w = 1.0, d = 4.0 },
        { coords = vec4(-587.28, -923.81, 23.0, 91.74), w = 1.0, d = 4.0 },
        { coords = vec4(-583.94, -913.28, 23.0, 3.32), w = 1.0, d = 4.0 },
    },
    clockin = {
        { coords = vec4(-583.15, -928.24, 23.81, 359.22), prop = false, },
        { coords = vec4(-583.15, -928.24, 23.81, 359.22), prop = false, },
    },
    manualRepair = {
        { coords = vec4(-559.75, -937.28, 23.87, 266.17), prop = true, },
    },
    carLift = {
        { coords = vec4(828.15, -812.69, 26.33, 270.5) },
        { coords = vec4(828.25, -819.93, 26.33, 270.5) },
        { coords = vec4(827.96, -805.63, 26.33, 270.5) },
    },
    -- garage = {
    --     spawn = vec4(826.59, -793.63, 26.21, 84.34),
    --     out = vec4(824.3, -801.2, 26.37, 0.65),
    --     list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
    --     prop = true
    -- },
    payments = {
        { coords = vec4(-589.83, -931.48, 23.54, 86.5), prop = false },
        img = "https://cdn.discordapp.com/attachments/769485468965928971/1033370006571995220/logo-performance-redline_1.png",
    },
    Restrictions = {
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
    },
    blip = {
        coords = vec3(-576.77, -922.96, 23.89),
        label = "Redline Performance",
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = 10,
    },
    discord = {
        link = "https://discord.com/api/webhooks/1188891878037393458/WbuZlzqWjWAqJ1Pakw55JOGCac-YSTe01dqMjfQd79ISYZcodCkn8LsUPSOmMSLujqgE",
        color = 16711680,
    }
}