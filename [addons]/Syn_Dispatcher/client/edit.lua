Citizen.CreateThread( function()

    if Config.Framework == "ESX" then 
        ESX = exports["es_extended"]:getSharedObject()
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        job = ESX.GetPlayerData().job.name or "none"

        RegisterNetEvent("esx:setJob")
        AddEventHandler("esx:setJob", function(JobInfo)
            job = JobInfo.name
        end)

    elseif Config.Framework == "QB" then 

        QBCore = exports['qb-core']:GetCoreObject()

        job = QBCore.Functions.GetPlayerData().job.name or "none"
        RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
            job = JobInfo.name
        end)
    end 
end)


--[[ 
ARGs = {
alertCallCode = the alert code sent EX: 4-10, 5-11 etc
alertTitle = the Generated or passed title of the message
alertMessage = the Generated or passed text of the message
OffendingPlayerCoords = the coords of the alert sent. 
DispatchedJob = the job the event is triggered to. 
YourData = is data you can pass through when you trigger the event. recommended to use tables here EX: {duration = 4000, icon = "fa-ruler", color = 11, } -- Implementation of this variable is up to the developer
}
]]
function DispatchRoutedTextandData(alertCallCode,alertTitle,alertMessage,OffendingPlayerCoords,DispatchedJob, YourData)

    if Config.Debug then
        print(alertCallCode,alertTitle,alertMessage,OffendingPlayerCoords,DispatchedJob)
    end 
    --example of integration 
    TriggerServerEvent("core_dispatch:addCall",  alertCallCode, alertTitle, { {icon="fa-ruler", info= alertMessage}}  , OffendingPlayerCoords, DispatchedJob, 4000,  11,  5) 
end 





--[[ 
    
░█████╗░░█████╗░███╗░░░███╗███╗░░░███╗░█████╗░███╗░░██╗██████╗░░██████╗
██╔══██╗██╔══██╗████╗░████║████╗░████║██╔══██╗████╗░██║██╔══██╗██╔════╝
██║░░╚═╝██║░░██║██╔████╔██║██╔████╔██║███████║██╔██╗██║██║░░██║╚█████╗░
██║░░██╗██║░░██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚████║██║░░██║░╚═══██╗
╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░╚═╝░██║██║░░██║██║░╚███║██████╔╝██████╔╝
░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░╚═════╝░
 ]]
RegisterKeyMapping('*DispatcherToggle', "Open Dispatch using " .. Config.DispatcherToggleKey, "keyboard", Config.DispatcherToggleKey)

RegisterCommand('*DispatcherToggle', function()
    DispatchState = not DispatchState
end, false)

Citizen.CreateThread(function()
    if Config.Debug then
        RegisterCommand("alertcheck", function(source, args, rwavommand)
            local code = args and args[1] or false 
            if Config.Debug then 
                for k,v in pairs(CrimeStrings) do 
                    if math.random(1,100) > 80 then 
                        code = k 
                        break
                    end 
                end 
            end 
            TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",false,false,code,false,true)
        end, false)
    end
end)

RegisterCommand('*PoliceAlertEms', function()
	if job == Config.PoliceJob then
		--ESX.ShowNotification('EMS Requested')
		alertmsg = " EMS Presence Was requested on " -- remember to add spaces before and after text
		alertTitle = "Police EMS Request" 
		alertCallCode = "10-52" 
		DispatchedJob = "ambulance" -- what job recieves the call? ambulance
		includeSustpect = false -- whether to give suspect description along with the crime
		TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",alertmsg,alertTitle,alertCallCode,DispatchedJob , includeSustpect)
	
	else 
		--ESX.ShowNotification('You Aint a Cop Mufucka')
	end 
end)

