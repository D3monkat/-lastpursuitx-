local QBCore = exports['qb-core']:GetCoreObject()

local killedPedWeapons = {}
local animalsKilled = {}
local busyTarget = false
local Hunting = false
local canPlaceBait = false
local animalSpooked = false
local hascarcass = false
local hasprey1 = false
local hasprey2 = false
local hasprey3 = false
local hasprey4 = false
local huntingAnimal = nil
local animalHash = nil
local huntingBait = nil
local baitBlip = nil
local animalBlip = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Player = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Hunting = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    Player = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Player = QBCore.Functions.GetPlayerData()
        Hunting = false
    end
end)

CreateThread(function ()
    if Config.UseZoneBlip then
        HuntingArea = AddBlipForRadius(Config.MainHuntingZoneBlipInfo.coords, Config.MainHuntingZoneBlipInfo.radius)
        SetBlipColour(HuntingArea, Config.MainHuntingZoneBlipInfo.color)
        MapAnimalBlip = AddBlipForCoord(Config.MainHuntingZoneBlipInfo.coords)
        SetBlipSprite(MapAnimalBlip, Config.MainHuntingZoneBlipInfo.sprite)
        SetBlipScale(MapAnimalBlip, Config.MainHuntingZoneBlipInfo.scale)
        SetBlipColour(MapAnimalBlip, Config.MainHuntingZoneBlipInfo.color2)
        SetBlipAsShortRange(MapAnimalBlip, Config.MainHuntingZoneBlipInfo.shortrange)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.MainHuntingZoneBlipInfo.name)
        EndTextCommandSetBlipName(MapAnimalBlip)
    end

    if Config.UseStoreBlip then
        HunterBlip = AddBlipForCoord(Config.PedLocation)
        SetBlipSprite(HunterBlip, Config.StoreBlipInfo.sprite)
        SetBlipColour(HunterBlip, Config.StoreBlipInfo.color)
        SetBlipScale(HunterBlip, Config.StoreBlipInfo.scale)
        SetBlipAsShortRange(HunterBlip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.StoreBlipInfo.name)
        EndTextCommandSetBlipName(HunterBlip)
    end

    QBCore.Functions.LoadModel(Config.PedHash)
    local Hunter = CreatePed(0, Config.PedHash, Config.PedLocation.x, Config.PedLocation.y, Config.PedLocation.z-1.0, Config.PedLocation.w, false, false)
	TaskStartScenarioInPlace(Hunter, Config.HunterScenario, true)
	FreezeEntityPosition(Hunter, true)
	SetEntityInvincible(Hunter, true)
	SetBlockingOfNonTemporaryEvents(Hunter, true)

    QBCore.Functions.LoadModel(Config.BodyPartsPedHash)
    local partsPed = CreatePed(0, Config.BodyPartsPedHash, Config.BodyPartsPedCoords.x, Config.BodyPartsPedCoords.y, Config.BodyPartsPedCoords.z-1.0, Config.BodyPartsPedCoords.w, false, false)
	FreezeEntityPosition(partsPed, true)
	SetEntityInvincible(partsPed, true)
	SetBlockingOfNonTemporaryEvents(partsPed, true)

    exports['qb-target']:AddTargetEntity(Hunter, {
        options = {
            {
                icon = 'fas fa-circle',
                label = 'Talk to Hunter',
                action = function()
                    TriggerServerEvent('kevin-hunting:ValidateLicense')
                end,
            },
            {
                icon = 'fas fa-id-card',
                label = 'Buy License',
                action = function()
                    QBCore.Functions.TriggerCallback('kevin-hunting:HasLicensePayment',function(money)
                        if money then
                            TriggerServerEvent('kevin-hunting:BuyHuntingLicense')
                        end
                    end)
                end,
            },
        },
        distance = 2.0
    })

    exports['qb-target']:AddTargetEntity(partsPed, {
        options = {
            {
                icon = 'fas fa-circle',
                label = 'Whats This?',
                action = function()
                    BodyPartsMenu()
                end,
            },
        },
        distance = 2.0
    })

    exports['qb-target']:AddTargetModel(Config.Animals, {
        options = {
            {
                icon = 'fas fa-circle',
                label = 'Take Carcass',
                canInteract = function(entity)
                    return IsEntityDead(entity) and not busyTarget
                end,
                action = function(entity)
                    if Config.UseLocalAnimals then
                        TakeCarcass(entity)
                    else
                        if entity == huntingAnimal then
                            TakeCarcass(entity)
                        else
                            QBCore.Functions.Notify('This animal is protected', 'error', 4500)
                        end
                    end
                end,
            },
        },
        distance = 2.5
    })
