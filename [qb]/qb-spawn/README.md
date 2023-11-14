*Add To qb-apartments Config*

****************************
**check Config and fxmanifest**
****************************

**qb-houses**
Apartments.Locations = {
    ["apartment1"] = {
        name = "apartment1",
        label = "South Rockford Drive",
        coords = {
            enter = vector4(-667.02, -1105.24, 14.63, 242.32),
        },
        pos = {top = 58.5, left = 66.4},
        polyzoneBoxData = {
            heading = 245,
            minZ = 13.5,
            maxZ = 16.0,
            debug = false,
            length = 1,
            width = 3,
            distance = 2.0,
            created = false
        }
    },
    ["apartment2"] = {
        name = "apartment2",
        label = "Morningwood Blvd",
        coords = {
            enter = vector4(-1288.52, -430.51, 35.15, 124.81),
        },
        pos = {top = 64.4, left = 62.9},
        polyzoneBoxData = {
            heading = 124,
            minZ = 34.0,
            maxZ = 37.0,
            debug = false,
            length = 1,
            width = 3,
            distance = 2.0,
            created = false
        }
    },
    ["apartment3"] = {
        name = "apartment3",
        label = "Integrity Way",
        coords = {
            enter = vector4(269.73, -640.75, 42.02, 249.07),
        },
        pos = {top = 50.2, left = 64.2},
        polyzoneBoxData = {
            heading = 250,
            minZ = 40,
            maxZ = 43.5,
            debug = false,
            length = 1,
            width = 1,
            distance = 2.0,
            created = false
        }
    },
    ["apartment4"] = {
        name = "apartment4",
        label = "Tinsel Towers",
        coords = {
            enter = vector4(-619.29, 37.69, 43.59, 181.03),
        },
        pos = {top = 58.1, left = 60.8},
        polyzoneBoxData = {
            heading = 180,
            minZ = 41.0,
            maxZ = 45.5,
            debug = false,
            length = 1,
            width = 2,
            distance = 2.0,
            created = false
        }
    },
    ["apartment5"] = {
        name = "apartment5",
        label = "Fantastic Plaza",
        coords = {
            enter = vector4(291.517, -1078.674, 29.405, 270.75),
        },
        pos = {top = 49.5, left = 66.2},
        polyzoneBoxData = {
            heading = 270,
            minZ = 28.5,
            maxZ = 31.0,
            debug = false,
            length = 1,
            width = 2,
            distance = 2.0,
            created = false
        }
    },
    ["apartment6"] = {
        name = "apartment6",
        label = "Alta ST",
        coords = {
            enter = vector4(-268.66, -962.02, 31.22, 300.37),
        },
        pos = {top = 55, left = 65.5},
        polyzoneBoxData = {
            heading = 300.0,
            minZ = 30.0,
            maxZ = 32.5,
            debug = false,
            length = 1,
            width = 2,
            distance = 2.0,
            created = false
        }
    },
}
===============================================================================================================================
**ps-housing**
Config.Apartments = {
    ["Integrity Way"] = {
        label = "Integrity Way",
        door = { x = 269.73, y = -640.75, z = 42.02, h = 249.07, length = 1, width = 2 },
        pos = {top = 50.2, left = 64.2},
        imgs = {
            {
                url = "https://cdn.discordapp.com/attachments/1102801782452785162/1106153553283784704/integrity.webp",
                label = "Outside",
            },
        },
        shell = "Apartment Furnished",
    },
    
    ["South Rockford Drive"] = {
        label = "South Rockford Drive",
        door = { x = -667.02, y = -1105.24, z = 14.63, h = 242.32, length = 1, width = 2 },
        pos = {top = 58.5, left = 66.4},
        imgs = {
            {
                url = "https://cdn.discordapp.com/attachments/1102801782452785162/1106154069426458665/integrity_1.webp",
                label = "Outside",
            },
        },
        shell = "Apartment Furnished",
    },

    ['Morningwood Blvd'] = {
        label = 'Morningwood Blvd',
        door = { x = -1288.52, y = -430.51, z = 35.15, h = 124.81, length = 1, width = 2 },
        pos = {top = 64.4, left = 62.9},
        imgs = {
            {
                url = "https://media.discordapp.net/attachments/1081260007129092146/1125035016905298021/morningwood.webp?width=1280&height=671",
                label = "Outside",
            },
        },
        shell = "Apartment Furnished",
    },

    ['Tinsel Towers'] = {
        label = 'Tinsel Towers',
        door = { x = -619.29, y = 37.69, z = 43.59, h = 181.03, length = 1, width = 2 },
        pos = {top = 58.1, left = 60.8},
        imgs = {
            {
                url = "https://cdn.discordapp.com/attachments/1102801782452785162/1106154069426458665/integrity_1.webp",
                label = "Outside",
            },
        },
        shell = "Apartment Furnished",
    },

    ['Fantastic Plaza'] = {
        label = 'Fantastic Plaza',
        door = { x = 291.517, y = -1078.674, z = 29.405, h = 270.75, length = 1, width = 2 },
        pos = {top = 49.5, left = 66.2},
        imgs = {
            {
                url = "https://media.discordapp.net/attachments/1081260007129092146/1125035016221638686/fantasticplaza.webp?width=1281&height=671",
                label = "Outside",
            },
        },
        shell = "Apartment Furnished",
    }
}

===============================================================================================================================
*Command For Add New Location*

/addloc

===============================================================================================================================
**Check Server Side OxMySql Query**

Map Site: https://www.bragitoff.com/2015/11/gta-v-maps-quad-ultra-high-definition-8k-quality/

===============================================================================================================================