RegisterCommand('*PolicePanicButton', function()
	if job == Config.PoliceJob then
		--ESX.ShowNotification('Backup Requested')

		alertmsg = " Emergency backup Was requested " -- remember to add spaces before and after text
		alertTitle = "Officer In Distress"
		alertCallCode = "10-99" 
		DispatchedJob = "police" -- what job recieves the call?
		includeSustpect = false -- whether to give suspect description along with the crime
		TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",alertmsg,alertTitle,alertCallCode,DispatchedJob , includeSustpect)
	else 
		--ESX.ShowNotification('You Aint a Cop Mufucka')
	end 
end)







--[[ 
███████╗██╗░░░██╗███╗░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
██╔════╝██║░░░██║████╗░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
█████╗░░██║░░░██║██╔██╗██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
██╔══╝░░██║░░░██║██║╚████║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
██║░░░░░╚██████╔╝██║░╚███║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
 ]]
function isPedDrivingAVehicle()
    local PlayerPedIdValue = PlayerPedId()
    local vehiclePedIsIn = GetVehiclePedIsIn(PlayerPedIdValue, false)
    if vehiclePedIsIn then
        local vehicleClass = GetVehicleClass(vehiclePedIsIn) 
        -- Check if ped is in driver seat
        if GetPedInVehicleSeat(vehiclePedIsIn, -1) == PlayerPedIdValue then
            -- We don't want planes, helicopters, bicycles and trains
            if vehicleClass ~= 15 and vehicleClass ~= 16 and vehicleClass ~=21 then
                if vehicleClass ~=13 then 
                    return vehiclePedIsIn
                end 
            else 
                return false
            end
        else 
            return false
        end
    else 
        return false
    end 
end 



