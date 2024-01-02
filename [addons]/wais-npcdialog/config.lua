Config = {}

Config.Peds = {
    [1] = {
        ["model"] = "s_m_y_cop_01",
        ["coords"] = vector4(437.20, -978.73, 29.67, 185.0),
        ["cam"] = vector4(437.25, -979.13, 31.30, 0.0), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(437.25, -979.00, 30.85),
        ["interactive"] = {
            ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            --["type"] = 38 https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 2, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make itf True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@code_human_police_investigate@idle_a",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Buck", 
            ["lastname"] = "Jackson",
        },
        ["title"] = "Big Game Winner", -- the text you want to appear maybe character task etc.
        ["question"] = "Well, howdy there, partner! What can ol' me do for ya today? I reckon I'm your go-to fella when it comes to huntin' and fishin' gear. Yep, I specialize in all them outdoor goodies for huntin' critters and catchin' fish out in them waters. So, what's on your mind, friend?", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Can i look at your supplies?", -- The answer to the option will appear in the person
                ["event"] = "kat:OpenShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I would like to purchase a weapons license so im legal... I guess....", -- The answer to the option will appear in the person
                ["event"] = "kevin-hunting:BuyHuntingLicense", -- Event name
                ["server"] = true, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    }
}