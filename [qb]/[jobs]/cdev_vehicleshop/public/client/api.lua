ResourceAPI = {}

-- 🚗 Spawn a networked vehicle with the given model at the given coords and execute the callback with the network id and plate.
-- 📣 You should also set the vehicle fuel to 100% and give keys to the player.
ResourceAPI.SpawnVehicle = function(model, plate, coords, rotation, callback)
    if clib.config.isQBCore then
        clib.frameworks.QBCore.Functions.TriggerCallback('QBCore:Server:CreateVehicle', function(netId)
            while not NetworkDoesEntityExistWithNetworkId(netId) do
                Wait(0)
            end

            NetworkRequestControlOfNetworkId(netId)

            while not NetworkHasControlOfNetworkId(netId) do
                Wait(0)
            end

            local veh = NetToVeh(netId)

            SetVehicleNumberPlateText(veh, plate)
            SetEntityRotation(veh, rotation.x + 0.0, rotation.y + 0.0, rotation.z + 0.0, 2, true)

            local finalPlate = clib.wrappers.GetVehiclePlate(veh)

            ResourceAPI.SetVehicleFuel(veh, 100.0)

            if PublicSharedResourceConfig.GiveKeysToEmployeeFirst then
                ResourceAPI.GiveKeysToVehicle(finalPlate, model, netId)
            end

            -- ⚠️ Edit this if you use a custom vehicle tuning resource
            TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", finalPlate)

            callback(netId, finalPlate)
        end, joaat(model), coords, false)
    elseif clib.config.isESX then
        clib.frameworks.ESX.Game.SpawnVehicle(model, coords, coords.w, function(veh)
            SetVehicleNumberPlateText(veh, plate)
            SetEntityRotation(veh, rotation.x + 0.0, rotation.y + 0.0, rotation.z + 0.0, 2, true)

            local finalPlate = clib.wrappers.GetVehiclePlate(veh)

            ResourceAPI.SetVehicleFuel(veh, 100.0)

            if PublicSharedResourceConfig.GiveKeysToEmployeeFirst then
                ResourceAPI.GiveKeysToVehicle(finalPlate, model)
            end

            callback(NetworkGetNetworkIdFromEntity(veh), finalPlate)
        end, true)
    else
        -- 🔧 If using custom, implement your own code here
    end
end

-- 🚗 Spawn a local vehicle with the given model at the given coords and execute the callback with the network id. Then grabbing the props and removing them
-- 📣 This is used for frameworks like ESX that needs the mods saved into the database initially
ResourceAPI.SpawnTempVehicle = function(model, plate)
    local props = promise.new()

    if clib.config.isQBCore then
        clib.frameworks.QBCore.Functions.SpawnVehicle(model, function(veh)
            SetVehicleNumberPlateText(veh, plate)

            props:resolve(clib.frameworks.QBCore.Functions.GetVehicleProperties(veh))

            SetEntityAsMissionEntity(veh, false, false)
            DeleteEntity(veh)
        end, GetEntityCoords(PlayerPedId()), false)
    elseif clib.config.isESX then
        clib.frameworks.ESX.Game.SpawnVehicle(model, GetEntityCoords(PlayerPedId()), 0, function(veh)
            SetVehicleNumberPlateText(veh, plate)

            props:resolve(clib.frameworks.ESX.Game.GetVehicleProperties(veh))

            SetEntityAsMissionEntity(veh, false, false)
            DeleteEntity(veh)
        end, false)
    else
        -- 🔧 If using custom, implement your own code here
    end

    return Citizen.Await(props)
end

-- 🔑 Give keys to the vehicle with the given plate.
ResourceAPI.GiveKeysToVehicle = function(plate, model, netId)
    local modelHash = joaat(model)
    if clib.config.isQBCore then
        -- ⚠️ Edit this if you use a custom keys resource
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
    elseif clib.config.isESX then
        -- ⚠️ Edit this if you use a custom keys resource
    else
        -- 🔧 If using custom, implement your own code here
    end
end

-- 🚗 This function is called when a player begins a test drive.
ResourceAPI.OnBeginTestDrive = function(vehicleNetId, vehiclePlate)
end

-- 🚗 This event is called when a test drive timer runs out
RegisterNetEvent("cdev_vehicleshop:onOverTestDrive", function(net)
end)

-- 🚗 This event is called when KillTestDriveVehicleEngine is true and the timer runs out
RegisterNetEvent("cdev_vehicleshop:killEngineTestDrive", function(net)
    local veh = NetworkGetEntityFromNetworkId(net)

    SetVehicleEngineOn(veh, false, false, true)
    SetVehicleEngineHealth(veh, -4000.0)

    ResourceAPI.SetVehicleFuel(veh, 0.0)

    SetVehicleUndriveable(veh, true)
end)

