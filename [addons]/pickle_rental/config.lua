Config = {}

Config.Language = "en"

Config.Debug = true

Config.RenderDistance = 20.0

Config.GiveKeys = function(plate)
    -- Replace this line with your export / event to give keys for your vehicle.
end

Config.Rental = {
    time = 60, -- Max minutes a player can have the car out until they get no refund for returning it.
    plateFormat = "RNT ...", -- The plate format for rented cars. ( _ = Letter, . = Number )
}

Config.Locations = {
    {
        title = "Car Rental",
        blip = { -- Set to nil for no blip.
            label = "Rental Company (Car)",
            id = 225,
            scale = 0.85,
            color = 2,
            display = 4,
        },
        locations = {
            interact = {
                coords = vector3(204.55, -805.88, 29.99),
                heading = 85.3245,
                ped = `ig_siemonyetarian` -- Set to nil to use markers.
            },
            spawn = {
                coords = vector3(205.83, -800.98, 30.44),
                heading = 247.0
            },
        },
        vehicles = {
            {
                label = "Blade",
                model = `blade`,
                price = 300,
                groups = nil -- {["police"] = 4}
            },
            {
                label = "Faction",
                model = `faction`,
                price = 200,
                groups = nil -- {["police"] = 4}
            },
        },
    },
}
