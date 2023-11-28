Towers = {}

local rightToRepair = false

RegisterNetEvent("SonoranRadio::AuthorizeTowers")
AddEventHandler("SonoranRadio::AuthorizeTowers", function()
	DebugPrint("Authorized for Tower Repair")
	rightToRepair = true
end)

function GetDistance(dist1, dist2)
    local dist = #(dist1 - dist2)
    return dist
end
function LoadModelSync(model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1) end
end

local function GetTowerFromId(id)
    for i = 1, #Towers do
        if Towers[i].Id == id then
            return Towers[i]
        end
    end
end
local function GetTowerCoords(tower)
    if DoesEntityExist(tower.Handle) then
        return GetOffsetFromEntityInWorldCoords(tower.Handle, 0.0, 0.0, 1.0)
    else
        return tower.PropPosition
    end
end
-- returns a value from 0-1 representing the percentage of active dishes
local function GetTowerCapacity(tower)
    if #tower.DishStatus < 1 then
        return 1.0
    end

    local n = 0.0
    for i = 1, #tower.DishStatus do
        if tower.DishStatus[i] == 'alive' then
            n = n + 1.0
        end
    end
    return n / #tower.DishStatus
end

local function AddTowerRange(t)
    if not Config.debug then return end
    -- create a radius blip that indicates the range of the tower (where edge of circle = 50% capacity)
    local blip = AddBlipForRadius(t.PropPosition.x, t.PropPosition.y, t.PropPosition.z, t.Range * 0.7937)
    SetBlipAlpha(blip, 127)
    SetBlipColour(blip, 3)
end


-- creates one dish on a tower
local function CreateTowerDish(tower, index, n)
    local dishModel = GetHashKey("sonoran")
    LoadModelSync(dishModel)

    local spawnPos = GetEntityCoords(tower.Handle)
    local dishHndl = CreateVehicle(dishModel, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, false, false)
    SetEntityAsMissionEntity(dishHndl, true, true)
    FreezeEntityPosition(dishHndl, true)
    if tower.Destruction then
        SetVehicleStrong(dishHndl, true)
    else
        -- turning each dish invincible will make it impossible to destroy the dishes
        -- in turn, disabling tower destruction
        SetEntityInvincible(dishHndl, true)
    end

    -- set the decorator to "1" to alert lower functions that this is a dish
    -- NOTE: later, this is set to 0 when the dish is killed. this is so that the dish doesn't get "destroyed" when it's killed
    DecorSetInt(dishHndl, "sonrad_dish", 1)

    local theta = ((index - 1) * math.pi * 2) / n
    -- in a normal unit circle, cos is x and sin is y. however, we need y to be the forward direction (and 1 @ theta=0.0)
    -- so we do some unconventional stuff here to ascertain the offsets
    local offx = -math.sin(theta) * 1.6
    local offy = math.cos(theta) * 1.6

    local zRot = (theta * 180.0 / math.pi)
    AttachEntityToEntity(dishHndl, tower.Handle, -1, offx, offy, 11.7, 0.0, 0.0, zRot, false, false, true, false, 0, true)

    SetModelAsNoLongerNeeded(dishModel)
    if not tower.Dishes then tower.Dishes = {} end
    if DoesEntityExist(tower.Dishes[index]) then
        DeleteEntity(tower.Dishes[index])
    end
    tower.Dishes[index] = dishHndl
