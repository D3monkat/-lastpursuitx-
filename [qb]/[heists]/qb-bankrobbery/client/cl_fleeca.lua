-- New Core and Old Core stuff
if Config.Version == 'new' then

    QBCore = exports['qb-core']:GetCoreObject()

elseif Config.Version == 'old' then

    local QBCore = nil
    CreateThread(function()
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj)QBCore = obj end)
            Wait(200)
        end
    end)
end

-- All The locals
local closestBank = nil
local inRange 
local copsCalled = false

-- All the PD and Job Checks
currentThermiteGate = 0
currentExplosiveGate = 0

CurrentCops = 0

---- FUNCTIONS ----

local function SetupVault(closestBank)
    local chance = math.random(1,100)
    if chance <= Config.FleecaGoldChance then 
        randomStack = 'gold'
    end

    if randomStack == 'gold' then
        cash = CreateObject(GetHashKey('h4_prop_h4_gold_stack_01a'), Config.FleecaBanks[closestBank]['grab']['pos'], 1, 1, 0)
        TriggerServerEvent('qb-bankrobbery:server:grabSync', closestBank, GetHashKey('h4_prop_h4_gold_stack_01a'))
    else
        cash = CreateObject(GetHashKey('h4_prop_h4_cash_stack_01a'), Config.FleecaBanks[closestBank]['grab']['pos'], 1, 1, 0)
        TriggerServerEvent('qb-bankrobbery:server:grabSync', closestBank, GetHashKey('h4_prop_h4_cash_stack_01a'))
    end
    SetEntityHeading(cash, Config.FleecaBanks[closestBank]['grab']['heading'])
    for k,v in pairs(Config.FleecaBanks[closestBank]['trollys']) do
        local TrollyChance = math.random(1,100)
        local loc = Config.FleecaBanks[closestBank]['trollys'][k]['coords']
        if TrollyChance <= Config.FleecaTrollyChance then
            local TrollyLoot = math.random(1,100)
            local randomTrolly
            if TrollyLoot <= Config.FleecaGoldTrollyChance then 
                randomTrolly = 'gold'
            else 
                randomTrolly = 'cash'
            end
            if randomTrolly == 'gold' then
                TrollyObj = CreateObject(2007413986, loc.x, loc.y, loc.z, 1, 0, 0)
                TriggerServerEvent('qb-bankrobbery:server:modelSync', closestBank, k, 2007413986)
            elseif randomTrolly == 'cash' then
                TrollyObj = CreateObject(269934519, loc.x, loc.y, loc.z, 1, 0, 0)
                TriggerServerEvent('qb-bankrobbery:server:modelSync', closestBank, k, 269934519)
            end
            SetEntityHeading(TrollyObj, v['heading'])
        end
    end
end

local function OnHackDone(success)
    if success then
        QBCore.Functions.Notify(Config.Notify['HackerSuccess'], 'success')
        TriggerEvent('qb-bankrobbery:client:SetUpFleeca', closestBank)
        local time = (Config.DoorCD*(60*1000))
        local minutes = math.ceil(time/1000)
        local halftime = minutes/2
        QBCore.Functions.Notify(Config.Notify['DoorMinutes']..minutes..Config.Notify['DoorSecondHalf'], 'success', 5500)
        Wait(time/2)
        QBCore.Functions.Notify(Config.Notify['DoorMinutes']..halftime..Config.Notify['DoorSecondHalf'], 'success', 5500)
        Wait(time/2)
        TriggerServerEvent('qb-bankrobbery:server:setBankState', true, 'fleeca', closestBank)
        TriggerServerEvent('qb-robbery:server:succesHeist', 15)
        TriggerServerEvent('qb-bankrobbery:server:setTimeout', 'fleeca', closestBank)
        SetupVault(closestBank)

        if Config.RemoveLaptop then 
            TriggerServerEvent("QBCore:Server:RemoveItem", "laptop_green", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["laptop_green"], "remove")
        end
    end
end

