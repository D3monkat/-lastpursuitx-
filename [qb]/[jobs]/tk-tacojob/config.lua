Config = {}

--Locations
Config.TacoJobBlipLocation = vector3(14.83, -1601.45, 29.38)
Config.TacoBlipName = "Taco Farmer"
Config.OnOffDutyLocation = vector3(8.21, -1607.23, 29.34)
Config.TacoSpawnVehicleLocation = vector3(45.02, -1619.14, 29.34)
Config.TacoRefillAreaLocation = vector3(17.03, -1599.6, 29.38)
Config.WarehouseLocation = vector3(858.62, -3202.47, 5.99)
Config.PrepLocation = vector3(15.84, -1598.38, 29.38)
Config.StoveLocation = vector3(11.41, -1599.27, 29.38)
Config.ShelfLocation = vector3(10.51, -1604.7, 29.41) -- This is For If Your Selling Tacos In Store Its a Place To Put The Tacos Once Purchased For The Buyer
Config.TacoVehicleHeading = 50.7 -- This is For The Direction The Vehicle Will Be Facing When It Spawns
Config.InventoryScript = 'ps-inventory' -- Change Inventory Script

--Prices
Config.StockPrice = 1000
Config.CookPay = 50 -- How Much The Cook Gets Paid Per Item Made

--Markers
Config.TacoVehicleCircle = vector3(45.02, -1619.14, 28.34) --This is For The Circle Marker

--ThirdEye
Config.OnOffDutyHeading = 9.78
Config.OnOffDutyMinZ = 28 -- For The Bottom of The Box
Config.OnOffDutyMaxZ = 30.5 -- For The Top of The Box
Config.RefillHeading = 144.83
Config.RefillMinZ = 28
Config.RefillMaxZ = 30.5
Config.WarehouseHeading = 0.69
Config.WarehouseMinZ = 4 
Config.WarehouseMaxZ = 6.5
Config.PrepHeading = 317.65
Config.PrepMinZ = 28
Config.PrepMaxZ = 30.5
Config.StoveHeading = 50.33
Config.StoveMinZ = 28
Config.StoveMaxZ = 30.5
Config.ShelfHeading = 223.61
Config.ShelfMinZ = 28
Config.ShelfMaxZ = 31

--Item Pricing and Names
Config.Items = {
    {
        ["name"] = "chickentaco",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "steaktaco",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "beeftaco",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "porktaco",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "steakburrito",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "chickenburrito",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "beefburrito",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "beanandcheeseburrito",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "beefandbeanburrito",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "porktorta",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "steaktorta",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "chorizotorta",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "cheesequesadilla",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "chickenquesadilla",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "steakquesadilla",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "beefquesadilla",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "chickentostada",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "beeftostada",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
    {
        ["name"] = "porktostada",
        ["price"] = 6,
        ["amounttorestock"] = 2
    },
}