--[[ 
███████╗██╗░░██╗██████╗░███████╗██████╗░██╗███╗░░░███╗███████╗███╗░░██╗████████╗░█████╗░██╗░░░░░
██╔════╝╚██╗██╔╝██╔══██╗██╔════╝██╔══██╗██║████╗░████║██╔════╝████╗░██║╚══██╔══╝██╔══██╗██║░░░░░
█████╗░░░╚███╔╝░██████╔╝█████╗░░██████╔╝██║██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░███████║██║░░░░░
██╔══╝░░░██╔██╗░██╔═══╝░██╔══╝░░██╔══██╗██║██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░██╔══██║██║░░░░░
███████╗██╔╝╚██╗██║░░░░░███████╗██║░░██║██║██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░██║░░██║███████╗
╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝
---AUTOMATIC CRIME ALERTS EXPERIMENTAL 
 ]]


 local ShockingEvents = { -- Some of these events are diffucult to track as they rarely trigger or do not trigger 
 [0] =  {SHOCKEVENT = "EVENT_ACQUAINTANCE_PED_DISLIKE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [1] =  {SHOCKEVENT = "EVENT_ACQUAINTANCE_PED_HATE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [2] =  {SHOCKEVENT = "EVENT_ACQUAINTANCE_PED_LIKE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [3] =  {SHOCKEVENT = "EVENT_ACQUAINTANCE_PED_RESPECT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [4] =  {SHOCKEVENT = "EVENT_ACQUAINTANCE_PED_WANTED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [5] =  {SHOCKEVENT = "EVENT_ACQUAINTANCE_PED_DEAD", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [6] =  {SHOCKEVENT = "EVENT_AGITATED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [7] =  {SHOCKEVENT = "EVENT_AGITATED_ACTION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [8] =  {SHOCKEVENT = "EVENT_ENCROACHING_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [9] =  {SHOCKEVENT = "EVENT_CALL_FOR_COVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [10] = {SHOCKEVENT = "EVENT_CAR_UNDRIVEABLE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [11] = {SHOCKEVENT = "EVENT_CLIMB_LADDER_ON_ROUTE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [12] = {SHOCKEVENT = "EVENT_CLIMB_NAVMESH_ON_ROUTE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [13] = {SHOCKEVENT = "EVENT_COMBAT_TAUNT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [14] = {SHOCKEVENT = "EVENT_COMMUNICATE_EVENT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [15] = {SHOCKEVENT = "EVENT_COP_CAR_BEING_STOLEN", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [16] = {SHOCKEVENT = "EVENT_CRIME_REPORTED", DispatchCode = "10-31", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [17] = {SHOCKEVENT = "EVENT_DAMAGE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [18] = {SHOCKEVENT = "EVENT_DEAD_PED_FOUND", DispatchCode = "4-19", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [19] = {SHOCKEVENT = "EVENT_DEATH", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [20] = {SHOCKEVENT = "EVENT_DRAGGED_OUT_CAR", DispatchCode = {"5-03","5-04"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [21] = {SHOCKEVENT = "EVENT_DUMMY_CONVERSION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [22] = {SHOCKEVENT = "EVENT_EXPLOSION", DispatchCode = "9-96-B", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = false, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [23] = {SHOCKEVENT = "EVENT_EXPLOSION_HEARD", DispatchCode = "9-96-B", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = false, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [24] = {SHOCKEVENT = "EVENT_FIRE_NEARBY", DispatchCode = "11-71", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = false, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [25] = {SHOCKEVENT = "EVENT_FLUSH_TASKS", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [26] = {SHOCKEVENT = "EVENT_FOOT_STEP_HEARD", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [27] = {SHOCKEVENT = "EVENT_GET_OUT_OF_WATER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [28] = {SHOCKEVENT = "EVENT_GIVE_PED_TASK", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [29] = {SHOCKEVENT = "EVENT_GUN_AIMED_AT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [30] = {SHOCKEVENT = "EVENT_HELP_AMBIENT_FRIEND", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [31] = {SHOCKEVENT = "EVENT_INJURED_CRY_FOR_HELP", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [32] = {SHOCKEVENT = "EVENT_CRIME_CRY_FOR_HELP", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [33] = {SHOCKEVENT = "EVENT_IN_AIR", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [34] = {SHOCKEVENT = "EVENT_IN_WATER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [35] = {SHOCKEVENT = "EVENT_INCAPACITATED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [36] = {SHOCKEVENT = "EVENT_LEADER_ENTERED_CAR_AS_DRIVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [37] = {SHOCKEVENT = "EVENT_LEADER_ENTERED_COVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [38] = {SHOCKEVENT = "EVENT_LEADER_EXITED_CAR_AS_DRIVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [39] = {SHOCKEVENT = "EVENT_LEADER_HOLSTERED_WEAPON", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [40] = {SHOCKEVENT = "EVENT_LEADER_LEFT_COVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [41] = {SHOCKEVENT = "EVENT_LEADER_UNHOLSTERED_WEAPON", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [42] = {SHOCKEVENT = "EVENT_MELEE_ACTION", DispatchCode = {"2-42","3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [43] = {SHOCKEVENT = "EVENT_MUST_LEAVE_BOAT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [44] = {SHOCKEVENT = "EVENT_NEW_TASK", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [45] = {SHOCKEVENT = "EVENT_NONE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [46] = {SHOCKEVENT = "EVENT_OBJECT_COLLISION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [47] = {SHOCKEVENT = "EVENT_ON_FIRE", DispatchCode = "11-71", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [48] = {SHOCKEVENT = "EVENT_OPEN_DOOR", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [49] = {SHOCKEVENT = "EVENT_SHOVE_PED", DispatchCode = {"2-42","3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [50] = {SHOCKEVENT = "EVENT_PED_COLLISION_WITH_PED", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [51] = {SHOCKEVENT = "EVENT_PED_COLLISION_WITH_PLAYER", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [52] = {SHOCKEVENT = "EVENT_PED_ENTERED_MY_VEHICLE", DispatchCode = {"9-25","10-24"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [53] = {SHOCKEVENT = "EVENT_PED_JACKING_MY_VEHICLE", DispatchCode ={"5-03","4-87","10-851"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [54] = {SHOCKEVENT = "EVENT_PED_ON_CAR_ROOF", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [55] = {SHOCKEVENT = "EVENT_PED_TO_CHASE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [56] = {SHOCKEVENT = "EVENT_PED_TO_FLEE", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [57] = {SHOCKEVENT = "EVENT_PLAYER_COLLISION_WITH_PED", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [58] = {SHOCKEVENT = "EVENT_PLAYER_LOCK_ON_TARGET", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [59] = {SHOCKEVENT = "EVENT_POTENTIAL_BE_WALKED_INTO", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [60] = {SHOCKEVENT = "EVENT_POTENTIAL_BLAST", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = false, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [61] = {SHOCKEVENT = "EVENT_POTENTIAL_GET_RUN_OVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [62] = {SHOCKEVENT = "EVENT_POTENTIAL_WALK_INTO_FIRE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [63] = {SHOCKEVENT = "EVENT_POTENTIAL_WALK_INTO_OBJECT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [64] = {SHOCKEVENT = "EVENT_POTENTIAL_WALK_INTO_VEHICLE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [65] = {SHOCKEVENT = "EVENT_PROVIDING_COVER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [66] = {SHOCKEVENT = "EVENT_RADIO_TARGET_POSITION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [67] = {SHOCKEVENT = "EVENT_RAN_OVER_PED", DispatchCode = {"1-87","2-40","2-17","4-80"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [68] = {SHOCKEVENT = "EVENT_REACTION_COMBAT_VICTORY", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [69] = {SHOCKEVENT = "EVENT_REACTION_ENEMY_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [70] = {SHOCKEVENT = "EVENT_REACTION_INVESTIGATE_DEAD_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [71] = {SHOCKEVENT = "EVENT_REACTION_INVESTIGATE_THREAT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [72] = {SHOCKEVENT = "EVENT_REQUEST_HELP_WITH_CONFRONTATION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [73] = {SHOCKEVENT = "EVENT_RESPONDED_TO_THREAT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [74] = {SHOCKEVENT = "EVENT_REVIVED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [75] = {SHOCKEVENT = "EVENT_SCRIPT_COMMAND", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [76] = {SHOCKEVENT = "EVENT_SHOCKING_BROKEN_GLASS", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [77] = {SHOCKEVENT = "EVENT_SHOCKING_CAR_ALARM", DispatchCode = {"5-03","5-04"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = {100,80},EventFunction = function() return true  end}},
 [78] = {SHOCKEVENT = "EVENT_SHOCKING_CAR_CHASE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [79] = {SHOCKEVENT = "EVENT_SHOCKING_CAR_CRASH", DispatchCode = {"11-80"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [80] = {SHOCKEVENT = "EVENT_SHOCKING_BICYCLE_CRASH", DispatchCode = "11-80", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [81] = {SHOCKEVENT = "EVENT_SHOCKING_CAR_PILE_UP", DispatchCode = {"4-80","11-80"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [82] = {SHOCKEVENT = "EVENT_SHOCKING_CAR_ON_CAR", DispatchCode = {"4-80","11-80"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [83] = {SHOCKEVENT = "EVENT_SHOCKING_DANGEROUS_ANIMAL", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [84] = {SHOCKEVENT = "EVENT_SHOCKING_DEAD_BODY", DispatchCode = "4-19", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [85] = {SHOCKEVENT = "EVENT_SHOCKING_DRIVING_ON_PAVEMENT", DispatchCode = {"10-38" , "5-86"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() 
     local pedDrivingAVehicle = isPedDrivingAVehicle()
     if pedDrivingAVehicle then -- isvehicleSpeeding
         local CurrentVehicleSpeed = (GetEntitySpeed(pedDrivingAVehicle) * 2.23) or 0
         if CurrentVehicleSpeed < Config.VehicleParkingVilationSpeed then 
             local CurrentCoords = GetEntityCoords(pedDrivingAVehicle)
             local VehicleNotMoved = false 
             local ParkedCounter = Config.IllegalParkingTimeViolation
             while ParkedCounter do 
                 Wait(1000)
                 if pedDrivingAVehicle and DoesEntityExist(pedDrivingAVehicle) then 
                     local Distcheck = #(CurrentCoords - (GetEntityCoords(pedDrivingAVehicle)))
                     if Distcheck > 8.0 then 
                         ParkedCounter = false
                         VehicleNotMoved = false
                     end 

                     if ParkedCounter then 
                         ParkedCounter = ParkedCounter - 1
                         if ParkedCounter <= 1 then 
                             VehicleNotMoved = true 
                             ParkedCounter = false  
                         end 
                     end 
                 else 
                     ParkedCounter = false
                     VehicleNotMoved = false
                 end 
             end 
             return VehicleNotMoved ,{code = "5-86"}
         elseif CurrentVehicleSpeed > Config.VehicleSideWalkeSPeedForDangerousDriver then 
             return true , {code = "10-38"}
         else 
             return false 
         end 
     else 
         return false 
     end  
 end}},
 [86] = {SHOCKEVENT = "EVENT_SHOCKING_BICYCLE_ON_PAVEMENT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [87] = {SHOCKEVENT = "EVENT_SHOCKING_ENGINE_REVVED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [88] = {SHOCKEVENT = "EVENT_SHOCKING_EXPLOSION", DispatchCode = "9-96-B", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = false, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [89] = {SHOCKEVENT = "EVENT_SHOCKING_FIRE", DispatchCode = "11-71", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = false, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [90] = {SHOCKEVENT = "EVENT_SHOCKING_GUN_FIGHT", DispatchCode = "10-71", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [91] = {SHOCKEVENT = "EVENT_SHOCKING_GUNSHOT_FIRED", DispatchCode = "10-71", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [92] = {SHOCKEVENT = "EVENT_SHOCKING_HELICOPTER_OVERHEAD", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [93] = {SHOCKEVENT = "EVENT_SHOCKING_PARACHUTER_OVERHEAD", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [94] = {SHOCKEVENT = "EVENT_SHOCKING_PED_KNOCKED_INTO_BY_PLAYER", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [95] = {SHOCKEVENT = "EVENT_SHOCKING_HORN_SOUNDED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [96] = {SHOCKEVENT = "EVENT_SHOCKING_IN_DANGEROUS_VEHICLE", DispatchCode = "10-38", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [97] = {SHOCKEVENT = "EVENT_SHOCKING_INJURED_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [98] = {SHOCKEVENT = "EVENT_SHOCKING_MAD_DRIVER", DispatchCode = "5-10", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() 
     local pedDrivingAVehicle = isPedDrivingAVehicle()
     if pedDrivingAVehicle then -- isvehicleSpeeding
         local coords = GetEntityCoords(GetPlayerPed(-1))
         local blip = GetFirstBlipInfoId(8)
         local currentstreet = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z, blipX, blipY, coords.z))
         local CurrentSpeedLimit = Config.SpeedLimits[currentstreet] or 60.0
         local CurrentVehicleSpeed = (GetEntitySpeed(pedDrivingAVehicle) * 2.23) or 0

         if CurrentVehicleSpeed and CurrentSpeedLimit and  type(CurrentVehicleSpeed) == "number" and type(CurrentSpeedLimit) == "number" and CurrentVehicleSpeed > CurrentSpeedLimit * (1.0 + Config.SpeedLimitExceededPercentForSpeeding) then 
             return true , {code = "5-10"}
         else 
            --10-38
             return false 
         end 
     else 
         return false 
     end 
 end}},
 [99] = {SHOCKEVENT = "EVENT_SHOCKING_MAD_DRIVER_EXTREME", DispatchCode = {"5-05","10-38"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [100] = {SHOCKEVENT = "EVENT_SHOCKING_MAD_DRIVER_BICYCLE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [101] = {SHOCKEVENT = "EVENT_SHOCKING_MUGGING", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [102] = {SHOCKEVENT = "EVENT_SHOCKING_NON_VIOLENT_WEAPON_AIMED_AT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [103] = {SHOCKEVENT = "EVENT_SHOCKING_PED_RUN_OVER", DispatchCode = "4-80", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [104] = {SHOCKEVENT = "EVENT_SHOCKING_PED_SHOT", DispatchCode = {"2-17","10-71"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [105] = {SHOCKEVENT = "EVENT_SHOCKING_PLANE_FLY_BY", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [106] = {SHOCKEVENT = "EVENT_SHOCKING_POTENTIAL_BLAST", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [107] = {SHOCKEVENT = "EVENT_SHOCKING_PROPERTY_DAMAGE", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [108] = {SHOCKEVENT = "EVENT_SHOCKING_RUNNING_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [109] = {SHOCKEVENT = "EVENT_SHOCKING_RUNNING_STAMPEDE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 -- Always triggers when entering vehicle [110] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_CAR_STOLEN", DispatchCode = {"5-03","4-87","10-851"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [111] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_CONFRONTATION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [112] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_GANG_FIGHT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [113] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_INSULT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [114] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_MELEE_ACTION", DispatchCode = {"3-90","5-07","5-94"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = {8,5},EventFunction = function() return true  end}},
 --[115] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_NICE_CAR", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [116] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_PED_KILLED", DispatchCode = "2-40", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [117] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_VEHICLE_TOWED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [118] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_WEAPON_THREAT", DispatchCode = "4-17", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [119] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_WEIRD_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [120] = {SHOCKEVENT = "EVENT_SHOCKING_SEEN_WEIRD_PED_APPROACHING", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [121] = {SHOCKEVENT = "EVENT_SHOCKING_SIREN", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [122] = {SHOCKEVENT = "EVENT_SHOCKING_STUDIO_BOMB", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [123] = {SHOCKEVENT = "EVENT_SHOCKING_VISIBLE_WEAPON", DispatchCode = "4-17", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [124] = {SHOCKEVENT = "EVENT_SHOT_FIRED", DispatchCode = "10-71", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [125] = {SHOCKEVENT = "EVENT_SHOT_FIRED_BULLET_IMPACT", DispatchCode = "2-17", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [126] = {SHOCKEVENT = "EVENT_SHOT_FIRED_WHIZZED_BY", DispatchCode = "2-17", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [127] = {SHOCKEVENT = "EVENT_FRIENDLY_AIMED_AT", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [128] = {SHOCKEVENT = "EVENT_FRIENDLY_FIRE_NEAR_MISS", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [129] = {SHOCKEVENT = "EVENT_SHOUT_BLOCKING_LOS", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [130] = {SHOCKEVENT = "EVENT_SHOUT_TARGET_POSITION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [131] = {SHOCKEVENT = "EVENT_STATIC_COUNT_REACHED_MAX", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [132] = {SHOCKEVENT = "EVENT_STUCK_IN_AIR", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [133] = {SHOCKEVENT = "EVENT_SUSPICIOUS_ACTIVITY", DispatchCode = {"9-25","10-24"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [134] = {SHOCKEVENT = "EVENT_SWITCH_2_NM_TASK", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [135] = {SHOCKEVENT = "EVENT_UNIDENTIFIED_PED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [136] = {SHOCKEVENT = "EVENT_VEHICLE_COLLISION", DispatchCode = "10-38", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [137] = {SHOCKEVENT = "EVENT_VEHICLE_DAMAGE_WEAPON", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [138] = {SHOCKEVENT = "EVENT_VEHICLE_ON_FIRE", DispatchCode = {"9-04-A","11-71"}, AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [139] = {SHOCKEVENT = "EVENT_WHISTLING_HEARD", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [140] = {SHOCKEVENT = "EVENT_DISTURBANCE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [141] = {SHOCKEVENT = "EVENT_ENTITY_DAMAGED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [142] = {SHOCKEVENT = "EVENT_ENTITY_DESTROYED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [143] = {SHOCKEVENT = "EVENT_WRITHE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [144] = {SHOCKEVENT = "EVENT_HURT_TRANSITION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 --[145] = {SHOCKEVENT = "EVENT_PLAYER_UNABLE_TO_ENTER_VEHICLE", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 --[146] = {SHOCKEVENT = "EVENT_SCENARIO_FORCE_ACTION", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 --[147] = {SHOCKEVENT = "EVENT_STAT_VALUE_CHANGED", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
 [148] = {SHOCKEVENT = "EVENT_PLAYER_DEATH", DispatchCode = "", AreaCooldown = 120, info = {jobreported = Config.PoliceJob, includeSuspect = true, ReportChance = Config.GenericReportingChance,EventFunction = function() return true  end}},
}

local Cooldown = 0
local CooldownTable = {}
Citizen.CreateThread(function()
    if Config.AutoReporting then 
        while true do 
            Wait(500)

            local PedCoords = GetEntityCoords(PlayerPedId())
            local hour = GetClockHours()
            for i = -1 , #ShockingEvents do 
                if Config.Debug then 
                    if ShockingEvents[i] and IsShockingEventInSphere(i,PedCoords, 20.0) then 
                        print(i,ShockingEvents[i].SHOCKEVENT)
                    end 
                end 
                if ShockingEvents[i] and IsShockingEventInSphere(i,PedCoords, 20.0) and Cooldown <= 0 and not CooldownTable[i] then 
                    local alertmsg = " EMS Presence Was requested on " -- remember to add spaces before and after text
                    local alertTitle = "Police EMS Request" 
                    local alertCallCode = "10-52" --https://copradar.com/tencodes/ -- MUST BE CORRECT USED FOR AUDIO CREATION
                    local DispatchedJob = "ambulance" -- what job recieves the call? ambulance
                    local includeSustpect = false -- whether to give suspect description along with the crime
                    
                    if type(ShockingEvents[i].DispatchCode) == "table" then 
                        alertCallCode = ShockingEvents[i].DispatchCode[math.random(1,#ShockingEvents[i].DispatchCode)]
                    else 
                        alertCallCode = ShockingEvents[i].DispatchCode
                    end 

                    
                    local TriggerChance = ShockingEvents[i].info.ReportChance[1]
                    if  hour > 18 or hour < 5 then -- night time 
                        TriggerChance = ShockingEvents[i].info.ReportChance[2]
                    end 

                    local functionsReturnState, functionsReturnInfo = ShockingEvents[i].info.EventFunction()
                    if functionsReturnInfo and type(functionsReturnInfo) == "table" then 
                        if functionsReturnInfo.code then 
                            alertCallCode = functionsReturnInfo.code
                        end 
                    end 
                    if alertCallCode and type(alertCallCode) == "string" and CrimeStrings[alertCallCode] and math.random(1,100) <= TriggerChance and functionsReturnState then 
                        TriggerEvent("Syn_Dispatcher:client:ReportCriminalActivity",false,false,alertCallCode,ShockingEvents[i].info.jobreported,ShockingEvents[i].info.includeSuspect)
                        CooldownTable[i] = {cooldown = ShockingEvents[i].AreaCooldown}
                        Cooldown = Cooldown + 20
                        break 
                    end
                    Cooldown = Cooldown + 10
                end 
            end
            if Cooldown >= 0 then 
                Cooldown = Cooldown - 0.5  
            end 
            if CooldownTable then 
                holdingtable = {}
                for k,v in pairs(CooldownTable) do 
                    if v.cooldown then 
                        v.cooldown = v.cooldown - 0.5 
                        if Config.Debug then
                            print("CoolDown for Index ",k,v.cooldown)
                        end
                        if v.cooldown > 0 then 
                            holdingtable[k] = v 
                        end
                    end 
                end 
                CooldownTable = holdingtable
            end 
        end
    end
end) 

