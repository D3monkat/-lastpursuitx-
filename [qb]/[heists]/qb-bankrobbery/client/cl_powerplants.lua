RegisterNetEvent('qb-bankrobbery:powerplant:PlaceBomb', function()
    QBCore.Functions.TriggerCallback('qb-Bankrobbery:server:GetItemsNeeded', function(hasItem)
        if hasItem then
            QBCore.Functions.TriggerCallback('qb-bankrobbery:server:IsServerBlackedout', function(isBlackout)
                if not isBlackout then
                    TriggerServerEvent('qb-bankrobbery:server:RemovePowerplantitem')
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    for k,v in pairs(Config.PowerPlant['locations']) do
                        local Dist = #(pos - vector3(v['coords'].x, v['coords'].y, v['coords'].z))
                        if Dist <= 1.5 then
                            if not v['open'] then
                                exports['memorygame']:thermiteminigame(Config.CorrectBlocks, Config.IncorrectBlocks, Config.TimeToShow, Config.TimeToLose,
                                function() -- success
                                    TriggerServerEvent('qb-bankrobbery:server:lowerVault:doorSync', 'doors', k)
                                    bombAnimation(k)
                                end)
                            else 
                                QBCore.Functions.Notify(Config.Notify["AlreadyExploded"], 'error')
                            end
                        end
                    end
                end
            end)
        else
            QBCore.Functions.Notify(Config.Notify["MissingThermite"], 'error')
        end
    end, Config.PowerplantRequired)
end)

function bombAnimation(k)
    RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    RequestModel('hei_p_m_bag_var22_arm_s')
    RequestNamedPtfxAsset('scr_ornate_heist')
    while not HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') and not HasModelLoaded('hei_p_m_bag_var22_arm_s') and not HasNamedPtfxAssetLoaded('scr_ornate_heist') do
        Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, Config.PowerPlant['locations'][k]['coords'].w)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local scene1 = NetworkCreateSynchronisedScene(Config.PowerPlant['locations'][k]['coords'].x, Config.PowerPlant['locations'][k]['coords'].y, Config.PowerPlant['locations'][k]['coords'].z, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bagObj = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), Config.PowerPlant['locations'][k]['coords'].x, Config.PowerPlant['locations'][k]['coords'].y, Config.PowerPlant['locations'][k]['coords'].z,  true,  true, false)

    SetEntityCollision(bagObj, false, true)
    NetworkAddPedToSynchronisedScene(ped, scene1, 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bagObj, scene1, 'anim@heists@ornate_bank@thermal_charge', 'bag_thermal_charge', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene1)
    Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bombObj = CreateObject(GetHashKey('hei_prop_heist_thermite'), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bombObj, false, true)
    AttachEntityToEntity(bombObj, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Wait(2000)
    DeleteObject(bagObj)
    DetachEntity(bombObj, 1, 1)
    FreezeEntityPosition(bombObj, true)

    NetworkStopSynchronisedScene(scene1)
    ClearPedTasks(ped)
    QBCore.Functions.Notify(Config.Notify["BombExplodes"], 'primary') 
    Wait(30 * 1000)
    DeleteObject(bombObj)
    TriggerServerEvent('qb-bankrobbery:server:ExplodePowerPlant', k)
end


RegisterNetEvent('qb-bankrobbery:client:PowerPlantgoBoom', function(k)
    AddExplosion(Config.PowerPlant['locations'][k]['coords'].x, Config.PowerPlant['locations'][k]['coords'].y, Config.PowerPlant['locations'][k]['coords'].z, 0, 1.0, true, false, 4.0)
end)