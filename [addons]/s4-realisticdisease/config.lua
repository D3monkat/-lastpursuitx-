Config = {}

Config.DebguMode = true -- if true will enable debug mode 

Config.Framework = "ESX" -- ESX or QBCore

Config.RemoveInjuresWhenRevive = false -- if true when player revive will remove all injures else doctor will need to heal player

Config.OnlyWithAim = true -- if true player will need to aim to damage player else will damage player without aim

Config.Job = "ambulance" -- job name that can heal players

Config.Key = 'i' -- key to open menu

Config.AlwaysOpenHudKey = 'k' -- key to open hud

Config.GetNameFromSQL = true -- if true will get name from sql else will get name from server (ESX)

Config.TreatFailRemoveItems = true -- if true will remove item from player inventory when treatment fail

Config.EnableFastTreatment = true -- if true will enable fast treatment else will enable minigame

Config.FastTreatMiniGame = true -- if true will enable minigame for fast treatment

Config.FastTreatmentPrice = 1000 -- price for fast treatment

Config.EnableBleeding = false -- if true will enable bleeding

Config.BleedingHitDamage = 5 -- how many times player can bleed 

Config.BleedingPerMillisecond = 2500 -- how many seconds player will bleed

Config.BleedingMultiplier = 1 -- how many times player will bleed

Config.DisableSetPlayerHealthRecharge = false -- if true will disable recharge player health

Config.Functions = {} -- dont touch this
Config.Functions.TreatingMiniGame = function(cachedTreat) 
    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
    if success then 
        TriggerServerEvent("s4-realisticdisease:treatPlayer", cachedTreat)
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = Config.Langs[Config.Lang]["succeed_treat"] })
        Config.Functions.PlayAnim(Config.Anims["treat"].lib, Config.Anims["treat"].anim)
    else
        if Config.TreatFailRemoveItems == true then 
           TriggerServerEvent("s4-realisticdisease:treatPlayer", cachedTreat, true)
        end
        Config.Functions.PlayAnim(Config.Anims["fail"].lib, Config.Anims["fail"].anim)
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["failed_treat"] })
    end
end

Config.Functions.FastTreatingMiniGame = function(pid) 
    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
    if success then 
        TriggerServerEvent("s4-realisticdisease:fastTreatPlayer", pid)
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = Config.Langs[Config.Lang]["succeed_treat"] })
        Config.Functions.PlayAnim(Config.Anims["treat"].lib, Config.Anims["treat"].anim)
    else
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["failed_treat"] })
        Config.Functions.PlayAnim(Config.Anims["fail"].lib, Config.Anims["fail"].anim)
    end
end


Config.Functions.PlayAnim = function(lib, anim)
    RequestAnimDict(lib)
    while not HasAnimDictLoaded(lib) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.SetTimeout(2500, function()
        ClearPedTasksImmediately(PlayerPedId())
    end)
end

Config.Anims = {  -- you can change animations here
    ["check"] = {
        lib = 'amb@medic@standing@timeofdeath@enter',
        anim = 'enter',
    },
    ["heal"] = {
        lib = 'anim@mp_player_intcelebrationfemale@knuckle_crunch',
        anim = 'knuckle_crunch',
    },
    ["treat"] = {
        lib = 'anim@mp_player_intcelebrationfemale@knuckle_crunch',
        anim = 'knuckle_crunch',
    },
    ["fail"] = {
        lib = 'move_m@_idles@shake_off',
        anim = 'shakeoff_1',
    },
}


Config.ItemsForHeal = {
    ["head"] = {
        "forceps", "gauze" 
    },
    ["body"] = {
        "gauze", "pill", "surgical-gloves", "surgical-staple" 
    },
    ["lleg"] = {
        "forceps", "syringe", "tape" 
    },
    ["rleg"] = {
        "forceps", "syringe", "tape" 
    },
    ["rarm"] = {
        "iodine", "gauze", "tape"
    },
    ["larm"] = {
        "iodine", "gauze", "tape"
    }
}


Config.Lang = "en"

