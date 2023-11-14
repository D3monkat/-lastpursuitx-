Config = {}

----- ** TIMER CONFIG ** ----
Config.BlackoutTimer = 60 -- How many minutes are the city blackedout when powerplant is hit?
Config.BankTimer = 45 -- How many minutes between each bank robbery?

---- ** BAG IDs ** ----
Config.BagUseID = 93 -- Which ID is the bag that a player gets after doing an animation? (Should use a black one so it looks close to the animation)
Config.HideBagID = 0 -- Which Bag ID is hiding the bag? This is used to not mess up the animations

---- ** MISC ** ----
Config.Version = "new" -- If you use a newer version of the core (around 1 month old) then set to new otherwise set it to old

Config.TargetOption = "qb" -- use either "bt", "qb" or "berkie" depending on which target you use (bt-targer, qb-target or berkie-target)
Config.Wrapper = "ox" -- Use ox or ghmatti, THIS IS FOR THE BAN TRIGGER nothing else leave this as whatever if you don't use Config.BanModders
Config.lowerVaultEnabled = "true" -- Extra step of pacific hiest that uses "name here" pacific bank MLO ("link here")

Config.debugPoly = false  -- Show polyzones for targets
Config.EnableTrades = false -- Accept trading for Laptops?

---- ** POLICE CONFIG ** ----

Config.MinimumFleecaPolice = 0
Config.MinimumPaletoPolice = 0
Config.MinimumPAleto2 = 0
Config.MinimumPacificPolice = 0
Config.MinimumlowerVaultPolice = 0 -- This also includes thermite in the lower Vault
Config.MinimumThermitePolice = 0 

---- ** REMOVE ITEMS ** ----
Config.RemoveLaptop = true -- True means that it will remove laptop after they complete a hack regardless of the amount of uses left
Config.RemoveCard = true -- This means after successfully using a bank card it will be removed set to false it will not be removed

---- ** DOOR COOLDOWN ** ----
Config.DoorCD = 1.1 -- How many minutes before Bank Vault opens after finishing the hack?

---- ** Trolly CONFIG ** ----

Config.FleecaTrollyChance = 100 -- How many percent chance of getting a extra trolley with loot
Config.FleecaGoldTrollyChance = 0 -- How many percent chance of that Fleeca Trolly to be gold

Config.PaletoTrollyChance = 100 -- How many percent chance of getting a extra trolley with loot
Config.PaletoGoldTrollyChance = 10 -- How many percent chance of that Fleeca Trolly to be gold

Config.PacificTrollyChance = 100 -- How many percent chance of getting a extra trolley with loot
Config.PacificGoldTrollyChance = 10 -- How many percent chance of that Fleeca Trolly to be gold

Config.FleecaGoldChance = 10 -- What percent chance of getting a gold table in a fleeca?
Config.PaletoGoldChance = 0 -- What percent chance of getting a gold table in a Paleto?
Config.PacificGoldChance = 0 -- What percent chance of getting a gold table in a Pacific?
Config.lowerVaultGoldChance = 100 -- What percent chance of getting a gold table in the lowerVault?

---- ** HARD DRIVE CONFIG ** ---- 
-- only mess with this if you use lowervault
Config.HardDriveChance = 50 -- Chance of getting a hard drive from one of the servers

---- ** DOOR ID CONFIGUARTIONS ** ----

Config.Doorlocks = "nui" -- Put 'nui' if you use NUI doorlocks

-- All the doorlock IDs you need to put in if you don't know how to find them just ask for help on Discord
Config.DoorlockID1 = 86 -- whats your ID for this door? vector3(-105.64, 6473.28, 31.63)
Config.DoorlockID2 = 85 -- whats your ID for this door? vector3(-105.87, 6475.57, 31.63)
Config.DoorlockID3 = 75 -- whats your ID for this door? vector3(257.22, 220.42, 106.29)
Config.DoorlockID4 = 76 -- whats your ID for this door? vector3(261.97, 221.53, 106.29)
Config.DoorlockID5 = 78 -- whats your ID for this door? vector3(252.69, 220.79, 101.68)
Config.DoorlockID6 = 79 -- whats your ID for this door? vector3(261.09, 215.04, 101.68)
Config.DoorlockID7 = 212 -- Whats your ID for this door? vector3(255.37, 229.54, 101.7)
Config.DoorlockID8 = 213 -- Whats your ID for this door? vector3(262.98, 258.38, 101.71)

