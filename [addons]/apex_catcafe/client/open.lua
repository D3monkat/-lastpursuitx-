-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------

local Apex = exports['apex_lib']:GetApexObject()
---------------------------------------


-- Inventory functions --
function OpenShop(invType, id, label, slots, weight, owner)
    Apex.Functions.OpenShop(invType, id, label, slots, weight, owner)
    -- If we do not support your current Inventory system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {maxweight = weight, slots = slots})
end
function OpenInventory(invType, id, label, slots, weight)
    Apex.Functions.OpenInventory(invType, id, label, slots, weight)
    -- If we do not support your current Inventory system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerServerEvent('inventory:server:OpenInventory', 'type', id)
end

---------------------------------------


-- Notification functions --
function Notifications(message, time, type)
    Apex.Functions.Notify(message, time, type)
    -- If we do not support your current Notification system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- exports['NotificationScript']:Alert("", message, time, type)
    -- TriggerEvent('NotificationScript:sendnotification', message, time, type)
end
---------------------------------------


-- Fuel functions --
function GetFuel(vehicle, plate)
    Apex.Functions.GetFuel(vehicle, plate)
    -- If we do not support your current Fuel system. Comment out the line above by adding (--) in front of it
    -- and then add your own mdt trigger below.
    -- Example:
    -- exports['fuel-name']:GetFuel(vehicle)
end
function SetFuel(vehicle, plate, fuel_level)
    Apex.Functions.SetFuel(vehicle, plate, fuel_level)
    -- If we do not support your current Fuel system. Comment out the line above by adding (--) in front of it
    -- and then add your own mdt trigger below.
    -- Example:
    -- exports['fuel-name']:SetFuel(vehicle, fuel_level)
end
---------------------------------------


-- Emotemenu functions --
function Emote(animation)
    Apex.Functions.Emote(animation)
    -- If we do not support your current Emotemenu system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerEvent('animations:client:EmoteCommandStart', {animation})
end
function EmoteCancel()
    Apex.Functions.EmoteCancel()
    -- If we do not support your current Emotemenu system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end
---------------------------------------


-- Stress Relief for ESX functions --
function StressRelief(amount)
    -- If you have some sort of custom script to relief stress for ESX, Add that trigger below
    -- TriggerServerEvent('esx_stress:server:RelieveStress', amount)
end
---------------------------------------