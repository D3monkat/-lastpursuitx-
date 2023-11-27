-- Insert Coin Arcade - https://www.gta5-mods.com/maps/arcade-bar-interior-mlo-fivem-sp


Config.Locations["insertcoin"] = {
	zoneEnable = true,
	job = "insertcoin",
	--gang = "lostmc",
	label = "Insert Coin",
	logo = "https://i.imgur.com/3LPyctu.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(-1261.595703125, -308.83560180664),
		vec2(-1279.9178466797, -273.55764770508),
		vec2(-1303.9106445312, -284.94165039062),
		vec2(-1287.451213413, -322.86131415112)
	},
	Blip = {
		showBlip = true,
		coords = vec3(-1278.13, -300.29, 36.05),
		color = 1,
		sprite = 606,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(-1294.63, -300.81, 36.08+1.03), h = 105.0, l = 0.5, w = 0.4, bottom = 36.08, top = 36.4, prop = true },
			{ coords = vec3(-1281.69, -295.7, 37.45+1.03), h = 295.0, l = 0.5, w = 0.4, bottom = 37.45, top = 37.8, prop = true },
		},
		Cocktails = {
			{ coords = vec3(-1290.33, -295.31, 36.05+1.00), h = 295.0, l = 1.55, w = 0.5, bottom = 36.05, top = 36.85 },
		},
		Shop = {
			{ coords = vec3(-1292.7, -301.18, 36.05-0.8), h = 24.0, l = 1.9, w = 0.5, bottom = 35.25, top = 36.0, },
			{ coords = vec3(-1294.39, -300.74, 36.05-0.8), h = 25.0, l = 2.5, w = 0.5, bottom = 35.25, top = 36.0, },
			{ coords = vec3(-1293.18, -296.82, 36.05-0.8), h = 295.0, l = 1.3, w = 0.5, bottom = 35.25, top = 36.0, },
			{ coords = vec3(-1290.15, -295.42, 36.05-0.8), h = 295.0, l = 1.3, w = 0.5, bottom = 35.25, top = 36.0, },
		},
		Tap = {
			{ coords = vec3(-1291.79, -295.99, 36.05), h = 295.0, l = 1.55, w = 0.5, bottom = 36.05, top = 36.85 },
		},
		Coffee = {
			{ coords = vec3(-1293.85, -302.5, 36.05), h = 25.0, l = 0.7, w = 0.5, bottom = 36.05, top = 36.65, },
		},
		HandWash = {
			{ coords = vec3(-1282.43, -294.37, 37.64), h = 295.0, l = 0.75, w = 0.6, bottom = 37.24, top = 38.24, },
		},
		Payment = {
			{ coords = vec3(-1294.17, -301.83, 36.05), h = 29.0, l = 0.4, w = 0.5, bottom = 36.05, top = 36.75, },
		},
		Tray = {
			{ coords = vec3(-1290.43, -297.76, 36.08), h = 25.0, l = 0.55, w = 0.6, bottom = 36.05, top = 36.3, prop = true },
			{ coords = vec3(-1292.52, -300.3, 36.08), h = 295.0, l = 0.55, w = 0.6, bottom = 36.05, top = 36.3, prop = true },
		},
		Storage = {
		--	{ },
		}
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 30, -- The radius of the sound from the booth
		coords = vec3(-1288.59, -292.61, 36.35), -- Where the booth is located
		playing = false, -- No touch.
	},
}
