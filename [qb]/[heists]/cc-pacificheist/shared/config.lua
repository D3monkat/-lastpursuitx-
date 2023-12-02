Config = {}
Config.Debug = false -- For polyzones

Config.PoliceJobs = {"police", "bcso", "sast"}
Config.MinCops = 0 -- Minimun amount of cops needed to start the robbery

Config.ResetTimer = 240 -- Minutes before the bank can be robbed again (timer starts when police reset security systems)

Config.Doorlock = "ox" -- QB / OX
Config.Inventory = "ox" -- QB / LJ / OX / CUSTOM (Add code in server/open.lua)

Config.CoreName = "qb-core" -- Change the name of the core, if you've renamed qb-core
Config.TargetName = "qb-target" -- Change the name of target, if you've renamed qb-target

Config.StickyNote = "stickynote"

-- Don't touch these, they are for the script
Config.ResetTimerActive = false -- Don't touch
Config.ActiveRobbery = false -- Don't touch
Config.AlarmTriggered = false -- Don't touch

Config.MiniGames = {
    ['lightout'] = { -- For the office hacks
        grid = 4, -- How big the grid will be (default 5x5)
        maxClicks = 100, -- Amount of clicks before fail
    },
    ['memorygame-access'] = { -- For the access doors cellar
        correctBlocks = 8, -- How many blocks to show
        incorrectBlocks = 3, -- Max wrong inputs before failing 
        timetoShow = 2, -- Seconds to show the correct blocks
        timetoLose = 10 -- How many seconds the player has, before losing
    },
    ['memorygame-thermite'] = { -- For the access doors cellar
        correctBlocks = 12, -- How many blocks to show
        incorrectBlocks = 3, -- Max wrong inputs before failing 
        timetoShow = 2, -- Seconds to show the correct blocks
        timetoLose = 10 -- How many seconds the player has, before losing
    },
    ['voltlab'] = { -- To disable the lasers
        time = 60, -- Min: 10, max: 60
    },
    ['laptophack'] = {
        puzzleDuration = 20, 
        puzzleLength = 5, 
        puzzleAmount = 5,
    },
    ['safecracker'] = {
        combination = 3 -- How many numbers before safe is cracked
    },
    ['numbers'] = { -- For planting bomb on vault
        numbersLength = 10,
        timer = 10, 
        showTime = 2
    },
    ['varhack'] = {
        blocks = 8,
        speed = 2
    }
}

Config.NeedPowerPlantHit = true -- Do players need to hit the powerplant in order to disable the lasers?
Config.PowerCooldown = 45 -- Minutes before the power is back on, after power has been shut off
Config.hit = false -- Don't touch

Config.DoorIds = {
    ['AccessOfficeDoor'] = "access-office",
    ['LeftAccessDoor'] = "left-access",
    ['RightAccessDoor'] = "right-access",
    ['RightSafeRoom'] = "right-saferoom",
    ['LeftSafeRoom'] = "left-saferoom",
    ['Vault'] = "vault",
    ['RightCellarThermite'] = "cellar-thermite-right",
    ['LeftCellarThermite'] = "cellar-thermite-left",
    ['Lobby1'] = "lobby1",
    ['Lobby2'] = "lobby2",
    ['Lobby3'] = "lobby3",
    ['Lobby4'] = "lobby4",
    ['Backdoor'] = "backdoor",
    ['StairsDoor'] = "stairs-door",
    ['VaultDoorRight'] = "vault-rightdoor",
    ['VaultDoorLeft'] = "vault-leftdoor",
    ['CellarExtraRoom'] = "cellar-extraroom",
}

