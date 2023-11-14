--allowed() is the function that determines if the player is allowed to use the dyno. DO NOT RENAME THE FUNCTION
--Place whatever job check code you want in here, return true if allowed, false if not
function allowed()
    return true
end

function LoadCompleteNotif()
	EndTextCommandThefeedPostTickerForced(1,1)
	ThefeedNextPostBackgroundColor(184)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(Config.NotiLoadCompleteMessage)
	EndTextCommandThefeedPostTicker(true, true)
	Wait(3000)
	EndTextCommandThefeedPostTickerForced(1,1)
end

function UnLoadCompleteNotif()
	EndTextCommandThefeedPostTickerForced(1,1)
	ThefeedNextPostBackgroundColor(184)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(Config.NotiUnLoadCompleteMessage)
	EndTextCommandThefeedPostTicker(true, true)
	Wait(3000)
	EndTextCommandThefeedPostTickerForced(1,1)
end

function FBBlockedNotif()
	EndTextCommandThefeedPostTickerForced(1,1)
	ThefeedNextPostBackgroundColor(6)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(Config.NotiFBBlockedMessage)
	EndTextCommandThefeedPostTicker(true, true)
	Wait(3000)
	EndTextCommandThefeedPostTickerForced(1,1)
end

function BlockedMessage()
	EndTextCommandThefeedPostTickerForced(1,1)
	ThefeedNextPostBackgroundColor(6)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(Config.NotiBlockedMessage)
	EndTextCommandThefeedPostTicker(true, true)
	Wait(3000)
	EndTextCommandThefeedPostTickerForced(1,1)
end

--This function returns if the vehicle is locked or not when trying to get in the loaded vehicle from next to the trailer
--false = NOT locked  true == LOCKED
function IsVehicleLocked(car)

    return DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 2 or DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 10
end

--Help Text Messages
function message(lineOne, lineTwo, lineThree, duration, loop)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(lineOne)
    AddTextComponentSubstringPlayerName(lineTwo or "")
    AddTextComponentSubstringPlayerName(lineThree or "")
  
    -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
    EndTextCommandDisplayHelp(0, loop, false, duration or 5000)
end

RegisterKeyMapping('+bedLower', 'bed Lower', 'keyboard', 'DOWN')
RegisterKeyMapping('+bedRaise', 'bed Raise', 'keyboard', 'UP')

RegisterKeyMapping('+flatbedAtt', 'Flatbed Attach', 'keyboard', 'E')
RegisterKeyMapping('+flatbedRope', 'Flatbed Remove Winch', 'keyboard', 'G')

RegisterKeyMapping('+flatbedWarp', 'Flatbed Get In Car', 'keyboard', 'F')
RegisterKeyMapping('+flatbedWheel', 'Flatbed Wheel Lift', 'keyboard', 'H')

RegisterKeyMapping('+flatbedWind', 'Flatbed Wind', 'keyboard', 'LEFT')
RegisterKeyMapping('+flatbedUWind', 'Flatbed Unwind', 'keyboard', 'RIGHT')