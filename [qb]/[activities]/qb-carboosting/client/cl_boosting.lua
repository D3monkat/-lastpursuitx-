local currentContract = nil
local dropZone, vinScratchZone, vehArea, vehZone
local areablip, dropblip
local boostVehicle = 0
local canHack = true

madeDropOffZone = false

local neons = {
    {r = 222,   g = 222,    b = 255},
    {r = 2,     g = 21,     b = 255},
    {r = 3,     g = 83,     b = 255},
    {r = 0,     g = 255,    b = 140},
    {r = 94,    g = 255,    b = 1},
    {r = 255,   g = 255,    b = 0},
    {r = 255,   g = 150,    b = 0}, 
    {r = 255,   g = 62,     b = 0},
    {r = 255,   g = 1,      b = 1},
    {r = 255,   g = 50,     b = 100},
    {r = 255,   g = 5,      b = 190},
    {r = 35,    g = 1,      b = 255},
    {r = 15,    g = 3,      b = 255}
}

local vehMods = { -- You can add more here
    0, -- Spoiler
    1, -- Front Bumper
    2, -- Rear Bumper
    3, -- Skirt
    4, -- Exhaust
    5, -- Chassis
    6, -- Grill
    7, -- Bonnet
    8, -- Wing L
    9, -- Wing R
    10, -- Roof
    22, -- Xenon Lights
}

local upgrades = {
    ['S+'] = { turbo = true, engine = 4, brakes = 2, transmission = 3 },
    ['S'] = { turbo = false, engine = 4, brakes = 2, transmission = 3 },
    ['A'] = { turbo = false, engine = 3, brakes = 1, transmission = 2 },
    ['B'] = { turbo = false, engine = 2, brakes = 1, transmission = 2 }
}

--- Functions

--- Method to run a loop to send alerts to police
---@param vehicle number - Vehicle entity handle
---@return nil
local setupTrackerLoop = function(vehicle)
    Wait(Shared.PingInterval * 1000)

    while vehicle == cache.vehicle do
        if cache.seat == -1 then
            local state = Entity(vehicle).state
            if not state or not state.carboosting then return end

            if state.carboosting.current < Shared.Contracts[state.carboosting.tier].hacks then
                TriggerServerEvent(Shared.Resource .. ':server:SendLocation')
            else
                return
            end
        end

        Wait(Shared.PingInterval * 1000)
    end
end

--- Checks if a specific vehicle is VIN scratched
---@param vehicle number - Vehicle entity handle
---@return nil
local CheckVIN = function(vehicle)
    if vehicle and vehicle ~= 0 then
        SetVehicleDoorOpen(vehicle, 4, false, false)

        if lib.progressBar({
            duration = 8000,
            label = Locales['checking_vin'],
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, combat = true, mouse = false },
            anim = { dict = 'mini@repair', clip = 'fixing_a_player', flag = 16 },
        }) then
            if #(GetEntityCoords(vehicle) - GetEntityCoords(cache.ped)) < 5.0 then
                SetVehicleDoorShut(vehicle, 4, false)
                local plate = GetVehicleNumberPlateText(vehicle)
                TriggerServerEvent(Shared.Resource .. ':server:CheckVin', plate)
            else
                Utils.Notify(Locales['vehicle_far'], 'error', 2500)
            end
        else
            Utils.Notify(Locales['canceled'], 'error', 2500)
        end
    end
end

--- Gives a vehicle random cosmetic upgrades
---@param vehicle number - Vehicle entity handle
---@return nil
local SetRandomCosmetics = function(vehicle)
    -- Colours
    local c1, c2 = math.random(160), math.random(160)
    SetVehicleColours(vehicle, c1, c2)

    -- Cosmetics
    SetVehicleModKit(vehicle, 0)
    for i = 1, #vehMods, 1 do
        local modAmount = GetNumVehicleMods(vehicle, vehMods[i])
        local rndm = math.random(modAmount)
        SetVehicleMod(vehicle, vehMods[i], rndm, false)
    end
end