local function ResetBankDoors()
    for k, v in pairs(Config.FleecaBanks) do
        local object = GetClosestObjectOfType(Config.FleecaBanks[k]["coords"]["x"], Config.FleecaBanks[k]["coords"]["y"], Config.FleecaBanks[k]["coords"]["z"], 5.0, Config.FleecaBanks[k]["object"], false, false, false)
        if not Config.FleecaBanks[k]["isOpened"] then
            SetEntityHeading(object, Config.FleecaBanks[k]["heading"].closed)
        else
            SetEntityHeading(object, Config.FleecaBanks[k]["heading"].open)
        end
    end
    if not Config.PaletoBank["isOpened"] then
        local paletoObject = GetClosestObjectOfType(Config.PaletoBank["coords"]["x"], Config.PaletoBank["coords"]["y"], Config.PaletoBank["coords"]["z"], 5.0, Config.PaletoBank["object"], false, false, false)
        SetEntityHeading(paletoObject, Config.PaletoBank["heading"].closed)
    else
        local paletoObject = GetClosestObjectOfType(Config.PaletoBank["coords"]["x"], Config.PaletoBank["coords"]["y"], Config.PaletoBank["coords"]["z"], 5.0, Config.PaletoBank["object"], false, false, false)
        SetEntityHeading(paletoObject, Config.PaletoBank["heading"].open)
    end

    if not Config.PacificBank["isOpened"] then
        local pacificObject = GetClosestObjectOfType(Config.PacificBank["coords"]["x"], Config.PacificBank["coords"]["y"], Config.PacificBank["coords"]["z"], 20.0, Config.PacificBank["object"], false, false, false)
        SetEntityHeading(pacificObject, Config.PacificBank["heading"].closed)
    else
        local pacificObject = GetClosestObjectOfType(Config.PacificBank["coords"]["x"], Config.PacificBank["coords"]["y"], Config.PacificBank["coords"]["z"], 20.0, Config.PacificBank["object"], false, false, false)
        SetEntityHeading(pacificObject, Config.PacificBank["heading"].open)
    end
end

local function ResetCurrentBank(type, closestBank)
    -- Fleecas
    if type == 'fleeca' then
        Config.FleecaBanks[closestBank]['isOpened'] = false
        Config.FleecaBanks[closestBank]['grab']['loot'] = false
        
        for k,_ in pairs(Config.FleecaBanks[closestBank]['drills']) do
            Config.FleecaBanks[closestBank]['drills'][k]['loot'] = false
        end
        for k,_ in pairs(Config.FleecaBanks[closestBank]['trollys']) do
            Config.FleecaBanks[closestBank]['trollys']['loot'] = false
        end

    -- Paletos
    elseif type == 'paleto' then
        Config.PaletoBank['isOpened'] = false
        Config.PaletoBank['grab']['loot'] = false
        Config.PaletoBank['thermite']['isOpen'] = false
        for k,_ in pairs(Config.PaletoBank['drills']) do
            Config.PaletoBank['drills'][k]['loot'] = false
        end
        for k,_ in pairs(Config.PaletoBank['trollys']) do
            Config.PaletoBank['trollys'][k]['loot'] = false
        end


    -- Pacfic
    
    elseif type == 'pacific' then
        Config.PacificBank['isOpened'] = false
        Config.PacificBank['grab']['loot'] = false
        for k,_ in pairs(Config.PacificBank['drills']) do
            Config.PacificBank['drills'][k]['loot'] = false
        end
        for k,_ in pairs(Config.PacificBank['trollys']) do
            Config.PacificBank['trollys'][k]['loot'] = false
        end
        for k,_ in pairs(Config.PacificBank['thermite']) do
            Config.PacificBank['thermite'][k]['isOpen'] = false
        end


    -- Lowervault
    elseif type == 'lowervault' then
        Config.lowerVault['isOpened'] = false
        for k,_ in pairs(Config.lowerVault['trays']) do
            Config.lowerVault['trays'][k]['loot'] = false
        end
        for k,_ in pairs(Config.lowerVault['grabGold']) do
            Config.lowerVault['grabGold'][k]['loot'] = false
        end
        for k,_ in pairs(Config.lowerVault['grabCash']) do
            Config.lowerVault['grabCash'][k]['loot'] = false
        end
        for k,_ in pairs(Config.lowerVault['doors']) do
            Config.lowerVault['doors'][k]['open'] = false
        end
        for k,_ in pairs(Config.lowerVault['elecbox']) do
         Config.lowerVault['elecbox'][k]['loot'] = false
        end
        for k,_ in pairs(Config.lowerVault['thermite']) do
            Config.lowerVault['thermite'][k]['isOpen'] = false
        end
    end
    ResetBankDoors()
