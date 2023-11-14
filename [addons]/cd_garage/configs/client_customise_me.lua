--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil
JobData, GangData, on_duty = {}, {}, true

CreateThread(function()
    if Config.Framework == 'esx' then
        while ESX == nil do
            pcall(function() ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject() end)
            if ESX == nil then
                TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            end
            Wait(100)
        end
        JobData = ESX.PlayerData.job or {}
        if JobData.onDuty ~= nil and Config.UseFrameworkDutySystem then on_duty = JobData.onDuty end 

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            JobData = xPlayer.job or {}
            if JobData.onDuty ~= nil and Config.UseFrameworkDutySystem then on_duty = JobData.onDuty end 
            while not Authorised do Wait(1000) end
            if Config.VehicleKeys.ENABLE then
                TriggerServerEvent('cd_garage:LoadCachedkeys')
            end
            if Config.PrivateGarages.ENABLE then
                TriggerServerEvent('cd_garage:LoadPrivateGarages')
            end
            if Config.VehiclesData.ENABLE then
                TriggerServerEvent('cd_garage:PriceData')
            end
            if Config.PersistentVehicles.ENABLE then
                TriggerServerEvent('cd_garage:LoadPersistentVehicles')
            end
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(job)
            JobData = job or {}
            if JobData.onDuty ~= nil and Config.UseFrameworkDutySystem then on_duty = JobData.onDuty end 
        end)
    

    elseif Config.Framework == 'qbcore' then
        while QBCore == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
            if QBCore == nil then
                QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
            end
            Wait(100)
        end
        JobData = QBCore.Functions.GetPlayerData().job or {}
        GangData = QBCore.Functions.GetPlayerData().gang or {}
        if JobData.onduty ~= nil and Config.UseFrameworkDutySystem then on_duty = JobData.onduty end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function()
            JobData = QBCore.Functions.GetPlayerData().job or {}
            GangData = QBCore.Functions.GetPlayerData().gang or {}
            if JobData.onduty ~= nil and Config.UseFrameworkDutySystem then on_duty = JobData.onduty end
            while not Authorised do Wait(1000) end
            if Config.VehicleKeys.ENABLE then
                TriggerServerEvent('cd_garage:LoadCachedkeys')
            end
            if Config.PrivateGarages.ENABLE then
                TriggerServerEvent('cd_garage:LoadPrivateGarages')
            end
            if Config.VehiclesData.ENABLE then
                TriggerServerEvent('cd_garage:PriceData')
            end
            if Config.PersistentVehicles.ENABLE then
                TriggerServerEvent('cd_garage:LoadPersistentVehicles')
            end
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(JobInfo)
            JobData = JobInfo or {}
        end)

        RegisterNetEvent(Config.FrameworkTriggers.duty)
        AddEventHandler(Config.FrameworkTriggers.duty, function(boolean)
            if not Config.UseFrameworkDutySystem then return end
            on_duty = boolean
        end)

        RegisterNetEvent(Config.FrameworkTriggers.gang)
        AddEventHandler(Config.FrameworkTriggers.gang, function(GangInfo)
            GangData = GangInfo or {}
            if Config.GangGarages.ENABLE then
                UpdateGangGarageBlips()
            end
        end)

    end
end)

RegisterNetEvent('cd_garage:PlayerLoaded')
AddEventHandler('cd_garage:PlayerLoaded', function()
    while not Authorised do Wait(1000) end
    if Config.VehicleKeys.ENABLE then
        TriggerServerEvent('cd_garage:LoadCachedkeys')
    end
    if Config.PrivateGarages.ENABLE then
        TriggerServerEvent('cd_garage:LoadPrivateGarages')
    end
    if Config.VehiclesData.ENABLE then
        TriggerServerEvent('cd_garage:PriceData')
    end
    if Config.PersistentVehicles.ENABLE then
        TriggerServerEvent('cd_garage:LoadPersistentVehicles')
    end
end)

function GetJob()
    if Config.Framework == 'esx' then
        while JobData.name == nil do Wait(0) end
        return {name = JobData.name, label = JobData.label}
    
    elseif Config.Framework == 'qbcore' then
        while JobData.name == nil do Wait(0) end
        return {name = JobData.name, label = JobData.label}

    elseif Config.Framework == 'other' then
        return {name = 'unemployed', label = 'Unemployed'} --return a players job name and label (table).
    end
