Config = {}
Config.Framework = 'qb-core' -- Type exports[Config.Framework]:GetCoreObject()
Config.Target = 'qb-target'
Config.BossPed = `s_m_m_ups_02` -- https://docs.fivem.net/docs/game-references/ped-models/

Config.Traxe = 58 -- Press G to turn in vehicle
Config.Management = true -- false to QB-BossMenu
Config.Company = true
Config.CompanyCut = 10 -- 10% of Prime Delivery money income will be added to the company's funds.

Config.BossLocation = vector4(-432.51, -2787.98, 6.0, 52.76)

Config.Vehicle = {
    ['prime'] = {hash = 'boxville4', pos = vector4(-446.54, -2789.49, 5.98, 45.83)},-- Your desired vehicle and pos spawn
    ['express'] = {hash = 'mule', pos = vector4(-446.54, -2789.49, 5.98, 45.83)},
    ['freight'] =  {hash = 'pounder', pos = vector4(-446.54, -2789.49, 5.98, 45.83)},
}

-- Blips Configs
Config.postOpBlip = 477
Config.postOpBlipColor = 5
Config.postOpBlipRange = true
Config.postOpBlipScale = 0.7

Config.turnInVehicleBlip = 477
Config.turnInVehicleBlipColor = 3
Config.turnInVehicleBlipRange = true
Config.turnInVehicleBlipScale = 0.7

Config.dropBlip = 271
Config.dropBlipColor = 5
Config.dropBlipRange = true
Config.dropBlipScale = 0.7
-- Target configs
Config.PrimeBone = {
    'seat_pside_r',
    'seat_dside_r',
}
Config.ExpressBone = {
    'seat_pside_r',
    'seat_dside_r',
}
Config.FreightBone = {
    'seat_pside_r',
    'seat_dside_r',
}

Config.Prop = { -- https://forge.plebmasters.de/objects
    `hei_prop_heist_box`,
    `v_ind_meatboxsml`,
    `v_res_fa_shoebox3`,
    `v_res_fa_shoebox1`,
    `v_res_fa_shoebox2`,
    `v_res_fa_shoebox4`,
    `prop_paper_box_02`,
    `prop_paper_box_01`,
    `prop_paper_box_03`,
    `prop_paper_box_04`,
    `prop_paper_box_05`,
    `prop_cs_rub_box_01`,
    `v_med_latexgloveboxred`,
    `prop_apple_box_01`,
    `prop_beer_box_01`,
    `prop_fruit_plas_crate_01`,
}

Config.PsBuff = false -- true if you have ps-buffs
Config.Buff = "luck"

Config.Prime = 4 -- How many runs before taking 1 hour break
Config.Freight = 1 -- Limited Runs per tsunami
Config.Express = 1 -- Limited Runs per tsunami

-- Money per job.
Config.MoneyP = 400
Config.MoneyE = 2500
Config.MoneyF = 5000

Config.groupMoney = 1.5 -- running in a group will get extra 50% payout for both
Config.buffMoney = 1.5 -- add extra 50% income on top if has buff

-- Example, running prime solo with buff = 600$ income
-- Running prime duo with buff = 900$ income per person

-- How many boxes for deliveries
Config.PrimeBox = 3
Config.ExpressBox = 3
Config.FreightBox = 12