end

-- Pacific
local function OpenPacificDoor()
    local object = GetClosestObjectOfType(Config.PacificBank['coords'].x, Config.PacificBank['coords'].y, Config.PacificBank['coords'].z, 20.0, Config.PacificBank['object'], false, false, false)
    local timeOut = 10
    local entHeading = Config.PacificBank['heading'].closed

    if object ~= 0 then
        CreateThread(function()
            while true do

                if entHeading > Config.PacificBank['heading'].open then
                    SetEntityHeading(object, entHeading - 10)
                    entHeading = entHeading - 1.0
                else
                    break
                end

                Wait(10)
            end
        end)
    end
end

-- Paletos
local function OpenPaletoDoor()
    local object = GetClosestObjectOfType(Config.PaletoBank['coords'].x, Config.PaletoBank['coords'].y, Config.PaletoBank['coords'].z, 5.0, Config.PaletoBank['object'], false, false, false)
    local timeOut = 10
    local entHeading = Config.PaletoBank['heading'].closed

    if object ~= 0 then
        SetEntityHeading(object, Config.PaletoBank['heading'].open)
    end
end

-- Fleecas
local function OpenBankDoor(closestBank)
    local object = GetClosestObjectOfType(Config.FleecaBanks[closestBank]['coords'].x, Config.FleecaBanks[closestBank]['coords'].y, Config.FleecaBanks[closestBank]['coords'].z, 5.0, Config.FleecaBanks[closestBank]['object'], false, false, false)
    local timeOut = 10
    local entHeading = Config.FleecaBanks[closestBank]['heading'].closed
    if object ~= 0 then
        CreateThread(function()
            while true do

                if entHeading ~= Config.FleecaBanks[closestBank]['heading'].open then
                    SetEntityHeading(object, entHeading - 10)
                    entHeading = entHeading - 0.5
                else
                    break
                end

                Wait(10)
            end
        end)
    end
end

-- Open Lower Vault
local function openlowerVault()
    local object = GetClosestObjectOfType(Config.lowerVault['coords'].x, Config.lowerVault['coords'].y, Config.lowerVault['coords'].z, 5.0, Config.lowerVault['object'], false, false, false)
    local timeOut = 10
    local entHeading = Config.lowerVault['heading'].closed
    if object ~= 0 then
        CreateThread(function()
            while true do

                if entHeading < Config.lowerVault['heading'].open then
                    SetEntityHeading(object, entHeading + 10)
                    entHeading = entHeading + 0.5
                else
                    break
                end

                Wait(10)
            end
        end)
    end
end

---- GLOBAL FUNCTIONS ----
function CashAppear(grabModel)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local grabmodel = GetHashKey(grabModel)

    loadModel(grabmodel)
    local grabobj = CreateObject(grabmodel, pedCoords, true)

    FreezeEntityPosition(grabobj, true)
    SetEntityInvincible(grabobj, true)
    SetEntityNoCollisionEntity(grabobj, ped)
    SetEntityVisible(grabobj, false, false)
    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
    local startedGrabbing = GetGameTimer()

    CreateThread(function()
        while GetGameTimer() - startedGrabbing < 37000 do
            Wait(1)
            DisableControlAction(0, 73, true)
            if HasAnimEventFired(ped, GetHashKey('CASH_APPEAR')) then
                if not IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, true, false)
                end
            end
            if HasAnimEventFired(ped, GetHashKey('RELEASE_CASH_DESTROY')) then
                if IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, false, false)
                end
            end
        end
        DeleteObject(grabobj)
    end)
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(50)
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
        Wait(0)
    end
end