Config.Langs = {
    ["en"] = {
        ["succeed_treat"] = "You succeed to treat the patient",
        ["failed_treat"] = "You failed to treat the patient",
        ["no_money"] = "You don't have enough money to treat the patient!",
        ["no_skill"] = "We're sorry, but you're not skilled enough to perform this surgery!",
        ["no_item"] = "We're sorry, but you're not skilled enough to perform this surgery!",
        ["wrong"] = "We're sorry, but you're not skilled enough to perform this surgery!"
    }
}
 
Config.PlayerBones = {
    -- ['RFoot'] = 52301,
    -- ['LFoot'] = 14201,
    -- ['RHand'] = 57005,
    -- ['LHand'] = 18905,
    ['RKnee'] = 36864,
    ['LKnee'] = 63931,
    ['Head'] = 31086,
    -- ['Neck'] = 39317,
    ['RArm'] = 28252,
    ['LArn'] = 61163,
    ['Chest'] = 24818,
    ['Pelvis'] = 11816,
    -- ['RShoulder'] = 40269,
    -- ['LShoulder'] = 45509,
    -- ['RWrist'] = 28422,
    -- ['LWrist'] = 60309,
}

Config.BoneLabelText = {
    [98] = { name = "Head", Label = "Head" , unity = 'Head' },
    [97] = { name = "Neck", Label = "Neck", unity = 'Neck' },
    [69] = { name = "RShoulder", Label = "Right Shoulder", unity = 'RArm' },
    [40] = { name = "LShoulder", Label = "Left Shoulder", unity = 'LArm' },
    [38] = { name = "Chest", Label = "Chest", unity = 'Chest' },
    [70] = { name = "RArm", Label = "Right Arm", unity = 'RArm' },
    [41] = { name = "LArm", Label = "Left Arm", unity = 'LArm' },
    [1] =  { name = "Pelvis", Label = "Body", unity = 'Pelvis' },
    [71] = { name = "RHand", Label = "", unity = 'RArm'  },
    [42] = { name = "LHand", Label = "", unity = 'LArm'  },
    [90] = { name = "RWrist", Label = "Right Wrist", unity = 'RArm'  },
    [61] = { name = "LWrist", Label = "Left Wrist" , unity = 'LArm' },
    [15] = { name = "RKnee", Label = "Right Leg", unity = 'RKnee' },
    [3] = { name = "LKnee", Label = "Left Leg", unity = 'LKnee' },
    [16] = { name = "RFoot", Label = "Right Leg", unity = 'RLeg' },
    [4] = { name = "LFoot", Label = "Left Leg", unity = 'LLeg' },
}
 

Config.Treatment = {
    ["Minor"] = {
        "forceps", "gauze", "pill", "surgical-gloves", "surgical-staple"
    },
    ["Medium"] = {
       "surgical-staple", "gauze", "tape", "forceps", "gauze", "pill", "surgical-gloves"
    },
    ["Critical"] = {
        "gauze", "tape", "surgical-tray", "iodine", "syringe","forceps", "gauze", "pill", "surgical-gloves", "surgical-staple",
    },
}


Config.items = {
    ["forceps"] = "forceps.png",
    ["gauze"] = "gauze.png",
    ["iodine"] = "iodine.png",
    ["pill"] = "pill.png",
    ["surgical-gloves"] = "surgical-gloves.png",
    ["surgical-staple"] = "surgical-staple.png",
    ["surgical-tray"] = "surgical-tray.png",
    ["syringe"] = "syringe.png",
    ["tape"] = "tape.png",
} -- import items your server database





