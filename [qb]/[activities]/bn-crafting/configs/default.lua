Config = Config or {}

Config.Default = {
    [1] = { -- Level required to craft this item
        ["lockpick"] = {
            ["aluminum"] = 10,  -- Amount of the material required, and the name of the material
            ["plastic"] = 20, -- You can add as many materials as you want.
            xp = 5, -- Amount of XP you get for crafting this item
            time = 1000 -- Time it takes to craft this item in milliseconds
        },
        ["phone"] = {
            ["rubber"] = 1,
            ["aluminum"] = 1,
            ["iron"] = 1,
            ["plastic"] = 1,
            xp = 5,
            time = 1000
        },
    },
    [2] = {
        ["weapon_carbinerifle"] = {
            ["rubber"] = 450,
            ["aluminum"] = 500,
            ["iron"] = 15,
            ["plastic"] = 410,
            xp = 5,
            time = 1000
        },
        ["weapon_pistol50"] = {
            ["rubber"] = 2,
            ["aluminum"] = 3,
            ["iron"] = 1,
            ["plastic"] = 4,
            xp = 5,
            time = 1000
        },
        ["weapon_knife"] = {
            ["aluminum"] = 150,
            ["iron"] = 25,
            xp = 5,
            time = 1000
        },
        ["armor"] = {
            ["rubber"] = 10,
            ["iron"] = 50,
            ["plastic"] = 250,
            xp = 5,
            time = 1000
        }
    }
}