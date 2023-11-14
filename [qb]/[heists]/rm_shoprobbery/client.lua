GrabTill = {
    ['animations'] = {
        {'enter'},
        {'loop'},
        {'exit'},
    },
    ['scenes'] = {},
}
shopPeds = {}
cashRegister = {}
safeObjects = {}
lootSync = {
    ['safecrack'] = {}
}
mainLoop = {}
clientStart = false
ESX, QBCore = nil, nil
Citizen.CreateThread(function()
    if Config['ShopRobbery']['framework']['name'] == 'ESX' then
        while not ESX do
            pcall(function() ESX = exports[Config['ShopRobbery']['framework']['scriptName']]:getSharedObject() end)
            if not ESX then
                TriggerEvent(Config['ShopRobbery']['framework']['eventName'], function(library) 
                    ESX = library 
                end)
            end
            Citizen.Wait(1)
        end
    elseif Config['ShopRobbery']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['ShopRobbery']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['ShopRobbery']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent(Config['ShopRobbery']['framework']['eventName'], function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
    end
end)

function TriggerCallback(cbName, cb, data)
    if Config['ShopRobbery']['framework']['name'] == 'ESX' then
        ESX.TriggerServerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    elseif Config['ShopRobbery']['framework']['name'] == 'QB' then
        QBCore.Functions.TriggerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    end
end

Citizen.CreateThread(function()
    for i = 1, #Config['ShopRobberySetup'] do
        cashRegister[i] = {}
        local pedSetup = Config['ShopRobberySetup'][i]['pedSetup']
        loadModel(pedSetup['model'])
        shopPeds[i] = CreatePed(4, GetHashKey(pedSetup['model']), pedSetup['coords'], false, false)
        SetEntityHeading(shopPeds[i], pedSetup['heading'])
        SetBlockingOfNonTemporaryEvents(shopPeds[i], true)
        FreezeEntityPosition(shopPeds[i], true)
        SetEntityCollision(shopPeds[i], false, false)
        SetEntityInvincible(shopPeds[i], true)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local sleep = 1000

        for i = 1, #Config['ShopRobberySetup'] do
            local dist = #(pedCo - Config['ShopRobberySetup'][i]['pedSetup']['coords'])
            if dist <= 10.0 then
                sleep = 1
                if IsPedShooting(ped) then
                    StartRobbery(i, Config['ShopRobberySetup'][i]['pedSetup']['coords'])
                    Wait(5000)
                end
                if IsPedDeadOrDying(shopPeds[i]) then
                    TriggerServerEvent('shoprobbery:server:sync', 'pedDeath', i)
                    Wait(5000)
                end                                                                                                                                                                                 
            end
        end
        Citizen.Wait(sleep)
    end
end)

function StartRobbery(index, coords)
    TriggerCallback('shoprobbery:server:isOwnerOnline', function(data)
        if data['status'] then
            TriggerCallback('shoprobbery:server:checkPoliceCount', function(data)
                if data['status'] then
                    TriggerCallback('shoprobbery:server:checkTime', function(data)
                        if data['status'] then
                            local safeSetup = Config['ShopRobberySetup'][index]['safecrackSetup']
                            loadModel('p_v_43_safe_s')
                            safeObjects[index] = CreateObject(GetHashKey('p_v_43_safe_s'), safeSetup['coords'], 1, 1, 0)
                            SetEntityHeading(safeObjects[index], safeSetup['heading'])
                            FreezeEntityPosition(safeObjects[index], true)
                            clientStart = true
                            TriggerServerEvent('shoprobbery:server:sync', 'startRobbery', index, coords)
                            TriggerServerEvent('shoprobbery:server:policeAlert', coords)
                        end
                    end, index)
                end
            end)
        end
    end, index)
end

RegisterNetEvent('shoprobbery:client:sync')
AddEventHandler('shoprobbery:client:sync', function(type, index, index2, chance)
    if type == 'startRobbery' then
        if chance >= Config['ShopRobbery']['clerkWeaponChance'] then
            TaskHandsUp(shopPeds[index], -1, -1, -1, 1)
            PlayPedAmbientSpeechWithVoiceNative(shopPeds[index], "SHOP_SCARED", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
            SetEntityInvincible(shopPeds[index], false)
        else
            local ped = PlayerPedId()
            SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
            AddRelationshipGroup('GuardPeds')
            SetPedRelationshipGroupHash(shopPeds[index], GetHashKey("GuardPeds"))
            GiveWeaponToPed(shopPeds[index], Config['ShopRobbery']['clerkWeapon'], 999, 1, 1)
            SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
	        SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
	        SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
            SetBlockingOfNonTemporaryEvents(shopPeds[index], false)
            SetEntityInvincible(shopPeds[index], false)
        end
        mainLoop[index] = true
        Citizen.CreateThread(function()
            while mainLoop[index] do
                local ped = PlayerPedId()
                local pedCo = GetEntityCoords(ped)
                local dist = #(pedCo - index2)
                local safecrackDist = #(pedCo - Config['ShopRobberySetup'][index]['safecrackSetup']['coords'])

                if not busy and dist <= 30.0 then
                    local register = GetClosestObjectOfType(pedCo, 2.0, GetHashKey('prop_till_01'), 0, 0, 0)
                    if register ~= 0 and HasObjectBeenBroken(register) then
                        local registerCo = GetEntityCoords(register)
                        if not cashRegister[index][registerCo] then
                            local dist = #(pedCo - registerCo)
                            if dist <= 1.0 then
                                ShowHelpNotification(Strings['grab_till'])
                                if IsControlJustPressed(0, 38) then
                                    GrabCashRegister(index)
                                end
                            end
                        end
                    end
                    if safecrackDist <= 2.0 and not lootSync['safecrack'][index] then
                        ShowHelpNotification(Strings['safecrack'])
                        if IsControlJustPressed(0, 38) then --- SafeCrackSuccess(index)
                            SafeCrackStart(index)
                        end
                    end
                end
                Citizen.Wait(1)
            end
        end)
    elseif type == 'pedDeath' then
        SetEntityHealth(shopPeds[index], 0)
    elseif type == 'register' then
        cashRegister[index][index2] = true
    elseif type == 'safecrack' then
        lootSync['safecrack'][index] = not lootSync['safecrack'][index]
    end                                                                      
end)

function GrabCashRegister(index)
    local ped = PlayerPedId()
    local pedCo, pedRot = GetEntityCoords(ped), GetEntityRotation(ped)
    local animDict = "oddjobs@shop_robbery@rob_till"
    loadAnimDict(animDict)
    busy = true

    sceneObject = GetClosestObjectOfType(pedCo, 2.0, GetHashKey('prop_till_01'), 0, 0, 0)
    TriggerServerEvent('shoprobbery:server:sync', 'register', index, GetEntityCoords(sceneObject))
    scenePos = GetOffsetFromEntityInWorldCoords(sceneObject, vector3(-0.025120, -0.712561, -0.089709))
    sceneRot = GetEntityRotation(sceneObject)

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    camOffset = vector3(-0.025120, 0.812561, 0.559709)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1500, true, false)
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(sceneObject, camOffset))
    SetCamRot(cam, vector3(-20.0, 0.0, GetEntityHeading(sceneObject) + 180))

    for i = 1, #GrabTill['animations'] do
        if i == 2 then
            GrabTill['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, false, true, 1065353216, 0, 0.8)
        else
            GrabTill['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, false, false, 1065353216, 0, 0.8)
        end
        NetworkAddPedToSynchronisedScene(ped, GrabTill['scenes'][i], animDict, GrabTill['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
    end

    money1 = CreateObject(GetHashKey('prop_anim_cash_note'), pedCo, 1, 1, 0)
    money2 = CreateObject(GetHashKey('prop_anim_cash_note'), pedCo, 1, 1, 0)
    AttachEntityToEntity(money1, ped, GetPedBoneIndex(PlayerPedId(), 18905), 0.13, 0.04, -0.02, -44.0, 0.0, 0.0, true, true, false, false, 1, true)
    AttachEntityToEntity(money2, ped, GetPedBoneIndex(PlayerPedId(), 57005), 0.16, 0.04, -0.02, 36.0, 16.0, 27.0, true, true, false, false, 1, true)

    NetworkStartSynchronisedScene(GrabTill['scenes'][1])
    Wait(1000)
    NetworkStartSynchronisedScene(GrabTill['scenes'][2])
    Wait(Config['ShopRobbery']['tillGrabTime'])
    NetworkStartSynchronisedScene(GrabTill['scenes'][3])
    Wait(1000)
    TriggerServerEvent('shoprobbery:server:rewardItem', 'null', Config['ShopRobbery']['rewardMoneys']['till'](), 'money', index)
    DetachEntity(money1, 0, 0)
    DetachEntity(money2, 0, 0)
    DeleteObject(money1)
    DeleteObject(money2)
    RenderScriptCams(false, true, 1500, true, false)
    DestroyCam(cam, false)
    busy = false
end

RegisterNetEvent('shoprobbery:client:resetHeist')
AddEventHandler('shoprobbery:client:resetHeist', function(index)
    local i = index
    local pedSetup = Config['ShopRobberySetup'][i]['pedSetup']
    loadModel(pedSetup['model'])
    DeletePed(shopPeds[i])
    shopPeds[i] = CreatePed(4, GetHashKey(pedSetup['model']), pedSetup['coords'], false, false)
    SetEntityHeading(shopPeds[i], pedSetup['heading'])
    SetBlockingOfNonTemporaryEvents(shopPeds[i], true)
    FreezeEntityPosition(shopPeds[i], true)
    SetEntityCollision(shopPeds[i], false, false)
    SetEntityInvincible(shopPeds[i], true)
    safecrackObject = GetClosestObjectOfType(Config['ShopRobberySetup'][i]['safecrackSetup']['coords'], 5.0, GetHashKey('p_v_43_safe_s'), 0, 0, 0)
    DeleteObject(safecrackObject)
    ClearArea(pedSetup['coords'], 10.0)
    mainLoop[index] = false
    cashRegister[index] = {}
    lootSync['safecrack'][index] = false
    clientStart = false
end)

function loadPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        RequestNamedPtfxAsset(dict)
        Citizen.Wait(50)
	end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function addBlip(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipScale(blip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end