end)

AddEventHandler('kat:is:god:shop', function()
    exports['ox_inventory']:RegisterShop('baitandgear', {
        name = "Bait and Gear",
        inventory = {
            { name = 'huntingbait', price = 50 },
            { name = 'weapon_huntingrifle', price = 250},
            { name = 'snp_ammo', price = 20 }, --- to do , NEeds 7.62 ammo
            { name = 'fishingrod', price = 100 },
            { name = 'fishingbait', price = 10 },
        },
    })
end)

RegisterNetEvent('kevin-hunting:OpenShop', function()
    -- TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Hunting', Config.Items)
end)
RegisterNetEvent('kat:OpenShop', function()
    exports.ox_inventory:openInventory('shop', { type = 'fishingstore', id = 1})
end)

RegisterNetEvent('kevin-hunting:GoHunt', function ()
    if not Hunting then
        Hunting = true
        QBCore.Functions.Notify('Hunting Grounds now accessable', 'primary', 4500)
    else
        QBCore.Functions.Notify('Hunting Grounds already accessable', 'error', 4500)
    end
end)

RegisterNetEvent('kevin-hunting:alert', function ()
    if Config.Dispatch == 'ps' then
        exports['ps-dispatch']:IllegalHunting()
    else
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', 'bcso', 'sast'},
            coords = data.coords,
            title = '911 - Illegal Hunting',
            message = 'Hello someone just killed a protected animal.. hurry',
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 141,
                scale = 1.5,
                colour = 17,
                flashes = false,
                text = '911 - Illegal Hunting',
                time = (5*60*1000),
                sound = 1,
            }
        })
    end
end)

RegisterNetEvent('kevin-hunting:bigfootalert', function ()
    if Config.Dispatch == 'ps' then
        exports['ps-dispatch']:BigFoot()
    else
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', 'bcso', 'sast'},
            coords = data.coords,
            title = '911 - Illegal Hunting',
            message = 'Hello someone just killed a person in a bigfoot outfit.. hurry',
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 671,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = '911 - Illegal Hunting',
                time = (5*60*1000),
                sound = 1,
            }
        })
    end
end)

RegisterCommand('getzone', function ()
    local player = PlayerPedId()
    local zone = GetNameOfZone(GetEntityCoords(player))
    print(zone)
end)

function GetZone()
    local player = PlayerPedId()
    local zone = GetNameOfZone(GetEntityCoords(player))
    for k, v in pairs(Config.HuntingZones) do
        if zone == v then
            return true
        end
    end
end

RegisterNetEvent('kevin-hunting:usebait', function ()
    local player = PlayerPedId()
    if Config.UseJob then
        if Player.job.name == Config.HuntingJobName then
            if GetZone() then
                PlaceBait()
            else
                QBCore.Functions.Notify('Cannot place bait here', 'error', 4000)
            end
        end
    else
        if GetZone() then
            PlaceBait()
        else
            QBCore.Functions.Notify('Cannot place bait here', 'error', 4000)
        end
    end
end)