---- CREATE THREADS ----
CreateThread(function()
    while true do
        Wait(1000 * 60 * 5)
        if copsCalled then
            copsCalled = false
        end
    end
end)

CreateThread(function()
    Wait(500)
    if QBCore.Functions.GetPlayerData() ~= nil then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = true
    end
end)

--closest hack check
CreateThread(function()
    while true do
        Wait(100)
        local pos = GetEntityCoords(PlayerPedId())
        inRange = false

        for k, v in pairs(Config.FleecaBanks) do
            local dist = #(pos - vector3(Config.FleecaBanks[k]['coords']['x'], Config.FleecaBanks[k]['coords']['y'], Config.FleecaBanks[k]['coords']['z']))
            if dist < 15 then
                closestBank = k
                inRange = true
            end
        end

        if not inRange then
            Wait(2000)
            closestBank = nil
        end
    end
end)

---- JOB CHECKS ----
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    QBCore.Functions.TriggerCallback('qb-bankrobbery:server:GetConfig', function(config)
        Config = config
    end)
    onDuty = true
    ResetBankDoors()
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

---- FLEECA EVENTS ----
-- All Events Client side
RegisterNetEvent('qb-bankrobbery:UseBankLaptop', function(colour, laptopData)
    if colour == 'green' then 
        local ped = PlayerPedId() 
        local pos = GetEntityCoords(ped)
        if closestBank ~= nil then
            QBCore.Functions.TriggerCallback('qb-bankrobbery:server:isRobberyActive', function(isBusy)
                if not isBusy then
                    local dist = #(pos - vector3(Config.FleecaBanks[closestBank]['coords'].x, Config.FleecaBanks[closestBank]['coords'].y, Config.FleecaBanks[closestBank]['coords'].z))
                    if dist < 1.5 then
                        if CurrentCops >= Config.MinimumFleecaPolice then
                            if not Config.FleecaBanks[closestBank]['isOpened'] then
                                SetEntityHeading(ped, Config.FleecaBanks[closestBank]['coords'].w)
                                QBCore.Functions.Progressbar('hack_gate', 'Connecting the laptop..', math.random(5000, 10000), false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = 'anim@gangops@facility@servers@',
                                    anim = 'hotwire',
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    StopAnimTask(PlayerPedId(), 'anim@gangops@facility@servers@', 'hotwire', 1.0)
                                    -- check uses
                                    TriggerServerEvent('qb-bankrobbery:server:RemoveLaptopUse', laptopData)
                                    TriggerEvent('qb-bankrobbery:LaptopFleeca', closestBank)
                                    if not copsCalled then
                                        local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                                        local street1 = GetStreetNameFromHashKey(s1)
                                        local street2 = GetStreetNameFromHashKey(s2)
                                        local streetLabel = street1
                                        if street2 ~= nil then
                                            streetLabel = streetLabel .. ' ' .. street2
                                        end
                                        TriggerServerEvent('qb-bankrobbery:server:callCops', 'small', closestBank, streetLabel, pos)
                                        copsCalled = true
                                    end
                                end, function() -- Cancel
                                    StopAnimTask(PlayerPedId(), 'anim@gangops@facility@servers@', 'hotwire', 1.0)
                                    QBCore.Functions.Notify(Config.Notify['FleecaHackCancel'], 'error')
                                end)
                            else
                                QBCore.Functions.Notify(Config.Notify['BankDoorOpen'], 'error')
                            end
                        else
                            QBCore.Functions.Notify(Config.Notify['NotEnoughPD'], 'error')
                        end
                    end
                else
                    QBCore.Functions.Notify(Config.Notify['BankCoolDown'], 'error', 5500)
                end
            end)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:LaptopFleeca', function()
    local loc = {x,y,z,h}
    loc.x = Config.FleecaBanks[closestBank]['coords'].x
    loc.y = Config.FleecaBanks[closestBank]['coords'].y
    loc.z = Config.FleecaBanks[closestBank]['coords'].z
    loc.h = Config.FleecaBanks[closestBank]['coords'].w

    local animDict = 'anim@heists@ornate_bank@hack'
    RequestAnimDict(animDict)
    RequestModel('hei_prop_hst_laptop')
    RequestModel('hei_p_m_bag_var22_arm_s')

    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded('hei_prop_hst_laptop')
        or not HasModelLoaded('hei_p_m_bag_var22_arm_s') do
        Wait(100)
    end

    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    SetEntityHeading(ped, loc.h)
    local animPos = GetAnimInitialOffsetPosition(animDict, 'hack_enter', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, 'hack_loop', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, 'hack_exit', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), targetPosition, 1, 1, 0)
    local laptop = CreateObject(GetHashKey('hei_prop_hst_laptop'), targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'hack_enter_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, 'hack_enter_laptop', 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'hack_loop_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, 'hack_loop_laptop', 4.0, -8.0, 1)

    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'hack_exit_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, 'hack_exit_laptop', 4.0, -8.0, 1)

    Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    Wait(2000)

    exports['hacking']:OpenHackingGame(Config.FleecaTime, Config.FleecaBlocks, Config.FleecaRepeat, function(Success)
        NetworkStartSynchronisedScene(netScene3)
        NetworkStopSynchronisedScene(netScene3)
        DeleteObject(bag)
        SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
        DeleteObject(laptop)
        FreezeEntityPosition(ped, false)
        OnHackDone(Success)
    end)
