Config = Config or {}

Config.DefaultKey = 'N'
Config.Hud = true                   -- Only enable if you are using PS hud or QB Hud (Follow the readme to install)
Config.HudName = 'ps-hud'           -- ps-hud for ps and qb-hud for qb
Config.WebhookColour = 16711680

Config.VehicleMaxSpeed = 66.5 -- (148) Sets Vehicle Max Speed in MPH (value * 2.236936) (This is a vehicle limit for what the vehicle will top out at.)

Config.GenericGear = {"C", "B", "A", "A+"} -- This is here so the resouce can tell what classes you wish to use for that class set 
Config.InterceptorGear = {"C", "B", "A", "A+", "S", "S+", "S++"} -- Same as above (and below)
Config.WidebodyGear = {"C", "B", "A", "A+", "S", "S+", "S++"}

Config.VehicleModifications = {
    { label = 'C', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = -1 , Brakes = -1, Transmission = -1, Suspension = -1},
    { label = 'B', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = 0 , Brakes = 0, Transmission = -1, Suspension = -1 },
    { label = 'A', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = 1 , Brakes = 1, Transmission = 0, Suspension = -1 },
    { label = 'A+', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = 1 , Brakes = 1, Transmission = 0, Suspension = -1 },
    { label = 'S', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = 1 , Brakes = 1, Transmission = 0, Suspension = -1 },
    { label = 'S+', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = 1 , Brakes = 1, Transmission = 0, Suspension = -1 },
    { label = 'S++', Turbo = false, XenonHeadlights = false, XenonHeadlightsColor = 0, Engine = 1 , Brakes = 1, Transmission = 0, Suspension = -1 },
}

Config.Generic = {
    ["tr_pdvic"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
    },
    ["tr_pdchar"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
    },
    ["tr_pdexp"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
    },
    ["tr_pddurango"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
    },
    ["tr_pdchar2"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
    },
    ["tr_pdtaurus"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
    },
}

Config.Widebody = {
    ["tr_pdchar"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
        ["S"] = {
            ["fInitialDriveForce"] = 0.600000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S+"] = {
            ["fInitialDriveForce"] = 0.620000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S++"] = {
            ["fInitialDriveForce"] = 0.650000,
            ["fInitialDragCoeff"] = 7.0,
        },
    },
    ["tr_pddurango"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
        ["S"] = {
            ["fInitialDriveForce"] = 0.600000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S+"] = {
            ["fInitialDriveForce"] = 0.620000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S++"] = {
            ["fInitialDriveForce"] = 0.650000,
            ["fInitialDragCoeff"] = 7.0,
        },
    },
}

Config.Interceptor = {
    ["tr_pddm"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
        ["S"] = {
            ["fInitialDriveForce"] = 0.600000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S+"] = {
            ["fInitialDriveForce"] = 0.620000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S++"] = {
            ["fInitialDriveForce"] = 0.650000,
            ["fInitialDragCoeff"] = 7.0,
        },
    },
    ["tr_pdmstang"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
        ["S"] = {
            ["fInitialDriveForce"] = 0.600000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S+"] = {
            ["fInitialDriveForce"] = 0.620000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S++"] = {
            ["fInitialDriveForce"] = 0.650000,
            ["fInitialDragCoeff"] = 7.0,
        },
    },
    ["tr_pdcv"] = {
        ["C"] = {
            ["fInitialDriveForce"] = 0.270000,
            ["fInitialDragCoeff"] = 3.0,
        },
        ["B"] = {
            ["fInitialDriveForce"] = 0.360000,
            ["fInitialDragCoeff"] = 4.0,
        },
        ["A"] = {
            ["fInitialDriveForce"] = 0.480000,
            ["fInitialDragCoeff"] = 5.0,
        },
        ["A+"] = {
            ["fInitialDriveForce"] = 0.550000,
            ["fInitialDragCoeff"] = 6.0,
        },
        ["S"] = {
            ["fInitialDriveForce"] = 0.600000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S+"] = {
            ["fInitialDriveForce"] = 0.620000,
            ["fInitialDragCoeff"] = 6.5,
        },
        ["S++"] = {
            ["fInitialDriveForce"] = 0.650000,
            ["fInitialDragCoeff"] = 7.0,
        },
    },
}

Config.Local = { -- Local File for Ox_lib
    ["ModeReset"] = "Pursuit Mode Disabled...",
    ["VehicleSet"] = "Pursuit Mode Set To B Class",
    ["VehicleClass"] = "Pursuit Mode | Class = ",
    ["titleTop"] = "Officer First & Last Name",
    ["titleMiddle"] = "Pursuit Mode Class",
    ["titleBottom"] = "Location",
    ["streetCurrent"] = "Currently on"
}