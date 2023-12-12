-- Patoche Cyber Bar v2
-- https://www.gta5-mods.com/maps/mlo-cyber-bar-fivem-sp

Config.Locations["cyberbar"] = {
	zoneEnable = true,
	job = "cyberbar",
	--gang = "lostmc",
	label = "Cyber Bar",
	logo = "https://i.imgur.com/j71myMw.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(387.77279663086, -945.43768310547),
		vec2(387.15032958984, -897.94818115234),
		vec2(297.16616821289, -898.40850830078),
		vec2(275.4811706543, -944.27935791016)
	},
	Blip = {
		showBlip = true,
		coords = vec3(336.69, -905.98, 29.25),
		color = 27,
		sprite = 93,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(323.12, -927.2, 29.00), h = 0.0, l = 1.5, w = 0.5, bottom = 28.85, top = 30.45, },
		},
		Cocktails = {
			{ coords = vec3(338.27, -914.51, 30.00), h = 350.0, l = 1.25, w = 0.5, bottom = 28.96, top = 29.56, },
			{ coords = vec3(333.8, -915.05, 30.00), h = 25.0, l = 1.2, w = 0.5, bottom = 28.96, top = 29.56, },
			{ coords = vec3(333.81, -907.65, 30.00), h = 325.0, l = 1.4, w = 0.5, bottom = 28.96, top = 29.56, },
			{ coords = vec3(338.42, -908.76, 30.00), h = 0.0, l = 1.2, w = 0.5, bottom = 28.96, top = 29.56, },
		},
		Shop = {
			{ coords = vec3(333.85, -909.97, 28.36), h = 359.0, l = 2.65, w = 0.5, bottom = 28.21, top = 29.01, },
			{ coords = vec3(335.86, -915.71, 28.26), h = 269.0, l = 1.9, w = 0.6, bottom = 28.21, top = 29.01, },
			{ coords = vec3(338.1, -912.03, 28.26), h = 0.0, l = 0.7, w = 0.6, bottom = 28.21, top = 29.01, },
		},
		Tap = {
			{ coords = vec3(338.66, -911.33, 29.36), h = 359.0, l = 0.7, w = 0.4, bottom = 29.36, top = 29.91, },
			{ coords = vec3(333.25, -909.71, 29.36), h = 359.0, l = 0.7, w = 0.4, bottom = 29.36, top = 29.91, },
		},
		Coffee = {
			{ coords = vec3(335.48, -915.85, 29.06), h = 174.0, l = 0.5, w = 0.5, bottom = 29.06, top = 29.66, prop = true },
		},
		HandWash = {
			{ coords = vec3(338.45, -912.06, 29.00), h = 359.0, l = 0.6, w = 0.6, bottom = 28.86, top = 29.21, },
			{ coords = vec3(338.47, -910.74, 29.00), h = 359.0, l = 0.6, w = 0.6, bottom = 28.86, top = 29.21, },
			{ coords = vec3(333.51, -910.37, 29.00), h = 359.0, l = 0.6, w = 0.6, bottom = 28.86, top = 29.21, },
			{ coords = vec3(333.55, -909.07, 29.00), h = 359.0, l = 0.6, w = 0.6, bottom = 28.86, top = 29.21, },
		},
		Payment = {
			{ coords = vec3(333.59, -914.1, 29.00), h = 1.0, l = 0.4, w = 0.55, bottom = 28.96, top = 29.56, },
		},
		Tray = {
			{ coords = vec3(338.69, -912.02, 29.25), h = 359.0, l = 0.5, w = 0.3, bottom = 29.3, top = 29.5, },
			{ coords = vec3(338.72, -910.72, 29.26), h = 0.0, l = 0.5, w = 0.3, bottom = 29.3, top = 29.5, },
			{ coords = vec3(333.28, -910.37, 29.26), h = 0.0, l = 0.5, w = 0.3, bottom = 29.3, top = 29.5, },
			{ coords = vec3(333.29, -909.08, 29.26), h = 0.0, l = 0.5, w = 0.3, bottom = 29.3, top = 29.5, },
		},
		Storage = {
			{ coords = vec3(337.41, -907.2, 28.06), h = 330.15, l = 0.5, w = 0.8, bottom = 28.0, top = 29.0, prop = true, },
		},
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 40, -- The radius of the sound from the booth
		coords = vec3(372.75, -934.16, 25.33), -- Where the booth is located
		playing = false, -- No touch.
	},
}

