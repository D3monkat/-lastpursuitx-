if Config.Framework == "ESX" then 
    ESX = exports['es_extended']:getSharedObject()
else 
    QBCore = exports['qb-core']:GetCoreObject()
end

CurrentInjure = {}
cam = nil
xped = nil


RegisterKeyMapping('hudxnp', 'Docnp', 'keyboard', Config.AlwaysOpenHudKey)
RegisterCommand('hudxnp', function()
    SendNUIMessage({  action = "hudAlways" })
end)

RegisterCommand('hudsize', function(source, args)
    if args[1] then 
        SendNUIMessage({  action = "hudSize", size = args[1] })
    end
end)

RegisterKeyMapping('doc', 'Doc', 'keyboard', Config.Key)
RegisterCommand('doc', function()
    if Config.Framework == "ESX" then 
        if ESX.PlayerData.job.name ~= Config.Job then 
            return
        end
    else 
        if QBCore.Functions.GetPlayerData().job.name ~= Config.Job then 
            return
        end
    end

    local ped = GetPedInFront()
    xped = ped

    if ped == 0 then 
        return
    end
    
 
    if IsEntityDead(ped) then 
        pedHeading = GetEntityHeading(ped)
        pedCoords = GetEntityCoords(ped)
        pedOffset = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
        cam = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', GetEntityCoords(PlayerPedId()), GetEntityRotation(PlayerPedId()), 90.0, false, 2)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 3000, true, false, false)
        SetCamParams(cam, pedCoords.x , pedCoords.y, pedCoords.z + 3.5,  -90.0, 180.0, GetEntityHeading(PlayerPedId()) - 50.0, 43.0557, 1000, 0, 0, 2);    
    end

   

     Wait(1000)
    local bones = {}
    i = 0
    for k,v in pairs(Config.PlayerBones) do
        local bone = GetPedBoneIndex(ped, v)
        table.insert(bones, {
            bone = bone,
            coords = GetWorldPositionOfEntityBone(ped, bone),
            label = Config.BoneLabelText[bone].Label
        })
        i = i + 1
        local screen_coords, screenX, screenY = GetScreenCoordFromWorldCoord(bones[i].coords.x, bones[i].coords.y, bones[i].coords.z)
        bones[i].screen_coords = screen_coords
        bones[i].screenX = screenX
        bones[i].screenY = screenY
    end
    t_ped = NetworkGetPlayerIndexFromPed(ped)
    t_pid = GetPlayerServerId(t_ped)


    if Config.Framework == "ESX" then 
        ESX.TriggerServerCallback("s4-realisticdisease:getPlayerInfo", function(x)
            SetNuiFocus(1, 1)
            local cachecfg = copyTable(Config)
            cachecfg.Functions = nil
            SendNUIMessage({  action = "open", data = x, config = cachecfg, bones = bones  })
        end, t_pid)
    else 
        QBCore.Functions.TriggerCallback("s4-realisticdisease:getPlayerInfo", function(x)
            SetNuiFocus(1, 1)
            local cachecfg = copyTable(Config)
            cachecfg.Functions = nil
            SendNUIMessage({  action = "open", data = x, config = cachecfg, bones = bones  })
        end, t_pid)
    end

  
 
    -- DebugThread()
end)

-- GetBonePosFromCamera = function(bone)
 
 
DebugThread = function()
    entity = xped
    while true do 
        local bones = {}
        i = 0
        for k,v in pairs(Config.PlayerBones) do
            local bone = GetPedBoneIndex(entity, v)
            table.insert(bones, {
                bone = bone,
                coords = GetWorldPositionOfEntityBone(entity, bone)
            })
            i = i + 1
            -- DrawText3D(bones[i].coords.x, bones[i].coords.y, bones[i].coords.z, bones[i].bone .. " " .. k)
            -- toScreenPosition(bones[i].coords, cam)
            -- WorldToScreen(bones[i].coords.x, bones[i].coords.y, bones[i].coords.z)
        --    print( RaycastBoneToScreen(bones[i].coords))

      
          
        end

        Citizen.Wait(0)
    end 

end

