CABLE_CARS = {
    [0] = { -- Left track car
        entity = nil, -- The car itself
        -- Doors (I don't actually know if the left ones are on the left or not)
        doorLL = nil,
        doorLR = nil,
        doorRL = nil,
        doorRR = nil,
        index = 0, -- The index, used to set the track
        position = vec3(0,0,0), -- The current position of the car
        direction = 1, -- What direction we're moving (up or down)
        gradient = 1, -- Believed to be the gradient during research, but was actually just the current node we're moving from
        run_timer = 0, -- Scale used for lerping
        altitude = 0, -- Used for the scenic camera in SP, not used here
        activation_timer = 0, -- Not used here
        gradient_distance = 0.0, -- Distance between the current node we're moving from and the next node
        offset_modifier = 0.0, -- Something believed to be an offset modifier
        can_move = true, -- Determine if the car can move, not actually used here though
        is_player_seated = false, -- Another value from the SP script, not actually used because fucking hell I'm tired
        speed = 17.5, -- Movement speed modifier, determines the speed of the car on the track
		maxSpeedDistance = 50, -- Distance from station at which the car will attain maximum speed
        state = "IDLE", -- The current state of the car
        showTramBlips = true, -- Show blip on the map
        offset = vec3(-0.2, 0.0, 0.0),

        moving = false,
        zones = {
            [1] = {
                poly = {
                    vec2(441.42828369141, 5575.845703125),
                    vec2(451.15399169922, 5575.8627929688),
                    vec2(451.12448120117, 5579.20703125),
                    vec2(441.39624023438, 5579.236328125)
                },
                minmax = { 41, 42 }
            },
            [2] = {
                poly = {
                    vector2(-736.09643554688, 5597.873046875),
                    vector2(-746.07440185547, 5597.7553710938),
                    vector2(-746.12506103516, 5601.1118164062),
                    vector2(-735.55377197266, 5600.9775390625)
                },
                minmax = { 41, 42 }
            },
        },
    },
    [1] = { -- Right track car
        entity = nil,
        doorLL = nil,
        doorLR = nil,
        doorRL = nil,
        doorRR = nil,
        index = 1,
        position = vec3(0,0,0),
        direction = 1,
        gradient = 1,
        run_timer = 0,
        altitude = 0,
        activation_timer = 0,
        gradient_distance = 0.0,
        offset_modifier = 0.0,
        can_move = true,
        is_player_seated = false,
        speed = 17.5,
		maxSpeedDistance = 50,
        state = "IDLE",
        showTramBlips = true,
        offset = vec3(-0.2, 0.0, 0.0),

        moving = false,
        zones = {
            [1] = {
                poly = {
                    vector2(451.11120605469, 5568.0834960938),
                    vector2(451.16217041016, 5564.7900390625),
                    vector2(441.19195556641, 5564.7612304688),
                    vector2(441.36416625977, 5568.08984375)
                },
                minmax = { 41, 42 }
            },
            [2] = {
                poly = {
                    vec2(-736.14, 5592.33),
                    vec2(-746.18, 5592.27),
                    vec2(-746.19, 5588.88),
                    vec2(-736.09, 5589.0)
                },
                minmax = { 41, 42 }
            },
        },
    },
}

TRACKS = {
    [0] = { -- Left skytram (from bottom)
        vec3(-740.911, 5599.341, 47.25),
        vec3(-739.557, 5599.346, 46.997),
        vec3(-581.009, 5596.517, 77.379),
        vec3(-575.717, 5596.388, 79.22),
        vec3(-273.805, 5590.844, 240.795),
        vec3(-268.707, 5590.744, 243.395),
        vec3(6.896, 5585.668, 423.614),
        vec3(11.774, 5585.591, 426.711),
        vec3(236.82, 5581.445, 599.642),
        vec3(241.365, 5581.369, 603.183),
        vec3(412.855, 5578.216, 774.401),
        vec3(417.541, 5578.124, 777.688),
        vec3(444.93, 5577.589, 786.535),
        vec3(446.288, 5577.59, 786.75),
    },
    [1] = { -- Right skytram (from bottom)
        vec3(446.291, 5566.377, 786.75),
        vec3(444.937, 5566.383, 786.551),
        vec3(417.371, 5567.001, 777.708),
        vec3(412.661, 5567.085, 774.439),
        vec3(241.31, 5570.594, 603.137),
        vec3(236.821, 5570.663, 599.561),
        vec3(11.35, 5575.298, 426.629),
        vec3(6.575, 5575.391, 423.57),
        vec3(-268.965, 5580.996, 243.386),
        vec3(-273.993, 5581.124, 240.808),
        vec3(-575.898, 5587.286, 79.251),
        vec3(-581.321, 5587.4, 77.348),
        vec3(-739.646, 5590.614, 47.006),
        vec3(-740.97, 5590.617, 47.306),
    },
}