Config.ThermiteLocations = {
    ['RightCellarThermite'] = {
        coords = vector4(256.060078125, 228.18249511719, 97.117042541504, 68.084678649902),
        hit = false,
        thermiteitem = "thermite"
    },
    ['LeftCellarThermite'] = {
        coords = vector4(251.98913513184, 217.28706359863, 97.117050170898, 249.61262512207),
        hit = false,
        thermiteitem = "thermite"
    },
    ['Lobby1'] = {
        coords = vector4(256.27240966797, 228.93696289063, 106.28224945068, 245.65286254883),
        hit = false,
        thermiteitem = "thermite"
    },
    ['Lobby2'] = {
        coords = vector4(269.9735534668, 220.67660827637, 106.28225708008, 248.25820922852),
        hit = false,
        thermiteitem = "thermite"
    },
    ['Lobby3'] = {
        coords = vector4(267.54731445313, 214.05955200195, 106.28226470947, 251.30648803711),
        hit = false,
        thermiteitem = "thermite"
    },
    ['Lobby4'] = {
        coords = vector4(251.75384216309, 216.62832641602, 106.28215026855, 249.17767333984),
        hit = false,
        thermiteitem = "thermite"
    },
    ['Backdoor'] = {
        coords = vector4(271.74392700195, 206.77495727539, 106.28211975098, 340.23468017578),
        hit = false,
        thermiteitem = "thermite"
    },
    ['StairsDoor'] = {
        coords = vector4(278.68664550781, 223.21350524902, 106.28226470947, 159.70545959473),
        hit = false,
        thermiteitem = "thermite"
    },
    ['CellarExtraRoom'] = {
        coords = vector4(265.3693359375, 224.90364624023, 97.117042541504, 245.26670837402),
        hit = false,
        thermiteitem = "thermite"
    } 
}

Config.AccessOfficeSafeCracker = {
    pos = vector3(278.83, 217.76, 110.17),
    height = 0.6,
    width = 1.0,
    heading=341,
    minZ=109.17,
    maxZ=110.97,
    cracked = false, -- Don't touch
    busy = false, -- Don't touch
    hackitem = {
        item = "lockpick",
        shouldremove = {
            remove = false, -- false = Don't remove item, all the options under don't matter when false
            type = "fail", -- Can be "fail", "success" or "both". 
            chance = 50, -- Percentage chance it will be removed
        }
    },
}

Config.OfficeHacks = {
    [1] = {
        pos = vector3(270.39, 231.68, 110.17),
        height = 0.25,
        width = 0.5,
        heading=351,
        minZ=109.82,
        maxZ=110.22,
        hacked = false, -- Don't touch
        busy = false, -- Don't touch
        hackitem = {
            item = "hardeneddecrypter",
            shouldremove = {
                remove = false, -- false = Don't remove item, all the options under don't matter when false
                type = "fail", -- Can be "fail", "success" or "both". 
                chance = 50, -- Percentage chance it will be removed
            }
        },
    },
    [2] = {
        pos = vector3(261.72, 234.87, 110.17),
        height = 0.2,
        width = 0.5,
        heading=350,
        minZ=109.82,
        maxZ=110.22,
        hacked = false, -- Don't touch
        busy = false, -- Don't touch 
        hackitem = {
            item = "hardeneddecrypter",
            shouldremove = {
                remove = false, -- false = Don't remove item, all the options under don't matter when false
                type = "fail", -- Can be "fail", "success" or "both". 
                chance = 50, -- Percentage chance it will be removed
            }
        },
    },
    [3] = {
        pos = vector3(260.52, 205.43, 110.17),
        height = 0.2,
        width = 0.5,
        heading=349,
        minZ=109.82,
        maxZ=110.22,
        hacked = false, -- Don't touch
        busy = false, -- Don't touch 
        hackitem = {
            item = "hardeneddecrypter",
            shouldremove = {
                remove = false, -- false = Don't remove item, all the options under don't matter when false
                type = "fail", -- Can be "fail", "success" or "both". 
                chance = 50, -- Percentage chance it will be removed
            }
        },
    },
    [4] = {
        pos = vector3(251.84, 208.6, 110.17),
        height = 0.25,
        width = 0.5,
        heading=349,
        minZ=110.12,
        maxZ=110.22,
        hacked = false, -- Don't touch
        busy = false, -- Don't touch 
        hackitem = {
            item = "hardeneddecrypter",
            shouldremove = {
                remove = false, -- false = Don't remove item, all the options under don't matter when false
                type = "fail", -- Can be "fail", "success" or "both". 
                chance = 50, -- Percentage chance it will be removed
            }
        },
    }
}

