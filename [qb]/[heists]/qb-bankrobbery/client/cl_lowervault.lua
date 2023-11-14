CurrentCops = 0


-- This is basically hacking the vault door

RegisterNetEvent('qb-bankrobbery:client:lowerVault:lootSync', function(type, k)
    if k then 
        Config.lowerVault[type][k]['loot'] = not Config.lowerVault[type][k]['loot']
    else
        Config.lowerVault[type]['loot'] = not Config.lowerVault[type]['loot']
    end
end)

RegisterNetEvent('qb-bankrobbery:client:SetUpLower', function()
    setUplowerVault()
end)

function setUplowerVault()
    if Config.lowerVaultEnabled == 'true' then
        for k,v in pairs(Config.lowerVault['grabGold']) do
                gold = CreateObject(GetHashKey('h4_prop_h4_gold_stack_01a'), Config.lowerVault['grabGold'][k]['coords'], 1, 1, 0)
                SetEntityHeading(gold, Config.lowerVault['grabGold'][k]['heading'])
        end
        for k,v in pairs(Config.lowerVault['grabCash']) do
                cash = CreateObject(GetHashKey('h4_prop_h4_cash_stack_01a'), Config.lowerVault['grabCash'][k]['coords'], 1, 1, 0)
                SetEntityHeading(cash, Config.lowerVault['grabCash'][k]['heading'])
        end
        for k,v in pairs(Config.lowerVault['tables']) do
            tableObj = CreateObject(GetHashKey('tr_prop_tr_table_vault_01b'), Config.lowerVault['tables'][k]['tableObj'], 1, 0, 0)
            SetEntityHeading(tableObj, Config.lowerVault['tables'][k]['tableObj'].w)
            FreezeEntityPosition(tableObj, true)
        end
        for k,v in pairs(Config.lowerVault['display']) do
            displayObj = CreateObject(GetHashKey('h4_prop_h4_glass_disp_01a'), Config.lowerVault['display']['coords'], 1, 0, 0)
            SetEntityHeading(displayObj, Config.lowerVault['display']['coords'].w)
            FreezeEntityPosition(displayObj, true)
            lootobj = CreateObject(GetHashKey('h4_prop_h4_diamond_disp_01a'), Config.lowerVault['display']['coords'].x, Config.lowerVault['display']['coords'].y, Config.lowerVault['display']['coords'].z, 1, 0, 0)
        end
    end
end

RegisterNetEvent('qb-bankrobbery:lowerDoors', function()
    if CurrentCops >= Config.MinimumlowerVaultPolice then 
        QBCore.Functions.TriggerCallback('qb-Bankrobbery:server:GetItemsNeeded', function(hasItem)
            if hasItem then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                TriggerServerEvent('qb-bankrobbery:server:RemoveLowerVaultItem')
                exports['memorygame']:thermiteminigame(Config.CorrectBlocks, Config.IncorrectBlocks, Config.TimeToShow, Config.TimeToLose,
                function() -- success
                    for k,v in pairs(Config.lowerVault['doors']) do
                        local doorDist = #(pos - vector3(v['coords'].x, v['coords'].y, v['coords'].z))
                        if doorDist <= 1.5 then
                            TriggerServerEvent('qb-bankrobbery:server:lowerVault:doorSync', 'doors', k)
                            doorAnimation(k)
                        end
                    end 
                end,
                function() -- failure
                    QBCore.Functions.Notify(Config.Notify["FleecaHackFail"], 'error', 4500)
                end)
            else
                QBCore.Functions.Notify(Config.Notify["MissingExplosive"], 'error')
            end
        end, Config.LowerVaultDoors)
    else
        QBCore.Functions.Notify(Config.Notify["NotEnoughPD"], "error", 4500)
    end
end)

RegisterNetEvent('qb-bankrobbery:UseLowerCard', function()
    if Config.lowerVaultEnabled == 'true' then
        local ped = PlayerPedId() 
        local pos = GetEntityCoords(ped)
        QBCore.Functions.TriggerCallback('qb-bankrobbery:server:IsServerBlackedout', function(isBlackout)
            if isBlackout then
                local dist = #(pos - vector3(257.32, 227.86, 101.68))
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
                                    TriggerServerEvent('qb-doorlock:server:updateState', Config.DoorlockID7, false)
                                elseif Config.Doorlocks == "nui" or Config.Doorlocks == "NUI" then 
                                    TriggerServerEvent('nui_doorlock:server:updateState', Config.DoorlockID7, false, false, false, true)
                                end

                                if Config.RemoveCard then 
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "security_card_03", 1)
                                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["security_card_03"], "remove")
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
            end
        end)
    end
