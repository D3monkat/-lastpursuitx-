CurrentCops = 0

local function LaptopAnimationPaleto()
    local loc = {x,y,z,h}
    loc.x = Config.PaletoBank['coords'].x
    loc.y = Config.PaletoBank['coords'].y
    loc.z = Config.PaletoBank['coords'].z+0.1
    loc.h = Config.PaletoBank['coords'].w

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

    --hack between laptop placed and hack exit
    exports['hacking']:OpenHackingGame(Config.PaletoTime, Config.PaletoBlocks, Config.PaletoRepeat, function(Success)
        NetworkStartSynchronisedScene(netScene3)
        NetworkStopSynchronisedScene(netScene3)
        DeleteObject(bag)
        DeleteObject(laptop)
        FreezeEntityPosition(ped, false)
        OnHackDonePaleto(Success)
    end)
end

RegisterNetEvent('qb-bankrobbery:paleto:thermitedoor', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    for k,v in pairs(Config.PaletoBank['thermite']) do
        local Dist = #(coords - vector3(v['coords'].x, v['coords'].y, v['coords'].z))
        if Dist <= 1.5 then
            QBCore.Functions.TriggerCallback('qb-Bankrobbery:server:GetItemsNeeded', function(hasItem)
                if hasItem then
                    SetEntityHeading(ped, Config.PaletoBank['thermite'][k]['coords'].w)
                    TriggerServerEvent('qb-bankrobbery:server:RemovePaletoDoorItem')
                    exports['memorygame']:thermiteminigame(Config.CorrectBlocks, Config.IncorrectBlocks, Config.TimeToShow, Config.TimeToLose,
                    function() -- success
                        QBCore.Functions.Notify(Config.Notify["PlacingThermite"], 'success', 4500)
                        local loc = Config.PaletoBank['thermite'][k]['anim']
                        local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(ped)))
                        local bagscene = NetworkCreateSynchronisedScene(loc.x, loc.y, loc.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
                        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), loc.x, loc.y, loc.z,  true,  true, false)
                        SetEntityCollision(bag, false, true)
                        NetworkAddPedToSynchronisedScene(ped, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 1.5, -4.0, 1, 16, 1148846080, 0)
                        NetworkAddEntityToSynchronisedScene(bag, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'bag_thermal_charge', 4.0, -8.0, 1)
                        NetworkStartSynchronisedScene(bagscene)
                        Wait(1500)
                        local x, y, z = table.unpack(GetEntityCoords(ped))
                        local thermal_charge = CreateObject(GetHashKey('hei_prop_heist_thermite'), x, y, z + 0.2,  true,  true, true)
                    
                        SetEntityCollision(thermal_charge, false, true)
                        AttachEntityToEntity(thermal_charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
                        Wait(4000)

                        TriggerServerEvent('QBCore:Server:RemoveItem', 'thermite', 1)
                        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['thermite'], 'remove')
                    
                        DetachEntity(thermal_charge, 1, 1)
                        FreezeEntityPosition(thermal_charge, true)
                        Wait(100)
                        DeleteObject(bag)
                        ClearPedTasks(ped)
                    
                        Wait(100)
                        RequestNamedPtfxAsset('scr_ornate_heist')
                        while not HasNamedPtfxAssetLoaded('scr_ornate_heist') do
                            Wait(1)
                        end

                        ptfx = vector3(Config.PaletoBank['thermite'][k]['effect'].x, Config.PaletoBank['thermite'][k]['effect'].y, Config.PaletoBank['thermite'][k]['effect'].z)
                        SetPtfxAssetNextCall('scr_ornate_heist')
                        local effect = StartParticleFxLoopedAtCoord('scr_heist_ornate_thermal_burn', ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                        Wait(3000)
                        StopParticleFxLooped(effect, 0)
                        DeleteObject(thermal_charge)

                        if Config.Doorlocks == "qb" then 
                            TriggerServerEvent('qb-doorlock:server:updateState', Config.DoorlockID1, false)
                        elseif Config.Doorlocks == "nui" or Config.Doorlocks == "NUI" then 
                            TriggerServerEvent('nui_doorlock:server:updateState', Config.DoorlockID1, false, false, false, true)
                        end
                    end,
                    function() -- failure
                        QBCore.Functions.Notify(Config.Notify["FleecaHackFail"], 'error', 4500)

                    end)
                else
                    QBCore.Functions.Notify(Config.Notify["MissingThermite"], 'error')
                end
            end, Config.PaletoPacificDoor)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:UseBankLaptop', function(colour, laptopData)
    if colour == 'blue' then 
        local ped = PlayerPedId() 
        local pos = GetEntityCoords(ped)
        QBCore.Functions.TriggerCallback('qb-bankrobbery:server:isRobberyActive', function(isBusy)
            if not isBusy then
                local dist = #(pos - vector3(Config.PaletoBank['coords'].x, Config.PaletoBank['coords'].y, Config.PaletoBank['coords'].z))
                if dist < 2.5 then
                    if CurrentCops >= Config.MinimumFleecaPolice then
                        if not Config.PaletoBank['isOpened'] then
                            --SetEntityCoords(ped, Config.PaletoBank['coords'])
                            SetEntityHeading(ped, Config.PaletoBank['coords'].w)
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
                            
                                if not copsCalled then
                                    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                                    local street1 = GetStreetNameFromHashKey(s1)
                                    local street2 = GetStreetNameFromHashKey(s2)
                                    local streetLabel = street1
                                    if street2 ~= nil then
                                        streetLabel = streetLabel .. ' ' .. street2
                                    end
                                    TriggerServerEvent('qb-bankrobbery:server:callCops', 'paleto', 0, streetLabel, pos)
                                    copsCalled = true
                                end
                                LaptopAnimationPaleto()
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
end)

