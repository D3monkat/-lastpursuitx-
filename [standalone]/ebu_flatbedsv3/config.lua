Config = {}

Config.InteractDistance         = 2.0   -- Distance to check if near a truck on foot
Config.CloseVehiclesDistance    = 10.0  -- Distance to check for nearby vehicles
Config.WinchSpeed               = 0.6   -- Winch Speed. HIGHLY suggest adjusting in 0.1 increments
Config.GetInDistance            = 3.5
Config.MaxWinchLength           = 20.0
Config.MinWindDistance          = 2.4

Config.Doublecheck              = true  -- Double locks the vehicle onto the bed to try and ensure its touching the bed
Config.DisableCabControl        = true  -- Disables Left Stick Control and Ctrl + Shift while driving.
Config.DisableSpeed             = 3.0   -- Speed at which the controls get disabled

--Beta Movement                         -- if True, MinPos & MaxPos need to be set for the vehicle
Config.BetaMove                 = true
Config.BedSpeed                 = 0.0003

--NOTIFICATIONS--
Config.Notifications            = true

--TRANSLATIONS More customization in utils.lua including key controls
Config.NotiUnLoadCompleteMessage    = "Unload Complete"
Config.NotiLoadCompleteMessage      = "Loading Complete"
Config.NotiBlockedMessage           = "Unloading zone blocked"
Config.NotiFBBlockedMessage         = "Flatbed blocked or occupied"

--========Markers & Prompts=======--
--Increases tick rate from 0.01 to 0.08 - 0.1 when in range
Config.MarkerDistance   = 5.0       -- Distance from point to see marker
Config.WaitTimer = 3000             -- Update rate to check for nearby trailer seconds * 1000 (Default 3000)
Config.ShowMarkers = true           -- Display markers at interaction points
Config.ShowHelp = true              -- Display help prompts
Config.MessageDistance = 2.0        -- Distance from point to display message (Default 2.0)
Config.Marker = {
    type = 1,                      -- marker shape: https://docs.fivem.net/docs/game-references/markers/ (Default 27)

    Size = 1.0,                     -- marker size (Default 2.0)

    Color = {                       -- RGBA color
        red = 100,
        green = 200,
        blue = 200,
        alpha = 150
    },
    heightOffset = 0.0,             -- Height from ground for marker. Marker at ground Z (Default 0.0)
    Bob = false,                    -- Marker bobbing up and down (Default false)
    faceCamera = false,             -- Marker always faces camera (Default false)
    rotate = false                  -- Marker rotates (Default false)
}
Config.Controlmessages = {
    LowerBed = "Lower",
    RaiseBed = "Raise bed",
    AttachVehicle = "Attach/Detach",
    WindWinch = "Wind",
    ExtendWinch = "Unwind",
    DetachWinch = "Detach Winch",
    WheelLift = "WheelLift"
}