-- THIS IS ONLY FOR THOSE WHO USE PALETO EXTENDED BY k4mb1
Config.DoorlockID9 = "Computer Room" -- Whats the doorID for this room?  vector3(-99.02, 6462.16, 31.63)
Config.DoorlockID10 = "lowervault 1" -- Whats the doorID for this room? vector3(-103.88, 6464.14, 31.63)
Config.DoorlockID11 = "lowervault main vault" -- Whats the doorID for this room? vector3(-102.02, 6459.52, 31.63)

---- ** FLEECA HACK CONFIG ** ----
Config.FleecaTime = 7 -- How much time do they have to enter the hack?
Config.FleecaBlocks = 4 -- How many different blocks can the hack have?
Config.FleecaRepeat = 1 -- How many times in a row do they need to hack the system?

---- ** PALETO HACK CONFIG ** ----
Config.PaletoTime = 8 -- How much time do they have to enter the hack?
Config.PaletoBlocks = 5 -- How many different blocks can the hack have?
Config.PaletoRepeat = 4 -- How many times in a row do they need to hack the system?

---- ** PACIFIC HACK CONFIG ** ----
Config.PacificTime = 10 -- How much time do they have to enter the hack?
Config.PacificBlocks = 6 -- How many different blocks can the hack have?
Config.PacificRepeat = 4 -- How many times in a row do they need to hack the system?

---- ** LOWER VAULT HACK CONFIG ** ----
Config.HDDTime = 10 -- How much time do they have to enter the hack?
Config.HDDBlocks = 6 -- How many different blocks can the hack have?
Config.HDDRepeat = 1 -- How many times in a row do they need to hack the system?

Config.LowerInnerTime = 8 -- How much time do they have to enter the hack?
Config.LowerInnerBlocks = 6 -- How many different blocks can the hack have?
Config.LowerInnerRepeat = 5 -- How many times in a row do they need to hack the system?



---- ** THERMITE MINIGAME CONFIG ** ----
Config.CorrectBlocks = 16 -- correctBlocks = Number of correct blocks the player needs to click
Config.IncorrectBlocks = 3 -- incorrectBlocks = number of incorrect blocks after which the game will fail
Config.TimeToShow = 4 -- timetoShow = time in secs for which the right blocks will be shown
Config.TimeToLose = 30 -- timetoLose = maximum time after timetoshow expires for player to select the right blocks


---- ** BILLS ITEM ** ----
Config.BillsItem = "markedbills"
Config.MarkedBillsWorthMin = 25000 -- Minimum worth of a bag
Config.MarkedBillsWorthMax = 37500 -- Maximum worth of a bag
-- NOTES --
-- Everywhere you give Config.BillsItem (Default markedbills) will give the same amount that means, trays, tables and lockers will give this amount


---- ** FLEECA ** ----
Config.FleecaBagsMin = 2 -- How many bags of Marked Bills can you MINIMUM get from a FLeeca Table?
Config.FleecaBagsMax = 4 -- How many bags of Marked Bills can you MAXIMUM get from a FLeeca Table?
Config.FleecaGoldMin = 2 -- Minimum gold bars from Fleecas
Config.FleecaGoldMax = 4 -- Maximum gold bars from Fleecas

---- ** PALETO ** ----
Config.PaletoBagsMin = 3 -- How many bags of Marked Bills can you MINIMUM get from a Paleto Table?
Config.PaletoBagsMax = 6 -- How many bags of Marked Bills can you MAXIMUM get from a Paleto Table?
Config.PaletoGoldMin = 5 -- Minimum gold bars from Paleto
Config.PaletoGoldMax = 8 -- Maximum gold bars from Paleto

