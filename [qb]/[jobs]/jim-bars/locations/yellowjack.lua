-- Vanilla Yellow Jack in Sandy Shores

Config.Locations["yellowjack"] = {
	zoneEnable = true,
	job = "yellowjack",
	--gang = "lostmc",
	label = "Yellow Jack",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/a/a2/YellowJackInn-GTAV-Logo.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(1994.7991943359, 3088.4384765625),
		vec2(2024.5247802734, 3068.8742675781),
		vec2(1988.9927978516, 3012.8618164062),
		vec2(1958.4154052734, 3031.8942871094)
	},
	Blip = {
		showBlip = true,
		coords = vec3(1992.76, 3056.65, 47.06),
		color = 46,
		sprite = 93,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(1986.63, 3056.0, 48.22), h = 58.0, l = 1.15, w = 0.3, bottom = 47.22, top = 48.82, },
		},
		Cocktails = {
			{ coords = vec3(1982.43, 3049.51, 48.00), h = 58.0, l = 0.7, w = 0.65, bottom = 46.92, top = 47.62, },
		},
		Shop = {
			{ coords = vec3(1984.96, 3048.29, 47.22), h = 57.0, l = 0.9, w = 0.7, bottom = 46.22, top = 48.22, },
			{ coords = vec3(1981.3, 3052.73, 47.22), h = 328.0, l = 1.2, w = 0.6, bottom = 46.22, top = 47.17, },
			{ coords = vec3(1982.05, 3053.75, 47.22), h = 328.0, l = 1.2, w = 0.5, bottom = 46.22, top = 47.17, },
		},
		Tap = {
			{ coords = vec3(1980.74, 3051.6, 47.22), h = 328.0, l = 1.25, w = 0.5, bottom = 47.22, top = 48.82 },
		},
		Coffee = {
			{ coords = vec3(1981.02, 3052.36, 47.22), h = 328.0, l = 0.25, w = 0.65, bottom = 47.22, top = 47.82, },
		},
		HandWash = {
			{ coords = vec3(1983.8, 3053.09, 47.22), h = 328.0, l = 0.75, w = 0.5, bottom = 46.62, top = 47.32, },
			{ coords = vec3(1980.98, 3050.69, 47.21), h = 58.0, l = 0.85, w = 0.9, bottom = 46.61, top = 47.61, },
		},
		Payment = {
			{ coords = vec3(1981.9, 3053.73, 47.22), h = 148.0, l = 0.4, w = 0.5, bottom = 47.22, top = 47.62, },
		},
		Tray = {
			{ coords = vec3(1984.93, 3054.31, 47.22), h = 328.0, l = 0.8, w = 1.5, bottom = 46.82, top = 47.62, },
			{ coords = vec3(1983.67, 3052.19, 47.22), h = 328.0, l = 0.8, w = 1.2, bottom = 46.82, top = 47.62, },
		},
		Storage = {
			{ coords = vec3(1984.56, 3055.32, 46.19), h = 328.45, l = 0.5, w = 0.8, bottom = 46.82, top = 47.82, prop = true },
		},
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 30, -- The radius of the sound from the booth
		coords = vec3(1987.92, 3051.77, 47.22), -- Where the booth is located
		playing = false, -- No touch.
	},
}