RegisterNetEvent('qb-bankrobbery:UsePaletoCard', function()
    local ped = PlayerPedId() 
    local pos = GetEntityCoords(ped)
    local dist = #(pos - vector3(Config.PaletoBank['coords'].x, Config.PaletoBank['coords'].y, Config.PaletoBank['coords'].z))
    if dist < 2.5 then
        if CurrentCops >= Config.MinimumFleecaPolice then
            SetEntityHeading(ped, Config.PaletoBank['coords'].w)
            QBCore.Functions.Progressbar('BankCard_Ting', 'Using BankCard', math.random(5000, 10000), false, true, {
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
                exports['memorygame']:thermiteminigame(Config.CorrectBlocks, Config.IncorrectBlocks, Config.TimeToShow, Config.TimeToLose,
                function() -- success
                    if Config.Doorlocks == "qb" then 
                        TriggerServerEvent('qb-doorlock:server:updateState', Config.DoorlockID2, false)
                    elseif Config.Doorlocks == "nui" or Config.Doorlocks == "NUI" then 
                        TriggerServerEvent('nui_doorlock:server:updateState', Config.DoorlockID2, false, false, false, true)
                    end

                    if Config.RemoveCard then 
                        TriggerServerEvent("QBCore:Server:RemoveItem", "security_card_01", 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["security_card_01"], "remove")
                    end
                end)
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'anim@gangops@facility@servers@', 'hotwire', 1.0)
                QBCore.Functions.Notify(Config.Notify['FleecaHackCancel'], 'error')
            end)
        else
            QBCore.Functions.Notify(Config.Notify['NotEnoughPD'], 'error')
        end
    end
end)

function OnHackDonePaleto(success)
    if success then
        SetUpPaleto()
        QBCore.Functions.Notify(Config.Notify['HackerSuccess'], 'success')
        local time = (Config.DoorCD*(60*1000))
        local minutes = math.ceil(time/1000)
        local halftime = minutes/2
        QBCore.Functions.Notify(Config.Notify['DoorMinutes']..minutes..Config.Notify['DoorSecondHalf'], 'success', 5500)
        Wait(time/2)
        QBCore.Functions.Notify(Config.Notify['DoorMinutes']..halftime..Config.Notify['DoorSecondHalf'], 'success', 5500)
        Wait(time/2)
        TriggerServerEvent('qb-bankrobbery:server:setBankState', true, 'paleto', 0)
        TriggerServerEvent('qb-robbery:server:succesHeist', 25)
        TriggerServerEvent('qb-bankrobbery:server:setTimeout', 'paleto')

        if Config.RemoveLaptop then 
            TriggerServerEvent("QBCore:Server:RemoveItem", "laptop_blue", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["laptop_blue"], "remove")
        end
    end
end

RegisterNetEvent('qb-bankrobbery:client:paleto:lootSync', function(type, k)
    if k then 
        Config.PaletoBank[type][k]['loot'] = not Config.PaletoBank[type][k]['loot']
    else
        Config.PaletoBank[type]['loot'] = not Config.PaletoBank[type]['loot']
    end
end)

function SetUpPaleto()
    local chance = math.random(1,100)
    
    if chance <= Config.PaletoGoldChance then 
        randomStack = 'gold'
    end

    if randomStack == 'gold' then
        cash = CreateObject(GetHashKey('h4_prop_h4_gold_stack_01a'), Config.PaletoBank['grab']['pos'], 1, 1, 0)
        TriggerServerEvent('qb-bankrobbery:server:paleto:grabSync', GetHashKey('h4_prop_h4_gold_stack_01a'))
    else
        cash = CreateObject(GetHashKey('h4_prop_h4_cash_stack_01a'), Config.PaletoBank['grab']['pos'], 1, 1, 0)
        TriggerServerEvent('qb-bankrobbery:server:paleto:grabSync', GetHashKey('h4_prop_h4_cash_stack_01a'))
    end
    SetEntityHeading(cash, Config.PaletoBank['grab']['heading'])
    for k,v in pairs(Config.PaletoBank['trollys']) do
        local TrollyChance = math.random(1,100)
        local loc = Config.PaletoBank['trollys'][k]['coords']
        if TrollyChance <= Config.PaletoTrollyChance then
            local TrollyLoot = math.random(1,100)
            local randomTrolly
            if TrollyLoot <= Config.PaletoGoldTrollyChance then 
                randomTrolly = 'gold'
            else 
                randomTrolly = 'cash'
            end
            if randomTrolly == 'gold' then
                trollyObj = CreateObject(2007413986, v['coords'], 1, 0, 0)
                TriggerServerEvent('qb-bankrobbery:server:paleto:modelSync', k, 2007413986)
            elseif randomTrolly == 'cash' then
                trollyObj = CreateObject(269934519, v['coords'], 1, 0, 0)
                TriggerServerEvent('qb-bankrobbery:server:paleto:modelSync', k, 269934519)
            end
            SetEntityHeading(trollyObj, v['heading'])
        end
    end
