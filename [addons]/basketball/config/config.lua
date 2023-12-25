Config = {
    snatch_ball = 50, -- % that you succeed snatching the ball
    allow_dunking = true, -- should people be able to dunk?
    dunk_percent = 40, -- % that you succeed dunking
    easy_mode = true, -- easier to hit the ball, this should be set to true otherwise it is *really* hard to hit the ball

    Courts = {
        { -- beach
            blip = vector3(-1282.99, -1528.75, 4.31),
            start = vector3(-1282.99, -1528.75, 4.31),
            ball = vector3(-1275.13, -1530.67, 3.4),
    
            home = {
                vector3(-1272.0, -1517.52, 6.3),
                vector3(-1272.0, -1517.52, 6.0),
            },
    
            guest = {
                vector3(-1278.22, -1544.04, 6.3),
                vector3(-1278.22, -1544.04, 6.0),
            },
    
            dunking = {
                home = vector4(-1272.25, -1518.37, 6.2, 344.46),
                guest = vector4(-1277.96, -1542.67, 6.2, 166.81),
            },

            queue = {
                minimum = 1, -- minimum users per team for a match to start
                timer = 5, -- how long (in seconds) until the match starts, after "minimum" users are in queue per team
                game = 30, -- how long (in seconds) a game lasts
            },
        },
        { -- breze mlo
            blip = vector3(-47.91, -1385.55, 29.49),
            start = vector3(-60.55, -1403.22, 29.49),
            ball = vector3(-60.48, -1395.26, 28.5),

            easy_mode = true, -- makes it easier to make a goal

            home = {
                vector3(-48.9, -1395.35, 31.7),
                vector3(-48.9, -1395.35, 31.4)
            },

            guest = {
                vector3(-72.35, -1395.4, 31.7),
                vector3(-72.35, -1395.4, 31.4)
            },

            dunking = {
                home = vector4(-49.63, -1395.39, 31.5, 261.74),
                guest = vector4(-71.43, -1395.23, 31.5, 92.69)
            },

            queue = {
                minimum = 1, -- minimum users per team for a match to start
                timer = 5, -- how long (in seconds) until the match starts, after "minimum" users are in queue per team
                game = 30, -- how long (in seconds) a game lasts
            },

            board = {
                enabled = true, -- update the score & time on the board? (this impacts performance, ~0.8ms, but doesn't seem to affect fps)
    
                heading = 180.0,
                home = vector3(-59.5, -1404.03, 31.95),
                guest = vector3(-62.3, -1404.03, 31.95),
                time = vector3(-60.95, -1404.03, 32.225),
                main = vector3(-60.44, -1395.18, 29.5),
            }
        },
    },
}

Strings = {
    ["blip"] = "Basketball",
    ["home"] = "Home",
    ["guest"] = "Guest",
    ["join_team"] = "Press ~INPUT_CONTEXT~ to %s team \"~b~%s~s~\" (%s in team)\nPress ~INPUT_DETONATE~ to %s team \"~r~%s~s~\" (%s in team)",
    ["join"] = "join",
    ["leave"] = "leave",

    ["game_progress"] = "There's a game in progress.\nIt ends in: %s %s and %s %s",
    
    ["waiting"] = "Waiting",
    ["cancelled"] = "The game got cancelled due to there being no players in one team.",

    ["starting"] = "\nGame starts in %s %s and %s %s",
    ["minute"] = "minute",
    ["minutes"] = "minutes",
    ["second"] = "second",
    ["seconds"] = "seconds",

    ["left_queue"] = "You left the queue since you walked away",

    ["steal_ball"] = "Press [~b~E~s~] to snatch the ball",
    ["pickup_ball"] = "Press [~b~E~s~] to pick up the ball",
    ["ball_info"] = "Press ~INPUT_VEH_DUCK~ to drop the ball\nPress ~INPUT_ATTACK~ to shoot the ball\nPress ~INPUT_DETONATE~ to dunk",

    ["goal"] = "Good shooting! You scored a point for your team.",
    ["better_luck"] = "You didn't get the ball",
    ["better_luck_dunk"] = "You didn't dunk - better luck next time",

    ["you_lost"] = "Your team ~r~lost~s~. Better luck next time!",
    ["you_won"] = "Your team ~g~won~s~!",
    ["tie"] = "Your team ~y~tied~s~ with the other team.",
}