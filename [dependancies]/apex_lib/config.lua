-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------

-- ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║         ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║         ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║         ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

ApexConfig = {}

-- FRAMEWORKS + RESOURCE NAMES
-------------------------------------
--[[- FRAMEWORK: (qbcore, esx)
    - qbcore
    - esx
]]--
--[[- RESOURCE NAME: (qb-core, es_extended)
    - qb-core
    - es_extended
]]--
ApexConfig.Framework = 'qbcore'
ApexConfig.ResourceName = 'qb-core'
-------------------------------------

-- BOSSMENU SYSTEMS
-------------------------------------
--[[
    - qb-bossmenu:client:OpenMenu
    - esx_society:openBossMenu
]]--
ApexConfig.Bossmenu = 'qb-bossmenu:client:OpenMenu'
-------------------------------------


-- TARGET SYSTEMS
-------------------------------------
--[[
    - qb-target
    - ox_target
]]--
ApexConfig.Target = 'ox_target'
-------------------------------------

-- MENU SYSTEMS
-------------------------------------
--[[
    - qb-menu
    - ox_lib
]]--
ApexConfig.Menu = 'ox_lib'
-------------------------------------

-- INPUT SYSTEMS
-------------------------------------
--[[
    - qb-input
    - ox_lib
]]--
ApexConfig.Input = 'ox_lib'
-------------------------------------


-- INVENTORY SYSTEMS
-------------------------------------
--[[
    - qb-inventory
    - lj-inventory
    - ps-inventory
    - qs-inventory
    - ox_inventory
    - codem-inventory
]]--
ApexConfig.Inventory = 'ox_inventory'
-------------------------------------

-- PROGRESSBAR SYSTEMS
-------------------------------------
--[[
    - qbcore
    - ox_lib
    - progressBars
]]--
ApexConfig.Progressbar = 'ox_lib'
-------------------------------------

-- NOTIFICATION SYSTEMS
-------------------------------------
--[[
    - apex_lib
    - qbcore
    - esx
    - okokNotify
    - codem-notification
    - ox_lib
]]--
ApexConfig.Notification = 'ox_lib'
-------------------------------------

-- PAYMENT SYSTEMS
-------------------------------------
--[[
    - jim-payments:client:Charge
    - okokBilling:ToggleCreateInvoice
]]--
ApexConfig.Payment = 'jim-payments:client:Charge'
-------------------------------------


-- MDT SYSTEMS
-------------------------------------
--[[
    - ps-mdt
    - al_mdt
    - qs-mdt
    - redutzu-mdt
]]--
ApexConfig.MDT = 'ps-mdt'
-------------------------------------


-- DISPATCH SYSTEMS
-------------------------------------
--[[
    - qbcore
    - ps-dispatch
    - qs-dispatch
    - cd_dispatch
]]--
ApexConfig.Dispatch = 'cd_dispatch'
-------------------------------------


-- PHONE SYSTEMS
-------------------------------------
--[[
    - qb-phone
    - qs-smartphone
    - gksphone
    - lb-phone
]]--
ApexConfig.Phone = 'lb-phone'
-------------------------------------


-- FUEL SYSTEMS
-------------------------------------
--[[
    - LegacyFuel
    - ps-fuel
    - lj-fuel
    - cdn-fuel
    - qs-fuelstations
    - frkn-fuelstation
    - okokGasStation
    - ti_fuel
    - ox_fuel
]]--
ApexConfig.Fuel = 'cdn-fuel'
-------------------------------------


-- GARAGE SYSTEMS
-------------------------------------
--[[
    - qb-garage
    - cd_garage
    - jg-advancedgarages
    - qs-advancedgarages
]]--
ApexConfig.Garage = 'cd_garage'
-------------------------------------


-- GARAGE SYSTEMS
-------------------------------------
--[[
    - qb-prison
    - lionheart-jail
    - rcore_prison
    - apex_penitentiary (If this is being use, remember to set Jailing to false in the apex_lawenforcement config)
]]--
ApexConfig.Jail = 'qb-prison'
-------------------------------------


-- VEHICLE LOCKSYSTEM SYSTEMS
-------------------------------------
--[[
    - qb-vehiclekeys
    - qs-vehiclekeys
    - wasabi_carlock
    - jaksam-vehiclekeys
]]--
ApexConfig.Keylock = 'qb-vehiclekeys'
-------------------------------------

-- EMOTE SYSTEMS
-------------------------------------
--[[
    - rpemotes
    - dpemotes
    - scully_emotemenu
]]--
ApexConfig.EmoteMenu = 'scully_emotemenu'
-------------------------------------

-- TEXT UI SYSTEMS
-------------------------------------
--[[
    - apex_lib
    - qbcore
    - ps-ui
    - okokNotify
]]--
ApexConfig.TextUI = 'apex_lib'          --<----- STIL IN DEVELOPMENT
-------------------------------------


-- BUILT-IN SYSTEMS
-------------------------------------
ApexConfig.Chat = false                 --<----- STIL IN DEVELOPMENT

--[[
    - To use our overlay chat (me, med, ool as 3d text), set the settings below to true
    - Don't wanna use them, set them to false
    - Remember to disable the /me command in qbcore if using this!
]]--
ApexConfig.OverlayChat = {              -- Also know as 3d Chat
    me = true,                          -- Default me chat
    med = true,                         -- Special me chat for ems
    ool = true,                         -- Out of character chat locally
    position = {                        -- Don't touch anything inside this, if you don't know what you're doing!
        coordsX = 0,                    -- Move text left or right
        coordsY = 0,                    -- Move text forward or backward
        coordsZ = 1.1                   -- Move text up or down
    },
    Webhook = 'WEBHOOK_HERE',           -- Discord webhook for logging
}
-------------------------------------