---- ** PALETO SECOND ** ----
Config.PaletoSecondMinBags = 6 -- How many bags of Marked Bills can you MINIMUM get from a Paleto Second Table
Config.PaletoSecondMaxBags = 9 -- How many bags of Marked Bills can you MAXIMUM get from a Paleto Second Table?
Config.PaletoSecondGoldMin = 5 -- Minimum gold bars from Paleto Second
Config.PaletoSecondGoldMax = 8 -- Maximum gold bars from Paleto Second

---- ** PACIFIC LOOT TABLES ** ----
Config.PacificBagsMin = 4 -- How many bags of Marked Bills can you MINIMUM get from a pacific Table?
Config.PacificBagsMax = 7 -- How many bags of Marked Bills can you MAXIMUM get from a pacific Table?
Config.PacificGoldMin = 5 -- Minimum gold bars from pacific
Config.PacificGoldMax = 10 -- Maximum gold bars from pacific

---- ** LOWER VAULT LOOT TABLES ** ----
Config.LowerVaultBagsMin = 6 -- How many bags of Marked Bills can you MINIMUM get from a lowervault Table?
Config.LowerVaultBagsMax = 10 -- How many bags of Marked Bills can you MAXIMUM get from a lowervault Table?
Config.LowerVaultGoldMin = 6 -- Minimum gold bars from Lower Vault
Config.LowerVaultGoldMax = 12 -- Maximum gold bars from Lower Vault
Config.LowerVaultDiamondMin = 6 -- Minimum amount of Diamonds from a lowervault
Config.LowerVaultDiamondMax = 12 -- Maximum amount of Diamonds from a lowervault