Config.InputAccessCodes = {
    ['right'] = {
        pos = vector3(270.55, 221.27, 97.12),
        height = 0.6,
        width = 0.2,
        heading=340,
        minZ=97.22,
        maxZ=97.87,
        hacked = false, -- Don't touch
        busy = false, -- Don't touch 
        hackitem = {
            item = "hardeneddecrypter",
            shouldremove = {
                remove = false, -- false = Don't remove item, all the options under don't matter when false
                type = "fail", -- Can be "fail", "success" or "both". 
                chance = 50, -- Percentage chance it will be removed
            }
        },
    },
    ['left'] = {
        pos = vector3(267.63, 213.21, 97.12),
        height = 0.55,
        width = 0.2,
        heading=341,
        minZ=97.22,
        maxZ=97.87,
        hacked = false, -- Don't touch
        busy = false, -- Don't touch 
        hackitem = {
            item = "hardeneddecrypter",
            shouldremove = {
                remove = false, -- false = Don't remove item, all the options under don't matter when false
                type = "fail", -- Can be "fail", "success" or "both". 
                chance = 50, -- Percentage chance it will be removed
            }
        },
    }
}

Config.SafeRoomHacks = {
    ['right'] = {
        pos = vector3(247.3, 233.69, 97.57),
        radius = 0.36,
        useZ = true,
        busy = false,
        hacked = false,
        hackitem = "laptop_red",
    },
    ['left'] = {
        pos = vector3(241.87, 218.69, 97.52),
        radius = 0.38,
        useZ = true,
        busy = false,
        hacked = false,
        hackitem = "laptop_red",
    }
}

Config.VaultHack = { -- Hack for extra doors in the vault
    pos = vector3(227.88, 228.43, 97.57),
    radius = 0.3,
    useZ = true,
    busy = false,
    hacked = false,
    hackitem = {
        item = "hardeneddecrypter",
        shouldremove = {
            remove = false, -- false = Don't remove item, all the options under don't matter when false
            type = "fail", -- Can be "fail", "success" or "both". 
            chance = 50, -- Percentage chance it will be removed
        }
    },
}

Config.PowerBox = {
    pos = vector3(260.66, 213.07, 98.82),
    radius = 0.5,
    useZ = true,
    hacked = false, -- Don't touch
    busy = false, -- Don't touch 
    hackitem = {
        item = "disruptor",
        shouldremove = {
            remove = false, -- false = Don't remove item, all the options under don't matter when false
            type = "fail", -- Can be "fail", "success" or "both". 
            chance = 50, -- Percentage chance it will be removed
        }
    },
}

Config.TableLoot = {
    [1] = { -- This one is accessible without disabling lasers
        pos = vector3(258.44, 222.21, 97.12),
        height = 0.8,
        width = 0.2,
        heading=351,
        minZ=96.17,
        maxZ=97.07,
        looted = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 50, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    },
    [2] = { -- This one is only accesible, when lasers are deactivated
        pos = vector3(249.72, 224.31, 97.12),
        height = 1.8,
        width = 0.2,
        heading=340,
        minZ=96.77,
        maxZ=97.07,
        looted = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 50, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    },
    [3] = { -- This one is only accesible, when lasers are deactivated
        pos = vector3(245.08, 226.03, 97.12),
        height = 1.85,
        width = 0.2,
        heading=340,
        minZ=96.77,
        maxZ=97.07,
        looted = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 50, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    },
    [4] = { -- This one is a behind a locked door (needs thermite), but lasers doesn't have to be disabled
        pos = vector3(269.27, 223.92, 97.12),
        height = 1.6,
        width = 0.2,
        heading=340,
        minZ=96.82,
        maxZ=97.02,
        looted = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 50, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    },
    [5] = { -- This one is a in the vault
        pos = vector3(228.73, 231.93, 97.12),
        height = 1.8,
        width = 0.2,
        heading=340,
        minZ=96.77,
        maxZ=97.07,
        looted = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 50, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    }      
}