end)

function doorAnimation(k)
    RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    RequestModel('hei_p_m_bag_var22_arm_s')
    RequestNamedPtfxAsset('scr_ornate_heist')
    while not HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') and not HasModelLoaded('hei_p_m_bag_var22_arm_s') do
        Wait(50)
    end
    local ped = PlayerPedId()
    SetEntityHeading(ped, Config.lowerVault['doors'][k]['animation'].w)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(Config.lowerVault['doors'][k]['animation'].x, Config.lowerVault['doors'][k]['animation'].y, Config.lowerVault['doors'][k]['animation'].z, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), Config.lowerVault['doors'][k]['animation'].x, Config.lowerVault['doors'][k]['animation'].y, Config.lowerVault['doors'][k]['animation'].z,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'bag_thermal_charge', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(bagscene)
    Wait(1500)

    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey('hei_prop_heist_thermite'), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Wait(2000)
    DeleteObject(bag)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)

    TriggerServerEvent('QBCore:Server:RemoveItem', 'thermite', 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['thermite'], 'remove')

    NetworkStopSynchronisedScene(bagscene)
    ClearPedTasks(ped)
    QBCore.Functions.Notify(Config.Notify["BombExplodes"], 'success') 
    Wait(30 * 1000)
    DeleteObject(bomba)
    TriggerServerEvent('qb-bankrobbery:server:ExplosionLowerVault', k)
end

RegisterNetEvent('qb-bankrobbery:client:LowerVaultExplosion', function(k)
    AddExplosion(Config.lowerVault['doors'][k]['coords'].x, Config.lowerVault['doors'][k]['coords'].y, Config.lowerVault['doors'][k]['coords'].z, 0, 1.0, true, false, 4.0)
end)

RegisterNetEvent('qb-bankrobbery:client:lowerVault:doorSync', function(type, k)
    if k then 
        Config.lowerVault[type][k]['open'] = not Config.lowerVault[type][k]['open']
    else
        Config.lowerVault[type]['open'] = not Config.lowerVault[type]['open']
    end
end)

RegisterNetEvent('qb-bankrobbery:client:lowerVault:modelSync', function(k, model)
    Config.lowerVault['trollys'][k]['model'] = model
end)