-- ONLY PUT MARKEDBILLS UNDER CASH, I made it so you have 50% chance of getting a RARE ITEM or a CASH item
Config.Lockers = {
    ["Fleeca"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
            'phone',
            'laptop_green',
        },
        ["ItemAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 10, -- CHANCE OF GETTING RARE OR CASH ITEM

        ["Rare"] = {
            'goldbar',
        },
        ["RareAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Cash"] = 'markedbills',
        ["CashAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
    },
    ["Paleto"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
            'phone',
            'laptop_green',
        },
        ["ItemAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 10, -- CHANCE OF GETTING RARE OR CASH ITEM

        ["Rare"] = {
            'goldbar',
        },
        ["RareAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Cash"] = 'markedbills',
        ["CashAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
    },
    ["PaletoVault"] = { -- This is Paleto SECOND vault
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
        },
        ["ItemAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 10, -- CHANCE OF GETTING RARE OR CASH ITEM

        ["Rare"] = {
            'goldbar',
        },
        ["RareAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Cash"] = 'markedbills',
        ["CashAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
    },
    ["Pacific"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
            'phone',
            'laptop_green',
        },
        ["ItemAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 10, -- CHANCE OF GETTING RARE OR CASH ITEM

        ["Rare"] = {
            'goldbar',
        },
        ["RareAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Cash"] = 'markedbills',
        ["CashAmount"] = math.random(1,5), -- Put minimum and Maximum amount of items inside the randomiser
    },
}

---- ITEMS NEEDED ---- (Rename these if you use different language or use different items)
Config.LockerRequired = 'drill' -- Which items do someone need to open a deposit box?
Config.PaletoPacificDoor = 'thermite' -- Which explosive is used to open paleto/pacific doors
Config.PowerplantRequired = 'thermite' -- Which item do someone need to blow up the powerplant?
Config.LowerVaultDoors = "weapon_pipebomb" -- Which item is required before they can plant explosives on lowervault doors?

---- MODDER DETECTION ----
Config.BanModders = true
-- Wanna ban modders when they trigger bankrobbery events? make this true!

-- All the laptop configs
Config.LaptopUses = 3


---- LAPTOP LOCATIONS ----
Config.LaptopLocations = {
    ["Hunter"] = {
        ["coords"] = vector4(347.78, -1255.41, 32.7, 326.1),
        ["TradeItem"] = "usb_green",
        ["laptop"] = "laptop_green",
        ["price"] = 15000,
    },
    ["Fernando"] = {
        ["coords"] = vector4(-458.22, -2266.08, 8.52, 290.63),
        ["TradeItem"] = "usb_blue",
        ["laptop"] = "laptop_blue",
        ["price"] = 30000,
    },
    ["Rico"] = {
        ["coords"] = vector4(1689.93, 3581.6, 35.62, 216.85),
        ["TradeItem"] = "usb_red",
        ["laptop"] = "laptop_red",
        ["price"] = 45000,
    },
    ["Gustavo"] = {
        ["coords"] = vector4(-1423.84, 6760.71, 5.88, 90.47),
        ["TradeItem"] = "usb_gold",
        ["laptop"] = "laptop_gold",
        ["price"] = 60000,
    },
    ["Fisher"] = {
        ["coords"] = vector4(1470.19, 6550.24, 14.9, 92.8),
        ["TradeItem"] = "usb_pink",
        ["laptop"] = "laptop_pink",
        ["price"] = 60000,
    },
}
---- NOTIFY SUPPORTING MULTIPLE LANGUAGES ----
Config.Notify = { -- Don't change the ["Text"] only change the text on the RIGHT SIDE
    -- POLICE NOTIS
    ["NotEnoughPD"] = "Not enough police...",

    -- Hard Drive Noti
    ["MissingHDD"] = "This dosn't seem right",
    ["BrokeHDD"] = "You broke the Hard Drive!",
    ["NoDrive"] = "No Hard Drive Found!",
    ["MissingDrive"] = "No Drive to be found",
    ["FoundHDD"] = "You found a encrypted Hard Drive!",

    ---- MISC ----
    ["FleecaHackCancel"] = "Canceled..",
    ["FleecaHackFail"] = "You failed the hack!",
    ["BankDoorOpen"] = "It seems the bank is already open..",
    ["BankCoolDown"] = "The security lock is active, opening the door is currently not possible..",
    ["HackerSuccess"] = "You cracked the security system...",
    ["DoorMinutes"] = "Bank Door opens in ",
    ["DoorSecondHalf"] = " Seconds",
    ["MissingDrill"] = "You don't have anything to open this with...",
    ["AlreadyDrilled"] = "Saftey Box has already been drilled...",
    ["MissingLaptop"] = "What are you gonna hack it with???",
    ["TableAlreadyLooted"] = "There's nothing there...",
    ["TrayAlreadyLooted"] = "There's nothing there...",
    ["BankOpen"] = "Bank Security is activated...",
    ["DoorIsOpen"] = "The Door is already open...",
    ["MissingExplosive"] = "Something seems wrong...",
    ["BombExplodes"] = "C4 will explode in 30 seconds!",

    -- Thermite Notis
    ["PlacingThermite"] = "Placing Thermite...",
    ["MissingThermite"] = "This dosn't seem right...",
    ["AlreadyExploded"] = "This dosn't seem right...",

    -- Item // server side notify
    ["Got"] = "You got ",
    ["BagsOfInked"] = "bags of inked money...",
    ["GoldBars"] = "Gold Bars",
    ["Diamonds"] = "Diamonds",
    ["found"] = "You found",

    -- Drill Overheated
    ["DrillBroke"] = "The Drill overheated and broke!",
    ["LockBroke"] = "The Drill overheated! You Messed up the lock...",

    -- Lower vault code
    ["FirstCode"] = "The first code is ",
    ["SecondCode"] = "The second code is ",
    ["Code1Cracked"] = "Code 1 cracked",
    ["WrongCode"] = "Wrong Code",
    ["LockDownActivated"] = "Lockdown is activated!",

    ["Code2Cracked"] = "Code 2 Cracked",
    ["LWHackFail"] = "The Hack Failed!",
    ["CrackCode1"] = "Crack the First Code!",

    -- Laptop Notis
    ["PurchasedLaptop"] = "You purchased a laptop from ",
    ["for"] = " for $",
    ["cash"] = " cash",

    -- ^^ This one might be confusing but it will look like this
    -- You purchased a laptop from Gustavo for $34591 cash

    ["NotEnoughCash"] = "You don't have enough cash",
    ["NothingToOffer"] = "You don't have anything to offer!",
}
---- BANK LOCATIONS ----

-- ** DO NOT CHANGE THIS ** --
Config.FleecaBanks = { 
    [1] = { -- Great Ocean Highway
        ["coords"] = vector4(-2956.564, 481.957, 15.297, 347.02),  -- Coordinates of the Banks
        ["tablecoords"] = {[1] = vector3(-2954.2, 484.377, 15.525)},
        ["object"] = GetHashKey("hei_prop_heist_sec_door"),
        ["camId"] = 25,
        ["isOpened"] = false,
        ["heading"] = {
            closed = 357.542,
            open = 267.542,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(-2954.2, 484.377, 15.525),
            heading = 270.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(-2952.2, 484.135, 15.9253), rotation = vector3(0.0, 0.0, 265.0), loot = false},
            {coords = vector3(-2954.0, 486.676, 15.9253), rotation = vector3(0.0, 0.0, 355.0), loot = false},
            {coords = vector3(-2954.2, 482.120, 15.9253), rotation = vector3(0.0, 0.0, 185.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(-2957.3, 485.690, 14.6753), heading = 178.0, loot = false},
            {coords = vector3(-2958.4, 484.099, 14.6753), heading = 268.0, loot = false},
        },
    },
    [2] = { -- Sandy Shores
        ["coords"] = vector4(1175.34, 2713.09, 39.35, 84.60),  -- Coordinates of the Banks   
        ["tablecoords"] = {[1] = vector3(1173.45, 2715.08, 37.9162)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 22,
        ["heading"] = {
            closed = 90.00,
            open = 0.00,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(1173.45, 2715.08, 37.9162),
            heading = 360.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(1173.34, 2717.16, 38.3363), rotation = vector3(0.0, 0.0, 0.0), loot = false},
            {coords = vector3(1175.52, 2715.16, 38.3363), rotation = vector3(0.0, 0.0, 275.0), loot = false},
            {coords = vector3(1170.95, 2715.26, 38.3363), rotation = vector3(0.0, 0.0, 90.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(1172.02, 2712.01, 37.0662), heading = 270.0, loot = false},
            {coords = vector3(1173.69, 2710.93, 37.0662), heading = 0.0, loot = false},
        },
    },
    [3] = { -- Del Perro Blvd
        ["coords"] = vector4(-1209.822, -336.4793, 37.381, 299.439),  -- Coordinates of the Banks   
        ["tablecoords"] = {[1] = vector3(-1207.47, -336.63, 37.76)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 296.863,
            open = 206.863,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(-1207.6, -337.40, 37.6093),
            heading = 210.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(-1205.1, -336.54, 37.9593), rotation = vector3(0.0, 0.0, -60.0), loot = false},
            {coords = vector3(-1206.4, -339.10, 37.9593), rotation = vector3(0.0, 0.0, 200.0), loot = false},
            {coords = vector3(-1209.1, -338.87, 37.9593), rotation = vector3(0.0, 0.0, 120.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(-1207.6, -333.89, 36.7592), heading = 118.0, loot = false},
            {coords = vector3(-1209.9039, -334.0858, 36.7592), heading = 208.0, loot = false},
        },
    },
    [4] = { -- Pink Cage Motel
        ["coords"] = vector4(311.57, -284.0903, 53.974, 259.00),  -- Coordinates of the Banks   
        ["tablecoords"] = {[1] = vector3(312.756, -287.41, 54.0)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(312.756, -287.41, 54.0),
            heading = 160.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(310.867, -286.82, 54.4430), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(312.411, -289.41, 54.4430), rotation = vector3(0.0, 0.0, 160.0), loot = false},
            {coords = vector3(315.230, -288.20, 54.4430), rotation = vector3(0.0, 0.0, 260.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(315.230, -284.93, 53.1430), heading = 70.0, loot = false},
            {coords = vector3(313.4798, -283.2532, 53.1430), heading = 160.0, loot = false},
        },
    },
    [5] = { -- Legion Square
        ["coords"] = vector4(vector3(147.52, -1046.69, 30.0008), 246.72924), -- Coordinates of the Banks   
        ["tablecoords"] = {[1] = vector3(148.431, -1049.1, 29.19)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(148.431, -1049.1, 29.19),
            heading = 160.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(146.459, -1048.4, 29.6162), rotation = vector3(0.0, 0.0, 70.0), loot = false},
            {coords = vector3(148.095, -1051.1, 29.6162), rotation = vector3(0.0, 0.0, 170.0), loot = false},
            {coords = vector3(150.969, -1049.8, 29.6162), rotation = vector3(0.0, 0.0, 250.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(151.036, -1046.6, 28.3462), heading = 70.0, loot = false},
            {coords = vector3(149.3168, -1045.0193, 28.3463), heading = 160.0, loot = false},
        },
    },
    [6] = { -- Hawick Ave
        ["coords"] = vector4(-354.08, -55.27648, 49.8666, 257.45),  -- Coordinates of the Banks   
        ["tablecoords"] = {[1] = vector3(-352.23, -58.215, 48.848)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(-352.23, -58.215, 48.848),
            heading = 160.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(-354.15, -57.592, 49.3147), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(-352.81, -60.155, 49.3147), rotation = vector3(0.0, 0.0, 160.0), loot = false},
            {coords = vector3(-349.70, -59.020, 49.3147), rotation = vector3(0.0, 0.0, 260.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(-349.86, -55.756, 48.0148), heading = 70.0, loot = false},
            {coords = vector3(-351.4306, -54.2340, 48.0148), heading = 162.0, loot = false},
        },
    },
}

Config.PaletoBank = {
    ["coords"] = vector4(-106.0602, 6472.4204, 31.00846, 43.4977),  -- Coordinates of the Banks
    ["isOpened"] = false,
    ["object"] = -1185205679,
    ["heading"] = {
        closed = 45.45,
        open = 130.45
    },
    ["camId"] = 26,
    ["grab"] = { -- middle main grab point
        pos = vector3(-104.7398, 6477.3164, 31.4869),
        heading = 308.2753,
        loot = false
    },
    ["drills"] = { -- drill points
        {coords = vector3(-102.9603, 6475.5752, 31.9267), rotation = vector3(0.0, 0.0, 219.2149), loot = false},
        {coords = vector3(-103.2137, 6478.2339, 31.9267), rotation = vector3(0.0, 0.0, 316.5404), loot = false},
        {coords = vector3(-105.9050, 6478.5010, 31.9283), rotation = vector3(0.0, 0.0, 50.1688), loot = false},
    },
    ["trollys"] = { -- trollys points
        {coords = vector3(-107.6612, 6475.3379, 30.6267), heading = 226.7980, loot = false}, 
        {coords = vector3(-107.15, 6473.53, 30.63), heading = 315.0013, loot = false},
    },
    ["thermite"] = { -- trollys points
        {coords = vector4(-105.8219, 6475.5615, 31.6267, 316.8870), anim = vector3(-105.5515, 6475.1553, 31.6267), effect = vector3(-105.5154, 6476.2031, 31.6267), isOpen = false},
    },
}

Config.PaletoSecond = {
    ["coords"] = vector4(-103.18, 6459.52, 30.63, 238.89),
    ["drills"] = { 
        {coords = vector3(-103.4, 6456.39, 31.9267), rotation = vector3(0.0, 0.0, 137.2149), loot = false},
        {coords = vector3(-101.72, 6456.25, 31.9267), rotation = vector3(0.0, 0.0, 200.5404), loot = false},
        {coords = vector3(-100.35, 6457.67, 31.9267), rotation = vector3(0.0, 0.0, 249.1688), loot = false},
        {coords = vector3(-100.43, 6459.7, 31.9267), rotation = vector3(0.0, 0.0, 310.0), loot = false},
    },
    ["trollys"] = { -- trollys points
        {coords = vector3(-105.13, 6457.68, 30.63), heading = 50.29, loot = false}, 
        {coords = vector3(-107.37, 6458.61, 30.63), heading = 315.0013, loot = false},
        {coords = vector3(-108.0, 6460.7, 30.63), heading = 225.93, loot = false},
    },
    ["thermite"] = { -- trollys points
        {coords = vector4(-105.39, 6460.81, 31.63, 135.31), anim = vector4(-105.94, 6461.04, 31.63, 137.83), effect = vector3(-105.0, 6461.04, 31.63), isOpen = false},
    },
}

Config.PacificBank = {
    ["coords"] = vector4(253.21, 228.3, 100.72, 73.16),  -- Coordinates of the Banks
    ["isOpened"] = false,
    ["object"] = 961976194,
    ["camId"] = 25,
    ["heading"] = {
        closed = 160.00001,
        open = 5.00001
    },
    ["grab"] = { -- middle main grab point
        pos = vector3(264.2917, 213.7544, 101.5277),
        heading = 257.1971,
        loot = false
    },
    ["drills"] = { -- drill points
        {coords = vector3(259.4137, 218.0399, 101.8832), rotation = vector3(0.0, 0.0, 338.5553), loot = false},
        {coords = vector3(258.2209, 214.2284, 101.8832), rotation = vector3(0.0, 0.0, 159.3905), loot = false},
        {coords = vector3(266.0605, 213.6284, 101.8832), rotation = vector3(0.0, 0.0, 244.9056), loot = false},
    },
    ["trollys"] = { -- trollys points
        {coords = vector3(262.5378, 212.7852, 100.6833), heading = 340.0059, loot = false}, 
        {coords = vector3(263.7690, 216.3632, 100.6833), heading = 161.9024, loot = false},
    },
    ["thermite"] = { -- trollys points
        {coords = vector4(257.0483, 220.5190, 106.2852, 332.2341), anim = vector3(257.40, 220.20, 106.35), effect = vector3(257.39, 221.20, 106.29), isOpen = false}, 
        {coords = vector4(252.4627, 220.8329, 101.6832, 161.7461), anim = vector3(252.95, 220.70, 101.76), effect = vector3(252.985, 221.70, 101.72), isOpen = false},
        {coords = vector4(261.5854, 215.0085, 101.6834, 254.1465), anim = vector3(261.65, 215.60, 101.76), effect = vector3(261.68, 216.63, 101.75), isOpen = false},

    },
}

Config.lowerVault = {
    ["coords"] = vector4(256.67, 240.63, 101.7, 344.11),
    ["isOpened"] = false,
    ["object"] = -1520917551,
    ["heading"] = {
        closed = 160.00001,
        open = 280.00001
    },
    ["grabGold"] = {
        {coords = vector3(250.1604, 247.5476, 101.5785), heading = 68.8828, loot = false, type = 'gold'},
        {coords = vector3(252.1132, 252.9595, 101.5785), heading = 73.3432, loot = false, type = 'gold'},
        {coords = vector3(254.1243, 258.4601, 101.578), heading = 68.2021, loot = false, type = 'gold'},
        {coords = vector3(265.3879, 258.2246, 101.5332), heading = 160.0, loot = false, type = 'gold'},
        {coords = vector3(261.0530, 259.6717, 101.5332), heading = 160.0, loot = false, type = 'gold'},
    },
    ["grabCash"] = {
        {coords = vector3(268.0621, 247.4709, 101.578), heading = 251.1204, loot = false, type = 'cash'},
        {coords = vector3(265.7912, 241.2334, 101.578), heading = 248.1179, loot = false, type = 'cash'},
        {coords = vector3(262.4372, 263.2787, 101.5333), heading = 340.1399, loot = false, type = 'cash'},
        {coords = vector3(266.7359, 261.7205, 101.5333), heading = 340.1399, loot = false, type = 'cash'},
    },
    ["trays"] = {
        {coords = vector4(265.9693, 251.3843, 100.6342, 180.8530), loot = false}, 
        {coords = vector4(267.8199, 250.7046, 100.6341, 158.7229), loot = false},
        {coords = vector4(269.3021, 255.3727, 100.6337, 342.4431), loot = false},
        {coords = vector4(266.3803, 256.4872, 100.6350, 342.6058), loot = false},
    },
    ["doors"] = {
        {coords = vector4(255.3327, 245.3432, 101.6912, 72.9778), animation = vector4(255.2947, 244.9085, 101.6912, 73.8324), open = false},
        {coords = vector4(257.3676, 251.0141, 101.6912, 76.0976), animation = vector4(257.1855, 250.4203, 101.6927, 67.1193), open = false},
        {coords = vector4(259.3481, 256.4061, 101.6912, 70.7064), animation = vector4(259.2074, 255.9462, 101.7999, 72.6879), open = false},
        {coords = vector4(264.6576, 254.4495, 101.6912, 249.2227), animation = vector4(264.4032, 253.9894, 101.6912, 253.8486), open = false},
        {coords = vector4(262.6246, 249.0240, 101.6911, 255.3003), animation = vector4(262.3975, 248.5452, 101.6912, 253.5369), open = false},
        {coords = vector4(260.6041, 243.4887, 101.6912, 256.8587), animation = vector4(260.3777, 242.9825, 101.6912, 250.4351), open = false},
    },
    ["elecbox"] = {
        {coords = vector4(252.38, 215.65, 100.68, 160), anim = vector4(252.8393, 216.7958, 100.6833, 151.5041), loot = false}, 
        {coords = vector4(249.08, 216.77, 100.68, 160), anim = vector4(249.5149, 217.9007, 100.6833, 164.9327), loot = false},
    },
    ["tables"] = {
        {tableObj = vector4(262.4427, 263.2368, 100.6838, 340.1399)},
        {tableObj = vector4(266.7326, 261.7053, 100.6838, 340.1399)},
        {tableObj = vector4(265.4210, 258.2497, 100.6837, 160.0)},
        {tableObj = vector4(261.1586, 259.7454, 100.6837, 160.0)},
    },
    ["display"] = {
        ["coords"] = vector4(264.6180, 262.4878, 100.633, 340.1399), 
        ["displayItem"] = vector4(264.6180, 262.4878, 101.6721, 340.1399),
        ["loot"] = false,
        [1] = {
            object = 'h4_prop_h4_diamond_01a',
            display = 'h4_prop_h4_diamond_disp_01a'  -- need to finish
        },
    },
    ["computer"] = vector4(251.99, 235.77, 102.49, 256.54), -- Coords for the PC used to Hack Hard drives
    ["LWCode1"] = "", -- DO NOT TOUCH THIS
    ["LWCode2"] = "", -- DO NOT TOUCH THIS
}


---- ** POWER PLANT LOCATIONS AND AMOUNT ** ----

-- This can be customized to however you'd like!

Config.PowerPlantLocations = 6 -- Change this if you change the powerplant locations amount

Config.PowerPlant = {
    ["locations"] = {
        {coords = vector4(2831.17, 1489.19, 24.73, 165.19), open = false},
        {coords = vector4(2825.2422, 1490.5781, 24.7287, 164.2826), open = false},
        {coords = vector4(2817.6945, 1499.2111, 24.7288, 344.5275), open = false},
        {coords = vector4(2811.8256, 1500.7874, 24.7288, 346.8244), open = false},
        {coords = vector4(2829.3327, 1507.0774, 24.7287, 167.7297), open = false},
        {coords = vector4(2835.2323, 1505.6520, 24.7287, 165.2132), open = false},
    },
}