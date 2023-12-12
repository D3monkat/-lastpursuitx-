-- LostMC Bar in Paleto
-- https://www.gta5-mods.com/maps/mlo-lost-mc-bar-paleto-bay-add-on-sp-fivem-altv

Config.Locations["lostmcpaleto"] = {
	zoneEnable = true,
	--job = "mechanic",
	gang = "lostmc",
	label = "LostMC Bar",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/b/b6/LostMCPatch-GTAV-Worn.png",
	autoClockOut = { enter = false, exit = true },
	zones = {
		vec2(-39.320045471191, 6483.0458984375),
		vec2(-26.301452636719, 6496.5688476562),
		vec2(-3.9524810314178, 6480.0600585938),
		vec2(-19.794105529785, 6462.06640625)
	},
	Blip = {
		showBlip = true,
		coords = vec3(-25.82, 6480.6, 31.5),
		color = 9,
		sprite = 93,
		scale = 0.7,
		disp = 6,
		category = nil,
	},
	Targets = {
		Clockin = {
			{ coords = vec3(-20.84, 6481.85, 32.51), h = 315.0, l = 0.5, w = 0.4, bottom = 31.37, top = 31.69, prop = true },
		},
		Cocktails = {
			{ coords = vec3(-20.4, 6481.58, 32.41), h = 40.0, l = 0.3, w = 0.3, bottom = 31.37, top = 31.69, },
		},
		Shop = {
			{ coords = vec3(-19.98, 6480.06, 31.49), h = 315.0, l = 0.8, w = 0.5, bottom = 31.49, top = 32.7, },
		},
		Tap = {
			{ coords = vec3(-20.83, 6479.95, 31.49), h = 44.0, l = 0.7, w = 0.4, bottom = 31.49, top = 32.2, },
		},
		Coffee = {
			{ coords = vec3(-20.05, 6481.25, 31.39), h = 310.0, l = 0.4, w = 0.25, bottom = 31.29, top = 31.99, prop = true },
		},
		HandWash = {
			{ coords = vec3(-23.93, 6475.18, 31.5), h = 315.0, l = 0.7, w = 0.5, bottom = 30.7, top = 31.7, },
		},
		Payment = {
			{ coords = vec3(-22.37, 6481.82, 31.49), h = 320.0, l = 0.4, w = 0.55, bottom = 31.49, top = 32.09, prop = true, },
		},
		Tray = {
			{ coords = vec3(-21.59, 6480.62, 31.54), h = 135.0, l = 0.35, w = 0.55, bottom = 31.49, top = 32.09, prop = true, },
		},
		Storage = {
			{ coords = vec3(-20.41, 6481.42, 30.49), h = 43.0, l = 2.0, w = 0.5, bottom = 30.49, top = 31.45, },
		}
	},
	--Custom DJ Booth Stuff
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 30, -- The radius of the sound from the booth
		coords = vec3(-29.0, 6480.79, 31.5), -- Where the booth is located
		playing = false, -- No touch.
	},
}