end

function GetJob_grade()
    if Config.Framework == 'esx' then
        while JobData.grade == nil do Wait(0) end
        return JobData.grade
    
    elseif Config.Framework == 'qbcore' then
        while JobData.grade.level == nil do Wait(0) end
        return JobData.grade.level

    elseif Config.Framework == 'other' then
        return 0 --return a players job grade (number).
    end
end

function CheckJob(job)
    if type(job) == 'string' then
        if GetJob().name == job and on_duty then
            return true
        end
    elseif type(job) == 'table' then
        local myjob = GetJob().name
        for c, d in ipairs(job) do
            if myjob == d and on_duty then
                return true
            end
        end
    end
    return false
end

function IsAllowed_Impound()
    if Config.Impound.Authorized_Jobs[GetJob().name] and on_duty then
        return true
    else
        return false
    end
end

function GetGang()
    if Config.Framework == 'esx' then
        return {name = 'unemployed', label = 'Unemployed'} --return a players gang name and label (table).
    
    elseif Config.Framework == 'qbcore' then
        while GangData.name == nil do Wait(0) end
        return {name = GangData.name, label = GangData.label}

    elseif Config.Framework == 'other' then
        return {name = 'unemployed', label = 'Unemployed'} --return a players gang name and label (table).
    end
end


--███╗   ███╗ █████╗ ██╗███╗   ██╗    ████████╗██╗  ██╗██████╗ ███████╗ █████╗ ██████╗ 
--████╗ ████║██╔══██╗██║████╗  ██║    ╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗
--██╔████╔██║███████║██║██╔██╗ ██║       ██║   ███████║██████╔╝█████╗  ███████║██║  ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║       ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══██║██║  ██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║       ██║   ██║  ██║██║  ██║███████╗██║  ██║██████╔╝
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ 


CreateThread(function()
    while not Authorised do Wait(1000) end
    local pausemenuopen = false
    local alreadyEnteredZone = false
    local GlobalText = nil
    local GlobalText_last = nil
    local wait = 5
    while true do
        wait = 5
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local inZone = false

        for cd = 1, #Config.Locations do
            local self = Config.Locations[cd]
            local dist = #(coords-vector3(self.x_1, self.y_1, self.z_1))
            if dist <= self.Dist then
                wait = 5
                inZone = true
                GlobalText = self.Name
                if InVehicle() then
                    GlobalText = '<b>'..L('garage')..'</b></p>'..L('notif_storevehicle')
                end
                if not CooldownActive then
                    if IsControlJustReleased(0, Config.Keys.QuickChoose_Key) then
                        TriggerEvent('cd_garage:EnterGarage_Outside', cd)
                    elseif IsControlJustReleased(0, Config.Keys.EnterGarage_Key) and self.EventName2 == 'cd_garage:EnterGarage' then
                        TriggerEvent('cd_garage:EnterGarage_Inside', cd)
                    elseif IsControlJustReleased(0, Config.Keys.StoreVehicle_Key) then
                        TriggerEvent('cd_garage:StoreVehicle_Main', false, false, false)
                    end
                end
                if not pausemenuopen and IsPauseMenuActive() then
                    pausemenuopen = true
                    DrawTextUI('hide')
                elseif pausemenuopen and not IsPauseMenuActive() then
                    pausemenuopen = false
                    DrawTextUI('show', GlobalText)
                end
                break
            else
                wait = 1000
            end
        end
        
        if not pausemenuopen then
            if inZone and not alreadyEnteredZone then
                alreadyEnteredZone = true
                DrawTextUI('show', GlobalText)
            end

            if GlobalText_last ~= GlobalText then
                DrawTextUI('show', GlobalText)
            end

            if not inZone and alreadyEnteredZone then
                alreadyEnteredZone = false
                DrawTextUI('hide')
            end
            GlobalText_last = GlobalText
        end
        Wait(wait)
    end
end)


-- ██████╗██╗  ██╗ █████╗ ████████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--██║     ███████║███████║   ██║       ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██║     ██╔══██║██╔══██║   ██║       ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚██████╗██║  ██║██║  ██║   ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


if Config.TransferGarage.ENABLE then
    TriggerEvent('chat:addSuggestion', '/'..Config.GarageSpace.chat_command_main, L('chatsuggestion_garagespace'), {{ name=L('chatsuggestion_playerid_1'), help=L('chatsuggestion_playerid_2')}})
    TriggerEvent('chat:addSuggestion', '/'..Config.GarageSpace.chat_command_check, L('chatsuggestion_garagespace_check'))