Citizen.CreateThread(function()
    while Config.EnableBleeding do 
       local inj = tl(CurrentInjure)
       local ped = PlayerPedId()
       inj = inj * Config.BleedingHitDamage
       if inj ~= 0 then 
           inj = inj * Config.BleedingMultiplier
           SetEntityHealth(ped,  GetEntityHealth(ped) - inj)
       end
     
       if Config.DisableSetPlayerHealthRecharge == true then 
           SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
       else 
            SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
       end
       Citizen.Wait(Config.BleedingPerMillisecond)
    end
end)
 
function tl(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function copyTable(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == "table" then
            copy[key] = copyTable(value)
        else
            copy[key] = value
        end
    end
    return copy
end

RegisterNetEvent('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdade', function(job)
    QBCore.Functions.GetPlayerData().job = job
end)


RegisterNetEvent("s4-realisticdisease:docStatus")
AddEventHandler("s4-realisticdisease:docStatus", function(status)
    x = {
        ["success"] = function()
            TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = Config.Langs[Config.Lang]["succeed_treat"] })
            Config.Functions.PlayAnim(Config.Anims["treat"].lib, Config.Anims["treat"].anim)
        end,
        ["wrong"] = function()
            TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["no_item"] })
            Config.Functions.PlayAnim(Config.Anims["fail"].lib, Config.Anims["fail"].anim)
        end,
        ["no_item"] = function()
            TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["no_item"] })
            Config.Functions.PlayAnim(Config.Anims["fail"].lib, Config.Anims["fail"].anim)
        end
    }
    x[status]()
end)

 
function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(0, 0)

    if cam ~= nil then 
        RenderScriptCams(false, false, 0, true, true, true)
        DestroyCam(cam, true)
        cam = nil
    end
end)

RegisterNUICallback("checkTreatment", function(data, cb)
    TriggerServerEvent("s4-realisticdisease:checkTreatment", data)

    -- Config.Functions.PlayAnim(Config.Anims["treat"].lib, Config.Anims["treat"].anim)

    SetNuiFocus(0, 0)

    if cam ~= nil then 
        RenderScriptCams(false, false, 0, true, true, true)
        DestroyCam(cam, true)
        cam = nil
    end
end)


RegisterNUICallback("checkItems", function(data, cb)
    if Config.Framework == "ESX" then
        ESX.TriggerServerCallback("s4-realisticdisease:checkItems", function(x)
            return cb(x)
        end)
    else 
        QBCore.Functions.TriggerCallback("s4-realisticdisease:checkItems", function(x)
            return cb(x)
        end)
    end
end)