Config.Weapons = {
    [-1075685676] = "WEAPON_PISTOL_MK2",
    [126349499] = "WEAPON_SNOWBALL",
    [-270015777] = "WEAPON_ASSAULTSMG",
    [615608432] = "WEAPON_MOLOTOV",
    [2024373456] = "WEAPON_SMG_MK2",
    [-1810795771] = "WEAPON_POOLCUE",
    [-1813897027] = "WEAPON_GRENADE",
    [-598887786] = "WEAPON_MARKSMANPISTOL",
    [-1654528753] = "WEAPON_BULLPUPSHOTGUN",
    [-72657034] = "GADGET_PARACHUTE",
    [-102323637] = "WEAPON_BOTTLE",
    [2144741730] = "WEAPON_COMBATMG",
    [-1121678507] = "WEAPON_MINISMG",
    [-1652067232] = "WEAPON_SWEEPERSHOTGUN",
    [961495388] = "WEAPON_ASSAULTRIFLE_MK2",
    [-86904375] = "WEAPON_CARBINERIFLE_MK2",
    [-1786099057] = "WEAPON_BAT",
    [177293209] = "WEAPON_HEAVYSNIPER_MK2",
    [600439132] = "WEAPON_BALL",
    [1432025498] = "WEAPON_PUMPSHOTGUN_MK2",
    [-1951375401] = "WEAPON_FLASHLIGHT",
    [171789620] = "WEAPON_COMBATPDW",
    [1593441988] = "WEAPON_COMBATPISTOL",
    [-2009644972] = "WEAPON_SNSPISTOL_MK2",
    [2138347493] = "WEAPON_FIREWORK",
    [1649403952] = "WEAPON_COMPACTRIFLE",
    [-619010992] = "WEAPON_MACHINEPISTOL",
    [-952879014] = "WEAPON_MARKSMANRIFLE",
    [317205821] = "WEAPON_AUTOSHOTGUN",
    [-1420407917] = "WEAPON_PROXMINE",
    [-1045183535] = "WEAPON_REVOLVER",
    [94989220] = "WEAPON_COMBATSHOTGUN",
    [-1658906650] = "WEAPON_MILITARYRIFLE",
    [1198256469] = "WEAPON_RAYCARBINE",
    [2132975508] = "WEAPON_BULLPUPRIFLE",
    [1627465347] = "WEAPON_GUSENBERG",
    [984333226] = "WEAPON_HEAVYSHOTGUN",
    [1233104067] = "WEAPON_FLARE",
    [-1716189206] = "WEAPON_KNIFE",
    [940833800] = "WEAPON_STONE_HATCHET",
    [1305664598] = "WEAPON_GRENADELAUNCHER_SMOKE",
    [727643628] = "WEAPON_CERAMICPISTOL",
    [-1074790547] = "WEAPON_ASSAULTRIFLE",
    [-1169823560] = "WEAPON_PIPEBOMB",
    [324215364] = "WEAPON_MICROSMG",
    [-1834847097] = "WEAPON_DAGGER",
    [-1466123874] = "WEAPON_MUSKET",
    [-1238556825] = "WEAPON_RAYMINIGUN",
    [-1063057011] = "WEAPON_SPECIALCARBINE",
    [1470379660] = "WEAPON_GADGETPISTOL",
    [584646201] = "WEAPON_APPISTOL",
    [-494615257] = "WEAPON_ASSAULTSHOTGUN",
    [-771403250] = "WEAPON_HEAVYPISTOL",
    [1672152130] = "WEAPON_HOMINGLAUNCHER",
    [338557568] = "WEAPON_PIPEWRENCH",
    [1785463520] = "WEAPON_MARKSMANRIFLE_MK2",
    [-1355376991] = "WEAPON_RAYPISTOL",
    [101631238] = "WEAPON_FIREEXTINGUISHER",
    [1119849093] = "WEAPON_MINIGUN",
    [883325847] = "WEAPON_PETROLCAN",
    [-102973651] = "WEAPON_HATCHET",
    [-275439685] = "WEAPON_DBSHOTGUN",
    [-1746263880] = "WEAPON_DOUBLEACTION",
    [-879347409] = "WEAPON_REVOLVER_MK2",
    [125959754] = "WEAPON_COMPACTLAUNCHER",
    [911657153] = "WEAPON_STUNGUN",
    [-2066285827] = "WEAPON_BULLPUPRIFLE_MK2",
    [-538741184] = "WEAPON_SWITCHBLADE",
    [100416529] = "WEAPON_SNIPERRIFLE",
    [-656458692] = "WEAPON_KNUCKLE",
    [-1768145561] = "WEAPON_SPECIALCARBINE_MK2",
    [1737195953] = "WEAPON_NIGHTSTICK",
    [2017895192] = "WEAPON_SAWNOFFSHOTGUN",
    [-2067956739] = "WEAPON_CROWBAR",
    [-1312131151] = "WEAPON_RPG",
    [-1568386805] = "WEAPON_GRENADELAUNCHER",
    [205991906] = "WEAPON_HEAVYSNIPER",
    [1834241177] = "WEAPON_RAILGUN",
    [-1716589765] = "WEAPON_PISTOL50",
    [736523883] = "WEAPON_SMG",
    [1317494643] = "WEAPON_HAMMER",
    [453432689] = "WEAPON_PISTOL",
    [1141786504] = "WEAPON_GOLFCLUB",
    [-1076751822] = "WEAPON_SNSPISTOL",
    [-2084633992] = "WEAPON_CARBINERIFLE",
    [487013001] = "WEAPON_PUMPSHOTGUN",
    [-1168940174] = "WEAPON_HAZARDCAN",
    [-38085395] = "WEAPON_DIGISCANNER",
    [-1853920116] = "WEAPON_NAVYREVOLVER",
    [-37975472] = "WEAPON_SMOKEGRENADE",
    [-1600701090] = "WEAPON_BZGAS",
    [-1357824103] = "WEAPON_ADVANCEDRIFLE",
    [-581044007] = "WEAPON_MACHETE",
    [741814745] = "WEAPON_STICKYBOMB",
    [-608341376] = "WEAPON_COMBATMG_MK2",
    [137902532] = "WEAPON_VINTAGEPISTOL",
    [-1660422300] = "WEAPON_MG",
    [1198879012] = "WEAPON_FLAREGUN",
 
}

 


