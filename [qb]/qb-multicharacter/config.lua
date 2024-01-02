Config = {}
Config.StartingApartment = true -- Enable/disable starting apartments (make sure to set default spawn coords)
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-972.97, 6582.43, 2.03, 13.18) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-972.97, 6582.43, 2.03, 13.18) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-962.42, 6558.62, 4.4, 90.03) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not

Config.DefaultNumberOfCharacters = 4 -- min = 1 | max = 5
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}

Config.PedCords = {
    [1] = vector4(-973.61, 6554.66, 1.89, 269.0),
    [2] = vector4(-973.31, 6557.22, 1.89, 271.13),
    [3] = vector4(-973.38, 6560.51, 1.89, 271.07),
    [4] = vector4(-973.38, 6560.51, 1.89, 271.07),
}

Config.TrainCoord = {
    Heading = 268.7,
    Start = vector3(-523.14, -665.62, -999.9),
    Stop = vector3(-498.32, -665.63, -9999.9),
}

Config.Clothing = {
    ['qb-clothing'] = false,
    ['fivem-appearance'] = false,
    ['illenium-appearance'] = true,
}

Config.Housing = { --New
    ['ps-housing'] = true, --https://github.com/Project-Sloth/ps-housing
    ['qb-houses'] = false,
}