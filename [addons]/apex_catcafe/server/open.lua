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
function RegisterStash(id, label, slots, weight, owner)
    Apex.Functions.RegisterStash(id, label, slots, weight, owner)
end
---------------------------------------


-- Notification functions --
function Notifications(source, message, time, type)
    Apex.Functions.Notify(source, message, time, type)
    -- If we do not support your current Notification system. Comment out the line above by adding (--) in front of it
    -- and then add your own trigger below.
    -- Examples:
    -- exports['NotificationScript']:Alert("", message, time, type)
    -- TriggerClientEvent('NotificationScript:sendnotification', src, message, time, type)
end
---------------------------------------


-- Add & Remove Items functions --
function AddItem(source, item, amount)
    Apex.Functions.AddItem(source, item, amount)
end
function RemoveItem(source, item, amount)
    Apex.Functions.RemoveItem(source, item, amount)
end
---------------------------------------