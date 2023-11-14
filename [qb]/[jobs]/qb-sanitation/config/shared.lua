Config = Config or {}

-- General Configuration
Config.ESX = false -- Set as true: Uses ESX / Set as false: Uses QBCore
Config.Notification = "OX" -- QB = QBCore Notification / ESX = ESX Notification / OX = Overextended Notification 

-- Vehicle Configuration
Config.TrashVehicle = "trash2" 
Config.VehicleSpawns = { -- Locations where the vehicle can spawn
    vector4(-327.6, -1524.25, 27.25, 267.9),
    vector4(-312.48, -1529.22, 27.27, 263.87),
    vector4(-310.77, -1520.05, 27.4, 261.97),
    vector4(-345.13, -1530.91, 27.42, 269.2)
}

-- Stops Configuration 
Config.StopsBlip = {
    blipRadius = 200.0, 
    blipAlpha = 150,
    blipColor = 1,
}

-- Dumpster Configuration
Config.Target = {
    "prop_snow_dumpster_01",
    "prop_dumpster_4a",
    "prop_cs_dumpster_01a",
    "p_dumpster_t",
    "prop_dumpster_3a",
    "prop_dumpster_4b",
    "prop_dumpster_01a",
    "prop_dumpster_02b",
    "prop_dumpster_02a",
    "prop_bin_01a",
    "prop_bin_07b",
    "prop_bin_07c",
    "prop_bin_08a"
}