--========Trucks========--
Config.Trucks = {
    --Bagged
    [GetHashKey('ct660tow')] = {
        type = 'rolling',                       -- Rolling for moving beds, static for flatbeds like the vanilla flatbed
        boneName = 'misc_a',                    -- Name of the bone to attach to Generally embedded in the flatbed
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,              -- Max distance in meters the winch will unwind
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, 0.4, -0.1),  -- Offset from the boneName position
        carHeightOffset = 0.375,                -- Height to adjust attached car by
        winchBone = 'misc_b',                   -- Bone for winch Rope
        winchDistCheck = 5.0,                   -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0,                     -- How far backwards from the winch bone to check from
        MinPos = 0.03,                          -- Position of the bed when raised fully
        MaxPos = 0.26                           -- Position of the bed when lowered fully
    },
    [GetHashKey('bc205500w')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, 0.8, 0.0),
        carHeightOffset = 0.2,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.028,
        MaxPos = 0.26
    },
    [GetHashKey('bcsandking5500wr')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, 0.8, 0.0),
        carHeightOffset = -0.05,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,              --Position of the bed when raised fully
        MaxPos = 0.26               -- Position of the bed when lowered fully
    },
    --Code3
    [GetHashKey('c3rollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-6.0,-0.55)},
        carPosition = vector3(0.0, 0.5, 0.2),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.02,
        MaxPos = 0.25
    },
    [GetHashKey('c3pwrollback')] = { 
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.6,-0.55)},
        carPosition = vector3(0.0, 0.5, 0.2),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.02,
        MaxPos = 0.22
    },
    [GetHashKey('c3f350rollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.6,-0.55)},
        carPosition = vector3(0.0, 0.5, 0.2),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.02,
        MaxPos = 0.23
    },
    [GetHashKey('c3navistar')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.2,-0.55),vector3(1.8,-5.2,-0.55)},
        carPosition = vector3(0.0, 0.4, -0.4),
        carHeightOffset = 0.0,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.02,
        MaxPos = 0.27
    },
    [GetHashKey('c3silvrollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.9,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.0),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.02,
        MaxPos = 0.23
    },

    --Redneck
    [GetHashKey('f550rb')] = {
        type = 'rolling',
        staticBed = false,
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.75,-0.55),vector3(1.8,-4.75,-0.55)},
        carPosition = vector3(0.0, -0.0, 0.0),
        carHeightOffset = 0.2,
        winchBone = 'attach_male',
        winchDistCheck = 5.0,
        winchOffset = 8.0,
        MinPos = 0.00,
        MaxPos = 0.33

    },
    [GetHashKey('f550rbc')] = {
        type = 'rolling',
        staticBed = false,
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.75,-0.55),vector3(1.8,-4.75,-0.55)},
        carPosition = vector3(0.0, -0.0, 0.0),
        carHeightOffset = -0.2,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.33
    },
    [GetHashKey('20ramrbc')] = {
        type = 'rolling',
        staticBed = false,
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.75,-0.55),vector3(1.8,-4.75,-0.55)},
        carPosition = vector3(0.0, -0.0, 0.0),
        carHeightOffset = 0,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.33

    },

    --https://www.gta5-mods.com/vehicles/freightliner-m2-crew-cab-flatbed-add-on-script-beta [[VEHICLE ONLY]]
    [GetHashKey('flatbedm2')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55), vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, 1.2, -0.1),
        carHeightOffset = 0.2,
        winchBone = 'misc_b',
        winchDistCheck = 10.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0 , --How far backwards from the winch bone to check from
        MinPos = 0.025,
        MaxPos = 0.22
    },

    --LordGooben
    [GetHashKey('lgc19flatbed')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, 1.2, -0.1),
        carHeightOffset = 0.5,
        winchBone = 'misc_b',
        winchDistCheck = 10.0,
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.028,
        MaxPos = 0.23
    },

    --MAOAM
    
    [GetHashKey('389towmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.5,0.55),vector3(1.8,-1.5,0.55)},
        carPosition = vector3(0.0, -0.1, 0.0),
        carHeightOffset = 0.375,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25,
        wheellift = 5

    },

    [GetHashKey('389towmfd3')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.5,0.55),vector3(1.8,-1.5,0.55)},
        carPosition = vector3(0.0, -0.1, 0.06),
        carHeightOffset = 0.375,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25,
        wheellift = 5

    },

    [GetHashKey('389towmfd4')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.9,0.55),vector3(1.8,-1.9,0.55)},
        carPosition = vector3(0.0, -0.3, -0.12),
        carHeightOffset = 0.375,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.22,
        wheellift = 5

    },

    [GetHashKey('389towmfd5')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.9,0.55),vector3(1.8,-1.9,0.55)},
        carPosition = vector3(0.0, -0.3, -0.12),
        carHeightOffset = 0.375,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.22,
        wheellift = 5

    },

    [GetHashKey('389towmfd6')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 12.0,
        BedControl = {vector3(-1.8,-2.5,0.55), vector3(1.8,-2.5,0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.14,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.035,
        MaxPos = 0.25,
        wheellift = 5

    },

    [GetHashKey('389towmfd7')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.9,0.55),vector3(1.8,-1.9,0.55)},
        carPosition = vector3(0.0, -1.2, -0.08),
        carHeightOffset = 0.375,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.036,
        MaxPos = 0.24,
        wheellift = 5

    },

    [GetHashKey('112towmfd4')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 11.0,
        BedControl = {vector3(-1.8,-7.5,-0.55),vector3(1.8,-7.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.2),
        carHeightOffset = 0.0,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25,
        wheellift = 5
    },

    [GetHashKey('108towmfd4')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-3.0,-0.55),vector3(1.8,-3.0,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.4,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25,
        wheellift = 5
    }, 

    [GetHashKey('108utwmfd3')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-3.0,-0.55),vector3(1.8,-3.0,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.55,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.21
    }, 

    [GetHashKey('440towmfd4')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-6.5,-0.55),vector3(1.8,-6.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.1,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.24,
        wheellift = 5
    },

    [GetHashKey('440towmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.5,-0.55),vector3(1.8,-5.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.45,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.26,
        wheellift = 5
    },

    [GetHashKey('cortowmfd4')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.25,-0.55),vector3(1.8,-5.25,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.05,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.26,
        wheellift = 5
    },
    
    [GetHashKey('112utwmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-2.5,-0.55),vector3(1.8,-2.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.6,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25
    },
    
    [GetHashKey('112utwmfd3')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-2.5,-0.55),vector3(1.8,-2.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.6,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25
    },

    [GetHashKey('112towmfd3')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-7.0,-0.55),vector3(1.8,-7.0,-0.55)},
        carPosition = vector3(0.0, -0.1, 0.0),
        carHeightOffset = 0.25,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.23,
        wheellift = 5

    },

    [GetHashKey('112towmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.5,-0.55),vector3(1.8,-5.5,-0.55)},
        carPosition = vector3(0.0, -0.1, 0.0),
        carHeightOffset = 0.3,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.23,
        wheellift = 5
    },
    
    [GetHashKey('112towmfd5')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-3.0,-0.55),vector3(1.8,-3.0,-0.55)},
        carPosition = vector3(0.0, -0.1, 0.0),
        carHeightOffset = 0.35,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.24,
        wheellift = 5
    },

    [GetHashKey('112boxmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-6.0,-0.55),vector3(1.8,-6.0,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.3,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.25,
        wheellift = 5
    },

    [GetHashKey('800towmfd4')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-2.5,-0.55),vector3(1.8,-7.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = 0.0,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.0,
        MaxPos = 0.21
    },

    [GetHashKey('550towmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.5,0.55),vector3(1.8,-1.5,0.55)},
        carPosition = vector3(0.0, -0.1, -0.5),
        carHeightOffset = 0.375,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 5.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.17,
        wheellift = 5

    },

    --MAOAM Public Release https://www.gta5-mods.com/vehicles/peterbilt-337-tuning-by-mfd-fivem
    [GetHashKey('Gtow')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.0,-0.55),vector3(1.8,-4.0,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.2),
        carHeightOffset = 0.0,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 10.0, --How far backwards from the winch bone to check from
        MinPos = 0.01,
        MaxPos = 0.2
    },

    [GetHashKey('106towmfd1')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.5,-0.55),vector3(1.8,-1.5,-0.55)},
        carPosition = vector3(0.0, -0.2, -1.0),
        carHeightOffset = 0.35, --Will vary per truck
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.21,
        wheellift = 5
    },

    [GetHashKey('106towmfd2')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.5,-0.55),vector3(1.8,-1.5,-0.55)},
        carPosition = vector3(0.0, -0.2, -1.0),
        carHeightOffset = 0.35, --Will vary per truck
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.21,
        wheellift = 5
    },

    [GetHashKey('106towmfd3')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-1.5,-0.55),vector3(1.8,-1.5,-0.55)},
        carPosition = vector3(0.0, -0.2, -1.0),
        carHeightOffset = 0.35, --Will vary per truck
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.00,
        MaxPos = 0.21,
        wheellift = 5
    },

    --Paul
    [GetHashKey('rollback2')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = -0.1,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.025,
        MaxPos = 0.23
    },
    [GetHashKey('rollback3')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = -0.1,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.025,
        MaxPos = 0.23
    },
    [GetHashKey('rollback4')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.9,-0.55),vector3(1.8,-4.9,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = -0.2,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.23
    },
    [GetHashKey('rollback14')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = -0.22,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.032,
        MaxPos = 0.23
    },
    [GetHashKey('rollback1')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = -0.22,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.032,
        MaxPos = 0.23
    },

    --Flair
    [GetHashKey('independent389')] = {
        type = 'rolling',
        boneName = 'misc_z',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-6.4,-0.55),vector3(1.8,-6.4,-0.55)},
        carPosition = vector3(0.0, -0.2, 0.0),
        carHeightOffset = -0.05,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 12.0, --How far backwards from the winch bone to check from
        MinPos = 0.03,
        MaxPos = 0.23,
        wheellift = 5
    },

    --Other
    [GetHashKey('towy')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.5,-0.55),vector3(1.8,-5.5,-0.55)},
        carPosition = vector3(0.0, 0.4, -0.1),
        carHeightOffset = -0.1,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.028,
        MaxPos = 0.26
    },

    [GetHashKey('ramtow')] = {
        type = 'rolling',
        boneName = 'misc_f',
        hasBedControl = true,
        MaxUnwindDistance  = 10.0,
        BedControl = {vector3(-1.8,-5.0,-0.55),vector3(1.8,-5.0,-0.55)},
        carPosition = vector3(0.0, -0.5, 0.0),
        carHeightOffset = 0.15,
        winchBone = 'misc_w',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 8.0, --How far backwards from the winch bone to check from
        MinPos = 0.028,
        MaxPos = 0.26
    },


    --STATIC BEDS
    [GetHashKey('flatbed')] = {
        type = 'static',
        carloadPos = vector3(0.0, -10.0, -0.55),
        BedControl = {vector3(-2.0, -5.0, -0.55)},
        carPosition = vector3(0.0, -2.3, 0.4),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.7,
    },
    [GetHashKey('slamtruck')] = {
        type = 'static',
        carloadPos = vector3(0.0, -8.0, -0.55),
        BedControl = {vector3(-2.0, -4.0, -0.55)},
        carPosition = vector3(0.0, -2.3, 0.4),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.7,
        chkDist = 4.0
    },

    --PICKUP TRUCK EXAMPLE
    [GetHashKey('sadler')] = {
        type = 'static',
        carloadPos = vector3(0.0, -5.5, -0.55),
        BedControl = {vector3(-1.5, -3.0, -0.55)},
        carPosition = vector3(0.0, -2.2, 0.8),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.6,
    },

    --Corentin
    [GetHashKey('flatbed1amber')] = {
        type = 'static',
        carloadPos = vector3(-1.0, -9.0, -0.55),
        BedControl = {vector3(-2.0, -5.0, -0.55)},
        carPosition = vector3(0.0, -1.9, 0.1),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.3,
    },

    [GetHashKey('flatbed2amber')] = {
        type = 'static',
        carloadPos = vector3(-1.0, -9.0, -0.55),
        BedControl = {vector3(-2.0, -5.0, -0.55)},
        carPosition = vector3(0.0, -3.3, 0.0),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.3,
    },

    [GetHashKey('flatbed3amber')] = {
        type = 'static',
        carloadPos = vector3(-1.0, -9.0, -0.55),
        BedControl = {vector3(-2.0, -5.0, -0.55)},
        carPosition = vector3(0.0, -3.3, 0.0),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.3,
    },
}

Config.BlacklistedVehs = {
    'kamacho'
}