-- 📦 Open the company stash for the given shop branch.
ResourceAPI.OpenCompanyStash = function(shopBranch)
    if clib.config.public.Inventory == "qbcore" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "company_" .. shopBranch, {
            maxweight = PublicSharedResourceConfig.DealershipJob.StashWeightCapacity,
            slots = PublicSharedResourceConfig.DealershipJob.StashSlotCount,
        })

        TriggerEvent("inventory:client:SetCurrentStash", "company_" .. shopBranch)
    elseif clib.config.public.Inventory == "ox" then
        if exports.ox_inventory:openInventory('stash', "company_" .. shopBranch) == false then
            clib.events.TriggerServerCallback("cdev_vehicleshop:loadStash", function()
                exports.ox_inventory:openInventory('stash', "company_" .. shopBranch)
            end, shopBranch)
        end
    else
        -- 🔧 If using custom, implement your own code here
        -- 🔧 Check the server api LoadStash function (if needed)
        clib.events.TriggerServerCallback("cdev_vehicleshop:loadStash", function()

        end, shopBranch)
    end
end

-- 📷 Request to take a screenshot of a vehicle and pass the image path to the callback (for thumbnails)
ResourceAPI.RequestScreenshot = function(model, callback)
    local entity = createShowroomVehicle(model, PublicSharedResourceConfig.ThumbnailGenerator.VehiclePosition)
    local _, max = GetModelDimensions(GetEntityModel(entity))
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    if GetVehicleClass(entity) == 8 or GetVehicleClass(entity) == 13 then
        AttachCamToEntity(cam, entity, 1.24, max[2] + 0.3, max[1] / 2 + 0.3, true)
        SetCamRot(cam, -10.0, 0, GetEntityHeading(entity) + 132.82, 2)
    else
        AttachCamToEntity(cam, entity, 1.94, max[2] + 0.1, max[1] / 2, true)
        SetCamRot(cam, -10.0, 0, GetEntityHeading(entity) + 132.82, 2)
    end

    SetCamActive(cam, true)
    SetFocusEntity(entity)
    RenderScriptCams(true, false, 0, true, true)

    while not HasCollisionLoadedAroundEntity(entity) do
        Wait(0)
    end

    local takingPic = true

    CreateThread(function()
        while takingPic do
            local c = GetCamCoord(cam)
            DrawSpotLight(c.x, c.y, c.z, 120.0, -160.0, 0.0, 255, 255, 255, 1000.0, 0.5, 0.5, 120.0, 2.0)
            Wait(0)
        end
    end)

    for i = 1, 3 do
        local _end = GetGameTimer() + 400

        while GetGameTimer() < _end do
            clib.wrappers.DrawText2D(4 - i, 0.5, 0.4, 3.0, { 255, 255, 255, 255 }, 1, 4, true)
            Wait(0)
        end
    end

    Wait(1)

    clib.events.TriggerServerCallback("cdev_vehicleshop:takeScreenshot", function(path)
        takingPic = false

        SetCamActive(cam, false)
        RenderScriptCams(false, false, 0, true, true)
        ClearFocus()
        DeleteEntity(entity)
        DestroyCam(cam)

        callback(path)
    end, model)
end

-- ⚠️ Edit this if you use a custom fuel resource
ResourceAPI.SetVehicleFuel = function(vehicle, level)
    SetVehicleFuelLevel(vehicle, level)
end


RegisterCommand("flatbed", function()
    local closestShop = getClosestShopInRange(100)
    if closestShop and hasJobRoleOnBranch(closestShop, Roles.EMPLOYEE) then
        clib.events.TriggerServerCallback("cdev_vehicleshop:spawnFlatbed", function(net, plate)
            while not NetworkDoesEntityExistWithNetworkId(net) do
                Wait(1)
            end

            local vehicle = NetworkGetEntityFromNetworkId(net)

            flatbedPlate = clib.wrappers.FormatPlate(plate)

            ResourceAPI.SetVehicleFuel(vehicle, 100.0)
            ResourceAPI.GiveKeysToVehicle(flatbedPlate, PublicSharedResourceConfig.VehiclePickupOptions.VehicleModel)
            SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

            clib.api.ThirdEye.AddEntityInteraction({
                entity = vehicle,
                event = "cdev_vehicleshop:deleteFlatbedVehicle",
                payload = {},
                faIcon = "fas fa-car",
                label = loc("return_flatbed"),
                distance = 2.5,
                canInteractCallback = function()
                    return GetVehicleNumberPlateText(vehicle) == plate
                end,
            })
        end, closestShop.name)

    else
        clib.api.Notify.AddWarningNotification(loc("error"), loc("shop_too_far"), 5)
    end
end)