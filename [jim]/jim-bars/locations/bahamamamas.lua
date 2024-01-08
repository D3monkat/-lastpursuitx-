- GABZ Bahama Mamas
Config.Locations["bahama"] = {
    zoneEnable = true,
    job = "nightclub",
    --gang = "bahama",
    label = "Bahama Mamas",
    logo = "https://i.imgur.com/ArzoMpG.png",
    autoClockOut = true,
    zones = {
        vector2(-1412.5675048828, -604.26824951172),
        vector2(-1391.0526123047, -637.83117675781),
        vector2(-1384.3073730469, -638.50915527344),
        vector2(-1383.7707519531, -639.39703369141),
        vector2(-1364.8765869141, -625.96075439453),
        vector2(-1384.1767578125, -585.27655029297)
    },
    Blip = {
        showBlip = true,
        coords = vector3(-1388.26, -587.07, 30.22),
        color = 8,
        sprite = 93,
    },
    Targets = {
        Clockin = {
            { coords = vector3(-1383.65, -592.42, 30.51), h = 245.0, l = 0.5, w = 0.5, bottom = 30.32, top = 30.92, prop = false},
        },
        Cocktails = {
            { coords = vector3(-1399.41, -602.24, 30.38), h = -130.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
            { coords = vector3(-1400.03, -602.75, 30.38), h = -150.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
        },
        Shop = {
            { coords = vector3(-1401.74, -597.45, 30.12), h = 32.0, l = 0.8, w = 0.9, bottom = 29.32, top = 31.52},
            { coords = vector3(-1403.96, -598.99, 30.12), h = 303.0, l = 0.6, w = 1, bottom = 29.78, top = 30.78},
            { coords = vector3(-1400.75, -597.5, 30.02), h = 303.0, l = 0.6, w = 1, bottom = 29.78, top = 30.78},

        },
        Tap = {
            { coords = vector3(-1399.85, -598.05, 30.33), h = 70.0, l = 0.7, w = 1.8, bottom = 29.87, top = 31.0, prop = false},
        },
        Coffee = {
            { coords = vector3(-1404.45, -598.94, 30.37), h = 32.9, l = 0.5, w = 0.5, bottom = 30.77, top = 31.37, prop = true},
        },
        HandWash = {
            { coords = vector3(-1403.17, -597.92, 30.51), h = 303.0, l = 1.2, w = 0.9, bottom = 29.32, top = 30.52, },
        },
        Payment = {
            { coords = vector3(-1398.89, -600.15, 30.54), h = 170.0, l = 0.6, w = 0.55, bottom = 29.72, top = 31.32, prop = false },
            { coords = vector3(-1402.79, -602.54, 30.5), h = 32.0, l = 0.6, w = 0.55, bottom = 29.72, top = 31.32 },
            { coords = vector3(-1384.45, -592.89, 30.22), h = -58.0, l = 0.6, w = 0.55, bottom = 29.72, top = 31.32, prop = true  },
        },
        Tray = {
            { coords = vector3(-1400.91, -603.12, 30.38), h = 10.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
            { coords = vector3(-1398.96, -601.43, 30.38), h = 70.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
        },
    },
    --Custom DJ Booth Stuff
    Booth = {
        enableBooth = true, -- Set false if using external DJ/Music stuff.
        DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
        radius = 60, -- The radius of the sound from the booth
        coords = vector3(-1377.54, -608.18, 31.46), -- Where the booth is located
        playing = false, -- No touch.
    },
}