RegisterNetEvent('qb-bankrobbery:lowerVaultGrabGold', function()
    if Config.lowerVaultEnabled == 'true' then
        if Config.lowerVault["isOpened"] then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            for k,v in pairs(Config.lowerVault['grabGold']) do
                local Dist = #(pos - vector3(Config.lowerVault['grabGold'][k]['coords'].x, Config.lowerVault['grabGold'][k]['coords'].y, Config.lowerVault['grabGold'][k]['coords'].z))
                if Dist <= 1.5 then
                    if not Config.lowerVault['grabGold'][k]['loot'] then
                        TriggerServerEvent('qb-bankrobbery:server:lowerVault:lootSync', 'grabGold', k)
                        local coords, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
                        local animDict = ''
                        
                        local stackModel = 'h4_prop_h4_gold_stack_01a'
                        animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
                        loadAnimDict(animDict)
    
                        loadModel('hei_p_m_bag_var22_arm_s')
                        bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), coords, 1, 1, 0)
                        sceneObject = GetClosestObjectOfType(Config.lowerVault['grabGold'][k]['coords'].x, Config.lowerVault['grabGold'][k]['coords'].y, Config.lowerVault['grabGold'][k]['coords'].z, 2.0, stackModel, false, false, false)

                        local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 1, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'enter_bag', 1.0, -1.0, 1148846080)
                        
                        local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 1, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
                        NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'grab_gold', 1.0, -1.0, 1148846080)
            

                        local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 1, 1.3)
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
                        TriggerServerEvent('qb-bankrobbery:server:FleecaTable', -180074230, 'lowerVault')
                    else
                        QBCore.Functions.Notify(Config.Notify["TableAlreadyLooted"], 'error')
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:lowerVaultGrabCash', function()
    if Config.lowerVaultEnabled == 'true' then
        if Config.lowerVault["isOpened"] then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            for k,v in pairs(Config.lowerVault['grabCash']) do
                local Dist = #(pos - vector3(Config.lowerVault['grabCash'][k]['coords'].x, Config.lowerVault['grabCash'][k]['coords'].y, Config.lowerVault['grabCash'][k]['coords'].z))
                if Dist <= 1.5 then
                    if not Config.lowerVault['grabCash'][k]['loot'] then
                        TriggerServerEvent('qb-bankrobbery:server:lowerVault:lootSync', 'grabCash', k)
                        local coords, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
                        local animDict = ''
                        
                        local stackModel = 'h4_prop_h4_cash_stack_01a'
                        animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
                        loadAnimDict(animDict)
    
                        loadModel('hei_p_m_bag_var22_arm_s')
                        bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), coords, 1, 1, 0)
                        sceneObject = GetClosestObjectOfType(Config.lowerVault['grabCash'][k]['coords'].x, Config.lowerVault['grabCash'][k]['coords'].y, Config.lowerVault['grabCash'][k]['coords'].z, 2.0, stackModel, false, false, false)

                        local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 1, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'enter_bag', 1.0, -1.0, 1148846080)
                        
                        local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 1, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
                        NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080)
            

                        local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 1, 1.3)
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
                        TriggerServerEvent('qb-bankrobbery:server:FleecaTable', "cash", 'lowerVault')
                    else
                        QBCore.Functions.Notify(Config.Notify["TableAlreadyLooted"], 'error')
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:lowerVaultDiamonds', function()
    if Config.lowerVaultEnabled == 'true' then
        if Config.lowerVault["isOpened"] then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            for k,v in pairs(Config.lowerVault['trays']) do
                local Dist = #(pos - vector3(Config.lowerVault['trays'][k]['coords'].x, Config.lowerVault['trays'][k]['coords'].y, Config.lowerVault['trays'][k]['coords'].z))
                if Dist <= 1.5 then
                    if not Config.lowerVault['trays'][k]['loot'] then
                        TriggerServerEvent('qb-bankrobbery:server:lowerVault:lootSync', 'trays', k)
                        local coords, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
                        local animDict = ''
                        local grabModel = 'ch_prop_vault_dimaondbox_01a'
                        
                        local stackModel = 'ch_prop_diamond_trolly_01c'
                        animDict = 'anim@heists@ornate_bank@grab_cash'
                        loadAnimDict(animDict)
    
                        loadModel('hei_p_m_bag_var22_arm_s')
                    -- sceneObject = GetClosestObjectOfType(Config.lowerVault['trays'][k]['coords'].x, Config.lowerVault['trays'][k]['coords'].y, Config.lowerVault['trays'][k]['coords'].z, 2.0, stackModel, false, false, false)
                        --NetworkRegisterEntityAsNetworked(sceneObject)

                        bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), coords, 1, 1, 0)
                        sceneObject = GetClosestObjectOfType(Config.lowerVault['trays'][k]['coords'].x, Config.lowerVault['trays'][k]['coords'].y, Config.lowerVault['trays'][k]['coords'].z, 2.0, GetHashKey('ch_prop_diamond_trolly_01c'), false, false, false)
                        NetworkRegisterEntityAsNetworked(sceneObject)


                        local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'intro', 1.5, -4.0, 1, 16, 1148846080, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 4.0, -8.0, 1)
                        
                        local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 1.5, -4.0, 1, 16, 1148846080, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_grab', 1.0, -1.0, 1148846080)
                        NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'cart_cash_dissapear', 4.0, -8.0, 1)
            

                        local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
                        NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'exit', 1.5, -4.0, 1, 16, 1148846080, 0)
                        NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_exit', 4.0, -8.0, 1)
                        
                        NetworkStartSynchronisedScene(scene1)
                        Wait(1750)
                        CashAppear(grabModel)
                        NetworkStartSynchronisedScene(scene2)
                        Wait(37000)
                        NetworkStartSynchronisedScene(scene3)
                        Wait(2000)
                        FreezeEntityPosition(sceneObject, true)
            
                        DeleteObject(sceneObject)
                        DeleteObject(bag)

                        TriggerServerEvent('qb-bankrobbery:server:FleecaTable', 'Diamonds', 'lowerVault')
                    else
                        QBCore.Functions.Notify(Config.Notify["TrayAlreadyLooted"], 'error')
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:displayCase', function()
    displayCase()