end

TriggerEvent('chat:addSuggestion', '/closeui', L('chatsuggestion_ui'))
RegisterCommand('closeui', function()
    CloseAllNUI()
end)


--██╗   ██╗███████╗██╗  ██╗██╗ ██████╗██╗     ███████╗    ██████╗ ███████╗██╗      █████╗ ████████╗███████╗██████╗ 
--██║   ██║██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝    ██╔══██╗██╔════╝██║     ██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
--██║   ██║█████╗  ███████║██║██║     ██║     █████╗      ██████╔╝█████╗  ██║     ███████║   ██║   █████╗  ██║  ██║
--╚██╗ ██╔╝██╔══╝  ██╔══██║██║██║     ██║     ██╔══╝      ██╔══██╗██╔══╝  ██║     ██╔══██║   ██║   ██╔══╝  ██║  ██║
-- ╚████╔╝ ███████╗██║  ██║██║╚██████╗███████╗███████╗    ██║  ██║███████╗███████╗██║  ██║   ██║   ███████╗██████╔╝
--  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝ 


function GetFuel(vehicle, plate) --This gets triggered just before you store your vehicle.
    if GetResourceState('LegacyFuel') == 'started' then
        return exports['LegacyFuel']:GetFuel(vehicle)
    
    elseif GetResourceState('esx-sna-fuel') == 'started' then
        return exports['esx-sna-fuel'], GetFuel(vehicle)

    elseif GetResourceState('ps-fuel') == 'started' then
        return exports['ps-fuel']:GetFuel(vehicle)

    elseif GetResourceState('lj-fuel') == 'started' then
        return exports['lj-fuel']:GetFuel(vehicle)

    elseif GetResourceState('ox_fuel') == 'started' then
        return GetVehicleFuelLevel(vehicle)
    
    elseif GetResourceState('ti_fuel') == 'started' then
        return exports['ti_fuel']:getFuel(vehicle)

    elseif GetResourceState('FRFuel') == 'started' then
        return math.ceil((100 / GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fPetrolTankVolume')) * math.ceil(GetVehicleFuelLevel(vehicle)))

    elseif GetResourceState('ND_Fuel') == 'started' then
        DecorGetFloat(vehicle, '_ANDY_FUEL_DECORE_')

    else
        return nil --If this returns nil, the script will use your frameworks default method to get fuel from your esx/qbcore GetVehicleProperties function.
    end
end

function SetFuel(vehicle, plate, fuel_level) --This gets triggered after you spawn your vehicle.
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, fuel_level)
    
    elseif GetResourceState('esx-sna-fuel') == 'started' then
        exports['esx-sna-fuel']:SetFuel(vehicle, fuel_level)

    elseif GetResourceState('ps-fuel') == 'started' then
        exports['ps-fuel']:SetFuel(vehicle, fuel_level)

    elseif GetResourceState('lj-fuel') == 'started' then
        exports['lj-fuel']:SetFuel(vehicle, fuel_level)

    elseif GetResourceState('ox_fuel') == 'started' then
        Entity(vehicle).state.fuel = fuel_level

    elseif GetResourceState('ti_fuel') == 'started' then
        exports['ti_fuel']:setFuel(vehicle, fuel_level, 'RON91' )
    
    elseif GetResourceState('FRFuel') == 'started' then
        SetVehicleFuelLevel(vehicle, fuel_level+0.0)
    
    elseif GetResourceState('ND_Fuel') == 'started' then
        SetVehicleFuelLevel(vehicle, fuel_level+0.0)
		DecorSetFloat(vehicle, '_ANDY_FUEL_DECORE_', fuel_level+0.0)
    end
    --If no events/exports are triggered here, the script will use your frameworks default method to set fuel from your esx/qbcore SetVehicleProperties function.
end

function VehicleSpawned(vehicle, plate, props) --This will be triggered when you spawn a vehicle.
    GiveVehicleKeys(plate, vehicle)
    AddPersistentVehicle(vehicle, plate)
    --Add your own code here if needed.
end

function VehicleStored(vehicle, plate, props) --This will be triggered just before a vehicle is stored.
    --Add your own code here if needed.
end

function GiveVehicleKeys(plate, vehicle) --This will be triggered when the script is giving keys to a vehicle ([vehicle] may not always be defined).
    if Config.VehicleKeys.ENABLE then
        AddKey(plate)
    else
        if GetResourceState('vehicles_keys') == 'started' then
            TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)

        elseif GetResourceState('fivecode_carkeys') == 'started' then
            TriggerServerEvent('fivecode_carkeys:pdmGiveKey', plate)

        elseif GetResourceState('stasiek_vehiclekeys') == 'started' then
            DecorSetInt(vehicle, 'owner', GetPlayerServerId(PlayerId()))

        elseif GetResourceState('xd_locksystem') == 'started' then
            exports['xd_locksystem']:givePlayerKeys(plate)

        elseif GetResourceState('ti_vehicleKeys') == 'started' then
            exports['ti_vehicleKeys']:addTemporaryVehicle(plate)

        elseif GetResourceState('F_RealCarKeysSystem') == 'started' then
            TriggerServerEvent('F_RealCarKeysSystem:generateVehicleKeys', plate)
        
        else
            TriggerEvent('vehiclekeys:client:SetOwner', plate) --The default qb-keys event.
            TriggerEvent('vehiclekeys:client:AddKeys', plate) --The default qb-keys event.
            --Add your own give vehicle keys events/exports here.
        end
    end
