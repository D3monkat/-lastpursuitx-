Config = {}
Config.Language = "EN" -- FR or EN by default
-- money -- 
Config.Money =  1500 -- * 1000 (you will be paid 3390$ each km drive + the km to go to the customer) 
Config.currency = "$"
Config.JobMoney = false -- if you want a society to earn money (set an amount of your choice if you want a society to earn money) only with esx_society


-- start method -- 
Config.UseCommand = "TrainStart" -- Set it to false if you dont want to use it by a command (need to restart your server to works)
Config.UseItem = false -- Set a object to start the job (example : Config.UseItem = "ticket" ) you need to restart the server to apply an item  
Config.JobRequire = false -- set a job between "" if you  want to check the job of the player (need to restart the script or reconnect to refresh your job in the script)
Config.Zone = vector4(265.87747, -1202.89991, 28.28915, 3.41094) -- if you want to start it with a npc (set it to false if you dont want to)
Config.pedhash = "s_m_m_lsmetro_01" -- the hash of the npc 

Config.Webhook = "https://discord.com/api/webhooks/1122040857256796221/idlBr2ixI6fxAwzQmR1cJEHCUy21YHYM5b0E5YAgLXkOkwPLBx1Y96rzeTx9SJDH5s4w" -- a webhook to see all the runs done by players 
Config.blipStation = true

-- dependencie
Config.useProgressBars = true

