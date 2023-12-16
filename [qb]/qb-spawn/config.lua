QB = {}

QB.Spawns = {
    ["legion"] = {
        coords = vector4(216.82, -811.92, 30.68, 335.33),
        location = "legion",
        label = "Legion Square",
        pos = {top = 50.9, left = 65.5}
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