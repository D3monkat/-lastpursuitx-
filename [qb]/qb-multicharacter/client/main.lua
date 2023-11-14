local cam = nil
local charPed = nil
local QBCore = exports['qb-core']:GetCoreObject()
local vehicle = nil
local vehicleBack = nil
local NewPeds = {}

-- Main Thread

CreateThread(function()
	while true do
		Wait(0)
		if NetworkIsSessionStarted() then
			TriggerEvent('qb-multicharacter:client:chooseChar')
			return
		end
	end
end)

-- Functions

local function skyCam(bool)
    TriggerEvent('qb-weathersync:client:DisableSync')
    if bool then
        DoScreenFadeIn(1000)
        SetTimecycleModifier('hud_def_blur')
        SetTimecycleModifierStrength(1.0)
        FreezeEntityPosition(PlayerPedId(), false)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Config.CamCoords.x, Config.CamCoords.y, Config.CamCoords.z, -8.0 ,0.0, Config.CamCoords.w, 70.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    else
        SetTimecycleModifier('default')
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end

local function deleteTrain()
	if vehicle ~= nil then
		DeleteEntity(vehicle)
		DeleteEntity(vehicleBack)
        vehicle = nil
        vehicleBack = nil
	end
end

local function VecTwo(a, b, t)
	return a + (b - a) * t
end

local function VecOne(x1, y1, z1, x2, y2, z2, l, clamp)
    if clamp then
        if l < 0.0 then l = 0.0 end
        if l > 1.0 then l = 1.0 end
    end
    local x = VecTwo(x1, x2, l)
    local y = VecTwo(y1, y2, l)
    local z = VecTwo(z1, z2, l)
    return vector3(x, y, z)
end

local function spawnTrain()
    deleteTrain()
	local trainSpawn = GetHashKey("metrotrain")
	RequestModel(trainSpawn)
	while not HasModelLoaded(trainSpawn) do
		RequestModel(trainSpawn)
		Wait(0)
	end
    local coords = vector3(Config.TrainCoord.Start[1], Config.TrainCoord.Start[2], Config.TrainCoord.Start[3])
    vehicle = CreateVehicle(trainSpawn, coords, Config.TrainCoord.Heading, false, false)
    FreezeEntityPosition(vehicle, true)

    local coords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -11.0, 0.0)

    vehicleBack = CreateVehicle(trainSpawn, coords, 158.0, false, false)
    FreezeEntityPosition(vehicleBack, true)
    AttachEntityToEntity(vehicleBack , vehicle , 51 , 0.0, -11.0, 0.0, 180.0, 180.0, 0.0, false, false, false, false, 0, true)

    CreateThread(function()
        local coords2 = vector3(Config.TrainCoord.Stop[1], Config.TrainCoord.Stop[2], Config.TrainCoord.Stop[3])
	    for i=1,100 do
	    	local setpos = VecOne(coords[1],coords[2],coords[3], coords2[1],coords2[2],coords2[3], i/100, true)
	    	SetEntityCoords(vehicle,setpos)
	  		Wait(15)
	    end
	end)
end

local function openCharMenu(bool)
    QBCore.Functions.TriggerCallback("qb-multicharacter:server:GetNumberOfCharacters", function(result)
        while result == nil do Wait(5) end
        if result then
            SetNuiFocus(bool, bool)
            SendNUIMessage({
                action = "ui",
                toggle = bool,
                nChar = result,
                enableDeleteButton = Config.EnableDeleteButton,
            })
            skyCam(bool)
        end
    end)
end

-- Events

RegisterNetEvent('qb-multicharacter:client:closeNUIdefault', function() -- This event is only for no starting apartments
    DeleteEntity(charPed)
    for k, v in pairs(NewPeds) do
        SetEntityAsMissionEntity(v[1], true, true)
        DeleteEntity(v[1])
    end
    NewPeds = {}
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    Wait(2000)
    SetEntityCoords(PlayerPedId(), Config.DefaultSpawn.x, Config.DefaultSpawn.y, Config.DefaultSpawn.z)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
    Wait(500)
    openCharMenu()
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerEvent('qb-weathersync:client:EnableSync')
    TriggerEvent('qb-clothes:client:CreateFirstCharacter')
end)

