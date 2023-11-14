CreateThread(function()
    if Config.ESX then 
        ESX = exports["es_extended"]:getSharedObject()
        triggerCallback = ESX.TriggerServerCallback
    else
        QBCore = exports["qb-core"]:GetCoreObject()
        triggerCallback = QBCore.Functions.TriggerCallback
    end 
end)

local pedSpawned = false
local signedIn = false
local onJob = false
local isThrowingBag = false

local function Notification(title, msg, type)
    if Config.Notification == "OX" then 
        lib.notify({
            title = title,
            description = msg,
            type = type
        })
    elseif Config.Notification == "ESX" then
        ESX.ShowNotification(msg, type)
    elseif Config.Notification == "QB" then
        QBCore.Functions.Notify(msg, type)
    end
end

local function loadAnimation(dict)
    RequestAnimDict(dict)
    repeat Wait(50) until HasAnimDictLoaded(dict)
end

local function requestModel(model)
    RequestModel(model)
    repeat Wait(50) until HasModelLoaded(model)
end

local function pedNatives(currentPed)
    FreezeEntityPosition(currentPed, true)
    SetEntityInvincible(currentPed, true)
    SetPedKeepTask(currentPed, true)
    SetBlockingOfNonTemporaryEvents(currentPed, true)
    SetPedFleeAttributes(currentPed, 0, 0)
    SetPedDiesWhenInjured(currentPed, false)
    SetPedDefaultComponentVariation(currentPed)
end

local function canGrabTrash(entity)
    if not onJob then return false end
    if hasBag then return false end 
    if isThrowingBag then return false end
    if not currentLoc then return false end
    if lootedDumpster and lootedDumpster[entity] then return false end
    if #(GetEntityCoords(entity) - vector3(currentLoc.xyz)) > Config.StopsBlip.blipRadius then return false end   

    return true
end

