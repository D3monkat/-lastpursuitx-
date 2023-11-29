-- Galaxy Night Club

Config.Locations["galaxy"] = {
    zoneEnable = true,
    job = "galaxy",
    --gang = "lostmc",
    label = "Galaxy Nightclub",
    logo = "https://i.imgur.com/usIc09I.png",
    autoClockOut = false,
    zones = {
        vector2(357.23, 302.9),
        vector2(322.89, 311.28),
        vector2(347.11, 273.48),
        vector2(308.03, 269.83)
    },
    Blip = {
        showBlip = true,
        coords = vector3(343.88, 307.0, 104.25),
        color = 27,
        sprite = 93,
    },
    Targets = {
        Clockin = {
            { coords = vector3(391.36, 269.19, 94.99), h = 120.0, l = 0.9, w = 0.5, bottom = 93.9, top = 95.79, }, -- Mac pro upstairs back main room
        },
        Cocktails = {
            { coords = vector3(351.0, 285.87, 91.19), h = 344.0, l = 1.15, w = 2.0, bottom = 88.96, top = 91.99, },-- first bar below entry
            { coords = vector3(357.21, 277.47, 94.19), h = 295.0, l = 1.85, w = 0.85, bottom = 93.89, top = 94.99, },-- main room upper main bar left
            { coords = vector3(358.99, 283.95, 94.19), h = 35.0, l = 1.85, w = 0.85, bottom = 93.89, top = 94.99, },-- main room upper main bar right
            { coords = vector3(409.15, 249.89, 92.05), h = 345.0, l = 0.65, w = 0.85, bottom = 91.55, top = 92.85, },-- pool table room
        },
        Shop = { 
            { coords = vector3(351.92, 274.69, 94.19), h = 345.0, l = 1.75, w = 0.75, bottom = 92.19, top = 95.39, },-- main room upper main bar
            { coords = vector3(355.04, 288.36, 91.19), h = 255.0, l = 1.85, w = 0.85, bottom = 88.59, top = 92.59, },--     first bar below entry
            { coords = vector3(406.84, 249.97, 92.05), h = 75.0, l = 1.0, w = 0.5, bottom = 90.75, top = 92.85, },-- pool table room
        },
        Tap = {
            { coords = vector3(353.16, 285.67, 91.19), h = 74.0, l = 0.7, w = 0.5, bottom = 89.99, top = 91.99, },-- first bar below entry
            { coords = vector3(355.34, 281.85, 94.19), h = 345.0, l = 1.5, w = 0.5, bottom = 93.99, top = 94.99, },-- main room upper main bar
        },
        Coffee = {
            { coords = vector3(350.22, 287.67, 91.19), h = 73.3, l = 0.5, w = 0.5, bottom = 90.0, top = 92.0, prop = true },--
        },
        HandWash = {
            { coords = vector3(352.79, 277.35, 94.19), h = 345.0, l = 1.45, w = 0.85, bottom = 92.79, top = 94.79, },-- main room upper main bar back room
            { coords = vector3(357.61, 278.75, 94.19), h = 345.0, l = 1.25, w = 0.85, bottom = 92.50, top = 94.99, },-- main room upper main bar back
        },
        Payment = {
            { coords = vector3(352.15, 289.14, 91.19), h = 340.0, l = 0.5, w = 0.5, bottom = 90.80, top = 91.79, },-- first bar below entry
            { coords = vector3(355.52, 282.91, 94.19), h = 340.0, l = 0.5, w = 0.5, bottom = 93.99, top = 94.99, },-- main room upper main bar
            { coords = vector3(406.29, 248.39, 92.05), h = 345.0, l = 0.5, w = 0.5, bottom = 91.65, top = 92.85, prop = true },-- pool table room
        },
        Tray = {
            { coords = vector3(352.28, 285.51, 91.19), h = 75.0, l = 0.6, w = 0.2, bottom = 90.69, top = 91.79, },-- first bar below entry
            { coords = vector3(359.02, 280.98, 94.19), h = 344.0, l = 2.25, w = 0.85, bottom = 93.99, top = 94.99, },-- main room upper main bar
            { coords = vector3(408.1, 250.21, 92.05), h = 75.0, l = 1.0, w = 0.4, bottom = 91.85, top = 92.85, },-- pool table room
        },
    },
    --Custom DJ Booth Stuff
    Booth = {
        enableBooth = false, -- Set false if using external DJ/Music stuff.
        DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
        radius = 40, -- The radius of the sound from the booth
        coords = vector3(372.75, -934.16, 25.33), -- Where the booth is located
        playing = false, -- No touch.
    },
}