end

RegisterNetEvent('qb-bankrobbery:client:paleto:grabSync', function(model)
    Config.PaletoBank['grab']['model'] = model
end)

RegisterNetEvent('qb-bankrobbery:client:paleto:modelSync', function(k, model)
    Config.PaletoBank['trollys'][k]['model'] = model
end)

RegisterNetEvent('qb-bankrobbery:tablepaleto', function()
    if not Config.PaletoBank['grab']['loot'] then
        LocalPlayer.state:set('inv_busy', true, true) -- Busy
        TriggerServerEvent('qb-bankrobbery:server:paleto:lootSync', 'grab')
        local ped = PlayerPedId()
        local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
        local animDict = ''
        

        local stackModel = Config.PaletoBank['grab']['model']
        if stackModel == -180074230 then
            animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
            loadAnimDict(animDict)
        else
            animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
            loadAnimDict(animDict)
        end
                
        loadModel('hei_p_m_bag_var22_arm_s')
        bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        sceneObject = GetClosestObjectOfType(Config.PaletoBank['grab']['pos'], 2.0, stackModel, false, false, false)

        scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)

        scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
        if stackModel == -180074230 then
            NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'grab_gold', 1.0, -1.0, 1148846080)
        else
            NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080)
        end

        scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
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
        
        LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
        TriggerServerEvent('qb-bankrobbery:server:FleecaTable', stackModel, 'paleto', pos)
    end
end)

RegisterNetEvent('qb-bankrobbery:PaletoTray', function()
    local ped = PlayerPedId()
    local pedCo = GetEntityCoords(ped)
    for k,v in pairs(Config.PaletoBank['trollys']) do
        if not v['loot'] then
            local TrayDist = #(pedCo - v['coords'])
                if TrayDist <= 1.5 then
                LocalPlayer.state:set('inv_busy', true, true) -- Busy
                TriggerServerEvent('qb-bankrobbery:server:paleto:lootSync', 'trollys', k)
                local ped = PlayerPedId()
                local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
                local trollyModel = Config.PaletoBank['trollys'][k]['model']
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

                sceneObject = GetClosestObjectOfType(Config.PaletoBank['trollys'][k]['coords'], 2.0, trollyModel, 0, 0, 0)
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
                newTrolly = CreateObject(emptyobj, Config.PaletoBank['trollys'][k]['coords'], true, false, false)
                SetEntityRotation(newTrolly, 0, 0, GetEntityHeading(sceneObject), 1, 0)
                DeleteObject(sceneObject)
                DeleteObject(bag)
                LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
                TriggerServerEvent('qb-bankrobbery:server:GetTrolleyLoot', grabModel, 'paleto', pedCo)
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:PaletoDrill', function()
    local ped = PlayerPedId()
    local pedCo = GetEntityCoords(ped)
    for k,v in pairs(Config.PaletoBank['drills']) do
        local drillDist = #(pedCo - v['coords'])
        if drillDist <= 1.0 then
            if not v['loot'] then
                QBCore.Functions.TriggerCallback('qb-Bankrobbery:server:GetItemsNeeded', function(hasItem)
                    if hasItem then
                        LocalPlayer.state:set('inv_busy', true, true) -- Busy
                        TriggerServerEvent('qb-bankrobbery:server:paleto:lootSync', 'drills', k)
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
                        
                        vaultPos = Config.PaletoBank['drills'][k]['coords']
                        vaultRot = Config.PaletoBank['drills'][k]['rotation']

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
                                LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
                                TriggerServerEvent('qb-bankrobbery:server:drillLoot', 'paleto', pedCo)
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
                                TriggerServerEvent('qb-bankrobbery:server:paleto:lootSync', 'drills', k)
                                grabNow = false
                                LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
                                TriggerServerEvent('qb-bankrobbery:server:drilldamaged')
                            end
                        end)
                    else
                        QBCore.Functions.Notify(Config.Notify['MissingDrill'], 'error', 4500)
                    end
                end, Config.LockerRequired)
            else
                QBCore.Functions.Notify(Config.Notify['AlreadyDrilled'], 'error')
            end
        end
    end
end)