Config.Translation = {
    ["FR"] = {
        ["Start"] = "Appuiez sur [E] pour commencer le transport en Train",
        ["StopRun2"] = "Appuiez sur [E] pour finir le job",
        ["StartRun"] = "Vous avez commencé votre run",
        ["StopRun"] = "Vous avez terminé votre run",
        ["thanks"] = "Merci !",
        ["InCar"] = "Remontez dans votre ~g~train",
        ["Money"] = "Vous avez gagner ",
        ['JobCheck'] = "Vous n'avez pas le job requis",
        ["Webhook"] = " a terminé un run et a gagné : ",
        ["Train"] = "Station de train",
        ["Metro"] = "Station de métro",
        ["EnterTrain"] = "Appuiez sur [E] pour entrer dans le train",
        ["Stop"] = "Arretez-vous",
        ["InStop"] = "Arrêt en cours",
        ["DriveTo"] = "Conduisez jusqu'à la station de : ~g~",
    },
    ["EN"] = {
        ["Start"] = "Press [E] to start the Train job",
        ["StopRun2"] = "Press [E] to stop the Train job",
        ["StartRun"] = "You begin your work",
        ["StopRun"] = "You stop to work",
        ["thanks"] = "Thanks !",
        ["InCar"] = "Get back in your ~g~train",
        ["Money"] = "You earn ",
        ['JobCheck'] = "You don't have the right job",
        ["Webhook"] = " have done a run and earn : ",
        ["Train"] = "Train Station",
        ["Metro"] = "Tramway Station",
        ["EnterTrain"] = "Press [E] to enter the train",
        ["Stop"] = "Stop the train",
        ["InStop"] = "The train is stopped",
        ["DriveTo"] = "Drive to : ~g~",
    }
}
Config.runTrain = {
    peds = {"a_f_m_beach_01","a_f_m_bevhills_01","a_f_m_bevhills_02","a_f_m_business_02","a_f_m_downtown_01","a_f_m_eastsa_01",
            "a_f_m_eastsa_02","a_f_m_fatbla_01","a_f_m_ktown_01","a_f_m_ktown_02","a_f_m_tourist_01","a_f_o_soucent_01","a_f_y_business_04","a_f_y_clubcust_01",
            "a_f_y_indian_01","a_f_y_soucent_02","a_f_y_vinewood_03","a_f_y_smartcaspat_01","a_m_m_afriamer_01","a_m_m_golfer_01","a_m_m_beach_01",
            "a_m_m_malibu_01","a_m_m_prolhost_01","a_m_m_skater_01","a_m_m_soucent_03","a_m_y_beachvesp_01","a_m_y_business_02","a_m_y_eastsa_01","a_m_y_ktown_02"
    },
    ["train"] = {
        stations = {
            {
                name = "Mesa Station",
                ped = vector4(662.16198, -685.79035, 24.08803, 274.23226),
                spawn = vector3(669.1997, -671.99097, 25.99131),
                ticket = vector3(662.95849, -678.88807, 25.23588)
            },
            {
                name = "Grand Senora Desert",
                ped = vector4(2536.30493, 2847.51171, 37.62685, 240.68124),
                spawn = vector3(2541.46826, 2843.40112, 38.78957),
                ticket = vector3(2537.11401, 2848.48364, 38.68369)
            },
            {
                name = "Sandy Shores",
                ped = vector4(2271.00341, 3756.82153, 37.42394, 39.63069),
                spawn = vector3(2254.34643, 3763.45092, 38.42557),
                ticket = vector3(2272.14453, 3757.39721, 38.42584)
            },
            {
                name = "Mont Josiah",
                ped = vector4(-341.71143, 3745.08911, 68.97085, 303.06375),
                spawn = vector3(-334.53187, 3751.18432, 70.78498),
                ticket = vector3(-341.13071, 3743.92016, 69.97085)
            },
            {
                name = "Paleto Bay",
                ped = vector4(-141.24323, 6149.78613, 31.33512, 137.71379),
                spawn = vector3(-136.19329, 6146.29199, 31.57835),
                ticket = vector3(-139.47822, 6148.76074, 32.33512)
            },
            {
                name = "Monts San Chianski",
                ped = vector4(2976.88574, 3768.90161, 53.69902, 81.95176),
                spawn = vector3(2969.54467, 3776.10791, 55.61811),
                ticket = vector3(2977.01293, 3770.05078, 54.70135)
            },
            {
                name = "Grand Senora Desert",
                ped = vector4(2632.5144, 2935.30834, 39.42162, 59.97898),
                spawn = vector3(2609.63354, 2926.88818, 40.43894),
                ticket = vector3(2634.64721, 2932.13037, 44.73899)
            },
            {
                name = "Palmer-Taylor's Centrale",
                ped = vector4(2619.26757, 1693.00781, 26.59853, 90.67733),
                spawn = vector3(2610.80517, 1678.58483, 27.11895),
                ticket = vector3(2619.4248, 1691.78613, 31.8694)
            },
            {
                name = "Mesa Station",
                ped = vector4(679.60223, -897.25019, 22.46206, 96.30525),
                spawn = vector3(669.25653, -897.26063, 22.26316),
                ticket = vector3(679.44073, -899.78187, 23.46206)
            },
        }
    },
    ["metro"] = {
        stations = {
            {
                name = "Los Santos International Airports",
                ped = vector4(-1095.1626, -2726.16895, -8.41014, 325.71792),
                spawn = vector3(-1064.54822, -2704.74781, -8.28577),
                ticket = vector3(-1105.943, -2743.93262, -7.41013)
            },
            {
                name = "Los Santos International Airports parkings",
                ped = vector4(-874.89551, -2304.40284, -12.73281, 253.85716),
                spawn = vector3(-871.37494, -2308.52198, -12.6296),
                ticket = vector3(-871.81989, -2285.10108, -11.73281)
            },
            {
                name = "Puerto Del Sol",
                ped = vector4(-540.43903, -1285.11622, 25.90158, 250.26632),
                spawn = vector3(-535.18372, -1281.52686, 26.8669),
                ticket = vector3(-539.91413, -1283.99012, 26.9016)
            }, 
            {
                name = "Strawberry",
                ped = vector4(278.7507, -1205.47852, 37.89419, 182.45143),
                spawn = vector3(275.44403, -1209.93433, 38.07442),
                ticket = vector3(281.92657, -1205.49939, 38.90011),
            },
            {
                name = "Burton",
                ped = vector4(-291.58909, -318.80768, 9.06315, 273.24331),
                spawn = vector3(-286.98206, -317.28364, 9.18161),
                ticket = vector3(-293.80469, -364.30002, 10.0631),
            },
            {
                name = "Portola Drive",
                ped = vector4(-819.3844, -140.02508, 18.95038, 307.07598),
                spawn = vector3(-825.20124, -134.896, 20.00232),
                ticket = vector3(-786.89161, -120.24803, 19.95031),
            },
            {
                name = "Del Perro",
                ped = vector4(-1353.87708, -462.04004, 14.04532, 30.07644),
                spawn = vector3(-1346.43201, -488.74042, 14.17012),
                ticket = vector3(-1369.3219, -435.77601, 15.04532),
            },
            {
                name = "Little Seoul",
                ped = vector4(-494.74015, -674.85877, 10.80902, 192.13395),
                spawn = vector3(-492.85923, -680.28303, 10.92442),
                ticket = vector3(-534.97883, -673.89063, 11.80897),
            },
            {
                name = "Pillbox South",
                ped = vector4(-213.65572, -1031.0973, 29.13845, 64.04772),
                spawn = vector3(-221.33494, -1041.32837, 28.70948),
                ticket = vector3(-214.51317, -1033.11023, 30.14038),
            },
            {
                name = "Davis",
                ped = vector4(105.63665, -1718.98987, 29.1112, 128.58197),
                spawn = vector3(120.52359, -1735.57703, 28.45325),
                ticket = vector3(114.36212, -1726.41639, 30.11111),
            },
            -- retour
            {
                name = "Davis",
                ped = vector4(106.98967, -1717.52027, 29.11355, 312.37152),
                spawn = vector3(116.22464, -1721.04114, 30.09348),
                ticket = vector3(114.36212, -1726.41639, 30.11111),
                retour = true,
            },
            {
                name = "Pillbox South",
                ped = vector4(-208.45945, -1022.55146, 29.13857, 250.96197),
                spawn = vector3(-206.97614, -1029.13953, 30.28913),
                ticket = vector3(-214.51317, -1033.11023, 30.14038),
                retour = true,
            },
            {
                name = "Little Seoul",
                ped = vector4(-494.80622, -671.30689, 10.80902, 356.81817),
                spawn = vector3(-514.82349, -665.61878, 10.29546),
                ticket = vector3(-534.97883, -673.89063, 11.80897),
                retour = true,
            },
            {
                name = "Del Perro",
                ped = vector4(-1356.31763, -450.60801, 14.04531, 310.6101),
                spawn = vector3(-1350.37574, -451.72913, 14.14937),
                ticket = vector3(-1369.3219, -435.77601, 15.04532),
                retour = true,
            },
            {
                name = "Portola Drive",
                ped = vector4(-820.60053, -142.66178, 18.95034, 195.36338),
                spawn = vector3(-822.3758, -150.15072, 20.00196),
                ticket = vector3(-786.89161, -120.24803, 19.95031),
                retour = true,
            },
            {
                name = "Burton",
                ped = vector4(-296.68601, -331.96027, 9.0631, 96.96437),
                spawn = vector3(-302.28095, -331.08524, 10.11512),
                ticket = vector3(-293.80469, -364.30002, 10.0631),
                retour = true,
            },
            {
                name = "Strawberry",
                ped = vector4(278.84768, -1203.04041, 37.89433, 2.12688),
                spawn = vector3(264.47549, -1198.54297, 39.01328),
                ticket = vector3(281.92657, -1205.49939, 38.90011),
                retour = true,
            },
            {
                name = "Puerto Del Sol",
                ped = vector4(-542.16504, -1283.17774, 25.90158, 73.84172),
                spawn = vector3(-545.20984, -1282.15442, 26.87141),
                ticket = vector3(-539.91413, -1283.99012, 26.9016),
                retour = true,
            },
            {
                name = "Los Santos International Airports parkings",
                ped = vector4(-882.69141, -2317.35669, -12.73279, 164.1751),
                spawn = vector3(-891.33973, -2319.26172, -12.61935),
                ticket = vector3(-871.81989, -2285.10108, -11.73281),
                retour = true,
            },
            {
                name = "Los Santos International Airports ",
                ped = vector4(-1090.12806, -2723.91431, -8.41014, 323.84423),
                spawn = vector3(-1095.84021, -2719.17945, -7.35873),
                ticket = vector3(-1105.943, -2743.93262, -7.41013),
                retour = true,
            },
        }
    }
}