GetBasketData = function(court, key)
    return GlobalState[GetCurrentResourceName() .. court .. key]
end

Notify = function(txt)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(txt)
	DrawNotification(0, 1)
end

CreateMarker = function(coords, rgba, height, scale)
    local checkPoint = CreateCheckpoint(45, coords, coords, scale, rgba.red, rgba.green, rgba.blue, rgba.alpha, 0)
    SetCheckpointCylinderHeight(checkPoint, height, height, scale)

    return checkPoint
end

AddBlip = function(coords, sprite, colour, label)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.5)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    return blip
end

HelpText = function(text, sound)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

DrawText3D = function(coords, text)
    coords = coords + vec3(0.0, 0.0, 0.3)
    SetDrawOrigin(coords)

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    DrawRect(0.0, 0.0125, 0.015 + text:gsub("~.-~", ""):len() / 370, 0.03, 45, 45, 45, 150)

    ClearDrawOrigin()
end

LoadModel = function(model)
    local ogmodel = model
    if type(model) == "string" then model = GetHashKey(model) elseif type(model) ~= "number" then return {loaded = false, model = model} end
    local timer = GetGameTimer() + 10000 -- 10 seconds to load

    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) and timer >= GetGameTimer() do -- give it time to load
            Wait(50)
        end
    end

    if HasModelLoaded(model) then
        return {loaded = true, model = model}
    else
        return {loaded = false, model = model}
    end
end

LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end
    return Dict
end

ForwardX = function()
    return GetEntityForwardX(Cache.self)
end

ForwardY = function()
    return GetEntityForwardY(Cache.self)
end