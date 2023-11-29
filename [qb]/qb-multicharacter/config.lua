Config = {}
Config.StartingApartment = true -- Enable/disable starting apartments (make sure to set default spawn coords)
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-216.46, -1038.94, 30.14, 69.9) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-510.25, -676.63, 11.81, 209.18) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-502.6, -680.89, 12.92, 0.0) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not

Config.DefaultNumberOfCharacters = 5 -- min = 1 | max = 5
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}

Config.PedCords = {
    [1] = vector4(-506.46, -676.66, 11.81, 211.83),
    [2] = vector4(-504.8, -676.01, 11.81, 206.35),
    [3] = vector4(-502.84, -676.04, 11.81, 185.5),
    [4] = vector4(-500.8, -676.01, 11.81, 162.35),
    [5] = vector4(-498.66, -676.5, 11.81, 140.97),
}

Config.TrainCoord = {
    Heading = 268.7,
    Start = vector3(-523.14, -665.62, 9.9),
    Stop = vector3(-498.32, -665.63, 9.9),
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