-- PostOp Prime Location (works with/without gabz 247)
Config.PrimeLocation = {
    [1] = { label = 'Innocence Boulevard', pos = vector3(29.1, -1350.07, 29.33),
        drop = vector3(26.24, -1339.25, 29.5) },
    [2] = { label = 'Grove Street', pos = vector3(-53.8, -1757.27, 29.44), drop = vector3(-40.84, -1751.08, 29.42) },
    [3] = { label = 'Little Seoul', pos = vector3(-711.63, -918.07, 19.19), drop = vector3(-706.01, -904.54, 19.22) },
    [4] = { label = 'Mirror Park Boulevard', pos = vector3(1159.72, -329.66, 69.02),
        drop = vector3(1163.25, -313.81, 69.21) },
    [5] = { label = 'Clinton Avenue', pos = vector3(375.94, 320.59, 103.43), drop = vector3(376.4, 334.08, 103.57) },
    [6] = { label = 'North Rockford Drive', pos = vector3(-1820.71, 786.68, 138.03),
        drop = vector3(-1826.18, 800.98, 138.12) },
    [7] = { label = 'Inseno Road', pos = vector3(-3034.7, 591.14, 7.81), drop = vector3(-3047.11, 583.74, 7.91) },
    [8] = { label = 'Route 68', pos = vector3(543.91, 2674.59, 42.15), drop = vector3(548.33, 2662.93, 42.16) },
    [9] = { label = 'Alhambra Drive', pos = vector3(1966.34, 3737.72, 32.19), drop = vector3(1957.57, 3748.05, 32.34) },
    [10] = { label = 'Senora Freeway', pos = vector3(2683.71, 3281.61, 55.24), drop = vector3(2671.63, 3285.1, 55.24) },
    [11] = { label = 'Palomino Freeway', pos = vector3(2563.15, 385.04, 108.47),
        drop = vector3(2549.03, 383.09, 108.62) },
    [12] = { label = 'Grapeseed Main Street', pos = vector3(1696.67, 4930.8, 42.08),
        drop = vector3(1705.42, 4917.63, 42.06) },
    [13] = { label = 'Great Ocean Highway', pos = vector3(1730.1, 6408.11, 34.51),
        drop = vector3(1733.43, 6421.51, 35.04) },
}
-- PostOP Express Location
Config.ExpressLocation = {
    [1] = { label = 'Mirror Park',
        pos = { [1] = { pos = vector3(820.68, -156.31, 80.75) },
            [2] = { pos = vector3(953.05, -196.47, 73.21) },
            [3] = { pos = vector3(804.76, -141.81, 74.89) },
            [4] = { pos = vector3(970.87, -199.6, 76.26) },
            [5] = { pos = vector3(1028.89, -408.28, 66.34) },
            [6] = { pos = vector3(1106.24, -485.22, 65.42) },
            [7] = { pos = vector3(987.45, -433.02, 64.05) },
            [8] = { pos = vector3(999.63, -593.89, 59.64) },
            [9] = { pos = vector3(1265.73, -457.9, 70.52) },
            [10] = { pos = vector3(1241.46, -366.82, 69.08) },
        }
    },
    [2] = { label = 'Mirror Park',
        pos = { [1] = { pos = vector3(996.86, -729.69, 57.82) },
            [2] = { pos = vector3(959.91, -669.97, 58.45) },
            [3] = { pos = vector3(928.9, -639.89, 58.24) },
            [4] = { pos = vector3(886.88, -608.18, 58.45) },
            [5] = { pos = vector3(850.17, -532.69, 57.93) },
            [6] = { pos = vector3(921.82, -477.78, 61.08) },
            [7] = { pos = vector3(987.47, -432.88, 64.05) },
            [8] = { pos = vector3(1050.97, -470.44, 64.3) },
            [9] = { pos = vector3(1223.1, -696.95, 60.8) },
            [10] = { pos = vector3(1240.61, -601.66, 69.78) },
        }
    },
    [3] = { label = 'Del Perro',
        pos = { [1] = { pos = vector3(-1535.15, -454.27, 35.92) },
            [2] = { pos = vector3(-1597.36, -422.15, 41.41) },
            [3] = { pos = vector3(-1390.21, -339.54, 39.47) },
            [4] = { pos = vector3(-1535.24, -422.28, 35.59) },
            [5] = { pos = vector3(-1699.89, -474.68, 41.65) },
            [6] = { pos = vector3(-1467.59, -259.33, 49.58) },
            [7] = { pos = vector3(-1660.36, -534.01, 36.02) },
            [8] = { pos = vector3(-1667.83, -441.38, 40.36) },
            [9] = { pos = vector3(-1477.94, -519.79, 34.74) },
            [10] = { pos = vector3(-1410.95, -456.61, 34.48) },
        }
    },
    [4] = { label = 'North Rockford Hill',
        pos = {
            [1] = { pos = vector3(-580.31, 491.59, 108.9) },
            [2] = { pos = vector3(-641.0, 520.59, 109.88) },
            [3] = { pos = vector3(-717.75, 448.64, 106.91) },
            [4] = { pos = vector3(-762.05, 430.9, 100.2) },
            [5] = { pos = vector3(-842.72, 466.86, 87.6) },
            [6] = { pos = vector3(-884.59, 517.88, 92.44) },
            [7] = { pos = vector3(-924.79, 561.22, 100.16) },
            [8] = { pos = vector3(-974.28, 581.94, 103.01) },
            [9] = { pos = vector3(-1107.84, 594.56, 104.45) },
            [10] = { pos = vector3(-1193.07, 564.13, 100.34) },
        }
    },
    [5] = { label = 'Del Perro',
        pos = {
            [1] = { pos = vector3(-1715.39, -447.23, 42.65) },
            [2] = { pos = vector3(-1678.24, -401.35, 47.53) },
            [3] = { pos = vector3(-1597.28, -352.13, 45.98) },
            [4] = { pos = vector3(-1643.22, -411.74, 42.08) },
            [5] = { pos = vector3(-1667.76, -441.15, 40.36) },
            [6] = { pos = vector3(-1585.59, -464.11, 37.28) },
            [7] = { pos = vector3(-1544.96, -530.31, 36.15) },
            [8] = { pos = vector3(-1468.32, -387.03, 38.81) },
            [9] = { pos = vector3(-1555.05, -289.98, 48.27) },
            [10] = { pos = vector3(-1480.26, -222.57, 49.83) },
        }
    },
    [6] = { label = 'Vespucci Canals',
        pos = { [1] = { pos = vector3(-1111.53, -902.07, 3.79) },
            [2] = { pos = vector3(-1152.2, -913.41, 6.99) },
            [3] = { pos = vector3(-1179.41, -929.21, 6.99) },
            [4] = { pos = vector3(-1055.97, -1000.71, 2.15) },
            [5] = { pos = vector3(-1063.8, -1055.02, 2.15) },
            [6] = { pos = vector3(-978.06, -1108.37, 2.15) },
            [7] = { pos = vector3(-1024.95, -1138.86, 2.34) },
            [8] = { pos = vector3(-986.93, -1199.6, 6.05) },
            [9] = { pos = vector3(-952.57, -1077.66, 2.67) },
            [10] = { pos = vector3(-1074.2, -1152.68, 2.16) },
        }
    },
    [7] = { label = 'Little Seoul',
        pos = { [1] = { pos = vector3(-668.24, -971.68, 22.34) },
            [2] = { pos = vector3(-728.48, -879.9, 22.71) },
            [3] = { pos = vector3(-716.41, -864.71, 23.21) },
            [4] = { pos = vector3(-763.55, -753.88, 27.87) },
            [5] = { pos = vector3(-731.61, -693.65, 30.38) },
            [6] = { pos = vector3(-591.45, -892.58, 25.94) },
            [7] = { pos = vector3(-690.6, -893.1, 24.71) },
            [8] = { pos = vector3(-831.43, -862.71, 20.69) },
            [9] = { pos = vector3(-599.22, -991.1, 22.33) },
            [10] = { pos = vector3(-604.3, -802.38, 25.4) },
        }
    },
    [8] = { label = 'Harmony',
        pos = { [1] = { pos = vector3(316.96, 2622.8, 44.46) },
            [2] = { pos = vector3(266.0, 2598.34, 44.83) },
            [3] = { pos = vector3(367.04, 2571.65, 44.53) },
            [4] = { pos = vector3(471.2, 2607.44, 44.48) },
            [5] = { pos = vector3(543.41, 2658.54, 42.18) },
            [6] = { pos = vector3(186.12, 2786.69, 46.01) },
            [7] = { pos = vector3(287.73, 2843.79, 44.7) },
            [8] = { pos = vector3(379.91, 2629.24, 44.67) },
            [9] = { pos = vector3(562.48, 2741.52, 42.87) },
            [10] = { pos = vector3(392.61, 2634.0, 44.67) },
        }
    },
    [9] = { label = 'Rub Street',
        pos = { [1] = { pos = vector3(-935.54, -1523.21, 5.24) },
            [2] = { pos = vector3(-928.24, -1511.09, 5.18) },
            [3] = { pos = vector3(-903.91, -1514.27, 5.02) },
            [4] = { pos = vector3(-922.25, -1527.74, 5.18) },
            [5] = { pos = vector3(-892.75, -1516.97, 5.18) },
            [6] = { pos = vector3(-898.78, -1500.32, 5.18) },
            [7] = { pos = vector3(-880.74, -1503.22, 5.24) },
            [8] = { pos = vector3(-933.98, -1555.82, 5.23) },
            [9] = { pos = vector3(-947.21, -1551.15, 5.18) },
            [10] = { pos = vector3(-976.85, -1561.94, 5.18) },
        }
    },
    [10] = { label = 'Procopoi Drive',
        pos = { [1] = { pos = vector3(-435.53, 6154.48, 31.48) },
            [2] = { pos = vector3(-374.59, 6191.09, 31.73) },
            [3] = { pos = vector3(-357.02, 6207.44, 31.84) },
            [4] = { pos = vector3(-347.54, 6225.33, 31.88) },
            [5] = { pos = vector3(-307.98, 6202.39, 31.48) },
            [6] = { pos = vector3(-360.23, 6260.6, 31.9) },
            [7] = { pos = vector3(-407.42, 6314.16, 28.94) },
            [8] = { pos = vector3(-379.99, 6252.61, 31.85) },
            [9] = { pos = vector3(-437.95, 6272.08, 30.17) },
            [10] = { pos = vector3(-442.83, 6197.82, 29.55) },
        }
    },
    [11] = { label = 'Cholla Spring Avenue ',
        pos = { [1] = { pos = vector3(1895.39, 3873.64, 32.58) },
            [2] = { pos = vector3(1880.51, 3920.6, 33.22) },
            [3] = { pos = vector3(1838.66, 3907.52, 33.46) },
            [4] = { pos = vector3(1832.61, 3868.59, 34.3) },
            [5] = { pos = vector3(1808.96, 3908.09, 33.74) },
            [6] = { pos = vector3(1728.37, 3851.78, 34.79) },
            [7] = { pos = vector3(1703.26, 3791.29, 34.81) },
            [8] = { pos = vector3(1661.35, 3819.89, 35.47) },
            [9] = { pos = vector3(1691.85, 3865.79, 34.91) },
            [10] = { pos = vector3(1733.61, 3895.3, 35.56) },
        }
    },
    [12] = { label = 'Brouge Avenue',
        pos = { [1] = { pos = vector3(282.12, -1694.8, 29.65) },
            [2] = { pos = vector3(252.94, -1670.74, 29.66) },
            [3] = { pos = vector3(291.74, -1784.15, 28.25) },
            [4] = { pos = vector3(348.66, -1820.86, 28.89) },
            [5] = { pos = vector3(169.62, -1633.94, 29.29) },
            [6] = { pos = vector3(197.55, -1725.71, 29.66) },
            [7] = { pos = vector3(149.7, -1864.61, 24.59) },
            [8] = { pos = vector3(94.76, -1809.97, 27.08) },
            [9] = { pos = vector3(38.91, -1911.57, 21.95) },
            [10] = { pos = vector3(-34.18, -1847.1, 26.19) },
        }
    },
    [13] = { label = 'Cypress Flats',
        pos = {
            [1] = { pos = vector3(931.01, -1963.92, 30.41) },
            [2] = { pos = vector3(252.94, -1670.74, 29.66) },
            [3] = { pos = vector3(873.53, -2117.6, 31.23) },
            [4] = { pos = vector3(913.67, -2153.7, 30.69) },
            [5] = { pos = vector3(838.7, -2254.17, 30.21) },
            [6] = { pos = vector3(960.01, -2448.64, 31.23) },
            [7] = { pos = vector3(844.59, -2118.16, 30.52) },
            [8] = { pos = vector3(919.56, -2430.12, 28.43) },
            [9] = { pos = vector3(784.05, -2254.04, 29.49) },
            [10] = { pos = vector3(964.38, -1786.65, 31.31) },
        }
    },
}
--PostOp Freight Location
Config.FreightLocation = {
    [1] = { label = 'these clients.',
        pos = { [1] = { pos = vector3(931.01, -1963.92, 30.41) },
            [2] = { pos = vector3(953.05, -196.47, 73.21) },
            [3] = { pos = vector3(-928.24, -1511.09, 5.18) },
            [4] = { pos = vector3(-668.24, -971.68, 22.34) },
            [5] = { pos = vector3(-1111.53, -902.07, 3.79) },
        }
    },
    [2] = { label = 'these clients.',
        pos = { [1] = { pos = vector3(953.05, -196.47, 73.21) },
            [2] = { pos = vector3(-1820.71, 786.68, 138.03) },
            [3] = { pos = vector3(-641.0, 520.59, 109.88) },
            [4] = { pos = vector3(-1678.24, -401.35, 47.53) },
            [5] = { pos = vector3(-1152.2, -913.41, 6.99) },
        }
    },
    [3] = { label = 'these clients.',
        pos = { [1] = { pos = vector3(-903.91, -1514.27, 5.02) },
            [2] = { pos = vector3(-1152.2, -913.41, 6.99) },
            [3] = { pos = vector3(-1667.76, -441.15, 40.36) },
            [4] = { pos = vector3(-1024.95, -1138.86, 2.34) },
            [5] = { pos = vector3(873.53, -2117.6, 31.23) },

        }
    },
    [4] = { label = 'these clients.',
        pos = { [1] = { pos = vector3(149.7, -1864.61, 24.59) },
            [2] = { pos = vector3(-1535.24, -422.28, 35.59) },
            [3] = { pos = vector3(-762.05, 430.9, 100.2) },
            [4] = { pos = vector3(970.87, -199.6, 76.26) },
            [5] = { pos = vector3(348.66, -1820.86, 28.89) },
        }
    },
}
-- This is for specific customers who has a rep system, dont touch if you dont know what it is
Config.Meta = {
    status = false,
    type = 'rep',
    amount = 10,
}