end

function AddPersistentVehicle(vehicle, plate) --This will be triggered everytime a vehicle is spawned.
    local net_id = NetworkGetNetworkIdFromEntity(vehicle)
    if Config.PersistentVehicles.ENABLE then
        TriggerServerEvent('cd_garage:AddPersistentVehicles', plate, net_id)

    else
        --Add your own code here if needed.
    end
end

function RemovePersistentVehicle(vehicle, plate) --This will be triggered everytime a vehicle is stored/deleted.
    if Config.PersistentVehicles.ENABLE then
        TriggerServerEvent('cd_garage:RemovePersistentVehicles', plate)
    else
        if GetResourceState('AdvancedParking') == 'started' then
            exports['AdvancedParking']:DeleteVehicle(vehicle)
        end
        --Add your own code here if needed.
    end
end


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function ToggleShellTime(toggle)
    if toggle == 'enter' then
        if Config.InsideGarage.shell_time_script == 'easytime' then
            TriggerEvent('cd_easytime:PauseSync', true)

        elseif Config.InsideGarage.shell_time_script == 'vsync' then
            TriggerEvent('vSync:toggle',false)
            NetworkOverrideClockTime(23, 00, 00)

        elseif Config.InsideGarage.shell_time_script == 'qbcore' then
            TriggerEvent('qb-weathersync:client:DisableSync')

        elseif Config.InsideGarage.shell_time_script == 'other' then
            --Add your own code here.
        end

    elseif toggle == 'exit' then
        if Config.InsideGarage.shell_time_script == 'easytime' then
            TriggerEvent('cd_easytime:PauseSync', false)
            
        elseif Config.InsideGarage.shell_time_script == 'vsync' then
            TriggerEvent('vSync:toggle',true)
            TriggerServerEvent('vSync:requestSync')

        elseif Config.InsideGarage.shell_time_script == 'qbcore' then
            TriggerEvent('qb-weathersync:client:EnableSync')

        elseif Config.InsideGarage.shell_time_script == 'other' then
            --Add your own code here.
        end
    end
end