Config.Safes = {
    ['safe1'] = {
        pos = vector3(244.79, 212.48, 97.12),
        height = 5.4,
        width = 0.4,
        heading=340,
        minZ=96.72,
        maxZ=99.52,
        busy = false, -- Don't touch
        open = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 23, -- Minimun amount to recieve
                max = 28 -- Maximum amount to recieve
            }
        }
    },
    ['safe2'] = {
        pos = vector3(241.23, 209.76, 97.12),
        height = 2.55,
        width = 0.4,
        heading=70,
        minZ=96.62,
        maxZ=99.32,
        busy = false, -- Don't touch
        open = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 23, -- Minimun amount to recieve
                max = 28 -- Maximum amount to recieve
            }
        }
    },
    ['safe3'] = {
        pos = vector3(240.32, 214.33, 97.12),
        height = 5.2,
        width = 0.4,
        heading=340,
        minZ=96.67,
        maxZ=99.42,
        busy = false, -- Don't touch
        open = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 23, -- Minimun amount to recieve
                max = 28 -- Maximum amount to recieve
            }
        }
    },
    ['safe4'] = {
        pos = vector3(248.92, 237.92, 97.12),
        height = 5.4,
        width = 0.4,
        heading=340,
        minZ=95.92,
        maxZ=99.92,
        busy = false, -- Don't touch
        open = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 23, -- Minimun amount to recieve
                max = 28 -- Maximum amount to recieve
            }
        }
    },
    ['safe5'] = {
        pos = vector3(252.58, 240.82, 97.12),
        height = 0.2,
        width = 2.6,
        heading=340,
        minZ=96.67,
        maxZ=99.32,
        busy = false, -- Don't touch
        open = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 23, -- Minimun amount to recieve
                max = 28 -- Maximum amount to recieve
            }
        }
    },
    ['safe6'] = {
        pos = vector3(253.75, 236.28, 97.12),
        height = 5.15,
        width = 1,
        heading=340,
        minZ=96.72,
        maxZ=99.42, 
        busy = false, -- Don't touch
        open = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "markedbills", -- Item to give (only needed if type is item)
                info = {
                    worth = 250
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 23, -- Minimun amount to recieve
                max = 28 -- Maximum amount to recieve
            }
        }
    }
}

Config.Trolly = {
    [1] = {
        coords = vector4(253.35682678223, 239.52975463867, 96.117149353027, 122.53581237793),
        type = "money", -- Can be gold, default: money 
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 2, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    [2] = {
        coords = vector4(248.74508666992, 235.68766784668, 96.117149353027, 326.54254150391),
        type = "money", -- Can be gold, default: money 
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    [3] = {
        coords = vector4(240.41593933105, 211.2497253418, 96.117149353027, 302.48675537109),
        type = "money", -- Can be gold, default: money 
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 2, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    [4] = {
        coords = vector4(241.82933044434, 216.11126708984, 96.117149353027, 204.87796020508),
        type = "money", -- Can be gold, default: money 
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    -- Everything under here is inside the vault (so you probably want better payout down here)
    [5] = { -- VAULT
        coords = vector4(227.868607, 235.043671, 96.117050170898, 224.338821411133),
        type = "money", -- Can be gold, default: money 
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            },
        }
    },
    [6] = { -- VAULT
        coords = vector4(231.80419921875, 233.5251159668, 96.117050170898, 112.73070526123),
        type = "money",
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    [7] = { -- VAULT
        coords = vector4(229.10649108887, 225.02365112305, 96.117156982422, 20.829521179199),
        type = "money",
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    [8] = { -- VAULT
        coords = vector4(227.82508850098, 225.56520080566, 96.117156982422, 301.9753036499),
        type = "money",
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 2 -- Maximum amount to recieve
            }
        }
    },
    [9] = { -- VAULT
        coords = vector4(224.78744506836, 226.67616271973, 96.117156982422, 302.00550079346),
        type = "money",
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    },
    [10] = { -- VAULT
        coords = vector4(226.05671691895, 226.11915588379, 96.117156982422, 20.92907714844),
        type = "money",
        taken = false, -- Don't touch
        rewards = {
            [1] = {
                type = "item", -- Can be money or item
                item = "inkedbills", -- Item to give (only needed if type is item)
                info = {
                    dried = 100,
                    -- inkcreated = os.time()
                },
                chance = 100, -- Chance to even recieve this, if it should aways give, set to 100
                min = 1, -- Minimun amount to recieve
                max = 1 -- Maximum amount to recieve
            }
        }
    },
}

Config.Vault = {
   pos = vector3(235.56, 229.53, 97.62),
   animation = vector4(235.87709350586, 229.3180847168, 97.117172241211, 71.863502502441),
   radius = 0.9,
   useZ = true,
   hackitem = {
    item = "c4",
    shouldremove = {
        remove = false, -- false = Don't remove item, all the options under don't matter when false
        type = "fail", -- Can be "fail", "success" or "both". 
        chance = 50, -- Percentage chance it will be removed
    }
},
   countdown = 15, -- Seconds before explosion
   object = 961976194,
   heading = {
    closed = 70.00,
    open = 303.00
   }
}

