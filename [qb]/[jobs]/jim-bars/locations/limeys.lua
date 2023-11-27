-- Limeys
-- https://www.gta5-mods.com/maps/mlo-limeys-juice-bar-fivem-add-on-sp

Config.Locations["limeys"] = {
	zoneEnable = true,
	job = "limeys",
	--gang = "lostmc",
	label = "Limeys",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/d/d1/Limey%27s-GTAV-Logo.png",
	autoClockOut = { enter = true, exit = true },
	zones = {
		vec2(243.27, -1031.76),
		vec2(266.11, -1036.26),
		vec2(280.13, -1000.78),
		vec2(246.54, -1011.45)
	},
	Blip = {
		showBlip = true,
		coords = vec3(255.01, -1024.68, 29.54),
		color = 2,
		sprite = 77,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(253.24, -1022.9, 30.5), h = 320.0, l = 0.4, w = 0.5, bottom = 29.44, top = 29.84 },
		},
		Cocktails = {
			{ coords = vec3(254.37, -1019.83, 30.50), h = 250.0, l = 0.4, w = 0.5, bottom = 29.44, top = 29.84, prop = true, },
		},
		Shop = {
			{ coords = vec3(252.53, -1019.26, 28.80), h = 340.0, l = 2.0, w = 0.55, bottom = 28.44, top =  29.45, },
		},
		Tap = {
			{ coords = vec3(254.0, -1021.39, 30.50), h = 250.0, l = 0.4, w = 0.6, bottom = 30.4, top = 30.5, prop = true, },
		},
		Coffee = {
			{ coords = vec3(251.92, -1023.19, 29.50), h = 70.0, l = 0.7, w = 0.55, bottom = 29.44, top = 29.94 },
		},
		HandWash = {
		--	{ },
		},
		Payment = {
			{ coords = vec3(253.41, -1022.34, 29.50), h = 340.0, l = 0.5, w = 0.4, bottom = 29.44, top = 29.84 },
		},
		Tray = {
			{ coords = vec3(253.59, -1021.86, 29.50), h = 340.0, l = 0.4, w = 0.5, bottom = 29.44, top = 29.84, prop = true },
		},
		Storage = {
			{ coords = vec3(255.04, -1017.12, 28.51), h = 340.0, l = 0.5, w = 0.8, bottom = 28.51, top = 29.90, prop = true },
		},
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = false, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 40, -- The radius of the sound from the booth
		coords = vec3(372.75, -934.16, 25.33), -- Where the booth is located
		playing = false, -- No touch.
	},
}

