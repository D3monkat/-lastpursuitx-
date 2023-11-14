QB = {}

QB.Spawns = {
    ["legion"] = {
        coords = vector4(195.17, -933.77, 29.7, 144.5),
        location = "legion",
        label = "Legion Square",
        pos = {top = 50.9, left = 65.5}
    },

    ["policedp"] = {
        coords = vector4(428.23, -984.28, 29.76, 3.5),
        location = "policedp",
        label = "Police Department",
        pos = {top = 48.4, left = 65.8}
    },

    ["paleto"] = {
        coords = vector4(80.35, 6424.12, 31.67, 45.5),
        location = "paleto",
        label = "Paleto Bay",
        pos = {top = 51.5, left = 28.9}
    },

    ["motel"] = {
        coords = vector4(327.56, -205.08, 53.08, 163.5),
        location = "motel",
        label = "Motels",
        pos = {top = 49.5, left = 62}
    },

    ["sandy"] = {
        coords = vector4(1151.608154296875, 2667.66650390625, 38.14596557617187, 356.8353271484375),
        location = "sandy",
        label = "Sandy Shores",
        pos = {top = 41.5, left = 47.6},
    },

    ["amusementpark"] = {
        coords = vector4(-1600.0509033203125, -971.2437133789064, 13.01739120483398, 54.69508361816406),
        location = "amusementpark",
        label = "Amusement Park",
        pos = {top = 67, left = 65.7},
    },

    ["paleto2"] = {
        coords = vector4(-375.2769775390625, 6030.4697265625, 31.52615165710449, 162.48745727539065),
        location = "paleto2",
        label = "Paleto Bay Sheriff",
        pos = {top = 55.8, left = 30.9},
    },
}

QB.SpawnAccess = { --To disable the buttons
    ['apartments'] = true,
    ['houses'] = true,
    ['lastLoc'] = true,
}

QB.Housing = { --New
    ['ps-housing'] = true, --https://github.com/Project-Sloth/ps-housing
    ['qb-houses'] = false,
}