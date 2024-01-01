CodeStudio = {}

CodeStudio.Debug = false
CodeStudio.AutoSQL = true
CodeStudio.DatabaseName = 'cs_bossmenu'  --'Example: management_funds, addon_account_data'

CodeStudio.ServerType = 'QB'       -- QB/ESX  check config/server_function.lua if you want to configure other framework


CodeStudio.LocationSettings = {
    Enable = true,          --Enable/Disable Boss Menu Locations
    useTarget = {
        Enable = false,              --toggle target system
        Target = 'ox_target'        --qb-target/ox_target
    },
    useTextUI = {
        Enable = true,              --toggle textUi system requires(ox_lib)
        openKey = 38                --Key to open menu
    },
}

CodeStudio.DicordLogs = {
    Enable = false,
    WebHook = ''   --Enter Webhook to log boss menu actions on discord
}

CodeStudio.MenuSections = {
    BossInventory = true,       -- Hide/Show Boss Inventory Option
    BossOutfit = true,          -- Hide/Show Outfit Option
    ApplicationSystem = false    -- If you are using Job Application System Script https://codestudio.tebex.io/package/5756147
}


CodeStudio.HireNearbyPlayers = true            -- Toggle Between Recruit List Nearby Player or All Players


CodeStudio.No_Job = {           -- Default Job (Job to be given after fire)
    Job = 'unemployed',
    Grade = '0'  -- If you are on ESX put 0 not '0'
}



CodeStudio.Locations = {
    ['bossmenu'] = {
        ['police'] = {
            vector4(448.25, -973.38, 30.69, 144),
        },
        ['ambulance'] = {
            vector4(446.29, -978.88, 30.69, 123.06),
        },
    },


    -- Only Edit Below If you are using QB
    ['gangmenu'] = {
        ['lostmc'] = {
            vector4(85.69, -1959.65, 21.12, 223.76)
        }
    }
}



CodeStudio.QuickAction = {          -- Society Money Quick Actions
    ['deposit'] = { -- Dont Change Name this is money deposit buttons
        [1] = 500,      -- Button 1 
        [2] = 5000      -- Button 2
    },
    ['withdraw'] = {    -- This is money withdraw buttons
        [1] = 500,
        [2] = 5000
    },
}


--Register Boss Menus with allowed job grades/ranks

CodeStudio.BossMenu = {
    --[job_name] = {rank1, rank2}
    ['police'] = {3, 4},
    ['ambulance'] = {1},
}



-- This option is only for QB based server other servers can simply register gangs in CodeStudio.BossMenu

CodeStudio.GangMenu = {
    ['lostmc'] = {3},
}







-- Functions --


function Notification(msg, state)
    -- Add Your Notification Event Here

    -- SetNotificationTextEntry('STRING')
    -- AddTextComponentString(msg)
    -- DrawNotification(0,1)

    -- Examples --

    -- [CodeStudio Notification] --

    -- exports['cs_notification']:Notify({  -- https://codestudio.tebex.io/package/5680775
    --     type = state,  
    --     title = 'Boss Menu',
    --     description = msg
    -- })

    -- [QBCore Notification] --

    TriggerEvent('QBCore:Notify', msg, state)

    -- [ESX Notification] --

    --TriggerEvent('esx:showNotification', msg, state)
end



function bossInventory(job)
    -- Below are some examples of creating stashes in different inventory remove and add your inventory code

    -- [ox_inventory] --

    if exports.ox_inventory:openInventory('stash', "boss_" .. job) == false then
        TriggerServerEvent('cs:bossmenu:oxInventory', job)
        exports.ox_inventory:openInventory('stash', "boss_" .. job)
    end


    -- [qb-inventory] --

    -- TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. job, {
    --     maxweight = 4000000,
    --     slots = 25,
    -- })
    -- TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. job)


    --[qs-inventory] --

    -- exports['qs-inventory']:RegisterStash("boss_" .. job, 25, 4000000) 
end



function outfitMenu()
    -- Add Your Outfit Event Here
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end