local function grabTrash(entity)
    triggerCallback("qb-sanitation:server:grabTrashBag", function(canGrab)
        if not canGrab then return end
            hasBag = true 
            lootedDumpster[entity] = true
            TaskTurnPedToFaceEntity(PlayerPedId(), entity, 500)
            loadAnimation("missfbi4prepp1")
            TaskPlayAnim(PlayerPedId(), "missfbi4prepp1", "_bag_walk_garbage_man", 6.0, -6.0, -1, 49, 0, 0, 0, 0)
            trashBag = CreateObject(`prop_cs_rub_binbag_01`, 0, 0, 0, true, true, true)
            AttachEntityToEntity(trashBag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.12, 0.0, -0.05, 220.0, 120.0, 0.0, true, true, false, true, 1, true)
        while true do Wait(50)
            if hasBag and not isThrowingBag then
                if not IsEntityPlayingAnim(PlayerPedId(), "missfbi4prepp1", "_bag_walk_garbage_man", -1) then
                    loadAnimation("missfbi4prepp1")
                    TaskPlayAnim(PlayerPedId(), "missfbi4prepp1", "_bag_walk_garbage_man", 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                end
            else 
                ClearPedTasks(PlayerPedId())
                break
            end
        end
    end)
end

local function canThrowTrashBag(entity)
    local coords, _ = GetModelDimensions(GetEntityModel(entity))
    local tempCoords = GetOffsetFromEntityInWorldCoords(entity, 0.0, coords.y - 0.5, 0.0)
    return #(tempCoords - GetEntityCoords(PlayerPedId())) <= 2.3
end

local function throwTrashBag()
    triggerCallback("qb-sanitation:server:throwTrashBag", function(canThrow)
        if not canThrow then return end
            isThrowingBag = true
            TaskTurnPedToFaceEntity(PlayerPedId(), trashVehicle, 500)
            loadAnimation("missfbi4prepp1")
            TaskPlayAnim(PlayerPedId(), "missfbi4prepp1", "_bag_throw_garbage_man", 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
            FreezeEntityPosition(PlayerPedId(), true)
            Wait(1250)
            DetachEntity(trashBag, 1, false)
            DeleteObject(trashBag)
            TaskPlayAnim(PlayerPedId(), "missfbi4prepp1", "exit", 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
            FreezeEntityPosition(PlayerPedId(), false)
            ClearPedTasks(PlayerPedId())
            isThrowingBag = false
            trashBag = nil
            hasBag = false
    end, GetEntityCoords(trashVehicle))
end

local function canThrowTrash(entity)
    if not onJob or not trashVehicle or not hasBag or isThrowingBag then return false end
    if GetEntityModel(entity) ~= joaat(Config.TrashVehicle) then return false end
    if entity ~= trashVehicle then return false end
    if GetVehicleDoorLockStatus(entity) ~= 1 then return false end
    if GetVehicleEngineHealth(entity) <= 0 then return false end
    if #(GetEntityCoords(entity) - vector3(currentLoc.xyz)) > Config.StopsBlip.blipRadius then return false end

    return true
end

local function capitalizeFirstLetter(currentWord)
    return (currentWord:gsub("^%l", string.upper))
end

CreateThread(function()
    triggerCallback("qb-sanitation:server:getPedTable", function(cb) 
        local pedModel = cb[1]
        local pedCoords = cb[2]
        local pedBlip = cb[3]

        if not pedModel and pedCoords and pedBlip and pedSpawned then return end 

        if pedBlip.enableBlip then 
            mainBlip = AddBlipForCoord(pedCoords.x, pedCoords.y, pedCoords.z)
            SetBlipSprite(mainBlip, pedBlip.blipType)
            SetBlipDisplay(mainBlip, 4)
            SetBlipScale(mainBlip, 1.0)
            SetBlipAsShortRange(mainBlip, true)
            SetBlipColour(mainBlip, pedBlip.blipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(pedBlip.blipText)
            EndTextCommandSetBlipName(mainBlip)
        end

        requestModel(pedModel)
        local bossPed = CreatePed(2, pedModel, pedCoords.xyzw, false, false) 
        pedNatives(bossPed)

        exports["qb-target"]:AddTargetEntity(bossPed, {
            options = {
                { 
                    num = 1,
                    label = "Sign In",
                    icon = "fa-solid fa-user",
                    canInteract = function(entity)
                        return not signedIn
                    end,
                    event = "qb-sanitation:client:signInOut",
                },
                { 
                    num = 2,
                    label = "Start Small Job",
                    icon = "fa-solid fa-trash",
                    canInteract = function(entity)
                        return signedIn and not onJob
                    end,
                    action = function()
                        TriggerEvent("qb-sanitation:client:startJob", "small")
                    end,
                },
                { 
                    num = 3,
                    label = "Start Medium Job",
                    icon = "fa-solid fa-trash",
                    canInteract = function(entity)
                        return signedIn and not onJob
                    end,
                    action = function()
                        TriggerEvent("qb-sanitation:client:startJob", "medium")
                    end,
                },
                { 
                    num = 4,
                    label = "Start Large Job",
                    icon = "fa-solid fa-trash",
                    canInteract = function(entity)
                        return signedIn and not onJob
                    end,
                    action = function()
                        TriggerEvent("qb-sanitation:client:startJob", "large")
                    end,
                },
                { 
                    num = 5,
                    label = "Sign Out",
                    icon = "fa-solid fa-user",
                    canInteract = function(entity)
                        return signedIn and not onJob
                    end,
                    event = "qb-sanitation:client:signInOut",
                },
                { 
                    num = 6,
                    label = "Collect Paycheck",
                    icon = "fa-solid fa-user",
                    canInteract = function(entity)
                        return signedIn and onJob and jobDone
                    end,
                    event = "qb-sanitation:client:collectPaycheck"    
                },
                { 
                    num = 7,
                    label = "Buy Materials",
                    icon = "fa-solid fa-recycle",
                    canInteract = function(entity)
                        return not signedIn and not onJob
                    end,
                    event = "qb-sanitation:client:openMaterialsMenu"    
                },
            },
            distance = 2.5
        })

        pedSpawned = true
    end)
end)

RegisterNetEvent("qb-sanitation:client:openMaterialsMenu", function()
    triggerCallback("qb-sanitation:server:getMaterialsTable", function(cb)
        local materialsTable = {}

        for k, v in pairs(cb) do 
            materialsTable[#materialsTable + 1] = {
                title = "".. capitalizeFirstLetter(v.name) .." $".. v.price .."",
                event = "qb-sanitation:client:openMaterialAmountMenu",
                args = {
                    name = v.name, 
                    price = v.price,
                }
            }
        end

        lib.registerContext({
            id = 'materialsMenu',
            title = 'Buy Materials',
            options = materialsTable,
        })
        
        lib.showContext('materialsMenu')
    end)
end)

RegisterNetEvent("qb-sanitation:client:openMaterialAmountMenu", function(currentMaterial)
    triggerCallback("qb-sanitation:server:getPlayerMoney", function(moneyAmount)
        if moneyAmount < tonumber(currentMaterial.price) then Notification("Material Shop", "Not enough money", "error") return end

        local input = lib.inputDialog("Purchase ".. capitalizeFirstLetter(currentMaterial.name) .." ($".. currentMaterial.price.. "/each)", {
            {type = 'number', label = 'Amount:', description = "Cash: $".. moneyAmount, min = 1, default = 1},
        })
        if not input then return end 
        
        TriggerServerEvent("qb-sanitation:server:purchaseMaterial", currentMaterial.name, input[1], currentMaterial.price)
    end)
end)

RegisterNetEvent("qb-sanitation:client:signInOut", function()
    if onJob then return end 
    
    if not signedIn then 
        signedIn = true
        Notification("Sanitation", "You signed in to Sanitation")
    else
        signedIn = false
        Notification("Sanitation", "You signed out of Sanitation")
    end
end)

RegisterNetEvent("qb-sanitation:client:startJob", function(jobType)
    if not jobType then return end
    if not signedIn then return end 
    if onJob then return end

    onJob = true 
    TriggerServerEvent("qb-sanitation:server:startJob", jobType)
end)

RegisterNetEvent("qb-sanitation:client:createVehicle", function(currentLocation)
    for k, v in pairs(Config.VehicleSpawns) do 
        if not IsAnyVehicleNearPoint(v.xyz, 2.0) then 
            vehicleSpawned = true
            spawnLocation = v
        end
    end

    if not vehicleSpawned then 
        onJob = false
        Notification("Sanitation", "There isn't a spot for the vehicle", "error")
        return 
    end
    Notification("Sanitation", "Get in the sanitation vehicle") 

    requestModel(Config.TrashVehicle)
    trashVehicle = CreateVehicle(Config.TrashVehicle, spawnLocation.xyzw, true, true)
    if not Config.ESX then TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", GetVehicleNumberPlateText(trashVehicle)) end

    exports["qb-target"]:AddTargetEntity(trashVehicle, {
        options = {
            {
                label = "Throw In Trash",
                icon = "fa-solid fa-trash-arrow-up",
                canInteract = function(entity)
                    return canThrowTrash(entity)
                end,
                action = function() 
                    throwTrashBag() 
                end,
            }
        },
        distance = 2.0,
    })

    exports["qb-target"]:AddTargetModel(Config.Target, {
        options = {
            {
                label = "Grab Trash",
                icon = "fa-solid fa-trash",
                canInteract = function(entity)
                    return canGrabTrash(entity)
                end,
                action = function(entity) 
                    grabTrash(entity) 
                end,
            }
        },
        distance = 1.5,
    })

    repeat Wait(500) until IsPedSittingInVehicle(PlayerPedId(), trashVehicle)
        TriggerEvent("qb-sanitation:client:newPlace", currentLocation)
end)

RegisterNetEvent("qb-sanitation:client:newPlace", function(currentLocation)
    if not currentLocation then return end
    if not onJob then onJob = true end 
    if currentLocationBlip then RemoveBlip(currentLocationBlip) end 

    lootedDumpster = {}

    currentLocationBlip = AddBlipForRadius(currentLocation.x, currentLocation.y, currentLocation.z, Config.StopsBlip.blipRadius)
    SetBlipAlpha(currentLocationBlip, Config.StopsBlip.blipAlpha)
    SetBlipHighDetail(currentLocationBlip, true)
    SetBlipColour(currentLocationBlip, Config.StopsBlip.blipColor)
    SetBlipAsShortRange(currentLocationBlip, true)

    Notification("Sanitation", "Go to the assigned zone (".. GetLabelText(GetNameOfZone(currentLocation.x, currentLocation.y, currentLocation.z)) ..")")
    currentLoc = currentLocation
end)

RegisterNetEvent("qb-sanitation:client:jobDone", function()
    if currentLocationBlip then RemoveBlip(currentLocationBlip) end

    triggerCallback("qb-sanitation:server:getPedTable", function(cb)
        SetNewWaypoint(cb[2].x, cb[2].y)
        exports["qb-target"]:RemoveTargetEntity(trashVehicle, "Throw In Trash")
        exports["qb-target"]:RemoveTargetModel(Config.Target, "Grab Trash")
        currentLoc = nil 
        jobDone = true
        Notification("Sanitation", "Job is done, head to the boss", "success")
    end)
end)

RegisterNetEvent("qb-sanitation:client:collectPaycheck", function()
    if not signedIn then return end
    if not onJob then return end
    if not jobDone then return end

    TriggerServerEvent("qb-sanitation:server:collectPaycheck", GetEntityCoords(trashVehicle))  
end)

RegisterNetEvent("qb-sanitation:client:resetClient", function()
    DeleteEntity(trashVehicle)
    lootedDumpster = nil
    trashVehicle = nil
    trashBag = nil
    onJob = false
    jobDone = false
end)