Config.WeaponsLabel = {
    [-1075685676] = "WEAPON_PISTOL_MK2",
    [126349499] = "WEAPON_SNOWBALL",
    [-270015777] = "WEAPON_ASSAULTSMG",
    [615608432] = "WEAPON_MOLOTOV",
    [2024373456] = "WEAPON_SMG_MK2",
    [-1810795771] = "WEAPON_POOLCUE",
    [-1813897027] = "WEAPON_GRENADE",
    [-598887786] = "WEAPON_MARKSMANPISTOL",
    [-1654528753] = "WEAPON_BULLPUPSHOTGUN",
    [-72657034] = "GADGET_PARACHUTE",
    [-102323637] = "WEAPON_BOTTLE",
    [2144741730] = "WEAPON_COMBATMG",
    [-1121678507] = "WEAPON_MINISMG",
    [-1652067232] = "WEAPON_SWEEPERSHOTGUN",
    [961495388] = "WEAPON_ASSAULTRIFLE_MK2",
    [-86904375] = "WEAPON_CARBINERIFLE_MK2",
    [-1786099057] = "WEAPON_BAT",
    [177293209] = "WEAPON_HEAVYSNIPER_MK2",
    [600439132] = "WEAPON_BALL",
    [1432025498] = "WEAPON_PUMPSHOTGUN_MK2",
    [-1951375401] = "WEAPON_FLASHLIGHT",
    [171789620] = "WEAPON_COMBATPDW",
    [1593441988] = "WEAPON_COMBATPISTOL",
    [-2009644972] = "WEAPON_SNSPISTOL_MK2",
    [2138347493] = "WEAPON_FIREWORK",
    [1649403952] = "WEAPON_COMPACTRIFLE",
    [-619010992] = "WEAPON_MACHINEPISTOL",
    [-952879014] = "WEAPON_MARKSMANRIFLE",
    [317205821] = "WEAPON_AUTOSHOTGUN",
    [-1420407917] = "WEAPON_PROXMINE",
    [-1045183535] = "WEAPON_REVOLVER",
    [94989220] = "WEAPON_COMBATSHOTGUN",
    [-1658906650] = "WEAPON_MILITARYRIFLE",
    [1198256469] = "WEAPON_RAYCARBINE",
    [2132975508] = "WEAPON_BULLPUPRIFLE",
    [1627465347] = "WEAPON_GUSENBERG",
    [984333226] = "WEAPON_HEAVYSHOTGUN",
    [1233104067] = "WEAPON_FLARE",
    [-1716189206] = "WEAPON_KNIFE",
    [940833800] = "WEAPON_STONE_HATCHET",
    [1305664598] = "WEAPON_GRENADELAUNCHER_SMOKE",
    [727643628] = "WEAPON_CERAMICPISTOL",
    [-1074790547] = "WEAPON_ASSAULTRIFLE",
    [-1169823560] = "WEAPON_PIPEBOMB",
    [324215364] = "WEAPON_MICROSMG",
    [-1834847097] = "WEAPON_DAGGER",
    [-1466123874] = "WEAPON_MUSKET",
    [-1238556825] = "WEAPON_RAYMINIGUN",
    [-1063057011] = "WEAPON_SPECIALCARBINE",
    [1470379660] = "WEAPON_GADGETPISTOL",
    [584646201] = "Ap Pistol",
    [-494615257] = "WEAPON_ASSAULTSHOTGUN",
    [-771403250] = "WEAPON_HEAVYPISTOL",
    [1672152130] = "WEAPON_HOMINGLAUNCHER",
    [338557568] = "WEAPON_PIPEWRENCH",
    [1785463520] = "WEAPON_MARKSMANRIFLE_MK2",
    [-1355376991] = "WEAPON_RAYPISTOL",
    [101631238] = "WEAPON_FIREEXTINGUISHER",
    [1119849093] = "WEAPON_MINIGUN",
    [883325847] = "WEAPON_PETROLCAN",
    [-102973651] = "WEAPON_HATCHET",
    [-275439685] = "WEAPON_DBSHOTGUN",
    [-1746263880] = "WEAPON_DOUBLEACTION",
    [-879347409] = "WEAPON_REVOLVER_MK2",
    [125959754] = "WEAPON_COMPACTLAUNCHER",
    [911657153] = "WEAPON_STUNGUN",
    [-2066285827] = "WEAPON_BULLPUPRIFLE_MK2",
    [-538741184] = "WEAPON_SWITCHBLADE",
    [100416529] = "WEAPON_SNIPERRIFLE",
    [-656458692] = "WEAPON_KNUCKLE",
    [-1768145561] = "WEAPON_SPECIALCARBINE_MK2",
    [1737195953] = "WEAPON_NIGHTSTICK",
    [2017895192] = "WEAPON_SAWNOFFSHOTGUN",
    [-2067956739] = "WEAPON_CROWBAR",
    [-1312131151] = "WEAPON_RPG",
    [-1568386805] = "WEAPON_GRENADELAUNCHER",
    [205991906] = "WEAPON_HEAVYSNIPER",
    [1834241177] = "WEAPON_RAILGUN",
    [-1716589765] = "WEAPON_PISTOL50",
    [736523883] = "WEAPON_SMG",
    [1317494643] = "WEAPON_HAMMER",
    [453432689] = "Pistol",
    [1141786504] = "WEAPON_GOLFCLUB",
    [-1076751822] = "WEAPON_SNSPISTOL",
    [-2084633992] = "WEAPON_CARBINERIFLE",
    [487013001] = "WEAPON_PUMPSHOTGUN",
    [-1168940174] = "WEAPON_HAZARDCAN",
    [-38085395] = "WEAPON_DIGISCANNER",
    [-1853920116] = "WEAPON_NAVYREVOLVER",
    [-37975472] = "WEAPON_SMOKEGRENADE",
    [-1600701090] = "WEAPON_BZGAS",
    [-1357824103] = "WEAPON_ADVANCEDRIFLE",
    [-581044007] = "WEAPON_MACHETE",
    [741814745] = "WEAPON_STICKYBOMB",
    [-608341376] = "WEAPON_COMBATMG_MK2",
    [137902532] = "WEAPON_VINTAGEPISTOL",
    [-1660422300] = "WEAPON_MG",
    [1198879012] = "WEAPON_FLAREGUN"
}