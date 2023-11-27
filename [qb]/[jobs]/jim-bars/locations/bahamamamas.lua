-- Bahama Mamas
-- https://forum.cfx.re/t/free-map-bahama-mamas-retexture-improve/4889260

Config.Locations["bahama"] = {
	zoneEnable = true,
	job = "bahama",
	--gang = "lostmc",
	label = "Bahama Mamas",
	logo = "https://i.imgur.com/ArzoMpG.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(-1384.5277099609, -584.45465087891),
        vec2(-1415.2163085938, -604.27465820312),
        vec2(-1389.8627929688, -644.43115234375),
        vec2(-1366.185546875, -628.23389404297)
	},
	Blip = {
		showBlip = true,
		coords = vec3(-1388.33, -586.92, 30.22),
		color = 8,
		sprite = 93,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(-1390.28, -598.57, 31.39), h = 335.0, l = 0.5, w = 0.5, bottom = 30.32, top = 30.92, prop = true},
		},
		Cocktails = {
			{ coords = vec3(-1393.29, -602.29, 30.32 + 1.03), h = 91.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
			{ coords = vec3(-1390.85, -607.83, 30.32 + 1.03), h = 312.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
			{ coords = vec3(-1375.82, -627.51, 30.82 + 1.03), h = 33.0, l = 0.4, w = 0.6, bottom = 30.82, top = 31.12, prop = true},
		},
		Shop = {
			{ coords = vec3(-1386.23, -609.27, 30.32-1), h = 32.0, l = 0.8, w = 0.9, bottom = 29.32, top = 31.52},
            { coords = vec3(-1375.27, -629.68, 30.18-0.5), h = 303.0, l = 6.6, w = 1, bottom = 29.78, top = 30.78},
		},
		Tap = {
			{ coords = vec3(-1373.1, -627.85, 30.82+1.03), h = 32.0, l = 0.4, w = 0.7, bottom = 30.87, top = 31.57, prop = true},
			{ coords = vec3(-1378.01, -631.05, 30.82+1.03), h = 33.0, l = 0.4, w = 0.7, bottom = 30.82, top = 31.62, prop = true},
			{ coords = vec3(-1392.88, -604.88, 30.32+1.03), h = 289.0, l = 0.4, w = 0.7, bottom = 30.32, top = 31.07, prop = true},
			{ coords = vec3(-1391.67, -606.94, 30.32+1.03), h = 305.0, l = 0.4, w = 0.7, bottom = 30.32, top = 31.07, prop = true},
			{ coords = vec3(-1393.05, -601.09, 30.32 +1.03), h = 73.0, l = 0.4, w = 0.7, bottom = 30.37, top = 31.17, prop = true},
		},
		Coffee = {
			{ coords = vec3(-1378.62, -631.57, 30.82), h = 213.0, l = 0.5, w = 0.5, bottom = 30.77, top = 31.37, prop = true},
            { coords = vec3(-1389.53, -599.82, 30.30), h = 303.0, l = 0.4, w = 0.3, bottom = 30.27, top = 30.97, prop = true},
		},
		HandWash = {
			{ coords = vec3(-1385.52, -608.45, 29.32), h = 303.0, l = 1.2, w = 0.9, bottom = 29.32, top = 30.52, },
            { coords = vec3(-1374.9, -627.1, 30.82-1), h = 303.0, l = 1.15, w = 0.9, bottom = 29.82, top = 31.02, },
		},
		Payment = {
			{ coords = vec3(-1379.41, -629.8, 30.82), h = 34.0, l = 0.6, w = 0.55, bottom = 30.72, top = 31.32 },
            { coords = vec3(-1376.39, -627.86, 30.82), h = 32.0, l = 0.6, w = 0.55, bottom = 30.72, top = 31.32 },
            { coords = vec3(-1372.91, -625.53, 30.82), h = 32.0, l = 0.6, w = 0.55, bottom = 30.72, top = 31.32 },
            { coords = vec3(-1389.87, -601.19, 30.32), h = 30.0, l = 0.6, w = 0.55, bottom = 30.27, top = 30.82 },
            { coords = vec3(-1390.36, -605.04, 30.32), h = 28.0, l = 0.6, w = 0.55, bottom = 30.22, top = 30.82 },
            { coords = vec3(-1388.09, -606.26, 30.32), h = 34.0, l = 0.6, w = 0.55, bottom = 30.22, top = 30.82 },
		},
		Tray = {
			{ coords = vec3(-1393.34, -603.5, 30.37), h = 100.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
            { coords = vec3(-1391.67, -599.63, 30.37), h = 32.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
            { coords = vec3(-1389.38, -609.24, 30.37), h = 150.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
            { coords = vec3(-1392.41, -605.97, 30.37), h = 299.0, l = 0.4, w = 0.6, bottom = 30.37, top = 30.57, prop = true},
            { coords = vec3(-1374.09, -626.28, 30.84), h = 33.0, l = 0.4, w = 0.6, bottom = 30.80, top = 31.12, prop = true},
            { coords = vec3(-1377.88, -628.74, 30.84), h = 33.0, l = 0.4, w = 0.6, bottom = 30.82, top = 31.12, prop = true},
		},
		Storage = {
		--	{ },
		}
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 40, -- The radius of the sound from the booth
		coords = vec3(-1381.71, -616.67, 31.5), -- Where the booth is located
		playing = false, -- No touch.
	},
}

