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
Config.Locations[#Config.Locations+1] = { --[[ GABZ LS TUNER SHOP ]]--
	Enabled = true,
	job = "shoptuner",
	zones = {
		vec2(154.69816589355, -3007.0153808594),
		vec2(120.64015197754, -3006.7275390625),
		vec2(120.48593902588, -3051.8874511719),
		vec2(154.61296081543, -3051.5419921875)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(144.38, -3051.3, 7.04, 0.0), w = 0.6, d = 3.6, },
		{ coords = vec4(128.45, -3007.83, 7.04, 0.0), w = 2.4, d = 3.5, },
	},
	store = {
		{ coords = vec4(128.64, -3014.68, 7.04, 0.0), w = 1.6, d = 3.0, },
	},
	crafting = {
		{ coords = vec4(136.71, -3051.29, 7.04, 0.0), w = 0.6, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(145.29, -3012.93, 6.94, 86.0), prop = true, },
		{ coords = vec4(125.55, -3007.25, 6.94, 350.0), w = 0.4, d = 0.45, },
	},
	manualRepair = {
		{ coords = vec4(121.0, -3047.69, 7.04, 270.11), prop = true, },
	},
	nosrefill = {
		{ coords = vec4(121.17, -3044.73, 7.04, 268.96) },
	},
	carLift = {
		{ coords = vec4(123.0, -3038.0, 7.04, 90.0), use = true, },
		{ coords = vec4(123.0, -3044.0, 7.04, 90.0), use = true, },
		{ coords = vector4(128.28, -3023.01, 7.04, 90.41) }
	},
	garage = {
		spawn = vec4(163.22, -3009.31, 5.27, 89.72),
		out = vec4(157.37, -3016.57, 7.04, 179.58),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true,
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(146.44, -3014.09, 6.94, 195.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(139.91, -3023.83, 7.04),
		label = "TunerShop",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ RFC LS CUSTOMS ]]--
    Enabled = true,
    job = "shopbluelinecustoms",
    zones = {
        vector2(8.903, -1664.435),
        vector2(-2.948, -1655.289),
        vector2(-26.549, -1670.801),
        vector2(-36.086, -1678.162),
        vector2(-47.601, -1668.066),
        vector2(-63.831, -1687.182),
        vector2(-54.333, -1697.307),
        vector2(-4.992, -1681.592)
    },
    autoClock = { enter = false, exit = false, },
    stash = {
        { coords = vec4(-329.54, -112.39, 39.0-0.4, 340.92), w = 0.6, d = 3.6, },
        { coords = vec4(-322.47, -114.78, 38.95-0.4, 343.93), w = 0.6, d = 3.6, },
    },
    store = {
		{ coords = vec4(-334.64, -164.61, 39.01-0.4, 70.08), w = 1.0, d = 1.4, },
	},
    crafting = {
        { coords = vec4(-314.61, -157.33, 39.04-0.4, 253.75), w = 1.4, d = 2.2, },
        { coords = vec4(-310.28, -145.19, 39.12-0.4, 255.76), w = 1.4, d = 2.2, },
        { coords = vec4(-306.29, -135.03, 39.11-0.4, 258.35), w = 1.4, d = 2.2, },
        { coords = vec4(-319.82, -119.97, 38.81-0.4, 335.43), w = 1.4, d = 2.2, },
    },
    clockin     = {
        { coords = vec4(-345.9, -130.4, 38.94, 244.06), prop = false, },
        { coords = vec4(-350.0, -150.9, 39.31, 160.92), prop = false, },
        { coords = vec4(-347.52, -130.47, 41.9, 250), prop = false, },
    },
    carLift = {
        -- { coords = vec4(-334.65, -136.87, 39.00, 340), use = false }, -- Bay 4 [GTA Prop]
        { coords = vec4(-324.56, -155.07, 39.00, 250), use = true }, -- Bay 3 [GTA Prop]
        { coords = vec4(-320.22, -144.26, 39.00, 250), use = true }, -- Bay 2 [GTA Prop]
        { coords = vec4(-316.65, -133.79, 39.00, 250), use = true }, -- Bay 1 [GTA Prop]
    },
    manualRepair = {
        { coords = vector4(-337.34, -132.77, 38.98, 250), prop = false, },
    },
	-- garage = { -- requires jim-jobgarge
    --     spawn = vec4(-49.14, -1031.25, 27.76, 339.67),
    --     out = vec4(-42.38, -1035.11, 28.52, 68.01),
    --     list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
    --     prop = true, -- spawn a prop (if there isn't alreaady one available in the current MLO at the location)
    -- },
    payments = {
        img = "<center><p><img src=https://i.imgur.com/74UVnCb.jpeg width=150px></p>",
        { coords = vec4(-346.42, -131.81, 39.01, 340), prop = false },
        { coords = vec4(-344.19, -125.77, 39.01, 340), prop = false },
        { coords = vec4(-361.8, -100.09, 39.55, 340), prop = false },
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
    },
    nosrefill = {
        { coords = vec4(-334.52, -114.66, 39.00, 161.14) }
    },
    blip = {
        coords = vec3(-360.24, -124.11, 38.09),
        label = "Bennys Workshop",
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    discord = {
        link = "",
        color = 16711680,
    }
}