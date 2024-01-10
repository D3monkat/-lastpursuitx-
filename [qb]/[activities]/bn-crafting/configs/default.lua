Config = Config or {}

Config.Default = {
    [1] = { -- Level required to craft this item
        ["lockpick"] = {
            ["aluminum"] = 15,  -- Amount of the material required, and the name of the material
            ["plastic"] = 25, -- You can add as many materials as you want.
            xp = 5, -- Amount of XP you get for crafting this item
            time = 1000 -- Time it takes to craft this item in milliseconds
        },
        ["phone"] = {
            ["rubber"] = 5,
            ["aluminum"] = 2,
            ["iron"] = 2,
            ["plastic"] = 5,
            xp = 5,
            time = 1000
        },
    },
    [2] = {
        ["radioscanner"] = {
            ["rubber"] = 50,
            ["aluminum"] = 200,
            ["iron"] = 50,
            ["plastic"] = 350,
            xp = 7,
            time = 1500
        },
        ["pinger"] = {
            ["rubber"] = 10,
            ["aluminum"] = 5,
            ["iron"] = 25,
            ["plastic"] = 15,
            xp = 3,
            time = 1000
        },
        ["binoculars"] = {
            ["iron"] = 50,
            xp = 5,
            time = 1000
        },
        ["armor"] = {
            ["rubber"] = 75,
            ["iron"] = 125,
            ["plastic"] = 250,
            xp = 10,
            time = 1500
        },
    },
    [3] = {
        ["screwdriverset"] = {
            ["iron"] = 25,
            ["plastic"] = 10,
            xp = 4,
            time = 1000
        },
        ["weapon_katana"] = {
            ["iron"] = 125,
            ["rubber"] = 50,
            xp = 7,
            time = 1500
        },
        ["weedkey"] = {
            ["metalscrap"] = 75,
            ["iron"] = 50,
            xp = 7,
            time = 1500
        },
    },
    [4] = {
        ["weapon_sledgehammer"] = {
            ["iron"] = 300,
            ["plastic"] = 50,
            ["rubber"] = 200,
            xp = 15,
            time = 2500
        },
        ["weapon_molotov"] = {
            ["glass"] = 550,
            xp = 3,
            time = 2000
        },
        ["cocainekey"] = {
            ["metalscrap"] = 75,
            ["iron"] = 50,
            xp = 7,
            time = 1500
        },
    },
    [5] = {
        ["bolt_cutter"] = {
            ["iron"] = 50,
            ["rubber"] = 125,
            ["plastic"] = 15,
            ["steel"] = 200,
            xp = 15,
            time = 3500
        },
        ["cutter"] = {
            ["iron"] = 70,
            ["plastic"] = 50,
            ["rubber"] = 10,
            xp = 15,
            time = 3000
        },
        ["vangelico_key"] = {
            ["plastic"] = 350,
            ["rubber"] = 15,
            xp = 10,
            time = 2500
        },
        ["crack_kit"] = {
            ["iron"] = 65,
            ["plastic"] = 120,
            ["steel"] = 75,
            ["rubber"] = 80,
            xp = 20,
            time = 4000
        },
        ["drill"] = {
            ["iron"] = 150,
            ["plastic"] = 200,
            ["rubber"] = 75,
            xp = 15,
            time = 3500
        },
        ["bag"] = {
            ["plastic"] = 200,
            ["rubber"] = 75,
            xp = 15,
            time = 3500
        },
        ["methkey"] = {
            ["metalscrap"] = 75,
            ["iron"] = 50,
            xp = 7,
            time = 1500
        },
        ["weapon_de"] = {
            ["iron"] = 15,
            ["plastic"] = 225,
            ["aluminum"] = 315,
            ["rubber"] = 125,
            xp = 7,
            time = 1500
        },
        ["weapon_pistol"] = {
            ["iron"] = 15,
            ["plastic"] = 225,
            ["aluminum"] = 315,
            ["rubber"] = 125,
            xp = 7,
            time = 1500
        },
        ["pistol_ammo"] = {
            ["iron"] = 35,
            xp = 7,
            time = 1500
        },
    },
    [6] = {
        ["parachute"] = {
            ["plastic"] = 150,
            ["rubber"] = 75,
            xp = 15,
            time = 5500
        },
        ["harness"] = {
            ["iron"] = 60,
            ["rubber"] = 90,
            ["steel"] = 55,
            xp = 15,
            time = 3000
        },
        ["trojan_usb"] = {
            ["plastic"] = 150,
            ["aluminum"] = 200,
            ["copper"] = 60,
            xp = 20,
            time = 2500
        },
        ["electronickit"] = {
            ["iron"] = 25,
            ["rubber"] = 150,
            ["plastic"] = 90,
            ["steel"] = 10,
            ["copper"] = 75,
            xp = 25,
            time = 1500
        },
        ["advancedlockpick"] = {
            ["aluminum"] = 70,
            ["plastic"] = 100,
            ["steel"] = 140,
            ["rubber"] = 50,
            xp = 25,
            time = 3500
        },
        ["blowtorch"] = {
            ["steel"] = 50,
            ["rubber"] = 120,
            ["iron"] = 120,
            xp = 20,
            time = 3000
        },
        ["gatecrack"] = {
            ["steel"] = 75,
            ["copper"] = 90,
            ["rubber"] = 125,
            xp = 30,
            time = 5000
        },
        ["thermite"] = {
            ["rubber"] = 100,
            ["metalscrap"] = 65,
            xp = 20,
            time = 3500
        },
        ["hack_usb"] = {
            ["plastic"] = 50,
            ["copper"] = 75,
            ["iron"] = 10,
            xp = 20,
            time = 2500
        },
        ["keya"] = {
            ["metalscrap"] = 75,
            ["iron"] = 50,
            xp = 7,
            time = 1500
        },
        ["weapon_glock17c"] = {
            ["aluminum"] = 400,
            ["rubber"] = 300,
            ["iron"] = 100,
            ["plastic"] = 250,
            xp = 35,
            time = 1500
        },
        ["weapon_glock18c"] = {
            ["aluminum"] = 600,
            ["rubber"] = 500,
            ["iron"] = 280,
            ["plastic"] = 420,
            xp = 35,
            time = 1500
        },
        ["weapon_mp5"] = {
            ["aluminum"] = 800,
            ["rubber"] = 600,
            ["iron"] = 300,
            ["plastic"] = 650,
            xp = 45,
            time = 8000
        },
        ["smg_ammo"] = {
            ["iron"] = 35,
            xp = 7,
            time = 1500
        },
    },
    [7] = {
        ["boostingtablet"] = {
            ["plastic"] = 70,
            ["copper"] = 150,
            ["steel"] = 60,
            xp = 30,
            time = 5000
        },
        ["hackingdevice"] = {
            ["plastic"] = 70,
            ["copper"] = 150,
            ["steel"] = 60,
            xp = 30,
            time = 5000
        },
        ["gpshackingdevice"] = {
            ["plastic"] = 70,
            ["copper"] = 150,
            ["steel"] = 60,
            xp = 30,
            time = 5000
        },
        ["boostingdisabler"] = {
            ["steel"] = 50,
            ["copper"] = 200,
            ["iron"] = 25,
            ["rubber"] = 60,
            xp = 30,
            time = 5500
        },
        ["bcssecuritycard"] = {
            ["plastic"] = 140,
            ["iron"] = 95,
            xp = 30,
            time = 3500
        },
        ["c4_bomb"] = {
            ["plastic"] = 50,
            ["copper"] = 90,
            ["rubber"] = 150,
            xp = 25,
            time = 5500
        },
        ["hardeneddecrypter"] = {
            ["steel"] = 70,
            ["plastic"] = 100,
            ["rubber"] = 75,
            xp = 30,
            time = 5500
        },
        ["hardeneddrill"] = {
            ["steel"] = 60,
            ["iron"] = 115,
            ["plastic"] = 45,
            ["copper"] = 20,
            xp = 30,
            time = 5500
        },
        ["fakeplate"] = {
            ["steel"] = 60,
            ["iron"] = 115,
            xp = 30,
            time = 5500
        },
        ["weapon_remington"] = {
            ["aluminum"] = 900,
            ["rubber"] = 600,
            ["iron"] = 200,
            ["plastic"] = 550,
            xp = 50,
            time = 8000
        },
        ["weapon_bullpupshotgun"] = {
            ["aluminum"] = 900,
            ["rubber"] = 600,
            ["iron"] = 200,
            ["plastic"] = 550,
            xp = 50,
            time = 10000
        },
        ["shotgun_ammo"] = {
            ["iron"] = 35,
            xp = 7,
            time = 1500
        },
    },
    [8] = {
        ["big_drill"] = {
            ["steel"] = 75,
            ["plastic"] = 60,
            ["copper"] = 100,
            ["iron"] = 120,
            xp = 50,
            time = 7500
        },
        ["weapon_mp9"] = {
            ["aluminum"] = 800,
            ["rubber"] = 600,
            ["iron"] = 300,
            ["plastic"] = 650,
            xp = 45,
            time = 8000
        },
    },
    [9] = {
        ["big_bomb"] = {
            ["plastic"] = 100,
            ["steel"] = 55,
            ["rubber"] = 70,
            ["copper"] = 175,
            xp = 75,
            time = 8000
        },
    },
    [10] = {
        ["handcuffs"] = {
            ["steel"] = 150,
            ["aluminum"] = 200,
            xp = 70,
            time = 4500
        },
        ["heavyarmor"] = {
            ["rubber"] = 175,
            ["iron"] = 200,
            ["plastic"] = 190,
            xp = 50,
            time = 6500
        }, 
        ["repairkit"] = {
            ["steel"] = 70,
            ["iron"] = 150,
            ["plastic"] = 50,
            ["aluminum"] = 95,
            ["metalscrap"] = 120,
            ["glass"] = 40,
            ["copper"] = 75,
            xp = 80,
            time = 7500
        },
        ["ifaks"] = {
            ["oxy"] = 15,
            ["bandage"] = 50,
            xp = 55,
            time = 2500
        },
        ["weapon_militaryrifle"] = {
            ["aluminum"] = 900,
            ["rubber"] = 700,
            ["iron"] = 400,
            ["plastic"] = 750,
            xp = 8,
            time = 9000
        },
        ["weapon_hk416"] = {
            ["aluminum"] = 900,
            ["rubber"] = 700,
            ["iron"] = 400,
            ["plastic"] = 750,
            xp = 8,
            time = 9000
        },
        ["rifle_ammo"] = {
            ["iron"] = 50,
            xp = 7,
            time = 1500
        },
        ["weapon_ak74"] = {
            ["aluminum"] = 500,
            ["rubber"] = 400,
            ["iron"] = 100,
            ["plastic"] = 450,
            xp = 5,
            time = 5000
        },
        ["weapon_aks74"] = {
            ["ceramic"] = 100,
            ["iron"] = 100,
            ["plastic"] = 225,
            ["aluminum"] = 500,
            xp = 3,
            time = 1000
        }
    }
}