end
-- syncs the dead/alive state of dishes to their physical vehicles
local function SyncDishStatus(tower, playSound)
    for i = 1, #tower.Dishes do
        local dish = tower.Dishes[i]
        local dead = IsEntityDead(dish)

        if tower.DishStatus[i] ~= 'alive' and not dead then
            NetworkExplodeVehicle(dish, false, false)
            DecorSetInt(dish, "sonrad_dish", 0)
            -- play a power-down sound for the player
            if playSound then
                local coords = GetEntityCoords(dish)
                PlaySoundFromCoord(-1, "Power_Down", coords, "DLC_HEIST_HACKING_SNAKE_SOUNDS", 0, 80)
            end
        elseif tower.DishStatus[i] == 'alive' and dead then
            CreateTowerDish(tower, i, #tower.DishStatus)
            if playSound then
                local coords = GetEntityCoords(dish)
                PlaySoundFromCoord(-1, "Success", coords, "DLC_HEIST_HACKING_SNAKE_SOUNDS", 0, 80)
            end
        end
    end
end

local function CreateTowerLadder(tower)
    -- if the tower isn't aligned almost straight up, then omit the ladder
    -- this is because GTA will be weird if going up a ladder rotated in x or y directions
    if #GetEntityRotation(tower.Handle, 0).xy > 2.0 then
        return
    end

    if DoesEntityExist(tower.Ladder) then DeleteEntity(tower.Ladder) end
    local model = GetHashKey("prop_radio_tower_ladder")
    LoadModelSync(model)

    local off = GetOffsetFromEntityInWorldCoords(tower.Handle, 0.0, 0.3, -0.4)
    local ladder = CreateObject(model, off.x, off.y, off.z, false, false, false)

    AttachEntityToEntity(ladder, tower.Handle, -1, 0.0, 0.3, 10.45, 0.0, 0.0, 285.0, false, false, true, false, 5, true)

    tower.Ladder = ladder
    SetModelAsNoLongerNeeded(model)
end
-- fully creates a tower based on the given tower object
local function CreateTower(tower)
    if DoesEntityExist(tower.Handle) then DeleteEntity(tower.Handle) end
    local towerModel = GetHashKey("prop_radio_tower")
    LoadModelSync(towerModel)

    local coords = tower.PropPosition
    tower.Handle = CreateObject(towerModel, coords, false, false, false)
    while not DoesEntityExist(tower.Handle) do Wait(0) end
    FreezeEntityPosition(tower.Handle, true)
    SetEntityCoords(tower.Handle, coords.x, coords.y, coords.z - 1, true, true, true, false)
    PlaceObjectOnGroundProperly(tower.Handle)

    SetModelAsNoLongerNeeded(towerModel)

    -- spawn the dishes and ladder for the tower
    for i = 1, #tower.DishStatus do
        CreateTowerDish(tower, i, #tower.DishStatus)
    end
    SyncDishStatus(tower, false)
    CreateTowerLadder(tower)
    tower.Spawned = true
end
-- delete the physical tower entities
local function DestroyTower(tower)
    if DoesEntityExist(tower.Handle) then
        DeleteEntity(tower.Handle)
    end
    if DoesEntityExist(tower.Ladder) then
        DeleteEntity(tower.Ladder)
    end
    local n = tower.Dishes and #tower.Dishes or 0
    for j = 1, n do
        DeleteEntity(tower.Dishes[j])
    end
    tower.Dishes = {}
    tower.Spawned = false
end

RegisterNetEvent("RadioTower:SyncTowers")
AddEventHandler("RadioTower:SyncTowers", function(towers)
    -- make sure all towers are cleared before we sync
    for i = 1, #Towers do DestroyTower(Towers[i]) end

    Towers = towers
    for i = 1, #Towers do
        AddTowerRange(Towers[i])
    end
    DebugPrint(("synced %s"):format(json.encode(towers)))
end)

RegisterNetEvent('RadioTower:SyncOneTower')
AddEventHandler('RadioTower:SyncOneTower', function(towerId, tower)
    for i = 1, #Towers do
        if Towers[i].Id == towerId then
            DestroyTower(Towers[i])
            Towers[i] = tower
            DebugPrint('synced tower', towerId)
            break
        end
    end
end)

RegisterNetEvent("RadioTower:SpawnTower")
AddEventHandler("RadioTower:SpawnTower", function(tower)
    DebugPrint(("spawned %s"):format(json.encode(tower)))
    table.insert(Towers, tower)
    AddTowerRange(tower)
    DebugPrint('new tower spawned', tower.Id)
end)

RegisterNetEvent('RadioTower:SetDishStatus')
AddEventHandler('RadioTower:SetDishStatus', function(towerId, dishStatus)
    local tower = GetTowerFromId(towerId)
    if not tower then return end
    tower.DishStatus = dishStatus
    SyncDishStatus(tower, true)
end)

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(10)
    end
    TriggerServerEvent("RadioTower:clientTowerSync")
    while #Towers == 0 do Wait(50) end

    DecorRegister("sonrad_dish", 3)
    while true do
        local pCoords = GetEntityCoords(GetPlayerPed(-1))
        local quality = 0.0
        for i = 1, #Towers do
            local tower = Towers[i]
            local d = #(GetTowerCoords(tower) - pCoords)
            -- if the player is within range (750m), then spawn a physical tower
            local physical = not Config.noPhysicalTowers and not tower.NotPhysical
            if d < 750.0 and not tower.Spawned and physical then
                CreateTower(tower)
                DebugPrint(("spawn physical tower (%f) %s"):format(d, tower.Id))
            elseif d >= 750.0 and tower.Spawned then
                DestroyTower(tower)
                DebugPrint(("destroy physical tower (%f) %s"):format(d, tower.Id))
            end

            -- recreate the tower completely if anything is missing
            -- NOTE: not including the ladder, as it will be omitted on certain conditions
            local recreate = tower.Spawned and not DoesEntityExist(tower.Handle)
            local n = tower.Dishes and #tower.Dishes or 0
            for j = 1, n do
                if not recreate then
                    recreate = not DoesEntityExist(tower.Dishes[j])
                end
            end
            if recreate then
                DebugPrint(("tower:%s component missing, recreating"):format(tower.Id))
                -- CreateTower will automatically delete old entities
                CreateTower(tower)
                SyncDishStatus(tower, false)
            end

            -- if tower is out of range, then just ignore it
            if d > tower.Range then goto continue end

            local tQuality = (1.0 - (d / tower.Range)) * GetTowerCapacity(tower)
            if quality < tQuality then quality = tQuality end
            ::continue::
        end

        if quality == 0.0 then
            DebugPrint("closest tower out of range")
        else
            DebugPrint(('best tower quality:%.4f'):format(quality))
        end
        SendNUIMessage({
            type = 'setTowerQuality',
            state = { tower_quality = quality }
        })
        Wait(3000)
    end
end)

local function RepairTower(tower)
    if rightToRepair then
        local ped = GetPlayerPed(-1)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)

        local start = GetGameTimer()
        -- watch WASD keys, and if pressed then cancel repair
        local controls = {32, 33, 34, 35}
        while (start + (Config.towerRepairTimer or 20) * 1000) > GetGameTimer() do
            for _, c in ipairs(controls) do
                if IsControlPressed(0, c) then
                    ClearPedTasksImmediately(ped)
                    return
                end
            end
            Wait(0)
        end

        ClearPedTasksImmediately(ped)

        -- recreate the dishes so they don't accidentally repair the tower twice
        -- waiting for the event to propogate
        TriggerServerEvent('RadioTower:RepairTower', tower.Id)
    else
		SendNotification("Radio: ~r~No Repair Permission~r~")
	end