RegisterNetEvent('qb-multicharacter:client:closeNUI', function()
    DeleteEntity(charPed)
    for k, v in pairs(NewPeds) do
        SetEntityAsMissionEntity(v[1], true, true)
        DeleteEntity(v[1])
    end
    NewPeds = {}
    SetNuiFocus(false, false)
end)

RegisterNetEvent('qb-multicharacter:client:chooseChar', function()
    SetNuiFocus(false, false)
    DoScreenFadeOut(10)
    Wait(1000)
    local interior = GetInteriorAtCoords(Config.Interior.x, Config.Interior.y, Config.Interior.z - 18.9)
    LoadInterior(interior)
    while not IsInteriorReady(interior) do
        Wait(1000)
    end
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), Config.HiddenCoords.x, Config.HiddenCoords.y, Config.HiddenCoords.z)
    Wait(1500)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    openCharMenu(true)
end)

-- NUI Callbacks

RegisterNUICallback('closeUI', function(_, cb)
    openCharMenu(false)
    cb("ok")
end)

RegisterNUICallback('disconnectButton', function(_, cb)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    for k, v in pairs(NewPeds) do
        SetEntityAsMissionEntity(v[1], true, true)
        DeleteEntity(v[1])
    end
    NewPeds = {}
    TriggerServerEvent('qb-multicharacter:server:disconnect')
    cb("ok")
end)

RegisterNUICallback('selectCharacter', function(data, cb)
    local cData = data.cData
    deleteTrain()
    DoScreenFadeOut(10)
    TriggerServerEvent('qb-multicharacter:server:loadUserData', cData)
    openCharMenu(false)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    for k, v in pairs(NewPeds) do
        SetEntityAsMissionEntity(v[1], true, true)
        DeleteEntity(v[1])
    end
    NewPeds = {}
    cb("ok")
end)


