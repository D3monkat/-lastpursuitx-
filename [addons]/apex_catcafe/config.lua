-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------
   
-- ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║         ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║         ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║         ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

Config = {}
Config.Debug = false


--     ██╗ ██████╗ ██████╗     ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--     ██║██╔═══██╗██╔══██╗    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--     ██║██║   ██║██████╔╝    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██   ██║██║   ██║██╔══██╗    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚█████╔╝╚██████╔╝██████╔╝    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚════╝  ╚═════╝ ╚═════╝     ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

Config.Name = "Rex Diner"
Config.Jobname = "catcafe"
Config.Blips = {
    {
        enabled = true,
        point = vector3(2537.81, 2589.01, 38.5),
        sprite = 819,
        scale = 0.8,
        colour = 61,
        title = Config.Name,
    },
}

Config.Features = {
    RemoveNPCsFromLocation = true, -- Disable random NPCs spawning inside the club
    RemoveNPCsFromLocationSettings = {
        {
            coords = vector3(2537.81, 2589.01, 38.5),
            radius = 30.0,
        },
    },
    Office = false,
    OfficeSettings = {
        Target = {
            {
                points = vector3(-578.27, -1066.63, 26.61),
                heading = 0.0,
                minZ = 26.61-0.1,
                maxZ = 26.61+0.4,
                Size = {0.2, 0.6},
                distance = 2.0,
            },
        },
    },
    Duty = true, -- This is a QBCore function, set it to false, if using ESX!
    DutySettings = {
        Target = {
            {
                points = vector3(2545.02, 2579.22, 38.5),
                heading = 175.3,
                minZ = 28.34+0.1,
                maxZ = 32.34+1.3,
                Size = {3.2, 0.2},
                distance = 2.0,
            },
        },
    },
    Wardrobe = false,
    WardrobeSettings = {
        Target = {
            {
                points = vector3(2542.6, 2583.14, 38.5),
                heading = 357.25,
                minZ = 28.34-1,
                maxZ = 38.54+1.2,
                Size = {2.45, 0.3},
                distance = 2.0,
            },
        },
        ClothingStore = true,
        ClothingStoreTrigger = "illenium-appearance:client:openClothingShop",
        --[[
            - qb-clothing:client:openMenu (default qbcore)
            - illenium-appearance:client:openClothingShop (illenium-appearance)
            - Or you can add your own trigger if you are using something else.
        ]]--
        OutfitMenu = true,
        OutfitMenuTrigger = "illenium-appearance:client:openOutfitMenu",
        --[[
            - qb-clothing:client:openOutfitMenu (default qbcore)
            - illenium-appearance:client:openOutfitMenu (illenium-appearance)
            - Or you can add your own trigger if you are using something else.
        ]]--
        PersonalLocker = false,
    },
    Table = false,
    TableSettings = {
        Size = 10000,
        Slots = 10,
    },
    Tray = false,
    TraySettings = {
        Size = 10000,
        Slots = 10,
    },
    Storage = true,
    StorageSettings = {
        Size = 4000000,
        Slots = 500,
    },
    Ingredients = true,
    IngredientsSettings = {
        shelves = {
            label = "Ingredients",
            slots = 18,
            items = {
                { name = "sugar",           price = 5, amount = 50, info = {}, type = "item", slot = 1, },
                { name = "cocoa_powder",    price = 5, amount = 50, info = {}, type = "item", slot = 2, },
                { name = "milk",            price = 5, amount = 50, info = {}, type = "item", slot = 3, },
                { name = "noodles",         price = 5, amount = 50, info = {}, type = "item", slot = 4, },
                { name = "onion",           price = 5, amount = 50, info = {}, type = "item", slot = 5, },
                { name = "butter",          price = 5, amount = 50, info = {}, type = "item", slot = 6, },
                { name = "chicken_fillet",  price = 5, amount = 50, info = {}, type = "item", slot = 7, },
                { name = "tofu",            price = 5, amount = 50, info = {}, type = "item", slot = 8, },
                { name = "rice",            price = 5, amount = 50, info = {}, type = "item", slot = 9, },
                { name = "fish",            price = 5, amount = 50, info = {}, type = "item", slot = 10, },
                { name = "flour",           price = 5, amount = 50, info = {}, type = "item", slot = 11, },
                { name = "egg",             price = 5, amount = 50, info = {}, type = "item", slot = 12, },
                { name = "orange_dye",      price = 5, amount = 50, info = {}, type = "item", slot = 13, },
                { name = "green_dye",       price = 5, amount = 50, info = {}, type = "item", slot = 14, },
                { name = "pink_dye",        price = 5, amount = 50, info = {}, type = "item", slot = 15, },
                { name = "turquoise_dye",   price = 5, amount = 50, info = {}, type = "item", slot = 16, },
                { name = "bakingsoda",      price = 5, amount = 50, info = {}, type = "item", slot = 17, },
                -- { name = "itemname", price = 0, amount = 0, info = {}, type = "item", slot = 18, },
            },
        },
    },
    Freezer = true,
    FreezerSettings = {
        shelves = {
            label = "Freezer",
            slots = 5,
            items = {
                -- { name = "itemname", price = 0, amount = 0, info = {}, type = "item", slot = 2, },
            },
        },
    },
    DrinkMachine = true,
    DrinkMachineSettings = {
        shelves = {
            label = "Drink Machine",
            slots = 5,
            items = {
                { name = "brewedcoffee",    price = 5, amount = 20, info = {}, type = "item", slot = 1, },
                { name = "hotchocolade",    price = 5, amount = 20, info = {}, type = "item", slot = 2, },
                { name = "latte",           price = 5, amount = 20, info = {}, type = "item", slot = 3, },
                { name = "matchatea",       price = 5, amount = 20, info = {}, type = "item", slot = 4, },
                { name = "bubbletea",       price = 5, amount = 20, info = {}, type = "item", slot = 5, },
                -- { name = "itemname", price = 0, amount = 0, info = {}, type = "item", slot = 2, },
            },
        },
    },
    Kitchen = true,
    KitchenSettings = {
        FoodMakingDuration = 10, -- Duration in seconds
        Recipes = {
            StoveEnabled = true,
            Stove = {
                {
                    label = "Chicken Noodle Soup",
                    ingredients = {
                        {name = "noodles", amount = 1},
                        {name = "onion", amount = 1},
                        {name = "butter", amount = 1},
                        {name = "chicken_fillet", amount = 1},
                    },
                    output = {
                        {name = "chickennoodlesoup", amount = 1},
                    },
                },
                {
                    label = "Miso Soup",
                    ingredients = {
                        {name = "tofu", amount = 1},
                        {name = "noodles", amount = 1},
                        {name = "rice", amount = 1},
                        {name = "fish", amount = 1},
                    },
                    output = {
                        {name = "misosoup", amount = 1},
                    },
                },
                {
                    label = "Pancakes",
                    ingredients = {
                        {name = "milk", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                    },
                    output = {
                        {name = "pancake", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Food",
                --     ingredients = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
            OvenEnabled = true,
            Oven = {
                {
                    label = "Orange Macaroon",
                    ingredients = {
                        {name = "sugar", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                        {name = "orange_dye", amount = 1},
                    },
                    output = {
                        {name = "orangemacaroon", amount = 1},
                    },
                },
                {
                    label = "Green Macaroon",
                    ingredients = {
                        {name = "sugar", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                        {name = "green_dye", amount = 1},
                    },
                    output = {
                        {name = "greenmacaroon", amount = 1},
                    },
                },
                {
                    label = "Pink Macaroon",
                    ingredients = {
                        {name = "sugar", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                        {name = "pink_dye", amount = 1},
                    },
                    output = {
                        {name = "pinkmacaroon", amount = 1},
                    },
                },
                {
                    label = "Turquoise Macaroon",
                    ingredients = {
                        {name = "sugar", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                        {name = "turquoise_dye", amount = 1},
                    },
                    output = {
                        {name = "turquoisemacaroon", amount = 1},
                    },
                },
                {
                    label = "Cookie",
                    ingredients = {
                        {name = "egg", amount = 1},
                        {name = "bakingsoda", amount = 1},
                    },
                    output = {
                        {name = "cookie", amount = 1},
                    },
                },
                {
                    label = "Cupcake",
                    ingredients = {
                        {name = "sugar", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                        {name = "butter", amount = 1},
                    },
                    output = {
                        {name = "cupcake", amount = 1},
                    },
                },
                {
                    label = "Donut",
                    ingredients = {
                        {name = "milk", amount = 1},
                        {name = "sugar", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "butter", amount = 1},
                    },
                    output = {
                        {name = "donut", amount = 1},
                    },
                },
                {
                    label = "Choco Sandwich",
                    ingredients = {
                        {name = "cocoa_powder", amount = 1},
                        {name = "milk", amount = 1},
                        {name = "flour", amount = 1},
                        {name = "egg", amount = 1},
                    },
                    output = {
                        {name = "chocosandwich", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Food",
                --     ingredients = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
            CuttingboardEnabled = true,
            Cuttingboard = {
                {
                    label = "Sushi",
                    ingredients = {
                        {name = "rice", amount = 1},
                        {name = "fish", amount = 1},
                    },
                    output = {
                        {name = "sushi", amount = 1},
                    },
                },
                -- {
                --     label = "Name of Food",
                --     ingredients = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
            PrepareboardEnabled = true,
            Prepareboard = {
                -- {
                --     label = "Name of Food",
                --     ingredients = {
                --         {name = "itemname", amount = 1},
                --     },
                --     output = {
                --         {name = "itemname", amount = 1},
                --     },
                -- },
            },
        }
    },
}


--████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗███████╗
--╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝██╔════╝
--   ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   ███████╗
--   ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   ╚════██║
--   ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   ███████║
--   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝

Config.AdditionalTargets = {
    Cuttingboard = {
        {
            Coords = vector3(2535.86, 2579.57, 38.5),
            Heading = 184.15,
            Size = {2.7, 0.75},
            Distance = 1.5,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    Prepareboard = {
        {
            Coords = vector3(2536.27, 2580.07, 38.5),
            Heading = 354.4,
            Size = {2.4, 0.6},
            Distance = 2.0,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    Stove = {
        {
            Coords = vector3(2539.62, 2579.62, 38.5),
            Heading = 272.09,
            Size = {1.05, 0.65},
            Distance = 1.5,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    Oven = {
        {
            Coords = vector3(2540.15, 2580.26, 38.5),
            Heading = 274.43,
            Size = {1.1, 0.2},
            Distance = 1.5,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    Storage = {
        {
            Coords = vector3(2529.0, 2579.39, 38.5),
            Heading = 178.84,
            Size = {2.4, 0.6},
            Distance = 2.0,
           minZ = 38.5,
            maxZ = 40.5,
        },
    },
    Ingredients = {
        {
            Coords = vector3(2529.12, 2582.72, 38.5),
            Heading = 3.27,
            Size = {3.85, 0.6},
            Distance = 2.0,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    Freezer = {
        {
            Coords = vector3(2535.64, 2582.65, 38.5),
            Heading = 2.51,
            Size = {2.0, 0.6},
            Distance = 2.0,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    DrinkMachine = {
        {
            Coords = vector3(2535.99, 2585.43, 38.66),
            Heading = 183.78,
            Size = {0.75, 0.55},
            Distance = 1.5,
            minZ = 38.5,
            maxZ = 40.5,
        },
    },
    CashRegisters = {
        {
            Coords = vector3(2537.59, 2586.36, 38.66),
            Heading = 354.72,
            Size = {0.26, 0.44},
            Distance = 1.5,
            minZ = 28.34-0.1,
            maxZ = 32.34+0.2,
        },
    },
    Tables = {
        { Coords = vector3(-586.88, -1067.69, 22.34), Heading = 0.0, Size = {0.8, 0.6}, Distance = 2.5, minZ = 22.34-0.05,    maxZ = 22.34+0.2, },
        { Coords = vector3(-586.88, -1066.69, 22.34), Heading = 0.0, Size = {0.8, 0.6}, Distance = 2.5, minZ = 22.34-0.05,    maxZ = 22.34+0.2, },
        { Coords = vector3(-586.88, -1065.69, 22.34), Heading = 0.0, Size = {0.8, 0.6}, Distance = 2.5, minZ = 22.34-0.05,    maxZ = 22.34+0.2, },
        { Coords = vector3(-586.88, -1064.69, 22.34), Heading = 0.0, Size = {0.8, 0.6}, Distance = 2.5, minZ = 22.34-0.05,    maxZ = 22.34+0.2, },
        { Coords = vector3(-573.55, -1067.09, 22.34), Heading = 0.0, Size = {1.2, 2.2}, Distance = 2.5, minZ = 22.34-0.1,     maxZ = 22.34+0.2, },
        { Coords = vector3(-573.47, -1063.44, 22.34), Heading = 0.0, Size = {1.2, 2.2}, Distance = 2.5, minZ = 22.34-0.1,     maxZ = 22.34+0.2, },
        { Coords = vector3(-573.47, -1059.79, 22.34), Heading = 0.0, Size = {1.2, 2.2}, Distance = 2.5, minZ = 22.34-0.1,     maxZ = 22.34+0.2, },
    },
    Trays = {
        {   Coords = vector3(-584.00, -1059.29, 22.34), Heading = 0.0,    Size = {0.7, 0.5}, Distance = 2.5, minZ = 22.34-0, maxZ = 38.5+0.3, },
        {   Coords = vector3(-584.06, -1062.04, 22.34), Heading = 0.0,    Size = {0.7, 0.5}, Distance = 2.5, minZ = 22.34-0, maxZ = 38.5+0.3, },
    },
}


--███████╗███████╗ █████╗ ████████╗███████╗
--██╔════╝██╔════╝██╔══██╗╚══██╔══╝██╔════╝
--███████╗█████╗  ███████║   ██║   ███████╗
--╚════██║██╔══╝  ██╔══██║   ██║   ╚════██║
--███████║███████╗██║  ██║   ██║   ███████║
--╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝

Config.Seats = {
    --[[
        YOU CAN ADD, REMOVE OR ADJUST AS YOU WANT FOR MORE SEATS
    ]]--
    --[[ CAT CAFE ]]--
    -- { coords = vector4(-579.95, -1064.80, 22.35, 169.75),   stand = vector3(-580.10, -1065.35, 22.35)},
	-- { coords = vector4(-580.80, -1064.20, 22.35, 124.98),   stand = vector3(-581.16, -1064.49, 22.35)},
	-- { coords = vector4(-581.01, -1063.16, 22.35, 81.93),    stand = vector3(-581.41, -1063.12, 22.34)},
	-- { coords = vector4(-580.47, -1062.29, 22.35, 39.3),     stand = vector3(-580.74, -1062.07, 22.34)},
	-- { coords = vector4(-579.40, -1062.07, 22.35, 354.81),   stand = vector3(-579.33, -1061.65, 22.34)},
	-- { coords = vector4(-578.30, -1063.73, 22.35, 305.1),    stand = vector3(-577.61, -1063.84, 22.35)},
	-- { coords = vector4(-578.87, -1064.58, 22.35, 217.3),    stand = vector3(-578.60, -1064.90, 22.35)},
	-- { coords = vector4(-586.29, -1067.69, 22.64, 90.0),     stand = vector3(-585.84, -1067.64, 22.34)},
	-- { coords = vector4(-586.29, -1066.69, 22.64, 90.0),     stand = vector3(-585.82, -1066.62, 22.34)},
	-- { coords = vector4(-586.29, -1065.69, 22.64, 90.0),     stand = vector3(-585.75, -1065.62, 22.34)},
	-- { coords = vector4(-586.29, -1064.69, 22.64, 90.0),     stand = vector3(-585.75, -1064.68, 22.34)},
    -- { coords = vector4(-580.77, -1051.28, 22.35, 287.73),   stand = vector3(-580.19, -1051.15, 22.34)},
	-- { coords = vector4(-579.63, -1052.52, 22.35, 322.42),   stand = vector3(-579.40, -1051.97, 22.35)},
	-- { coords = vector4(-577.53, -1052.52, 22.35, 42.47),    stand = vector3(-577.93, -1052.01, 22.35)},
	-- { coords = vector4(-576.91, -1050.97, 22.35, 105.69),   stand = vector3(-577.55, -1051.24, 22.35)},
    -- { coords = vector4(-573.13, -1068.02, 22.48, 0.0),      stand = vector3(-575.12, -1067.07, 22.34)},
	-- { coords = vector4(-573.73, -1068.02, 22.48, 0.0),      stand = vector3(-575.12, -1067.07, 22.34)},
	-- { coords = vector4(-573.13, -1066.13, 22.48, 180.0),    stand = vector3(-575.12, -1067.07, 22.34)},
	-- { coords = vector4(-573.73, -1066.13, 22.48, 180.0),    stand = vector3(-575.12, -1067.07, 22.34)},
	-- { coords = vector4(-573.13, -1064.36, 22.48, 0.0),      stand = vector3(-575.14, -1063.46, 22.34)},
	-- { coords = vector4(-573.73, -1064.36, 22.48, 0.0),      stand = vector3(-575.14, -1063.46, 22.34)},
	-- { coords = vector4(-573.13, -1062.47, 22.48, 180.0),    stand = vector3(-575.14, -1063.46, 22.34)},
	-- { coords = vector4(-573.73, -1062.47, 22.48, 180.0),    stand = vector3(-575.14, -1063.46, 22.34)},
	-- { coords = vector4(-573.13, -1060.68, 22.48, 0.0),      stand = vector3(-575.10, -1059.83, 22.34)},
	-- { coords = vector4(-573.73, -1060.68, 22.48, 0.0),      stand = vector3(-575.10, -1059.83, 22.34)},
	-- { coords = vector4(-573.13, -1058.81, 22.48, 180.0),    stand = vector3(-575.10, -1059.83, 22.34)},
	-- { coords = vector4(-573.73, -1058.81, 22.48, 180.0),    stand = vector3(-575.10, -1059.83, 22.34)},
}