function PlaceBait()
    local player = PlayerPedId()
    if Hunting then
        if not canPlaceBait then
            canPlaceBait = true
            if not IsPedInAnyVehicle(player, false) then
                SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
                Wait(1500)
                QBCore.Functions.Progressbar('using_bait', 'Placing Bait', math.random(7500, 12000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = 'amb@world_human_gardener_plant@male@base',
                    anim = 'base',
                    flags = 1,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('kevin-hunting:removebait')
                    ClearPedTasks(player)
                    CreateBait()
                end, function() -- Cancel
                    canPlaceBait = false
                    ClearPedTasks(player)
                    QBCore.Functions.Notify('Cancelled', 'error')
                end)
            else
                QBCore.Functions.Notify('You want to use bait in a vehicle?', 'error', 4000)
            end
        else
            QBCore.Functions.Notify('You cannot place 2 bait..', 'error', 4000)
        end
    else
        QBCore.Functions.Notify('Grounds not accessable..', 'error', 4000)
    end
end

function CreateBait()
    local coords = GetEntityCoords(PlayerPedId())
    QBCore.Functions.LoadModel(`prop_drug_package_02`)
    huntingBait = CreateObject(`prop_drug_package_02`, coords.x , coords.y , coords.z- 1.0, true, true, true)
    if DoesEntityExist(huntingBait) then
        SetEntityAsMissionEntity(huntingBait)
        FreezeEntityPosition(huntingBait, true)

        if Config.UseBaitBlip then
            baitBlip = AddBlipForEntity(huntingBait)
            SetBlipSprite(baitBlip, Config.BaitBlipInfo.sprite)
            SetBlipColour(baitBlip, Config.BaitBlipInfo.color)
            SetBlipScale(baitBlip, Config.BaitBlipInfo.scale)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(Config.BaitBlipInfo.name)
            EndTextCommandSetBlipName(baitBlip)
        end
        exports['qb-target']:AddTargetEntity(huntingBait, {
            options = {
                {
                    icon = 'fas fa-circle',
                    label = 'Squash Bait',
                    action = function()
                        RemoveBait()
                    end,
                },
            },
            distance = 2.5
        })
        CreateAnimal()
    end
end

function RemoveBait()
    local player = PlayerPedId()
    TaskTurnPedToFaceEntity(player, huntingBait, -1)
    Wait(500)
    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
    QBCore.Functions.Progressbar('using_bait', 'Squashing', math.random(4000, 8000), false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@world_human_gardener_plant@male@base',
        anim = 'base',
        flags = 1,
    }, {}, {}, function() -- Done
        exports['qb-target']:RemoveTargetEntity(huntingBait, 'Squash Bait')
        ClearPedTasks(player)
        if DoesEntityExist(huntingAnimal) then
            DeleteEntity(huntingAnimal)
            huntingAnimal = nil
        end
        DeleteEntity(huntingBait)
        RemoveBlip(baitBlip)
        canPlaceBait = false
        animalSpooked = false
        CanTakeCarcass = false
        huntingBait = nil
        animalBlip = nil
        baitBlip = nil
    end, function() -- Cancel
        ClearPedTasks(player)
        QBCore.Functions.Notify('Cancelled', 'error')
    end)
end