end)

RegisterNetEvent('qb-bankrobbery:grabcash', function()
    if not Config.FleecaBanks[closestBank]['grab']['loot'] then
        if Config.FleecaBanks[closestBank]['isOpened'] then
            SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
            LocalPlayer.state:set('inv_busy', true, true) -- Busy
            TriggerServerEvent('qb-bankrobbery:server:lootSync', closestBank, 'grab')
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = ''
            

            local stackModel = Config.FleecaBanks[closestBank]['grab']['model']
            if stackModel == -180074230 then
                animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
                loadAnimDict(animDict)
            else
                animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
                loadAnimDict(animDict)
            end
                    
            loadModel('hei_p_m_bag_var22_arm_s')
            local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
            local sceneObject = GetClosestObjectOfType(Config.FleecaBanks[closestBank]['grab']['pos'], 2.0, stackModel, false, false, false)

            local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)

            local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
            if stackModel == -180074230 then
                NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'grab_gold', 1.0, -1.0, 1148846080)
            else
                NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080)
            end

            local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080)

            NetworkStartSynchronisedScene(scene1)
            Wait(GetAnimDuration(animDict, 'enter') * 1000)
            NetworkStartSynchronisedScene(scene2)
            Wait(GetAnimDuration(animDict, 'grab') * 1000 - 3000)
            DeleteObject(sceneObject)
            NetworkStartSynchronisedScene(scene3)
            Wait(GetAnimDuration(animDict, 'exit') * 1000)        
            ClearPedTasks(ped)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            TriggerServerEvent('qb-bankrobbery:server:FleecaTable', stackModel, 'fleeca', pedCo, closestBank)
            LocalPlayer.state:set('inv_busy', false, true) 
        else 
            QBCore.Functions.Notify(Config.Notify['TableAlreadyLooted'], 'error', 4500)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:loottray', function()
    local ped = PlayerPedId()
    local pedCo = GetEntityCoords(ped)
    for k,v in pairs(Config.FleecaBanks[closestBank]['trollys']) do
        if not v['loot'] then
            if Config.FleecaBanks[closestBank]['isOpened'] then
                local TrayDist = #(pedCo - v['coords'])
                if TrayDist <= 1.5 then
                    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
                    LocalPlayer.state:set('inv_busy', true, true) -- Busy
                    TriggerServerEvent('qb-bankrobbery:server:lootSync', closestBank, 'trollys', k)
                    local ped = PlayerPedId()
                    local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
                    local trollyModel = Config.FleecaBanks[closestBank]['trollys'][k]['model']
                    local animDict = 'anim@heists@ornate_bank@grab_cash'
                    if trollyModel == 881130828 then
                        grabModel = 'ch_prop_vault_dimaondbox_01a'
                    elseif trollyModel == 2007413986 then
                        grabModel = 'ch_prop_gold_bar_01a'
                    else
                        grabModel = 'hei_prop_heist_cash_pile'
                    end
                    loadAnimDict(animDict)
                    loadModel('hei_p_m_bag_var22_arm_s')

                    sceneObject = GetClosestObjectOfType(Config.FleecaBanks[closestBank]['trollys'][k]['coords'], 2.0, trollyModel, 0, 0, 0)
                    bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, true, false, false)

                    while not NetworkHasControlOfEntity(sceneObject) do
                        Wait(1)
                        NetworkRequestControlOfEntity(sceneObject)
                    end

                    scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'intro', 1.5, -4.0, 1, 16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 4.0, -8.0, 1)

                    scene2 =  NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 1.5, -4.0, 1, 16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_grab', 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'cart_cash_dissapear', 4.0, -8.0, 1)

                    scene3 =  NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'exit', 1.5, -4.0, 1, 16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_exit', 4.0, -8.0, 1)

                    NetworkStartSynchronisedScene(scene1)
                    Wait(1750)
                    CashAppear(grabModel)
                    NetworkStartSynchronisedScene(scene2)
                    Wait(37000)
                    NetworkStartSynchronisedScene(scene3)
                    Wait(2000)

                    local emptyobj = 769923921
                    newTrolly = CreateObject(emptyobj, Config.FleecaBanks[closestBank]['trollys'][k]['coords'], true, false, false)
                    SetEntityRotation(newTrolly, 0, 0, GetEntityHeading(sceneObject), 1, 0)
                    DeleteObject(sceneObject)
                    DeleteObject(bag)
                    SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                    TriggerServerEvent('qb-bankrobbery:server:GetTrolleyLoot', grabModel, 'fleeca', pedCo, closestBank)
                    LocalPlayer.state:set('inv_busy', false, true) -- Not Busy

                end
            else 
                QBCore.Functions.Notify(Config.Notify['TrayAlreadyLooted'], 'error', 4500) 
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:DepositBox', function()
    local ped = PlayerPedId()
    local pedCo = GetEntityCoords(ped)
    for k,v in pairs(Config.FleecaBanks[closestBank]['drills']) do
        if Config.FleecaBanks[closestBank]['isOpened'] then
            if not v['loot'] then
                local drillDist = #(pedCo - v['coords'])
                if drillDist <= 1.0 then
                    QBCore.Functions.TriggerCallback('qb-Bankrobbery:server:GetItemsNeeded', function(hasItem)
                        if hasItem then
                            SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
                            LocalPlayer.state:set('inv_busy', true, true) -- Busy
                            TriggerServerEvent('qb-bankrobbery:server:lootSync', closestBank, 'drills', k)
                            local coords, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
                            local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@'
                            loadAnimDict(animDict)
                            local bagModel = 'hei_p_m_bag_var22_arm_s'
                            loadModel(bagModel)
                            local laserDrillModel = 'hei_prop_heist_drill'
                            loadModel(laserDrillModel)

                            RequestAmbientAudioBank('DLC_HEIST_FLEECA_SOUNDSET', 0)
                            RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL', 0)
                            RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL_2', 0)

                            soundId = GetSoundId()

                            cam = CreateCam('DEFAULT_ANIMATED_CAMERA', true)
                            SetCamActive(cam, true)
                            RenderScriptCams(true, 0, 3000, 1, 0)

                            bag = CreateObject(GetHashKey(bagModel), coords, 1, 0, 0)
                            laserDrill = CreateObject(GetHashKey(laserDrillModel), coords, 1, 0, 0)
                            
                            vaultPos = Config.FleecaBanks[closestBank]['drills'][k]['coords']
                            vaultRot = Config.FleecaBanks[closestBank]['drills'][k]['rotation']

                            scene1 = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                            NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'intro', 4.0, -4.0, 1033, 0, 1000.0, 0)
                            NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 1.0, -1.0, 1148846080)
                            NetworkAddEntityToSynchronisedScene(laserDrill, scene1, animDict, 'intro_drill_bit', 1.0, -1.0, 1148846080)

                            scene2 = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                            NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'drill_straight_start', 4.0, -4.0, 1033, 0, 1000.0, 0)
                            NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_drill_straight_start', 1.0, -1.0, 1148846080)
                            NetworkAddEntityToSynchronisedScene(laserDrill, scene2, animDict, 'drill_straight_start_drill_bit', 1.0, -1.0, 1148846080)

                            scene3 = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                            NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'drill_straight_end_idle', 4.0, -4.0, 1033, 0, 1000.0, 0)
                            NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_drill_straight_end_idle', 1.0, -1.0, 1148846080)
                            NetworkAddEntityToSynchronisedScene(laserDrill, scene3, animDict, 'drill_straight_end_idle_drill_bit', 1.0, -1.0, 1148846080)

                            scene4 = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                            NetworkAddPedToSynchronisedScene(ped, scene4, animDict, 'drill_straight_fail', 4.0, -4.0, 1033, 0, 1000.0, 0)
                            NetworkAddEntityToSynchronisedScene(bag, scene4, animDict, 'bag_drill_straight_fail', 1.0, -1.0, 1148846080)
                            NetworkAddEntityToSynchronisedScene(laserDrill, scene4, animDict, 'drill_straight_fail_drill_bit', 1.0, -1.0, 1148846080)

                            scene5 = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                            NetworkAddPedToSynchronisedScene(ped, scene5, animDict, 'drill_straight_end', 4.0, -4.0, 1033, 0, 1000.0, 0)
                            NetworkAddEntityToSynchronisedScene(bag, scene5, animDict, 'bag_drill_straight_end', 1.0, -1.0, 1148846080)
                            NetworkAddEntityToSynchronisedScene(laserDrill, scene5, animDict, 'drill_straight_end_drill_bit', 1.0, -1.0, 1148846080)

                            scene6 = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                            NetworkAddPedToSynchronisedScene(ped, scene6, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)
                            NetworkAddEntityToSynchronisedScene(bag, scene6, animDict, 'bag_exit', 1.0, -1.0, 1148846080)
                            NetworkAddEntityToSynchronisedScene(laserDrill, scene6, animDict, 'exit_drill_bit', 1.0, -1.0, 1148846080)

                            NetworkStartSynchronisedScene(scene1)
                            PlayCamAnim(cam, 'intro_cam', animDict, vaultPos, vaultRot, 0, 2)
                            Wait(GetAnimDuration(animDict, 'intro') * 1000)
                            
                            NetworkStartSynchronisedScene(scene2)
                            PlayCamAnim(cam, 'drill_straight_start_cam', animDict, vaultPos, vaultRot, 0, 2)
                            
                            NetworkStartSynchronisedScene(scene3)
                            PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, vaultPos, vaultRot, 0, 2)
                            PlaySoundFromEntity(soundId, 'Drill', laserDrill, 'DLC_HEIST_FLEECA_SOUNDSET', 1, 0)
                            TriggerEvent('Drilling:Start',function(success)
                                if success then
                                    StopSound(soundId)
                                    NetworkStartSynchronisedScene(scene5)
                                    PlayCamAnim(cam, 'drill_straight_end_cam', animDict, vaultPos, vaultRot, 0, 2)
                                    Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000)
                                    NetworkStartSynchronisedScene(scene6)
                                    PlayCamAnim(cam, 'exit_cam', animDict, vaultPos, vaultRot, 0, 2)
                                    Wait(GetAnimDuration(animDict, 'exit') * 1000)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    DestroyCam(cam, false)
                                    ClearPedTasks(ped)
                                    DeleteObject(bag)
                                    DeleteObject(laserDrill)
                                    SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                                    LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
                                    TriggerServerEvent('qb-bankrobbery:server:drillLoot', 'fleeca', pedCo, closestBank)
                                else
                                    StopSound(soundId)
                                    NetworkStartSynchronisedScene(scene4)
                                    PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, vaultPos, vaultRot, 0, 2)
                                    Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    DestroyCam(cam, false)
                                    ClearPedTasks(ped)
                                    DeleteObject(bag)
                                    DeleteObject(laserDrill)
                                    SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                                    TriggerServerEvent('qb-bankrobbery:server:lootSync', closestBank, 'drills', k)
                                    grabNow = false
                                    LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
                                    TriggerServerEvent('qb-bankrobbery:server:drilldamaged')
                                end
                            end)
                        else 
                            QBCore.Functions.Notify(Config.Notify['MissingDrill'], 'error', 4500)
                        end
                    end, Config.LockerRequired)
                end
            else
                QBCore.Functions.Notify(Config.Notify['AlreadyDrilled'], 'error')
            end
        else
            QBCore.Functions.Notify(Config.Notify['BankOpen'], 'error', 4500)
        end
    end