--- Enables upgrades for a specific vehicle based on the tier of the contract
---@param vehicle number - Vehicle entity handle
---@param tier string - Tier of the boosting contract
---@return nil
local EnableUpgrades = function(vehicle, tier)
    SetVehicleModKit(vehicle, 0)
    ToggleVehicleMod(vehicle, 18, upgrades[tier].turbo) 
    SetVehicleMod(vehicle, 11, upgrades[tier].engine, false)
    SetVehicleMod(vehicle, 12, upgrades[tier].brakes, false)
    SetVehicleMod(vehicle, 13, upgrades[tier].transmission, false)   
end

--- Enables neon and xenon for a specific vehicle
---@param vehicle number - Vehicle entity handles
---@return nil
local EnableNeon = function(vehicle)
    -- Neon
    local colour = math.random(#neons)
    SetVehicleNeonLightsColour(vehicle, neons[colour].r, neons[colour].g, neons[colour].b)
    SetVehicleNeonLightEnabled(vehicle, 0, true)
    SetVehicleNeonLightEnabled(vehicle, 1, true)
    SetVehicleNeonLightEnabled(vehicle, 2, true)
    SetVehicleNeonLightEnabled(vehicle, 3, true)

    -- Xenon
    ToggleVehicleMod(vehicle, 22, true)
    SetVehicleXenonLightsColor(vehicle, math.random(0, 12))
end

--- Create a drop off location zone to complete the contract
---@param dropOffLoc vec3 - Drop off location coordinates
---@return nil
local registerDropOffZone = function(dropOffLoc)
    -- Blip
    dropblip = Utils.CreateDropOffBlip(dropOffLoc)

    -- Phone Notification
    Utils.PhoneNotification(Locales['go_dropoff'], 60000)

    -- Zone
    madeDropOffZone = true
    dropZone = lib.zones.sphere({
        coords = dropOffLoc,
        radius = 4.0,
        debug = false,
        onEnter = function(self)
            if cache.vehicle == boostVehicle then
                Utils.PhoneNotification(Locales['park_vehicle'], 10000)
            end
        end,
        onExit = function(self)
            if boostVehicle and self:contains(GetEntityCoords(boostVehicle)) then
                -- Delete Zone
                self:remove()
                dropZone = nil

                -- Complete Contract
                TriggerServerEvent(Shared.Resource .. ':server:CompleteDropOff', currentContract)

                -- Delete Blip
                RemoveBlip(dropblip)
                dropblip = nil

                -- Notify Complete
                Utils.PhoneNotification(Locales['completed_contract'], 10000)

                -- Delete Contract
                DeleteContract(currentContract)
            end
        end
    })
end

--- Create a VIN Scratch location zone
---@param vinScratchLoc vec3 - VIN Scratch location index
---@return nil
local registerVinScratchZone = function(vinScratchLoc)
    -- Blip
    dropblip = Utils.CreateDropOffBlip(Shared.ScratchLocations[vinScratchLoc].coords)

    -- Phone Notification
    Utils.PhoneNotification(Locales['go_vinloc'], 60000)

    -- Zone
    madeDropOffZone = true
    vinScratchZone = lib.zones.sphere({
        coords = Shared.ScratchLocations[vinScratchLoc].coords,
        radius = 4.0,
        debug = false,
        onEnter = function()
            if cache.vehicle == boostVehicle then
                Utils.PhoneNotification(Locales['go_wipe_paperwork'], 10000)
            end
        end
    })

    -- Target: create laptop box zone
    if Shared.Target == 'ox' then
        exports['ox_target']:addBoxZone({
            coords = Shared.ScratchLocations[vinScratchLoc].laptop.xyz,
            size = vector3(0.5, 0.5, 0.6),
            rotation = Shared.ScratchLocations[vinScratchLoc].laptop.w,
            debug = false,
            options = {
                {
                    label = Locales['target_laptop'],
                    name = 'carboosting_laptop',
                    icon = 'fas fa-network-wired',
                    distance = 1.5,
                    event = Shared.Resource .. ':client:InteractLaptop'
                }
            }
        })
    elseif Shared.Target == 'qb' then
        exports['qb-target']:AddBoxZone('carboosting_laptop', Shared.ScratchLocations[vinScratchLoc].laptop.xyz, 0.5, 0.5, {
            name = 'carboosting_laptop',
            heading = Shared.ScratchLocations[vinScratchLoc].laptop.w,
            minZ = Shared.ScratchLocations[vinScratchLoc].laptop.z - 0.3,
            maxZ = Shared.ScratchLocations[vinScratchLoc].laptop.z + 0.3,
            debugPoly = false
        }, {
            options = { 
                {
                    type = 'client',
                    event = Shared.Resource .. ':client:InteractLaptop',
                    icon = 'fas fa-network-wired',
                    label = Locales['target_laptop']
                }
            },
            distance = 1.5,
        })
    end
end

--- Handlers

AddStateBagChangeHandler('carboosting', nil, function(bagName, key, value)
    if not value then return end
    
    local entity = GetEntityFromStateBagName(bagName)
    if entity == cache.vehicle then
        if entity == boostVehicle and value and value.current == Shared.Contracts[value.tier].hacks then
            if value.vinscratch then
                registerVinScratchZone(value.dropoff)
            else
                registerDropOffZone(value.dropoff)
            end
        else
            Utils.PhoneNotification(Locales['update_tracker'] .. ' (' .. value.current .. '/' .. Shared.Contracts[value.tier].hacks .. ')', 60000)
        end
    end
end)

--- Events

RegisterNetEvent(Shared.Resource .. ':client:StartContract', function(contractId, tier, location)
    currentContract = contractId

    -- Phone Notification
    Utils.PhoneNotification(Locales['go_vehicle'], 60000)

    -- Blip
    local vehLoc = Shared.Contracts[tier].locations[location].vehicle
    areablip = Utils.CreateAreaBlip(vehLoc)

    -- Area zone: spawn car
    vehArea = lib.zones.sphere({
        coords = Shared.Contracts[tier].locations[location].vehicle.xyz,
        radius = 200.0,
        debug = false,
        onEnter = function(self)
            -- Delete Zone
            self:remove()
            vehArea = nil

            -- Spawn Car
            lib.callback(Shared.Resource .. ':server:SpawnVehicle', false, function(netId)
                while not NetworkDoesEntityExistWithNetworkId(netId) do Wait(0) end
                boostVehicle = NetToVeh(netId)

                -- Set Cosmetics and fuel
                SetRandomCosmetics(boostVehicle)
                exports[Shared.FuelScript]:SetFuel(boostVehicle, 23.00)

                -- Set Upgrades and neons
                if upgrades[Shared.Contracts[tier].label] then
                    EnableNeon(boostVehicle)
                    EnableUpgrades(boostVehicle, Shared.Contracts[tier].label)
                end
            end, contractId)

            Utils.PhoneNotification(Locales['find_steal'], 60000)
        end
    })

    -- Veh zone: alert cops and spawn npc's
    vehZone = lib.zones.sphere({
        coords = Shared.Contracts[tier].locations[location].vehicle.xyz,
        radius = 2.5,
        debug = false,
        onEnter = function(self)
            -- Delete Zone
            self:remove()
            vehZone = nil

            -- Remove Area Blip
            RemoveBlip(areablip)
            areablip = nil

            -- Alert Cops
            Utils.AlertPolice(GetVehicleNumberPlateText(boostVehicle), boostVehicle)

            -- Spawn NPC
            lib.callback(Shared.Resource .. ':server:SpawnNPC', false, function(netIds)
                Wait(1000)

                for i = 1, #netIds, 1 do
                    local npc = NetworkGetEntityFromNetworkId(netIds[i])
                    SetPedDropsWeaponsWhenDead(npc, false)
                    SetPedMaxHealth(npc, 500)
                    SetPedArmour(npc, 200)
                    SetCanAttackFriendly(npc, false, true)
                    SetPedCombatAttributes(npc, 46, true)
                    SetPedCombatAttributes(npc, 0, false)
                    SetPedCombatAbility(npc, 100)
                    SetPedAsCop(npc, true)
                    SetPedRelationshipGroupHash(npc, `HATES_PLAYER`)
                    SetPedAccuracy(npc, 60)
                    SetPedFleeAttributes(npc, 0, 0)
                    SetPedKeepTask(npc, true)
                    SetBlockingOfNonTemporaryEvents(npc, true)
                end
            end, contractId)
        end
    })
end)

RegisterNetEvent(Shared.Resource .. ':client:RejoinContract', function(contractId, tier, location)
    started = true
    currentContract = contractId

    -- Phone Notification
    Utils.PhoneNotification(Locales['go_vehicle'], 60000)

    -- Blip
    areablip = Utils.CreateAreaBlip(location)

    -- Veh zone: alert cops and spawn npc's
    vehZone = lib.zones.sphere({
        coords = location,
        radius = 2.5,
        debug = true,
        onEnter = function(self)
            -- Delete Zone
            self:remove()
            vehZone = nil

            -- Remove Area Blip
            RemoveBlip(areablip)
            areablip = nil

            -- Alert Cops
            Utils.AlertPolice(GetVehicleNumberPlateText(boostVehicle), boostVehicle)

            -- Spawn NPC
            lib.callback(Shared.Resource .. ':server:SpawnNPC', false, function(netIds)
                Wait(1000)

                for i = 1, #netIds, 1 do
                    local npc = NetworkGetEntityFromNetworkId(netIds[i])
                    SetPedDropsWeaponsWhenDead(npc, false)
                    SetPedMaxHealth(npc, 500)
                    SetPedArmour(npc, 200)
                    SetCanAttackFriendly(npc, false, true)
                    SetPedCombatAttributes(npc, 46, true)
                    SetPedCombatAttributes(npc, 0, false)
                    SetPedCombatAbility(npc, 100)
                    SetPedAsCop(npc, true)
                    SetPedRelationshipGroupHash(npc, `HATES_PLAYER`)
                    SetPedAccuracy(npc, 60)
                    SetPedFleeAttributes(npc, 0, 0)
                    SetPedKeepTask(npc, true)
                    SetBlockingOfNonTemporaryEvents(npc, true)
                end
            end, contractId)
        end
    })
end)

RegisterNetEvent(Shared.Resource .. ':client:UseDisabler', function()
    if canHack and cache.vehicle then
        if cache.seat == 0 then
            local state = Entity(cache.vehicle).state
            if not state.carboosting then return end

            -- If not all hacks done
            if state.carboosting.current < Shared.Contracts[state.carboosting.tier].hacks then
                if GetEntitySpeed(cache.vehicle) * 2.23694 >= Shared.MinSpeed then
                    canHack = false

                    -- Minigame
                    local result = exports['boostinghack']:StartHack()
                    TriggerServerEvent(Shared.Resource .. ':server:UpdateTracker', state.carboosting.id, result)

                    -- Cooldown
                    SetTimeout(60 * 1000, function()
                        canHack = true
                    end)
                else
                    Utils.Notify(Locales['too_slow'], 'error', 2500)
                end
            end
        else
            Utils.Notify(Locales['not_as_driver'], 'error', 2500)
        end
    end
end)

RegisterNetEvent(Shared.Resource .. ':client:InteractLaptop', function(data)
    if started and DoesEntityExist(boostVehicle) then
        if vinScratchZone:contains(GetEntityCoords(boostVehicle)) then
            if lib.progressBar({
                duration = 8000,
                label = Locales['progress_connect_network'],
                useWhileDead = false,
                canCancel = false,
                disable = { car = true, move = true, combat = true, mouse = false },
                anim = { dict = 'anim@heists@prison_heiststation@cop_reactions', clip = 'cop_b_idle', flag = 1 },
            }) then
                Utils.PhoneNotification(Locales['can_wipe'], 6000)

                if lib.progressBar({
                    duration = 8000,
                    label = Locales['progress_wiping_paperwork'],
                    useWhileDead = false,
                    canCancel = false,
                    disable = { car = true, move = true, combat = true, mouse = false },
                    anim = { dict = 'anim@heists@prison_heiststation@cop_reactions', clip = 'cop_b_idle', flag = 1 },
                }) then
                    Utils.PhoneNotification(Locales['can_scratch'], 6000)

                    if Shared.Target == 'ox' then
                        -- Remove Target
                        exports['ox_target']:removeZone(data.zone)

                        -- Create Target to scratch vin
                        exports['ox_target']:addLocalEntity(boostVehicle, {
                            {
                                label = Locales['target_scratch_vin'],
                                name = 'carboosting_scratchvin',
                                icon = 'fas fa-eye-slash',
                                distance = 1.0,
                                event = Shared.Resource .. ':client:ScratchVIN',
                                canInteract = function(entity)
                                    return vinScratchZone:contains(GetEntityCoords(entity))
                                end
                            }
                        })
                    elseif Shared.Target == 'qb' then
                        -- Remove Target
                        exports['qb-target']:RemoveZone('carboosting_laptop')

                        -- Create Target to scratch vin
                        exports['qb-target']:AddTargetEntity(boostVehicle, {
                            options = {
                                {
                                    type = 'client',
                                    event = Shared.Resource .. ':client:ScratchVIN',
                                    icon = 'fas fa-eye-slash',
                                    label = Locales['target_scratch_vin'],
                                    canInteract = function(entity)
                                        return vinScratchZone:contains(GetEntityCoords(entity))
                                    end
                                }
                            },
                            distance = 1.0
                        })
                    end
                end
            end
        else
            Utils.Notify(Locales['veh_not_in_zone'], 'error', 2500)
        end
    end
end)

RegisterNetEvent(Shared.Resource .. ':client:ScratchVIN', function(data)
    if started and data.entity == boostVehicle then
        local state = Entity(data.entity).state
        if not state.carboosting then return end
        
        if Shared.Contracts[state.carboosting.tier].hacks == state.carboosting.current and state.carboosting.vinscratch then
            -- Remove Target
            if Shared.Target == 'ox' then
                exports['ox_target']:removeLocalEntity(data.entity, 'carboosting_scratchvin')
            elseif Shared.Target == 'qb' then
                exports['qb-target']:RemoveTargetEntity(data.entity, 'Scratch VIN')
            end

            -- Remove Zone
            vinScratchZone:remove()
            vinScratchZone = nil

            -- Deltee Blip
            RemoveBlip(dropblip)
            dropblip = nil

            -- Progressbar
            if lib.progressBar({
                duration = 10000,
                label = Locales['progress_scratching_vin'],
                useWhileDead = false,
                canCancel = false,
                disable = { car = true, move = true, combat = true, mouse = false },
                anim = { dict = 'mp_car_bomb', clip = 'car_bomb_mechanic', flag = 16 },
            }) then
                -- Notify Complete
                Utils.PhoneNotification(Locales['scratched_vin'], 6000)

                -- Complete Contract
                TriggerServerEvent(Shared.Resource .. ':server:CompleteVinScratch', currentContract, Framework.Functions.GetVehicleProperties(data.entity))

                -- Delete Contract
                DeleteContract(currentContract)
            end
        end
    end
end)

lib.onCache('vehicle', function(vehicle)
    if vehicle then
        local state = Entity(vehicle).state
        if not state or not state.carboosting then return end

        if started and state.carboosting.citizenid == PlayerData.citizenid then
            boostVehicle = vehicle
        end

        if started and vehicle == boostVehicle then
            -- If all hacks done and drop off zone isn't made
            if Shared.Contracts[state.carboosting.tier].hacks == state.carboosting.current then
                if not madeDropOffZone and state.carboosting.vinscratch then
                    registerVinScratchZone(state.carboosting.dropoff)
                elseif not madeDropOffZone then
                    registerDropOffZone(state.carboosting.dropoff)
                end
            else
                Utils.PhoneNotification(Locales['look_tracking'], 10000)
            end
        end

        setupTrackerLoop(vehicle)
    end
end)

--- Threads

CreateThread(function()
    -- Police check vin target
    if Shared.Target == 'ox' then
        exports['ox_target']:addGlobalVehicle({
            {
                label = Locales['target_check_vin'],
                name = 'carboosting_checkvin',
                icon = 'fas fa-check-circle',
                distance = 1.5,
                groups = 'police',
                onSelect = function(data)
                    CheckVIN(data.entity)
                end
            }
        })
    elseif Shared.Target == 'qb' then
        exports['qb-target']:AddGlobalVehicle({
            options = {
                {
                    icon = 'fas fa-check-circle',
                    label = Locales['target_check_vin'],
                    action = function(entity)
                        CheckVIN(entity)
                    end,
                    job = 'police'
                }
            },
            distance = 1.5,
        })
    end
end)

--- Testing

--- Replicates doing a successfull hack
RegisterCommand('boosting_test', function(source, args, rawCommand)
    if cache.vehicle then
        local state = Entity(cache.vehicle).state
        if not state.carboosting then return end

        TriggerServerEvent(Shared.Resource .. ':server:UpdateTracker', state.carboosting.id, true)
    end
end)
