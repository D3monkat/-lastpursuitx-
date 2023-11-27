-- Split Sides in Vinewood
-- https://www.gta5-mods.com/maps/split-sides-west-mlo-fivem-ragemp

Config.Locations["splitsides"] = {
	zoneEnable = true,
	job = "splitsides",
	--gang = "lostmc",
	label = "Split Sides",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/4/40/Split-Sides-GTAIV-Logo.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(-415.41961669922, 252.84022521973),
		vec2(-466.17614746094, 259.34390258789),
		vec2(-460.81491088867, 305.86346435547),
		vec2(-405.25280761719, 301.07598876953),
		vec2(-408.814453125, 257.96966552734)
	},
	Blip = {
		showBlip = true,
		coords = vec3(-430.07, 267.26, 83.42),
		color = 9,
		sprite = 93,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(-435.04, 271.82, 83.56+1), h = 90.0, l = 0.5, w = 0.4, bottom = 83.56, top = 84.12, prop = true },
		},
		Cocktails = {
			{ coords = vec3(-433.49, 276.85, 83.53+1.03), h = 356.0, l = 0.4, w = 0.54, bottom = 83.53, top = 84.02, prop = true },
		},
		Shop = {
			{ coords = vec3(-432.94, 271.91, 83.42-1), h = 355.0, l = 1.85, w = 0.5, bottom = 82.42, top = 83.52, },
			{ coords = vec3(-432.77, 273.79, 83.42-1), h = 355.0, l = 1.85, w = 0.5, bottom = 82.42, top = 83.52, },
		},
		Tap = {
			{ coords = vec3(-434.91, 272.95, 83.56+1), h = 85.0, l = 0.4, w = 0.65, bottom = 83.56, top = 84.32, prop = true},
		},
		Coffee = {
			{ coords = vec3(-432.78, 271.59, 83.42), h = 356.0, l = 0.65, w = 0.5, bottom = 83.42, top = 84.02, },
		},
		HandWash = {
			{ coords = vec3(-424.45, 275.55, 83.42), h = 85.0, l = 3.5, w = 0.6, bottom = 83.02, top = 84.22, },
		},
		Payment = {
			{ coords = vec3(-432.54, 276.81, 83.42), h = 85.0, l = 0.55, w = 0.55, bottom = 83.52, top = 84.07, },
		},
		Tray = {
			{ coords = vec3(-434.8, 274.4, 83.57), h = 85.0, l = 0.35, w = 0.55, bottom = 83.52, top = 83.92, prop = true, },
		},
		Storage = {
		--	{ },
		}
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 45, -- The radius of the sound from the booth
		coords = vec3(-442.53, 278.99, 83.02), -- Where the booth is located
		playing = false, -- No touch.
	},
}