end)

---- BANK STATES ----
RegisterNetEvent('qb-bankrobbery:client:setBankState', function(bankId, state)
    if bankId == 'paleto' then
        Config.PaletoBank['isOpened'] = state
        if state then
            OpenPaletoDoor()
        end
    elseif bankId == 'pacific' then
        Config.PacificBank['isOpened'] = state
        if state then
            OpenPacificDoor()
        end
    elseif bankId == 'lowerVault' then
        Config.lowerVault['isOpened'] = state
        if state then
            openlowerVault()
        end
    else
        Config.FleecaBanks[bankId]['isOpened'] = state
        if state then
            OpenBankDoor(bankId)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:client:ResetCurrentBank', function(type, closestBank)
    ResetCurrentBank(type, closestBank)
end)

---- LOOT SYNCS ----
RegisterNetEvent('qb-bankrobbery:client:lootSync', function(closestBank, type, k)
    if k then 
        Config.FleecaBanks[closestBank][type][k]['loot'] = not Config.FleecaBanks[closestBank][type][k]['loot']
    else
        Config.FleecaBanks[closestBank][type]['loot'] = not Config.FleecaBanks[closestBank][type]['loot']
    end
end)

RegisterNetEvent('qb-bankrobbery:client:grabSync', function(closestBank, model)
    Config.FleecaBanks[closestBank]['grab']['model'] = model
end)

