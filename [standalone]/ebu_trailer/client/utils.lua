RegisterKeyMapping("+trailerAttach", Config.Controlmessages.AttachVehicle, "keyboard", "g")
RegisterKeyMapping("+trailerInteract", Config.Controlmessages.RampInteract, "keyboard", "e")
RegisterKeyMapping("+trailerWarp", "Get in attached vehicle", "keyboard", "f")
RegisterKeyMapping("+trailerConnect", "Connect any trailer", "keyboard", "j")

function NotiAtt() -- Attached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

function NotiDet() -- Detached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiUnLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

-- Use this function for job locking. If the job is correct, return true.
-- Please refer to your framework's job system for how to implement, I do not support
-- job checking integration. -Theebu
function allowed()
    return true
end

--This function returns if the vehicle is locked or not when trying to get in the loaded vehicle from next to the trailer
--false = NOT locked  true == LOCKED
function IsVehicleLocked(car)

    return DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 2 or DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 10
end

--Help Text Messages
function message(lineOne, lineTwo, lineThree, duration)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(lineOne)
    AddTextComponentSubstringPlayerName(lineTwo or "")
    AddTextComponentSubstringPlayerName(lineThree or "")
  
    -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
    EndTextCommandDisplayHelp(0, false, false, duration or 5000)
end