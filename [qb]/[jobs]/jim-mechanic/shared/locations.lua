Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ RFC LS CUSTOMS ]]--
    Enabled = true,
    job = "mechanic",
    zones = {
        vec2(-357.11694335938, -138.5697479248),
        vec2(-350.16461181641, -150.59289550781),
        vec2(-350.35028076172, -151.14776611328),
        vec2(-349.26226806641, -151.57026672363),
        vec2(-353.04995727539, -161.36512756348),
        vec2(-345.96157836914, -163.96807861328),
        vec2(-342.69039916992, -155.07688903809),
        vec2(-341.96646118164, -155.39378356934),
        vec2(-345.19152832031, -164.26715087891),
        vec2(-338.00445556641, -166.9347076416),
        vec2(-334.79922485352, -157.95303344727),
        vec2(-334.67324829102, -156.9211730957),
        vec2(-333.49572753906, -157.36219787598),
        vec2(-337.83312988281, -169.46090698242),
        vec2(-315.77774047852, -163.20722961426),
        vec2(-304.49011230469, -132.14988708496),
        vec2(-309.84133911133, -130.18266296387),
        vec2(-307.64532470703, -123.81855010986),
        vec2(-320.4919128418, -118.1721496582),
        vec2(-316.2926940918, -106.99356842041),
        vec2(-316.73837280273, -106.22454071045),
        vec2(-313.30139160156, -95.538734436035),
        vec2(-351.69564819336, -81.245178222656),
        vec2(-359.94036865234, -103.92008209229),
        vec2(-334.56372070312, -113.00981140137),
        vec2(-330.22259521484, -101.34365844727),
        vec2(-329.94000244141, -102.03875732422),
        vec2(-334.04333496094, -113.31317901611),
        vec2(-334.67007446289, -113.93590545654),
        vec2(-346.6354675293, -109.56227111816)
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
        { coords = vec4(-337.34, -132.77, 38.98, 250), prop = false, },
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
    -- Restrictions = { -- Remove what you DON'T what the location to be able to edit
    --     Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
    --     Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
    -- },
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
        link = "",
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
    autoClock = { enter = true, exit = true, },
    stash = {
        { coords = vec4(-589.87, -930.24, 27.92, 0), w = 5.5, d = 1.0 },
        { coords = vec4(-570.3, -911.4, 23.0, 357.94), w = 1.0, d = 4.0 },
        { coords = vec4(-568.68, -939.89, 23.0, 182.12), w = 1.0, d = 4.0 },
    },
    store = {
        { coords = vec4(837.02, -808.22, 26.33, 90.0), w = 1.0, d = 1.4, },
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
        link = "",
        color = 16711680,
    }
}