end

CreateThread(function()
    while true do
        -- get the closest (spawned) tower
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local tower, d
        for i = 1, #Towers do
            local t = Towers[i]
            if t.Spawned then
                local td = #(GetTowerCoords(t) - coords)
                if d == nil or td < d then
                    tower = t
                    d = td
                end
            end
        end

        if tower ~= nil and d < 2.0 and GetTowerCapacity(tower) < 1.0 then
            BeginTextCommandDisplayHelp("STRING")
            AddTextComponentSubstringPlayerName("Press ~INPUT_DETONATE~ to repair this tower.")
            EndTextCommandDisplayHelp(0, false, true, -1)

            DisableControlAction(0, 47, true)
            if IsDisabledControlJustReleased(0, 47) then
                RepairTower(tower)
            end

            Wait(0)
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        for i = 1, #Towers do
            local tower = Towers[i]
            local n = tower.Dishes and #tower.Dishes or 0
            for j = 1, n do
                local e = tower.Dishes[j]
                if DecorGetInt(e, 'sonrad_dish') ~= 1 then goto continue end
                if not IsEntityDead(e) then
                    -- make sure it doesn't explode from gunshots
                    SetVehiclePetrolTankHealth(e, 1000.0)
                end

                local health = GetVehicleBodyHealth(e)
                if health > 500.0 then goto continue end

                -- here we kill the dish
                DecorSetInt(e, "sonrad_dish", 0)
                DebugPrint("sending dish destroyed server event")
                TriggerServerEvent('RadioTower:KillDish', tower.Id, j)
                ::continue::
            end
        end
        Wait(250)
    end
end)

-- cleanup towers on stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for i = 1, #Towers do
        DestroyTower(Towers[i])
    end
    -- make sure the thread doesn't re-spawn them
    Towers = {}
end)