RegisterNUICallback("startTreat", function(data, cb)
    local cachedTreat = data
    if Config.Framework == "ESX" then
        ESX.TriggerServerCallback("s4-realisticdisease:checkItems", function(items)
            i = 0
            for x,y in pairs(Config.Treatment[cachedTreat.clvl]) do
                if items[y] then 
                    i = i + 1
                end
            end
            if (i == #Config.Treatment[cachedTreat.clvl]) then 
                Config.Functions.TreatingMiniGame(cachedTreat)
            end 
        end)
    else 
        QBCore.Functions.TriggerCallback("s4-realisticdisease:checkItems", function(items)
            i = 0
            for x,y in pairs(Config.Treatment[cachedTreat.clvl]) do
                if items[y] then 
                    i = i + 1
                end
            end
            if (i == #Config.Treatment[cachedTreat.clvl]) then 
                Config.Functions.TreatingMiniGame(cachedTreat)
            end 
        end)
    
    end
end)
 
RegisterNUICallback("action", function(data, cb)
    pid = data.pid
    SetNuiFocus(0, 0)
    x = {
        ["check"] = function()
            Config.Functions.PlayAnim(Config.Anims["check"].lib, Config.Anims["check"].anim)
            if Config.Framework == "ESX" then
                ESX.TriggerServerCallback("s4-realisticdisease:getPlayerInfo", function(x)
                    local cachet = {}
                    injuresOld = x.injures
                    for k,v in pairs(x.injures) do
                        table.insert(cachet, k)
                    end
                    x.injures = cachet
                    SetNuiFocus(1, 1)
                    SendNUIMessage({  action = "checked", data = x, injuresOld = injuresOld,  config = Config.BoneLabelText  })
                end, pid)
            else 
                QBCore.Functions.TriggerCallback("s4-realisticdisease:getPlayerInfo", function(x)
                    local cachet = {}
                    injuresOld = x.injures
                    for k,v in pairs(x.injures) do
                        table.insert(cachet, k)
                    end
                    x.injures = cachet
                    SetNuiFocus(1, 1)
                    SendNUIMessage({  action = "checked", data = x, injuresOld = injuresOld,  config = Config.BoneLabelText  })
                end, pid)
            end
        end,
        ["treat"] = function()
            if Config.EnableFastTreatment == true then 
                if Config.Framework == "ESX" then
                    ESX.TriggerServerCallback("s4-realisticdisease:fastTreatment", function(x)
                        if x == true then 
                            if Config.FastTreatMiniGame == true then 
                                Config.Functions.FastTreatingMiniGame(pid)
                            else
                                TriggerServerEvent("s4-realisticdisease:fastTreatPlayer", pid)
                                TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = Config.Langs[Config.Lang]["succeed_treat"] })
                            end
                        else 
                            TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["no_money"] })
                        end
                    end, pid)  
                else 
                    QBCore.Functions.TriggerCallback("s4-realisticdisease:fastTreatment", function(x)
                        if x == true then 
                            if Config.FastTreatMiniGame == true then 
                                Config.Functions.FastTreatingMiniGame(pid)
                            else
                                TriggerServerEvent("s4-realisticdisease:fastTreatPlayer", pid)
                                TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', text = Config.Langs[Config.Lang]["succeed_treat"] })
                            end
                        else 
                            TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["no_money"] })
                        end
                    end, pid)  
                end
            else 
                TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = Config.Langs[Config.Lang]["no_skill"] })
            end
        end,
        ["close"] = function() end
    }
    x[data.type]()
end)

if Config.Framework == "ESX" then
    Citizen.CreateThread(function()
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        ESX.PlayerData = ESX.GetPlayerData()
    end)
else 
    Citizen.CreateThread(function()
        while QBCore.Functions.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
    
        QBCore.Functions.PlayerData = QBCore.Functions.GetPlayerData()
    end)
end


RegisterNetEvent("s4-realisticdisease:updateInjures")
AddEventHandler("s4-realisticdisease:updateInjures", function(injures, t_pid)
    CurrentInjure = injures
  
    -- if t_pid then 
   
    --     if Config.Framework == "ESX" then 
    --         ESX.TriggerServerCallback("s4-realisticdisease:getPlayerInfo", function(x)
    --             SetNuiFocus(1, 1)
    --             local cachecfg = copyTable(Config)
    --             cachecfg.Functions = nil
    --             print(injures)
    --             SendNUIMessage({  action = "update", data = x, config = cachecfg, bones = bones  })
    --         end, t_pid)
    --     else 
    --         QBCore.Functions.TriggerCallback("s4-realisticdisease:getPlayerInfo", function(x)
    --             SetNuiFocus(1, 1)
    --             local cachecfg = copyTable(Config)
    --             cachecfg.Functions = nil
    --             SendNUIMessage({  action = "update", data = x, config = cachecfg, bones = bones  })
    --         end, t_pid)
    --     end
    -- end

end)

RegisterNetEvent("s4-realisticdisease:hitRecieve")
AddEventHandler("s4-realisticdisease:hitRecieve", function(bone, injures)
    CurrentInjure = injures

    local cachet = {}

    for k,v in pairs(CurrentInjure.injures) do
        table.insert(cachet, k)
    end

    SendNUIMessage({ action = "damageTaken", CurrentInjure = cachet, config = Config.BoneLabelText })

    if Config.DebguMode == true then 
        print("Hit recieved: " .. bone .. " " .. Config.BoneLabelText[bone].name)
        -- print(ESX.DumpTable(CurrentInjure))
    end 
end)


AimBool = function(entity, player)
    if Config.OnlyWithAim == true then 
        return (IsEntityAPed(entity) and IsPedShooting(player))
    else
        return IsPedShooting(player)
    end
