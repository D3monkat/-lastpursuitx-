-- Irish pub next to casino
-- https://www.gta5-mods.com/maps/mlo-irish-pub-fivem-altv-sp

Config.Locations["irishpub"] = {
	zoneEnable = true,
	job = "irishpub",
	--gang = "lostmc",
	label = "Irish Pub",
	logo = "https://i.imgur.com/2hJ4w9n.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(856.5771484375, -111.25072479248),
		vec2(822.66241455078, -88.403450012207),
		vec2(805.86566162109, -117.47148132324),
		vec2(842.22521972656, -137.1206817627)
	},
	Blip = {
		showBlip = true,
		coords = vec3(850.24, -112.64, 79.43),
		color = 2,
		sprite = 93,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(831.62, -111.69, 79.77+1.0), h = 340.0, l = 0.5, w = 0.5, bottom = 79.82, top = 80.42, },
		},
		Cocktails = {
			{ coords = vec3(837.03, -114.84, 79.77+1), h = 60.0, l = 0.6, w = 0.4, bottom = 79.77, top = 80.17, },
		},
		Shop = {
			{ coords = vec3(833.53, -115.05, 79.77-1), h = 60.0, l = 0.85, w = 0.5, bottom = 78.77, top = 80.92, },
			{ coords = vec3(836.56, -114.71, 79.77-1), h = 60.0, l = 1.3, w = 0.5, bottom = 78.77, top = 79.72, },
			{ coords = vec3(832.57, -114.5, 79.77-1), h = 60.0, l = 1.3, w = 0.5, bottom = 78.77, top = 79.72, },
			{ coords = vec3(835.02, -115.91, 79.77-1), h = 60.0, l = 2.6, w = 0.5, bottom = 78.77, top = 79.72, },
		},
		Tap = {
			{ coords = vec3(837.92, -114.92, 79.77), h = 60.0, l = 0.7, w = 0.4, bottom = 79.77, top = 80.77 },
			{ coords = vec3(835.74, -113.66, 79.77), h = 60.0, l = 0.7, w = 0.4, bottom = 79.77, top = 80.77 },
		},
		Coffee = {
			{ coords = vec3(832.81, -114.79, 79.77), h = 328.0, l = 0.5, w = 0.4, bottom = 79.67, top = 80.47, },
		},
		HandWash = {
			{ coords = vec3(842.38, -122.33, 79.77), h = 328.0, l = 0.7, w = 0.5, bottom = 79.37, top = 80.37, },
			{ coords = vec3(841.36, -124.06, 79.77), h = 328.0, l = 0.7, w = 0.5, bottom = 79.37, top = 80.37, },
			{ coords = vec3(840.33, -125.77, 79.77), h = 328.0, l = 0.7, w = 0.5, bottom = 79.37, top = 80.37, },
			{ coords = vec3(824.97, -110.45, 79.77), h = 328.0, l = 0.6, w = 1.0, bottom = 79.37, top = 80.37, },
		},
		Payment = {
			{ coords = vec3(834.53, -115.76, 79.77), h = 330.0, l = 0.5, w = 0.4, bottom = 79.62, top = 80.27, },
		},
		Tray = {
			{ coords = vec3(836.82, -114.01, 79.935), h = 330.0, l = 0.55, w = 0.6, bottom = 79.77, top = 80.17, prop = true },
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
		coords = vec3(832.44, -112.15, 79.77), -- Where the booth is located
		playing = false, -- No touch.
	},
}