RegisterNetEvent('qb-bankrobbery:client:modelSync', function(closestBank, k, model)
    Config.FleecaBanks[closestBank]['trollys'][k]['model'] = model
end)

---- POLICE BANK EVENTS ----
RegisterNetEvent('qb-bankrobbery:client:OpenFleeca', function()
    TriggerServerEvent('qb-bankrobbery:server:setBankState', true, 'fleeca', closestBank)
end)

RegisterNetEvent('qb-bankrobbery:client:CloseFleeca', function()
    TriggerServerEvent('qb-bankrobbery:server:setBankState', false, 'fleeca', closestBank)
    Wait(750)
    ResetBankDoors()
end)

RegisterNetEvent('qb-bankrobbery:client:OpenPaleto', function()
    TriggerServerEvent('qb-bankrobbery:server:setBankState', true, 'paleto')
end)

RegisterNetEvent('qb-bankrobbery:client:ClosePaleto', function()
    TriggerServerEvent('qb-bankrobbery:server:setBankState', false, 'paleto')
    Wait(750)
    ResetBankDoors()
end)

RegisterNetEvent('qb-bankrobbery:client:OpenPacific', function()
    TriggerServerEvent('qb-bankrobbery:server:setBankState', true, 'pacific')
end)

RegisterNetEvent('qb-bankrobbery:client:ClosePacific', function()
    TriggerServerEvent('qb-bankrobbery:server:setBankState', false, 'pacific')
    Wait(750)
    ResetBankDoors()
end)


-- USE FOR LATER --
--QBCore.Functions.TriggerCallback("bankrobbery:getclothes", function(result)
--if json.decode(result).bag.item == 44 or json.decode(result).bag.item == 45 then
--    BankRobbery()
--else
--    QBCore.Functions.Notify("You don't have a bag", 'error')
--end
--end)


RegisterCommand("bagtest", function(source, args, rawCommand)
    local ped = PlayerPedId()
    SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
    -- normal function handling here
end, false) -- set this to false to allow anyone.

RegisterCommand("resetbag", function(source, args, rawCommand)
    local ped = PlayerPedId()
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    -- normal function handling here
end, false) -- set this to false to allow anyone.