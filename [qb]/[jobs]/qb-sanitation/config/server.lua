Config = Config or {}

-- Ped Configuration
Config.PedModel = "s_m_y_garbage"
Config.PedCoords = vector4(-354.62, -1546.24, 26.73, 268.73)
Config.PedBlip = {
    enableBlip = true, 
    blipType = 318,
    blipColor = 39,
    blipText = "Sanitation",
}

-- Stops Configuration 
Config.StopsAmount = { -- Amount of locations per job
    small = {
        minAmount = 1,
        maxAmount = 2,
    },
    medium = {
        minAmount = 2, 
        maxAmount = 3,
    }, 
    large = {
        minAmount = 3, 
        maxAmount = 4,
    },
}

Config.Stops = { -- Trash collection locations
    vector3(304.99, 263.64, 105.28),
    vector3(-1517.52, 50.77, 55.38),
    vector3(-1101.48, -1630.69, 4.4),
    vector3(-652.63, 493.34, 109.44),
    vector3(-1567.97, -906.07, 9.32),
    vector3(346.03, -952.61, 29.46),
    vector3(1069.83, -478.64, 64.01),
    vector3(93.77, -1931.76, 20.8),
    vector3(1258.99, -1596.78, 53.06),
    vector3(1173.36, -1319.56, 34.84),
    vector3(127.17, -1318.48, 29.2),
    vector3(1139.78, -404.94, 67.05),
}

-- Dumpsters Configuration
Config.MoneyPerTrashBag = 250 -- Money per one trash bag 
Config.DumpstersMinAmount = 5 -- Minimum amount of trash bags that the player has to collect
Config.DumpstersMaxAmount = 10 -- Maximum amount of trash bags that the player has to collect

-- Materials Configuration 
Config.Materials = { -- name = "Item name", price = "Price to buy one item"
    {name = "iron", price = "700"}, 
    {name = "gold", price = "1050"},
}