RegisterNUICallback('setupCharacters', function(_, cb)
    for k, v in pairs(NewPeds) do
        SetEntityAsMissionEntity(v[1], true, true)
        DeleteEntity(v[1])
    end
    NewPeds = {}
    QBCore.Functions.TriggerCallback("qb-multicharacter:server:SetupNewCharacter", function(result)
        while result == nil do Wait(5) end
        if result then
            for k, v in pairs(result) do 
                if v[1] ~= nil then
                    if Config.Clothing['qb-clothing'] then
                        CreateThread(function()
                            local model = tonumber(v[1])
                            RequestModel(model)
                            while not HasModelLoaded(model) do
                                Wait(0)
                            end
                            local Screen, x, y = GetHudScreenPositionFromWorldPosition(Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3])
                            local CharInfoData = json.decode(v[4])
                            SendNUIMessage({
                                action = "SetupCharacterNUI",
                                left = x*100,
                                top = y*70,
                                cid = v[3],
                                charinfo = CharInfoData,
                                Data = v[5],
                            })
                            charPed = CreatePed(2, model, Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3], Config.PedCords[k][4], false, true)
                            SetPedComponentVariation(charPed, 0, 0, 0, 2)
                            FreezeEntityPosition(charPed, false)
                            SetEntityInvincible(charPed, true)
                            PlaceObjectOnGroundProperly(charPed)
                            SetBlockingOfNonTemporaryEvents(charPed, true)
                            local data = json.decode(v[2])
                            TriggerEvent('qb-clothing:client:loadPlayerClothing', data, charPed)
                            NewPeds[k] = {charPed}
                        end)
                    elseif Config.Clothing['fivem-appearance'] then
                        CreateThread(function()
                            local model = GetHashKey(v[1])
                            RequestModel(model)
                            while not HasModelLoaded(model) do
                                Wait(0)
                            end
                            local Screen, x, y = GetHudScreenPositionFromWorldPosition(Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3])
                            local CharInfoData = json.decode(v[4])
                            SendNUIMessage({
                                action = "SetupCharacterNUI",
                                left = x*100,
                                top = y*70,
                                cid = v[3],
                                charinfo = CharInfoData,
                                Data = v[5],
                            })
                            charPed = CreatePed(2, model, Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3], Config.PedCords[k][4], false, true)
                            SetPedComponentVariation(charPed, 0, 0, 0, 2)
                            FreezeEntityPosition(charPed, false)
                            SetEntityInvincible(charPed, true)
                            PlaceObjectOnGroundProperly(charPed)
                            SetBlockingOfNonTemporaryEvents(charPed, true)
                            exports['fivem-appearance']:setPedAppearance(charPed, json.decode(v[2]))
                            NewPeds[k] = {charPed}
                        end)
                    elseif Config.Clothing['illenium-appearance'] then
                        CreateThread(function()
                            local model = GetHashKey(v[1])
                            RequestModel(model)
                            while not HasModelLoaded(model) do
                                Wait(0)
                            end
                            local Screen, x, y = GetHudScreenPositionFromWorldPosition(Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3])
                            local CharInfoData = json.decode(v[4])
                            SendNUIMessage({
                                action = "SetupCharacterNUI",
                                left = x*100,
                                top = y*70,
                                cid = v[3],
                                charinfo = CharInfoData,
                                Data = v[5],
                            })
                            charPed = CreatePed(2, model, Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3], Config.PedCords[k][4], false, true)
                            SetPedComponentVariation(charPed, 0, 0, 0, 2)
                            FreezeEntityPosition(charPed, false)
                            SetEntityInvincible(charPed, true)
                            PlaceObjectOnGroundProperly(charPed)
                            SetBlockingOfNonTemporaryEvents(charPed, true)
                            exports['illenium-appearance']:setPedAppearance(charPed, json.decode(v[2]))
                            NewPeds[k] = {charPed}
                        end)
                        
                    end
                else
                    CreateThread(function()
                        local CharGender = json.decode(v[5]['charinfo'])
                        local model = nil
                        if CharGender.gender == 1 then 
                            model = -1667301416 -- girl
                        else
                            model = 1885233650 -- boy
                        end
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Wait(0)
                        end
                        local Screen, x, y = GetHudScreenPositionFromWorldPosition(Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3])
                        local CharInfoData = json.decode(v[4])
                        SendNUIMessage({
                            action = "SetupCharacterNUI",
                            left = x*100,
                            top = y*70,
                            cid = v[3],
                            charinfo = CharInfoData,
                            Data = v[5],
                        })
                        charPed = CreatePed(2, model, Config.PedCords[k][1], Config.PedCords[k][2], Config.PedCords[k][3], Config.PedCords[k][4], false, true)
                        SetPedComponentVariation(charPed, 0, 0, 0, 2)
                        FreezeEntityPosition(charPed, false)
                        SetEntityInvincible(charPed, true)
                        PlaceObjectOnGroundProperly(charPed)
                        SetBlockingOfNonTemporaryEvents(charPed, true)
                        NewPeds[k] = {charPed}
                    end)
                end
            end
        end
        cb("ok")
    end)
    spawnTrain()
end)

RegisterNUICallback('removeBlur', function(_, cb)
    SetTimecycleModifier('default')
    cb("ok")
end)

RegisterNUICallback('createNewCharacter', function(data, cb)
    local cData = data
    DoScreenFadeOut(150)
    if cData.gender == "Male" then
        cData.gender = 0
    elseif cData.gender == "Female" then
        cData.gender = 1
    end
    TriggerServerEvent('qb-multicharacter:server:createCharacter', cData)
    Wait(500)
    cb("ok")
end)

RegisterNUICallback('removeCharacter', function(data, cb)
    TriggerServerEvent('qb-multicharacter:server:deleteCharacter', data.citizenid)
    TriggerEvent('qb-multicharacter:client:chooseChar')
    cb("ok")
end)

RegisterNUICallback('expertSendAlert', function(data, cb)
    QBCore.Functions.Notify(data.text, data.type, 4000)
    cb("ok")
end)