end

AimBoolFirst = function()
    if Config.OnlyWithAim == true then 
        return IsPlayerFreeAiming(PlayerId())
    else
        return true
    end
end

Citizen.CreateThread(function()                              
    while true do                                           
            local sleepThread = 250                                                                                               
            local player = PlayerPedId()         
            if AimBoolFirst() then   
                sleepThread = 0        
                local entity = getEntity(PlayerId())    
                local hit, coords, entity = RayCastGamePlayCamera(1000.0)
                if AimBool(entity, player) then
                    t_ped = NetworkGetPlayerIndexFromPed(entity)
                    t_pid = GetPlayerServerId(t_ped)
                    bones = {}
                    i = 0
                    for k,v in pairs(Config.PlayerBones) do
                        local bone = GetPedBoneIndex(entity, v)
                        table.insert(bones, {
                            bone = bone,
                            coords = GetWorldPositionOfEntityBone(entity, bone)
                        })
                        i = i + 1
                        -- DrawText3D(bones[i].coords.x, bones[i].coords.y, bones[i].coords.z, bones[i].bone .. " " .. k)
                    end
                    local position = GetEntityCoords(GetPlayerPed(-1))
                    local hittedbone = GetClosestBone(coords, bones)
                    if hittedbone then                   
                        local exist, weapon = GetCurrentPedWeapon(player)
                        damage = {
                            name = "Unkown",
                            label = "Unkown",
                        }
                        if exist then 
                            damage = {
                                name = Config.Weapons[weapon],
                                label = Config.WeaponsLabel[weapon],
                            }
                        end
                        TriggerServerEvent('s4-realisticdisease:hitPlayer', t_pid, hittedbone, damage)
                        -- DrawText3D(coords.x, coords.y, coords.z, hittedbone)
                    end
                    if Config.DebguMode == true then 
                        DrawLine(position.x, position.y , position.z, coords.x, coords.y, coords.z, 255, 0, 0, 255)
                    end
                end
            end
        Citizen.Wait(sleepThread)
    end
end)


if Config.DebguMode == true then 
 
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         if Config.DebguMode == true then 
--             local ped = PlayerPedId()
--             SetEntityHealth(ped, 200)
--             SetPedArmour(ped, 200)
--             SetEntityInvincible(ped, true)
--         end
--     end
-- end)

end

GetClosestBone = function(aimCoord, bones) 
    local x = false
    local cacheTable = bones
  
    for k,v in pairs(bones) do
        dists = #(bones[k].coords - aimCoord)
        cacheTable[k].dist = dists
    end

    table.sort(cacheTable, function(a,b) return a.dist < b.dist end)

    x = cacheTable[1].bone
    
    return x
end

DrawText3D = function(x, y, z, text)
    if Config.DebguMode == false then 
        return
    end
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
 
function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance)
	local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, -1, 1))
	return b, c, e
end
 

function getEntity(player)                                          
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)     
    return entity                                                   
end
 
 
AddEventHandler('playerSpawned', function(spawn)
    if Config.RemoveInjuresWhenRevive == true then 
        CurrentInjure = {}
        TriggerServerEvent('s4-realisticdisease:removeAllInjures')
    end
end)


function CameraTransition(cam, startPos, endPos, duration)
    local startTime = GetGameTimer()
    local endTime = startTime + duration

    while GetGameTimer() < endTime do
        local progress = (GetGameTimer() - startTime) / duration
        local currentPos = LerpVector3(startPos, endPos, progress)

        SetCamCoord(cam, currentPos.x, currentPos.y, currentPos.z)

        Citizen.Wait(0)
    end

    SetCamCoord(cam, endPos.x, endPos.y, endPos.z)
end

function LerpVector3(startPos, endPos, progress)
    local x = Lerp(startPos.x, endPos.x, progress)
    local y = Lerp(startPos.y, endPos.y, progress)
    local z = Lerp(startPos.z, endPos.z, progress)

    return vector3(x, y, z)
end

function Lerp(startValue, endValue, progress)
    return startValue + (endValue - startValue) * progress
end