CreateThread(function()
    while not Authorised do Wait(1000) end
    for c, d in pairs (Config.Locations) do
        if d.Type ~= nil then
            if CheckBlips(d.EnableBlip, d.JobRestricted) then
                local blip = AddBlipForCoord(d.x_1, d.y_1, d.z_1)
                SetBlipSprite(blip, Config.Blip[d.Type].sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, Config.Blip[d.Type].scale)
                SetBlipColour(blip, Config.Blip[d.Type].colour)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('STRING')
                if Config.Unique_Blips and not d.JobRestricted then
                    AddTextComponentSubstringPlayerName(Config.Blip[d.Type].name:sub(1, -2)..': '..d.Garage_ID)
                elseif d.JobRestricted then
                    AddTextComponentSubstringPlayerName(Config.Blip[d.Type].name:sub(1, -2)..': '..d.Garage_ID..' ['..JobRestrictNotif(d.JobRestricted, true)..']')
                else
                    AddTextComponentSubstringPlayerName(Config.Blip[d.Type].name:sub(1, -2))
                end
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    while not Authorised do Wait(1000) end
    if resource == GetCurrentResourceName() then
        TriggerEvent('cd_drawtextui:HideUI')
        if MyCars ~= nil then
            for cd=1, #MyCars do
                if MyCars[cd] ~= nil then
                    SetEntityAsNoLongerNeeded(MyCars[cd].vehicle)
                    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
                    DeleteEntity(MyCars[cd].vehicle)
                    DeleteVehicle(MyCars[cd].vehicle)
                end
            end
        end
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
        if shell and Config.InsideGarage.ENABLE then
            DeleteGarage()
        end
    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(notif_type, message)
    if notif_type and message then
        if Config.Notification == 'esx' then
            ESX.ShowNotification(message)
        
        elseif Config.Notification == 'qbcore' then
            if notif_type == 1 then
                QBCore.Functions.Notify(message, 'success')
            elseif notif_type == 2 then
                QBCore.Functions.Notify(message, 'primary')
            elseif notif_type == 3 then
                QBCore.Functions.Notify(message, 'error')
            end
        
        elseif Config.Notification == 'okokNotify' then
            if notif_type == 1 then
                exports['okokNotify']:Alert(L('garage'), message, 5000, 'success')
            elseif notif_type == 2 then
                exports['okokNotify']:Alert(L('garage'), message, 5000, 'info')
            elseif notif_type == 3 then
                exports['okokNotify']:Alert(L('garage'), message, 5000, 'error')
            end
        
        elseif Config.Notification == 'ps-ui' then
            if notif_type == 1 then
                exports['ps-ui']:Notify(message, 'success', 5000)
            elseif notif_type == 2 then
                exports['ps-ui']:Notify(message, 'primary', 5000)
            elseif notif_type == 3 then
                exports['ps-ui']:Notify(message, 'error', 5000)
            end
        
        elseif Config.Notification == 'ox_lib' then
            if notif_type == 1 then
                lib.notify({title = L('garage'), description = message, type = 'success'})
            elseif notif_type == 2 then
                lib.notify({title = L('garage'), description = message, type = 'inform'})
            elseif notif_type == 3 then
                lib.notify({title = L('garage'), description = message, type = 'error'})
            end

        elseif Config.Notification == 'chat' then
            TriggerEvent('chatMessage', message)
            
        elseif Config.Notification == 'other' then
            --add your own notification.
            
        end
    end
end


--██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗ 
--██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝ 
--██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗
--██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║
--██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝
--╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ 


if Config.Debug then
    local function Debug()
        while not Authorised do Wait(1000) end
        print('^6-----------------------^0')
        print('^1CODESIGN DEBUG^0')
        print(string.format('^6Resource Name:^0 %s', GetCurrentResourceName()))
        print(string.format('^6Framework:^0 %s', Config.Framework))
        print(string.format('^6Database:^0 %s', Config.Database))
        print(string.format('^6Config.AutoInsertSQL:^0 %s', Config.AutoInsertSQL))
        print(string.format('^6Notification:^0 %s', Config.Notification))
        print(string.format('^6Language:^0 %s', Config.Language))
        if Config.Framework == 'esx' or Config.Framework == 'qbcore' or Config.Framework == 'other' then
            while JobData.name == nil do Wait(0) end
            print(string.format('^6Job Name:^0 %s', GetJob().name))
            print(string.format('^6Job Label:^0 %s', GetJob().label))
            print(string.format('^6Job Grade:^0 %s', GetJob_grade()))
        end
        if Config.Framework == 'qbcore' then
            while GangData.name == nil do Wait(0) end
            print(string.format('^6Gang Name:^0 %s', GetGang().name))
            print(string.format('^6Gang Label:^0 %s', GetGang().label))
        end
        print(string.format('^6Use Framework Duty System:^0 %s', Config.UseFrameworkDutySystem))
        print(string.format('^6On Duty:^0 %s', on_duty))
        print(string.format('^6Is Allowed Impound:^0 %s', IsAllowed_Impound()))
        print('^6-----------------------^0')
        TriggerServerEvent('cd_garage:Debug')
    end

    CreateThread(function()
        Wait(3000)
        Debug()
    end)

    RegisterCommand('debug_garage', function()
        Debug()
    end)
end