function CreateAnimal()
    local player = PlayerPedId()
    local coords = GetEntityCoords(huntingBait)
    local time = GetClockHours()
    local chance = math.random(1, 100)
    if Config.UseBigFoot then
        if Config.UseBigFootNightOnly then
            if time >= Config.NightStartTime and time <= Config.NightEndTime then
                if chance <= Config.BigFootChance then
                    animalHash = Config.BigFootHash
                else
                    animalHash = Config.Animals[math.random(#Config.Animals)]
                end
            else
                animalHash = Config.Animals[math.random(#Config.Animals)]
            end
        else
            if chance <= Config.BigFootChance then
                animalHash = Config.BigFootHash
            else
                animalHash = Config.Animals[math.random(#Config.Animals)]
            end
        end
    else
        animalHash = Config.Animals[math.random(#Config.Animals)]
    end
    Wait(Config.TimeForAnimalSpawn * 60000)
    QBCore.Functions.LoadModel(animalHash)

    local radius = 100.0
    local x = coords.x + math.random(-radius, radius)
    local y = coords.y + math.random(-radius, radius)
    local z = coords.z + 999.0
    local w = math.random(1, 360) + .0

    local ground, safe = GetGroundZFor_3dCoord(x + .0, y + .0, z, 1)
    if not ground then
        repeat
            ground, safe = GetGroundZFor_3dCoord(x + .0, y + .0, z, 1)
        until ground
    end
    huntingAnimal = CreatePed(28, animalHash, x, y, safe, w, true, true)
    -- print(huntingAnimal)
    -- print(x, y, safe)
    SetEntityAsMissionEntity(huntingAnimal)
    if DoesEntityExist(huntingAnimal) then
        NetworkId = NetworkGetNetworkIdFromEntity(huntingAnimal)
        TaskGoToCoordAnyMeans(huntingAnimal, coords, 1.2, 0, 0, 786603, 1.0)
        if Config.UseAnimalBlip then
            if DoesEntityExist(huntingAnimal) then
                if animalHash == Config.BigFootHash then
                    animalBlip = AddBlipForEntity(huntingAnimal)
                    SetBlipSprite(animalBlip, Config.BigFootBlipInfo.sprite)
                    SetBlipColour(animalBlip, Config.BigFootBlipInfo.color)
                    SetBlipScale(animalBlip, Config.BigFootBlipInfo.scale)
                    SetBlipFlashes(animalBlip, Config.BigFootBlipInfo.blipflash)
                else
                    animalBlip = AddBlipForEntity(huntingAnimal)
                    SetBlipSprite(animalBlip, Config.AnimalBlipInfo.sprite)
                    SetBlipColour(animalBlip, Config.AnimalBlipInfo.color)
                    SetBlipScale(animalBlip, Config.AnimalBlipInfo.scale)
                    SetBlipFlashes(animalBlip, Config.AnimalBlipInfo.blipflash)
                end
            end
        end
    end

    CreateThread( function ()
        while DoesEntityExist(huntingAnimal) do
            local preypos = GetEntityCoords(huntingAnimal)
            local playercoords = GetEntityCoords(player)
            if DoesEntityExist(huntingAnimal) then
                if #(coords - preypos) < 0.85 then
                    if animalHash == `a_c_deer` then
                        TaskStartScenarioInPlace(huntingAnimal, 'WORLD_DEER_GRAZING', 0, true)
                    elseif animalHash == `a_c_boar` then
                        TaskStartScenarioInPlace(huntingAnimal, 'WORLD_BOAR_GRAZING', 0, true)
                    elseif animalHash == `a_c_coyote` then
                        TaskStartScenarioInPlace(huntingAnimal, 'WORLD_COYOTE_HOWL', 0, true)
                    end
                end

                if #(preypos - playercoords) <= Config.AnimalFleeDistanceFromPLayer and not IsEntityDead(huntingAnimal) and not animalSpooked then
                    animalSpooked = true
                    TaskTurnPedToFaceEntity(huntingAnimal, player, -1)
                    Wait(1500)
                    ClearPedTasks(huntingAnimal)
                    TaskSmartFleePed(huntingAnimal, player, 1000.0, -1, true, true)
                end

                if #(preypos - playercoords) >= 250.0 and animalSpooked then
                    QBCore.Functions.Notify('Animal got away..', 'error')
                    DeleteEntity(huntingBait)
                    DeleteEntity(huntingAnimal)
                    RemoveBlip(baitBlip)
                    canPlaceBait = false
                    animalSpooked = false
                    huntingAnimal = nil
                    huntingBait = nil
                    baitBlip = nil
                end
            end
            Wait(1000)
        end
    end)
end

AddEventHandler('gameEventTriggered', function(event, data)
    if event == "CEventNetworkEntityDamage" then
        local victim, attacker, victimDied, weapon = data[1], data[2], data[4], data[7]
        if victimDied then
            
            if IsEntityAPed(victim) and IsEntityAPed(attacker) then
                local pedVictim = tonumber(victim)
                local pedAttacker = tonumber(attacker)
                
                if pedVictim ~= 0 and pedAttacker ~= 0 then
                    killedPedWeapons[pedVictim] = weapon
                end
            end
        end
    end
end)

function TakeCarcass(entity)
    local causeDeath = GetPedCauseOfDeath(entity)
    local weaponHash = GetHashKey(Config.HuntingWeapon)
    if killedPedWeapons[entity] == weaponHash then
        if not hascarcass then
            if not busyTarget then
                busyTarget = true
                local player = PlayerPedId()
                SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
                TaskTurnPedToFaceEntity(player, entity, -1)
                Wait(1500)
                LoadAnim('amb@medic@standing@kneel@base')
                LoadAnim('anim@gangops@facility@servers@bodysearch@')
                TaskPlayAnim(player, 'amb@medic@standing@kneel@base' ,'base' ,8.0, -8.0, -1, 1, 0, false, false, false )
                TaskPlayAnim(player, 'anim@gangops@facility@servers@bodysearch@' ,'player_search' ,8.0, -8.0, -1, 48, 0, false, false, false )
                QBCore.Functions.Progressbar('using_bait', 'Grabbing', math.random(8000, 12000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    busyTarget = false
                    ClearPedTasks(player)
                    TriggerServerEvent('kevin-hunting:getdata', GetEntityModel(entity), NetworkGetNetworkIdFromEntity(entity))
                    Wait(500)
                    DeleteEntity(entity)
                    if entity == huntingAnimal then
                        DeleteEntity(huntingBait)
                        RemoveBlip(baitBlip)
                        RemoveBlip(animalBlip)
                        canPlaceBait = false
                        animalSpooked = false
                        huntingAnimal = nil
                        huntingBait = nil
                        animalBlip = nil
                        baitBlip = nil
                    end
                end, function() -- Cancel
                    busyTarget = false
                    ClearPedTasks(player)
                    QBCore.Functions.Notify('Cancelled', 'error')
                end)
            end
        else
            QBCore.Functions.Notify('You cannot do this..', 'error')
        end
    else
        QBCore.Functions.Notify('Animal was killed with an illegal weapon', 'error')
    end
end

RegisterNetEvent('kevin-hunting:useknife', function ()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local PlayerPeds = {}
    if next(PlayerPeds) == nil then
        for _, activePlayer in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(activePlayer)
            PlayerPeds[#PlayerPeds + 1] = ped
        end
    end
    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
    if closestDistance < 1.5 and closestPed ~= 0 and IsEntityDead(closestPed) and GetPedType(closestPed) ~= 28 then
        if not animalsKilled[closestPed] then
            local chance = math.random(1, 100)
            if chance < Config.AlertChance then
                if Config.Dispatch == 'ps' then
                    exports['ps-dispatch']:BodyLooting()
                else
                    local data = exports['cd_dispatch']:GetPlayerInfo()
                    TriggerServerEvent('cd_dispatch:AddNotification', {
                        job_table = {'police'},
                        coords = data.coords,
                        title = '911 - Body Disection',
                        message = 'There is someone disecting a body..',
                        flash = 0,
                        unique_id = tostring(math.random(0000000,9999999)),
                        blip = {
                            sprite = 310,
                            scale = 1.5,
                            colour = 1,
                            flashes = false,
                            text = '911 - Body Disection',
                            time = (5*60*1000),
                            sound = 1,
                        }
                    })
                end
            end

            SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
            Wait(1500)
            LoadAnim('amb@medic@standing@kneel@base')
            LoadAnim('anim@gangops@facility@servers@bodysearch@')
            TaskPlayAnim(player, 'amb@medic@standing@kneel@base' ,'base' ,8.0, -8.0, -1, 1, 0, false, false, false )
            TaskPlayAnim(player, 'anim@gangops@facility@servers@bodysearch@' ,'player_search' ,8.0, -8.0, -1, 48, 0, false, false, false )
            QBCore.Functions.Progressbar('start_butchering', 'Cutting Open', 6000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                ClearPedTasks(player)
                animalsKilled[closestPed] = true
                TriggerServerEvent('kevin-hunting:giveparts', NetworkGetNetworkIdFromEntity(closestPed))
                if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
                    QBCore.Functions.Notify('Your finger got cut..', 'error', 4500)
                    local pos = GetEntityCoords(player)
                    TriggerServerEvent('evidence:server:CreateFingerDrop', pos)
                end
            end, function() -- Cancel
                ClearPedTasks(player)
                animalsKilled[closestPed] = false
            end)
        else
            QBCore.Functions.Notify('Body already butchered', 'error', 4500)
        end
    end
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == `mp_m_freemode_01` then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function BodyPartsMenu()
    local partsMenu = {
        id = 'item-menu',
        title = 'Sellable Organs',
        options = {}
    }
    local options = {}
    for itemName, v in pairs(Config.BodyParts) do
        local item = QBCore.Functions.HasItem(itemName)
        if item then
            options[#options+1] = {
                title = QBCore.Shared.Items[itemName]['label'],
                description = 'Cost: $'..v.price..' per',
                serverEvent = 'kevin-hunting:sellparts',
                args = {
                    item = QBCore.Shared.Items[itemName]['name'],
                    price = v.price
                }
            }
        end
    end
    partsMenu['options'] = options
    lib.registerContext(partsMenu)
    lib.showContext('item-menu')
end

CreateThread(function()
    while true do
        if LocalPlayer.state['isLoggedIn'] then
            local player = PlayerPedId()
            local Item = QBCore.Functions.HasItem(Config.StoreInfo[1].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[2].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[3].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[4].item)
            if Item then
                if not hasprey1 and not hascarcass then
                    hasprey1 = true
                    hascarcass = true
                    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
                    local forward = GetEntityForwardVector(player)
                    local x, y, z = table.unpack(coords + forward * 0.5)
                    QBCore.Functions.LoadModel(`a_c_deer`)
                    Carcass = CreatePed(28, `a_c_deer`, x, y, z-1, true, true)
                    AttachEntityToEntity(Carcass, player, 11816, 0.3,  0.8, -1.2, -200.0, 30.0, 0.0, false, false, false, true, 2, true)
                    SetEntityInvincible(Carcass, true)
                    SetEntityHealth(Carcass, 0)
                    AnimControls()
                end
            elseif hasprey1 then
                ClearPedTasks(player)
                DeleteEntity(Carcass)
                hascarcass = false
                hasprey1 = false
            end
        end
        Wait(1000)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state['isLoggedIn'] then
            local player = PlayerPedId()
            local Item = QBCore.Functions.HasItem(Config.StoreInfo[13].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[14].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[15].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[16].item)
            if Item then
                if not hasprey2 and not hascarcass then
                    hasprey2 = true
                    hascarcass = true
                    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
                    local forward = GetEntityForwardVector(player)
                    local x, y, z = table.unpack(coords + forward * 0.5)
                    QBCore.Functions.LoadModel(`a_c_mtlion`)
                    Carcass = CreatePed(28, `a_c_mtlion`, x, y, z-1, true, true)
                    AttachEntityToEntity(Carcass, player,11816, 0.1, 0.7, -1.0, -210.0, 0.0, 0.0, false, false, false, true, 2, true)
                    SetEntityInvincible(Carcass, true)
                    SetEntityHealth(Carcass, 0)
                    AnimControls()
                end
            elseif hasprey2 then
                ClearPedTasks(player)
                DeleteEntity(Carcass)
                hascarcass = false
                hasprey2 = false
            end
        end
        Wait(1000)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state['isLoggedIn'] then
            local player = PlayerPedId()
            local Item = QBCore.Functions.HasItem(Config.StoreInfo[9].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[10].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[11].item) or
            QBCore.Functions.HasItem(Config.StoreInfo[12].item)
            if Item then
                if not hasprey3 and not hascarcass then
                    hasprey3 = true
                    hascarcass = true
                    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
                    local forward = GetEntityForwardVector(PlayerPedId())
                    local x, y, z = table.unpack(coords + forward * 0.5)
                    QBCore.Functions.LoadModel(`a_c_boar`)
                    Carcass = CreatePed(28, `a_c_boar`, x, y, z-1, true, true)
                    AttachEntityToEntity(Carcass, player,11816, -0.7, 1.2, -1.0, -200.0, 0.0, 0.0, false, false, false, true, 2, true)
                    SetEntityInvincible(Carcass, true)
                    SetEntityHealth(Carcass, 0)
                    AnimControls()
                end
            elseif hasprey3 then
                ClearPedTasks(player)
                DeleteEntity(Carcass)
                hascarcass = false
                hasprey3 = false
            end
        end
        Wait(1000)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state['isLoggedIn'] then
            local player = PlayerPedId()
            local Item = QBCore.Functions.HasItem(Config.StoreInfo[17].item)
            if Item then
                if not hasprey4 and not hascarcass then
                    hasprey4 = true
                    hascarcass = true
                    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
                    local forward = GetEntityForwardVector(player)
                    local x, y, z = table.unpack(coords + forward * 0.5)
                    QBCore.Functions.LoadModel(`ig_orleans`)
                    Carcass = CreatePed(1, `ig_orleans`, x, y, z, true, true)
                    AttachEntityToEntity(Carcass, player, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
                    LoadAnim('nm')
                    TaskPlayAnim(Carcass, 'nm', 'firemans_carry', 8.0, -8.0, 100000, 2, 0, false, false, false)
                    LoadAnim('missfinale_c2mcs_1')
                    TaskPlayAnim(player, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, 100000, 49, 0, false, false, false)
                    CreateThread( function ()
                        while hasprey4 do
                            if not IsEntityPlayingAnim(player, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 49) then
                                TaskPlayAnim(player, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                            end
                            Wait(1000)
                        end
                    end)
                end
            elseif hasprey4 then
                ClearPedTasks(player)
                DeleteEntity(Carcass)
                hascarcass = false
                hasprey4 = false
            end
        end
        Wait(1000)
    end
end)

function AnimControls()
    CreateThread(function ()
        local player = PlayerPedId()
        local moving = false
        while hascarcass do
            LoadAnim('combat@drag_ped@')
            local pos = GetEntityCoords(player)
            if (IsControlPressed(0, 33) and not moving) then
                moving = true
                SetPedMoveAnimsBlendOut(player)
                TaskPlayAnimAdvanced(player, 'combat@drag_ped@', 'injured_drag_plyr', pos.x, pos.y, pos.z+0.1, 0.0, 0.0, GetEntityHeading(player), 100.0, 0.4, 1.0, 7, 2.0, 1, 1)
                Wait(500)
            elseif (not IsControlPressed(0, 33) and moving) then
                TaskPlayAnimAdvanced(player, 'combat@drag_ped@', 'injured_drag_plyr', pos.x, pos.y, pos.z+0.1, 0.0, 0.0, GetEntityHeading(player), 100.0, 0.4, 1.0, 6, 2.0, 1, 1)
                Wait(500)
                moving = false
            end
            if IsControlPressed(0, 34) then
                SetEntityHeading(player,GetEntityHeading(player) + 1)
            end
            if IsControlPressed(0, 9) then
                SetEntityHeading(player,GetEntityHeading(player) - 1)
            end
            --
            DisableControlAction(0, 21, true) -- Sprinting
            DisableControlAction(0, 22, true) -- Jumping
            DisableControlAction(0, 23, true) -- Vehicle Entering
            DisableControlAction(0, 36, true) -- Ctrl
            DisableControlAction(0, 24, true) -- Disable Attack
            DisableControlAction(0, 25, true) -- Disable Aim
            Wait(7)
        end
    end)
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

CreateThread(function()
    while true do
        local player = PlayerPedId()
        local weaponHash = GetHashKey(Config.HuntingWeapon)
        if GetSelectedPedWeapon(player) == weaponHash then
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if aiming then
                if IsPedAPlayer(targetPed) and GetPedType(targetPed) ~= 28 then
                    DisableControlAction(0, 24, true) -- Disable Attack
                    DisableControlAction(0, 257, true) -- Disable Attack
                    DisableControlAction(0,47,true) -- disable weapon
                    DisableControlAction(0,58,true) -- disable weapon
                end
            end
            if IsPlayerFreeAiming(PlayerId()) then
                DisplaySniperScopeThisFrame()
            end
        end
        Wait(0)
    end
end)