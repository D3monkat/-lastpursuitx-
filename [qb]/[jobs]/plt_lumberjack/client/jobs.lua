------------------------------- QB-CORE Events -----------------------------
--RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
--	TriggerEvent("plt_lumberjack:JobUpdate",val.job.name,val.job.grade.level)
--	JobUpdate(val.job.name,val.job.grade.level)
--end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	local QBCore = exports['qb-core']:GetCoreObject()
	while QBCore.Functions.GetPlayerData().job == nil do Citizen.Wait(1000) end
	local PlayerData = QBCore.Functions.GetPlayerData()
	JobUpdate(PlayerData.job.name,PlayerData.job.grade.level)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
	JobUpdate(JobInfo.name,JobInfo.grade.level)
end)
-------------------------------ESX Events -----------------------------
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(PlayerData)
	JobUpdate(PlayerData.job.name,PlayerData.job.grade)
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	JobUpdate(job.name,job.grade)
end)
------------------------------ Other FrameWorks ------------------------
RegisterNetEvent('plt_lumberjack:JobUpdate')
AddEventHandler('plt_lumberjack:JobUpdate', function(jobName,jobGrade)
	JobUpdate(jobName,jobGrade)
end)
----------------------------------- 0 ----------------------------------
AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos) 
	if workStage ~= nil then 
		Notification(__["jobCancelledDied"].type,__["jobCancelledDied"].text,__["jobCancelledDied"].duration)
		CancelJob()
	end
end)
function JobUpdate(jobName,jobGrade)
	if playerJobName ~= jobName or playerJobGrade ~= jobGrade then 
	   playerJobName = jobName
	   playerJobGrade = jobGrade
	   refrehPedBlip()
   end 
end