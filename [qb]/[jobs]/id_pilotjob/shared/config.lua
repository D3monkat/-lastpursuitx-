Config = {}

Config.PilotJob = vector3(-941.49, -2954.92, 13.95) -- place for starting the route

Config.PlaneSpawn = {coords = vector3(-972.8835, -2999.367, 14.53625), heading = 62.36221} -- where the plane will be spawned

Config.Level1Reward = 5000 -- amount of cash that will level 1 players receive after route completed, you can do math.random for random reward

Config.Level2Reward = "markedbills" -- can be either "markedbills" (marked bills) or "cash" (legal money)
Config.Level2RewardCashAmount = 10000 -- amount of money that will level 2 players receive after route completed, you can do math.random(1000, 5000), player will receive between 1000$ and 5000$
Config.Level2RewardMarkedBillAmount = 100

Config.LegalRoute = {
    VehicleModel = "Shamal", -- plane model
    CheckPoint = vector3(1735.767, 3294.646, 40.76562) -- checkpoint for boarding passengers
}

Config.IllegalRoute = {
    VehicleModel = "Vestra", -- plane model
    CheckPoint = vector3(2135.486, 4780.932, 40.14209) -- checkpoint for loading illegal goods
}

Config.Translation = {
    HelpNotification = "Press [E] to take the route",
    HelpBoardPassengers = "Press [E] to board the passengers",
    HelpDisembarkPassengers = "Press [E] to disembark passengers",
    HelpLoadGoods = "Press [E] to load illegal goods",
    HelpUnloadGoods = "Press [E] to unload illegal goods",
    DeliverGoods = "Deliver illegal goods back to the Los Santos Airport, be careful of police",
    NotLevel2 = "You must be level 2 in order to take this route",
    GoLoadGoods = "Go to Sandy Shores and load illegal goods",
    SpawnPointNotAvailable = "SpawnPoint location is not available right now",
    GoTakePassengers = "Go to the location marked on the GPS \"Passengers\", and wait for the passengers to board",
    TakePassengersBack = "Take passengers back to the Los Santos Airport",
    JobFinished = "You have finished legal route of pilot job, money delivered",
    IllegalJobFinished = "You have finished delivering illegal goods",
    InventoryFull = "You don't have enough space in your inventory."
}

Config.Blips = { -- https://docs.fivem.net/docs/game-references/blips/
    MainBlip = {
        Label = "Pilot Job",
        ID = 16,
        Scale = 0.9,
        Colour = 3
    },
    LegalCheckPoint = {
        Label = "Passengers",
        ID = 366,
        Scale = 0.7,
        Colour = 0
    },
    LegalCheckPoint2 = {
        Label = "Los Santos Airport",
        ID = 307,
        Scale = 0.7,
        Colour = 0
    },
    IllegalCheckPoint = {
        Label = "Illegal Goods",
        ID = 501,
        Scale = 0.7,
        Colour = 0
    }
}