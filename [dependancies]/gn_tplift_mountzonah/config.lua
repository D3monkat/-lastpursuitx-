ELEVATOR_MENU_TITLE = "Elevator"
ELEVATOR_MENU_DESCRIPTION = "The world fastest elevator!"
MARKER_NOTIFICATION = "Press ~INPUT_CONTEXT~ to access ~b~elevator menu"

ZONES = {
    --Mount Zonah Medical Center--
    ['middle_floor_1'] = {
        label = "Middle floor",
        coords = vec4(-493.6240, -327.1189, 42.3073, 171.8218),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'upper_floor_1'
        }
    },
    ['middle_floor_2'] = {
        label = "Middle floor",
        coords = vec4(-490.6217, -327.5114, 42.3074, 176.5276),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'upper_floor_2'
        }
    },
    ['middle_floor_3'] = {
        label = "Middle floor",
        coords = vec4(-487.5668, -328.1387, 42.3072, 172.7814),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'upper_floor_3'
        }
    },
    ['upper_floor_1'] = {
        label = "Upper floor",
        coords = vec4(-493.4203, -327.1465, 69.5048, 174.1004),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'middle_floor_1'
        }
    },
    ['upper_floor_2'] = {
        label = "Upper floor",
        coords = vec4(-490.4966, -327.5276, 69.5050, 174.9955),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'middle_floor_2'
        }
    },
    ['upper_floor_3'] = {
        label = "Upper floor",
        coords = vec4(-487.5024, -327.9883, 69.5050, 169.2472),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'middle_floor_3'
        }
    },
    ['main_floor_lift'] = {
        label = "Main floor",
        coords = vec4(-442.2075, -342.9900, 35.0052, 167.2911),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'middle_floor_lift'
        }
    },
    ['middle_floor_lift'] = {
        label = "Middle floor",
        coords = vec4(-442.1522, -343.1809, 42.4325, 342.6664),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'main_floor_lift'
        }
    },
    ['staff_main'] = {
        label = "Emergency",
        coords = vec4(-452.6657, -288.5636, 34.9493, 113.2766),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_upper',
            "staff_underground",
            "helipad_1",
            'mz_ambulance_garage_01'
        }
    },
    ['staff_upper'] = {
        label = "Room floor",
        coords = vec4(-452.5607, -288.5359, 69.5395, 114.5866),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            "staff_underground",
            "helipad_1",
            'mz_ambulance_garage_01'
        }
    },
    ['staff_underground'] = {
        label = "Operating/Laboratory",
        coords = vec4(-452.5061, -288.4799, -130.8365, 121.2068),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            "staff_upper",
            "helipad_1",
            'mz_ambulance_garage_01'
        }
    },
    ['helipad_1'] = {
        label = "Helipad access (roof)",
        coords = vec4(-439.7648, -335.8337, 78.3007, 82.3231),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            "staff_upper",
            "staff_underground",
            'mz_ambulance_garage_01'
        }
    },
    ['helipad_2'] = {
        label = "Helipad access (roof)",
        coords = vec4(-440.7327, -339.7452, 78.3125, 93.2510),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            "staff_upper",
            "staff_underground",
            'mz_ambulance_garage_02'
        }
    },
    ['helipad_3'] = {
        label = "Helipad access (roof)",
        coords = vec4(-449.5277, -338.5990, 78.3134, 263.4413),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            "staff_upper",
            "staff_underground",
            'mz_ambulance_garage_01'
        }
    },
    ['helipad_4'] = {
        label = "Helipad access (roof)",
        coords = vec4(-449.1564, -334.6594, 78.3010, 265.4069),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            "staff_upper",
            "staff_underground",
            'mz_ambulance_garage_02'
        }
    },
    ['garage_main'] = {
        label = "Main hall",
        coords = vec4(-436.1739, -359.8416, 34.9498, 350.9644),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'garage_1',
            'garage_2'
        }
    },
    ['garage_1'] = {
        label = "Parking  north",
        coords = vec4(-418.6887, -344.7437, 24.2318, 110.5469),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'garage_main'
        }
    },
    ['garage_2'] = {
        label = "Parking  south",
        coords = vec4(-495.6707, -372.8068, 24.2317, 290.3439),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'garage_main'
        }
    },
    ['mz_ambulance_garage_02'] = {
        label = "Ambulance Garage",
        coords = vec4(-512.6515, -332.5018, 34.3866, 261.2480),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            'staff_upper',
            'staff_underground',
            'helipad_1',
            'garage_2'
        }
    },
    ['mz_ambulance_garage_01'] = {
        label = "Ambulance Garage",
        coords = vec4(-512.2889, -328.5314, 34.3866, 263.0868),
        interactDistance = 1.5,
        renderDistance = 5.0,
        directions = {
            'staff_main',
            'staff_upper',
            'staff_underground',
            'helipad_2',
            'garage_2'
        }
    }
}