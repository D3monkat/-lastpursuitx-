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