end)

function displayCase()
    if Config.lowerVault["isOpened"] then
        local ped = PlayerPedId()
        local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
        local animDict = 'anim@scripted@heist@ig16_glass_cut@male@'
        sceneObject = GetClosestObjectOfType(263.925, 260.656, 100.633, 1.0, GetHashKey('h4_prop_h4_glass_disp_01a'), 0, 0, 0)
        scenePos = GetEntityCoords(sceneObject)
        sceneRot = GetEntityRotation(sceneObject)
        globalObj = GetClosestObjectOfType(263.925, 260.656, 100.633, 5.0, 'h4_prop_h4_diamond_disp_01a', 0, 0, 0)
        loadAnimDict(animDict)
        RequestScriptAudioBank('DLC_HEI4/DLCHEI4_GENERIC_01', -1)

        bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        cutter = CreateObject(GetHashKey('h4_prop_h4_cutter_01a'), pedCo, 1, 1, 0)

        local newObj = CreateObject(GetHashKey('h4_prop_h4_glass_disp_01b'), GetEntityCoords(sceneObject), 1, 1, 0)
        SetEntityHeading(newObj, GetEntityHeading(sceneObject))

        scene1 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'enter_bag', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(cutter, scene1, animDict, 'enter_cutter', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(sceneObject, scene1, animDict, 'enter_glass_display', 1.0, -1.0, 1148846080)

        scene2 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'idle', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'idle_bag', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(cutter, scene2, animDict, 'idle_cutter', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(sceneObject, scene2, animDict, 'idle_glass_display', 1.0, -1.0, 1148846080)

        scene3 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'cutting_loop', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'cutting_loop_bag', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(cutter, scene3, animDict, 'cutting_loop_cutter', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(sceneObject, scene3, animDict, 'cutting_loop_glass_display', 1.0, -1.0, 1148846080)

        scene4 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene4, animDict, 'overheat_react_01', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene4, animDict, 'overheat_react_01_bag', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(cutter, scene4, animDict, 'overheat_react_01_cutter', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(sceneObject, scene4, animDict, 'overheat_react_01_glass_display', 1.0, -1.0, 1148846080)

        scene5 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene5, animDict, 'success', 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, scene5, animDict, 'success_bag', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(cutter, scene5, animDict, 'success_cutter', 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(newObj, scene5, animDict, 'success_glass_display_cut', 1.0, -1.0, 1148846080)

        local sound1 = GetSoundId()
        local sound2 = GetSoundId()

        NetworkStartSynchronisedScene(scene1)
        Wait(GetAnimDuration(animDict, 'enter') * 1000)

        NetworkStartSynchronisedScene(scene2)
        Wait(GetAnimDuration(animDict, 'idle') * 1000)

        NetworkStartSynchronisedScene(scene3)
        PlaySoundFromEntity(sound1, 'StartCutting', cutter, 'DLC_H4_anims_glass_cutter_Sounds', true, 80)
        Wait(GetAnimDuration(animDict, 'cutting_loop') * 1000)
        StopSound(sound1)

        NetworkStartSynchronisedScene(scene4)
        PlaySoundFromEntity(sound2, 'Overheated', cutter, 'DLC_H4_anims_glass_cutter_Sounds', true, 80)
        PlayCamAnim(cam, 'overheat_react_01_cam', animDict, scenePos, sceneRot, 0, 2)
        Wait(GetAnimDuration(animDict, 'overheat_react_01') * 1000)
        StopSound(sound2)

        DeleteObject(sceneObject)
        NetworkStartSynchronisedScene(scene5)
        Wait(2000)
        DeleteObject(globalObj)
        Wait(GetAnimDuration(animDict, 'success') * 1000 - 2000)
        DeleteObject(bag)
        DeleteObject(cutter)
        ClearPedTasks(ped)
    end
end

RegisterNetEvent('qb-bankrobbery:client:HackDrive', function()
    if CurrentCops >= Config.MinimumlowerVaultPolice then 
        QBCore.Functions.TriggerCallback('qb-Bankrobbery:server:GetItemsNeeded', function(hasItem)
            if hasItem then
                TriggerEvent('animations:client:EmoteCommandStart', {'kneel3'})
                QBCore.Functions.Progressbar('qb-bankrobbery:hackingPCV', 'Connecting HardDrive', 4500, false, false, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    TriggerServerEvent('qb-bankrobbery:server:RemoveHDD')
                    ClearPedTasks(PlayerPedId())
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['encrypted_hdd'], 'remove')
                    startHDHack()
                end)
            else
                QBCore.Functions.Notify(Config.Notify["MissingHDD"], 'error')
            end
        end , 'encrypted_hdd')
    end
end)

function startHDHack() 
    exports['hacking']:OpenHackingGame(Config.HDDTime, Config.HDDBlocks, Config.HDDRepeat, function(Success)
        if Success then
            QBCore.Functions.Notify(Config.Notify['HackerSuccess'], 'success')
            TriggerServerEvent('qb-bankrobbery:server:GetCode')
            TriggerServerEvent('qb-robbery:server:succesHeist', 50)
        end
    end)
end

RegisterNetEvent('qb-bankrobbery:client:EnterlowerVaultCode1', function()
    local dialog = exports['qb-input']:ShowInput({
        header = 'Lower Vault Code',
        submitText = 'Submit',
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'Code',
                text = 'Enter Code'
            },
        }
    })
    if dialog then
        if not dialog.Code then return end
        local data = dialog.Code
        TriggerServerEvent('qb-bankrobbery:server:IsComvination1Right', data)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:EnterlowerVaultCode2', function()
    local dialog = exports['qb-input']:ShowInput({
        header = 'Lower Vault Code',
        submitText = 'Submit',
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'Code',
                text = 'Enter Code'
            },
        }
    })
    if dialog then
        if not dialog.Code then return end
        local data = dialog.Code
        TriggerServerEvent('qb-bankrobbery:server:IsComvination2Right', data)
    end
end)

RegisterNetEvent('qb-bankrobbery:UseBankLaptop', function(colour, laptopData)
    if colour == 'gold' then 
        local ped = PlayerPedId() 
        local pos = GetEntityCoords(ped)
        local dist = #(pos - vector3(261.51, 258.01, 101.69))
        if dist < 1.5 then
            if CurrentCops >= Config.MinimumlowerVaultPolice then
                if Config.lowerVault["isOpened"] then
                    SetEntityHeading(ped, 350)
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
                        TriggerEvent('qb-bankrobbery:LaptopLowerVault')
                    end, function() -- Cancel
                        StopAnimTask(PlayerPedId(), 'anim@gangops@facility@servers@', 'hotwire', 1.0)
                        QBCore.Functions.Notify(Config.Notify['FleecaHackCancel'], 'error')
                    end)
                end
            else
                QBCore.Functions.Notify(Config.Notify['NotEnoughPD'], 'error')
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:LaptopLowerVault', function()
    local LaptopPos = vector4(261.36, 257.86, 101.39, 340.74)

    local loc = {x,y,z,h}
    loc.x = LaptopPos.x
    loc.y = LaptopPos.y
    loc.z = LaptopPos.z
    loc.h = LaptopPos.w

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

    exports['hacking']:OpenHackingGame(Config.FleecaTime, Config.FleecaBlocks, Config.FleecaRepeat, function(Success)
        NetworkStartSynchronisedScene(netScene3)
        NetworkStopSynchronisedScene(netScene3)
        DeleteObject(bag)
        DeleteObject(laptop)
        FreezeEntityPosition(ped, false)
        if Success then 
            QBCore.Functions.Notify("Done", "success", 4500)
            if Config.Doorlocks == "qb" then 
                TriggerServerEvent('qb-doorlock:server:updateState', Config.DoorlockID8, false)
            elseif Config.Doorlocks == "nui" or Config.Doorlocks == "NUI" then 
                TriggerServerEvent('nui_doorlock:server:updateState', Config.DoorlockID8, false, false, false, true)
            end
            if Config.RemoveLaptop then 
                TriggerServerEvent("QBCore:Server:RemoveItem", "laptop_gold", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["laptop_gold"], "remove")
            end
        end
    end)
end)