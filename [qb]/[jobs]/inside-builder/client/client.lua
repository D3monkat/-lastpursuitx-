local QBCore = exports['qb-core']:GetCoreObject()

local PlayerData = {}
local Experience = 0
local Level = 1
local Login = false
local Done = 0
local haspackage = false
local packnumber = 0
local anim = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
	if (Config.jobrequirement and (PlayerData.job ~= nil and PlayerData.job.name == Config.jobname)) then
		CreateBossBlip(true)
	elseif not Config.jobrequirement then
		CreateBossBlip(true)
	end
	Login = true
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function()
	PlayerData.job = QBCore.Functions.GetPlayerData().job
	if (Config.jobrequirement and (PlayerData.job ~= nil and PlayerData.job.name == Config.jobname)) then
		CreateBossBlip(true)
	elseif not Config.jobrequirement then
		CreateBossBlip(true)
	else 
		CreateBossBlip(false)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if Login then
			QBCore.Functions.TriggerCallback('inside-builder:getexperience', function(exp)
				Experience = exp
			end, PlayerData)
			break
		end
	end
end)

function CreateBossBlip(type)
	if type then
		RemoveBlip(StartJobBlip)
		StartJobBlip = AddBlipForCoord(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z)
		
		SetBlipSprite (StartJobBlip, 408)
		SetBlipDisplay(StartJobBlip, 4)
		SetBlipScale  (StartJobBlip, 0.8)
		SetBlipColour (StartJobBlip, 0)
		SetBlipAsShortRange(StartJobBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Builder Work')
		EndTextCommandSetBlipName(StartJobBlip)
	else
		RemoveBlip(StartJobBlip)
	end
end

Citizen.CreateThread(function()
	if not Config.jobrequirement then
		CreateBossBlip(true)
	end
	local ped_hash = GetHashKey(Config.builder['BossSpawn'].Type)
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end	
	BossNPC = CreatePed(1, ped_hash, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-1, Config.builder['BossSpawn'].Pos.h, false, true)
	SetBlockingOfNonTemporaryEvents(BossNPC, true)
	SetPedDiesWhenInjured(BossNPC, false)
	SetPedCanPlayAmbientAnims(BossNPC, true)
	SetPedCanRagdollFromPlayerImpact(BossNPC, false)
	SetEntityInvincible(BossNPC, true)
	FreezeEntityPosition(BossNPC, true)
	while true do

		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			if not Config.jobrequirement then
				if(GetDistanceBetweenCoords(coords,Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z, true) < 9.0) then	
					sleep = 4
					if(GetDistanceBetweenCoords(coords,Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z, true) < 1.5) then	
						if not JobStarted then
							if Experience < Config.ExperienceRequirement[Level].Requirement then
								DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'Experience Requirement [~r~'..Experience..'~w~/'..Config.ExperienceRequirement[Level].Requirement..']', 35)
							else
								DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'Experience Requirement [~g~'..Experience..'~w~/'..Config.ExperienceRequirement[Level].Requirement..']', 35)
							end
							
							DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.15, ' [~g~Q~w~]  Level '..Level..'  [~g~E~w~]', 15)

							DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+0.20, 'To start work, press [~g~G~w~]', 25)
							DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
						else
							DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'To finish work, press [~r~G~w~]', 25)
							DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 133, 0, 0, 100, false, true, 2, false, false, false, false)
						end
						if (IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and not JobStarted) and Experience >= Config.ExperienceRequirement[Level].Requirement then
							exports.rprogress:Custom({
								Duration = 2500,
								Label = "Changing wear...",
								Animation = {
									scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
									animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(2500)
							local PlayerData = QBCore.Functions.GetPlayerData()
							if PlayerData.charinfo.gender == 0 then 
								SetPedComponentVariation(ped, 3, Config.Clothes[Level].male['arms'], 0, 0) --arms
								SetPedComponentVariation(ped, 8, Config.Clothes[Level].male['tshirt_1'], Config.Clothes[Level].male['tshirt_2'], 0) --t-shirt
								SetPedComponentVariation(ped, 11, Config.Clothes[Level].male['torso_1'], Config.Clothes[Level].male['torso_2'], 0) --torso2
								SetPedComponentVariation(ped, 9, Config.Clothes[Level].male['bproof_1'], Config.Clothes[Level].male['bproof_2'], 0) --vest
								SetPedComponentVariation(ped, 10, Config.Clothes[Level].male['decals_1'], Config.Clothes[Level].male['decals_2'], 0) --decals
								SetPedComponentVariation(ped, 7, Config.Clothes[Level].male['chain_1'], Config.Clothes[Level].male['chain_2'], 0) --accessory
								SetPedComponentVariation(ped, 4, Config.Clothes[Level].male['pants_1'], Config.Clothes[Level].male['pants_2'], 0) -- pants
								SetPedComponentVariation(ped, 6, Config.Clothes[Level].male['shoes_1'], Config.Clothes[Level].male['shoes_2'], 0) --shoes
								SetPedPropIndex(ped, 0, Config.Clothes[Level].male['helmet_1'], Config.Clothes[Level].male['helmet_2'], true) --hat
								SetPedPropIndex(ped, 2, Config.Clothes[Level].male['ears_1'], Config.Clothes[Level].male['ears_2'], true) --ear
							else
								SetPedComponentVariation(ped, 3, Config.Clothes[Level].female['arms'], 0, 0) --arms
								SetPedComponentVariation(ped, 8, Config.Clothes[Level].female['tshirt_1'], Config.Clothes[Level].female['tshirt_2'], 0) --t-shirt
								SetPedComponentVariation(ped, 11, Config.Clothes[Level].female['torso_1'], Config.Clothes[Level].female['torso_2'], 0) --torso2
								SetPedComponentVariation(ped, 9, Config.Clothes[Level].female['bproof_1'], Config.Clothes[Level].female['bproof_2'], 0) --vest
								SetPedComponentVariation(ped, 10, Config.Clothes[Level].female['decals_1'], Config.Clothes[Level].female['decals_2'], 0) --decals
								SetPedComponentVariation(ped, 7, Config.Clothes[Level].female['chain_1'], Config.Clothes[Level].female['chain_2'], 0) --accessory
								SetPedComponentVariation(ped, 4, Config.Clothes[Level].female['pants_1'], Config.Clothes[Level].female['pants_2'], 0) -- pants
								SetPedComponentVariation(ped, 6, Config.Clothes[Level].female['shoes_1'], Config.Clothes[Level].female['shoes_2'], 0) --shoes
								SetPedPropIndex(ped, 0, Config.Clothes[Level].female['helmet_1'], Config.Clothes[Level].female['helmet_2'], true) --hat
								SetPedPropIndex(ped, 2, Config.Clothes[Level].female['ears_1'], Config.Clothes[Level].female['ears_2'], true) --ear
							end				
	
							JobStarted = true
							JobStart()	
						elseif IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and JobStarted then
							exports.rprogress:Custom({
								Duration = 2500,
								Label = "Changing wear...",
								Animation = {
									scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
									animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(2500)
							TriggerServerEvent("qb-clothes:loadPlayerSkin")
							exports.pNotify:SendNotification({text = "<b>Boss</b></br>Thanks for the help", timeout = 4500})
							JobStarted = false
							DeletePed(BossPlaceNPC)	
							for i, v in ipairs(Config.Places1lvl[Place].Places) do
								v.Done = false
								RemoveBlip(v.blip)
							end
							Done = 0
							RemoveBlip(BossPlaceBlip)
							packnumber = 0
							DeleteEntity(Pallete)
							doneWork = false
							haspackage = false
							DeleteEntity(pack)
							QBCore.Functions.DeleteVehicle(Vehicle)
							RemoveBlip(PackagesBlip)
							RemoveBlip(ConstructionBlip)

						elseif (IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and not JobStarted) and Experience < Config.ExperienceRequirement[Level].Requirement then
							exports.pNotify:SendNotification({text = "<b>Boss</b></br>You don't have enough experience", timeout = 4500})					
						elseif IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and not JobStarted then
							if Level ~= 3 then
								Level = Level + 1
							end
						elseif IsControlJustReleased(0, Keys['Q']) and not IsPedInAnyVehicle(ped, false) and not JobStarted then
							if Level ~= 1 then 
								Level = Level - 1
							end
						end
					else
						DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					end
				end
			elseif (Config.jobrequirement and (PlayerData.job ~= nil and PlayerData.job.name == Config.jobname)) then
				if(GetDistanceBetweenCoords(coords,Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z, true) < 9.0) then	
					sleep = 4
					if(GetDistanceBetweenCoords(coords,Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z, true) < 1.5) then	
						if not JobStarted then
							if Experience < Config.ExperienceRequirement[Level].Requirement then
								DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'Experience Requirement [~r~'..Experience..'~w~/'..Config.ExperienceRequirement[Level].Requirement..']', 35)
							else
								DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'Experience Requirement [~g~'..Experience..'~w~/'..Config.ExperienceRequirement[Level].Requirement..']', 35)
							end
							
							DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.15, ' [~g~Q~w~]  Level '..Level..'  [~g~E~w~]', 15)

							DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+0.20, 'To start work, press [~g~G~w~]', 25)
							DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
						else
							DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'To finish work, press [~r~G~w~]', 25)
							DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 133, 0, 0, 100, false, true, 2, false, false, false, false)
						end
						if (IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and not JobStarted) and Experience >= Config.ExperienceRequirement[Level].Requirement then
							exports.rprogress:Custom({
								Duration = 2500,
								Label = "Changing wear...",
								Animation = {
									scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
									animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(2500)
							local PlayerData = QBCore.Functions.GetPlayerData()
							if PlayerData.charinfo.gender == 0 then 
								SetPedComponentVariation(ped, 3, Config.Clothes[Level].male['arms'], 0, 0) --arms
								SetPedComponentVariation(ped, 8, Config.Clothes[Level].male['tshirt_1'], Config.Clothes[Level].male['tshirt_2'], 0) --t-shirt
								SetPedComponentVariation(ped, 11, Config.Clothes[Level].male['torso_1'], Config.Clothes[Level].male['torso_2'], 0) --torso2
								SetPedComponentVariation(ped, 9, Config.Clothes[Level].male['bproof_1'], Config.Clothes[Level].male['bproof_2'], 0) --vest
								SetPedComponentVariation(ped, 10, Config.Clothes[Level].male['decals_1'], Config.Clothes[Level].male['decals_2'], 0) --decals
								SetPedComponentVariation(ped, 7, Config.Clothes[Level].male['chain_1'], Config.Clothes[Level].male['chain_2'], 0) --accessory
								SetPedComponentVariation(ped, 4, Config.Clothes[Level].male['pants_1'], Config.Clothes[Level].male['pants_2'], 0) -- pants
								SetPedComponentVariation(ped, 6, Config.Clothes[Level].male['shoes_1'], Config.Clothes[Level].male['shoes_2'], 0) --shoes
								SetPedPropIndex(ped, 0, Config.Clothes[Level].male['helmet_1'], Config.Clothes[Level].male['helmet_2'], true) --hat
								SetPedPropIndex(ped, 2, Config.Clothes[Level].male['ears_1'], Config.Clothes[Level].male['ears_2'], true) --ear
							else
								SetPedComponentVariation(ped, 3, Config.Clothes[Level].female['arms'], 0, 0) --arms
								SetPedComponentVariation(ped, 8, Config.Clothes[Level].female['tshirt_1'], Config.Clothes[Level].female['tshirt_2'], 0) --t-shirt
								SetPedComponentVariation(ped, 11, Config.Clothes[Level].female['torso_1'], Config.Clothes[Level].female['torso_2'], 0) --torso2
								SetPedComponentVariation(ped, 9, Config.Clothes[Level].female['bproof_1'], Config.Clothes[Level].female['bproof_2'], 0) --vest
								SetPedComponentVariation(ped, 10, Config.Clothes[Level].female['decals_1'], Config.Clothes[Level].female['decals_2'], 0) --decals
								SetPedComponentVariation(ped, 7, Config.Clothes[Level].female['chain_1'], Config.Clothes[Level].female['chain_2'], 0) --accessory
								SetPedComponentVariation(ped, 4, Config.Clothes[Level].female['pants_1'], Config.Clothes[Level].female['pants_2'], 0) -- pants
								SetPedComponentVariation(ped, 6, Config.Clothes[Level].female['shoes_1'], Config.Clothes[Level].female['shoes_2'], 0) --shoes
								SetPedPropIndex(ped, 0, Config.Clothes[Level].female['helmet_1'], Config.Clothes[Level].female['helmet_2'], true) --hat
								SetPedPropIndex(ped, 2, Config.Clothes[Level].female['ears_1'], Config.Clothes[Level].female['ears_2'], true) --ear
							end		
							JobStarted = true
							JobStart()	
						elseif IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and JobStarted then
							exports.rprogress:Custom({
								Duration = 2500,
								Label = "Changing wear...",
								Animation = {
									scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
									animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
								},
								DisableControls = {
									Mouse = false,
									Player = true,
									Vehicle = true
								}
							})
							Citizen.Wait(2500)
							TriggerServerEvent("qb-clothes:loadPlayerSkin")
							exports.pNotify:SendNotification({text = "<b>Boss</b></br>Thanks for the help", timeout = 4500})
							JobStarted = false
							DeletePed(BossPlaceNPC)	
							for i, v in ipairs(Config.Places1lvl[Place].Places) do
								v.Done = false
								RemoveBlip(v.blip)
							end
							Done = 0
							RemoveBlip(BossPlaceBlip)
							packnumber = 0
							DeleteEntity(Pallete)
							doneWork = false
							haspackage = false
							DeleteEntity(pack)
							QBCore.Functions.DeleteVehicle(Vehicle)
							RemoveBlip(PackagesBlip)
							RemoveBlip(ConstructionBlip)

						elseif (IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false) and not JobStarted) and Experience < Config.ExperienceRequirement[Level].Requirement then
							exports.pNotify:SendNotification({text = "<b>Boss</b></br>You don't have enough experience", timeout = 4500})			
						elseif IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) and not JobStarted then
							if Level ~= #Config.ExperienceRequirement then
								Level = Level + 1
							end
						elseif IsControlJustReleased(0, Keys['Q']) and not IsPedInAnyVehicle(ped, false) and not JobStarted then
							if Level ~= 1 then 
								Level = Level - 1
							end
						end
					else
						DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					end
				end
			else
				if(GetDistanceBetweenCoords(coords,Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z, true) < 9.0) then	
					sleep = 5
					if(GetDistanceBetweenCoords(coords,Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z, true) < 1.5) then	
						DrawText3Ds(Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z+1.0, 'You are not employed as ~r~'..Config.jobname, 25)
						DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
					else
						DrawMarker(25, Config.builder['BossSpawn'].Pos.x, Config.builder['BossSpawn'].Pos.y, Config.builder['BossSpawn'].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		Citizen.Wait(sleep)
	end
end)

function CreateBlipsWork()
	for i, v in ipairs(Config.Places1lvl[Place].Places) do
		v.blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)		
		SetBlipSprite (v.blip, 1)
		SetBlipDisplay(v.blip, 4)
		SetBlipScale  (v.blip, 0.8)
		SetBlipColour (v.blip, 0)
		SetBlipAsShortRange(v.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Workplace')
		EndTextCommandSetBlipName(v.blip)
	end
end

function CreateBlipsWorkLVL3()
	for i, v in ipairs(Config.Places3lvl[Place].Places) do
		v.blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)		
		SetBlipSprite (v.blip, 1)
		SetBlipDisplay(v.blip, 4)
		SetBlipScale  (v.blip, 0.8)
		SetBlipColour (v.blip, 0)
		SetBlipAsShortRange(v.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Workplace')
		EndTextCommandSetBlipName(v.blip)
	end
end

function JobStart()
	if Level == 1 then
		Place = math.random(1, #Config.Places1lvl)
		exports.pNotify:SendNotification({text = "<b>Boss</b></br>Go to the place where the construction boss is waiting for you", timeout = 4500})

		local ped_hash = GetHashKey(Config.Places1lvl[Place].Type)
		RequestModel(ped_hash)
		while not HasModelLoaded(ped_hash) do
			Citizen.Wait(1)
		end	
		BossPlaceNPC = CreatePed(1, ped_hash, Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z-1, Config.Places1lvl[Place].Pos.h, false, true)
		SetBlockingOfNonTemporaryEvents(BossPlaceNPC, true)
		SetPedDiesWhenInjured(BossPlaceNPC, false)
		SetPedCanPlayAmbientAnims(BossPlaceNPC, true)
		SetPedCanRagdollFromPlayerImpact(BossPlaceNPC, false)
		SetEntityInvincible(BossPlaceNPC, true)
		FreezeEntityPosition(BossPlaceNPC, true)


		BossPlaceBlip = AddBlipForCoord(Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z)		
		SetBlipSprite (BossPlaceBlip, 525)
		SetBlipDisplay(BossPlaceBlip, 4)
		SetBlipScale  (BossPlaceBlip, 0.8)
		SetBlipColour (BossPlaceBlip, 0)
		SetBlipAsShortRange(BossPlaceBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Construction boss')
		EndTextCommandSetBlipName(BossPlaceBlip)

		

		Citizen.CreateThread(function()
			while true do
				local sleep = 100
				local ped = PlayerPedId()
				local coords = GetEntityCoords(ped)
				if(GetDistanceBetweenCoords(coords,Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z, true) < 9.0) then	
					sleep = 4
					DrawMarker(25, Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
					if(GetDistanceBetweenCoords(coords,Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z, true) < 1.5) then
						DrawText3Ds(Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z+1.15, 'Hello, you have to help me with a few things.', 45)
						DrawText3Ds(Config.Places1lvl[Place].Pos.x, Config.Places1lvl[Place].Pos.y, Config.Places1lvl[Place].Pos.z+1.0, 'To start work, press [~g~G~w~]', 26)
						if(IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false)) then
							RemoveBlip(BossPlaceBlip)
							CreateBlipsWork()
							exports.pNotify:SendNotification({text = "<b>Boss</b></br>Go to the designated places and do the work", timeout = 4500})
							while true do 
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								Citizen.Wait(4)
								for i, v in ipairs(Config.Places1lvl[Place].Places) do
									if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 6.0) and not v.Done then
										DrawMarker(25, v.Pos.x, v.Pos.y, v.Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
										if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.5) and not v.Done then
											DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z+1, 'To start work, press [~g~E~w~]', 30)
											if(IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false)) then
												SetEntityCoords(ped, v.Pos.x, v.Pos.y, v.Pos.z-0.99)
												SetEntityHeading(ped, v.Pos.h)

												if v.Tool == 'hammer' then
													hammer = CreateObject(GetHashKey('prop_tool_hammer'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(hammer, ped, GetPedBoneIndex(ped, 28422), 0.0, 0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)

													startAnim(ped, 'amb@world_human_hammering@male@base', 'base')
												elseif v.Tool == 'pneumatic hammer' then
													Phammer = CreateObject(GetHashKey('prop_tool_jackham'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(Phammer, ped, GetPedBoneIndex(ped, 28422), 0.0, 0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
													
													startAnim(ped, 'amb@world_human_const_drill@male@drill@base', 'base')
												elseif v.Tool == 'drill' then
													Drill = CreateObject(GetHashKey('prop_tool_drill'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(Drill, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.07, 0.0, 0.0, 0.0, 90.0, 1, 1, 0, 0, 2, 1)
														
													startAnim(ped, 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle')
													RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
													RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
													RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)
													drillSound = GetSoundId()													
													PlaySoundFromEntity(drillSound, "Drill", Drill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)											
												elseif v.Tool == 'weld' then
													weld = CreateObject(GetHashKey('prop_weld_torch'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(weld, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
													
													startAnim(ped, 'amb@world_human_welding@male@base', 'base')												
												end
												exports.rprogress:Custom({
													Duration = v.WorkingTime,
													Label = "You are working...",
													Animation = {
														scenario = "", -- https://pastebin.com/6mrYTdQv
														animationDictionary = "", -- https://alexguirre.github.io/animations-list/
													},
													DisableControls = {
														Mouse = false,
														Player = true,
														Vehicle = true
													}
												})
												Citizen.Wait(v.WorkingTime)
												if v.Tool == 'hammer' then
													DeleteEntity(hammer)
												elseif v.Tool == 'pneumatic hammer' then
													DeleteEntity(Phammer)
												elseif v.Tool == 'drill' then
													DeleteEntity(Drill)
													StopSound(drillSound)	
												elseif v.Tool == 'weld' then			
													DeleteEntity(weld)
												end							
												ClearPedTasks(ped)
												v.Done = true
												RemoveBlip(v.blip)
												Done = Done + 1	
												exports.pNotify:SendNotification({text = "<b>Boss</b></br>You did the job [<font style='color: #3bf5c3;'>"..Done.."</font>/"..#Config.Places1lvl[Place].Places.."]", timeout = 1500})									
											end
										end
									end
								end
								if Done == #Config.Places1lvl[Place].Places then
									for i, v in ipairs(Config.Places1lvl[Place].Places) do
										v.Done = false
									end
									Done = 0
									QBCore.Functions.TriggerCallback('inside-builder:payout', function(money,exp)
										Experience = Experience + exp
										Citizen.Wait(1000)
										exports.pNotify:SendNotification({text = '<b>Boss</b></br>You have earned '..money..'$ and '..exp..' experience. <br> Totally experience [<b>'..Experience..']</b>', timeout = 3500})
									end,PlayerData, Level)
									DeletePed(BossPlaceNPC)
									break
								end
							end
							Citizen.CreateThread(function()
								Citizen.Wait(4000)
								JobStart()
							end)
							break
						end
					end
				end
				Citizen.Wait(sleep)
				if not JobStarted then
					break 
				end
			end
		end)
	elseif Level == 2 then
		Place = math.random(1, #Config.Places2lvl)
		exports.pNotify:SendNotification({text = "<b>Boss</b></br>Go to the place where the construction boss is waiting for you", timeout = 4500})

		local ped_hash = GetHashKey(Config.Places2lvl[Place].Type)
		RequestModel(ped_hash)
		while not HasModelLoaded(ped_hash) do
			Citizen.Wait(1)
		end	
		BossPlaceNPC = CreatePed(1, ped_hash, Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z-1, Config.Places2lvl[Place].Pos.h, false, true)
		SetBlockingOfNonTemporaryEvents(BossPlaceNPC, true)
		SetPedDiesWhenInjured(BossPlaceNPC, false)
		SetPedCanPlayAmbientAnims(BossPlaceNPC, true)
		SetPedCanRagdollFromPlayerImpact(BossPlaceNPC, false)
		SetEntityInvincible(BossPlaceNPC, true)
		FreezeEntityPosition(BossPlaceNPC, true)


		BossPlaceBlip = AddBlipForCoord(Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z)		
		SetBlipSprite (BossPlaceBlip, 525)
		SetBlipDisplay(BossPlaceBlip, 4)
		SetBlipScale  (BossPlaceBlip, 0.8)
		SetBlipColour (BossPlaceBlip, 0)
		SetBlipAsShortRange(BossPlaceBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Construction boss')
		EndTextCommandSetBlipName(BossPlaceBlip)	
		
		Citizen.CreateThread(function()
			while true do
				local sleep = 100
				local ped = PlayerPedId()
				local coords = GetEntityCoords(ped)
				if(GetDistanceBetweenCoords(coords,Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z, true) < 9.0) then	
					sleep = 4
					DrawMarker(25, Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
					if(GetDistanceBetweenCoords(coords,Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z, true) < 1.5) then
						DrawText3Ds(Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z+1.15, 'Hello, you need to bring me some things to the construction site.', 70)
						DrawText3Ds(Config.Places2lvl[Place].Pos.x, Config.Places2lvl[Place].Pos.y, Config.Places2lvl[Place].Pos.z+1.0, 'To start work, press [~g~G~w~]', 25)
						if(IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false)) then
							if IsSpawnPointClear(vector3(Config.Places2lvl[Place].VehiclePos.x, Config.Places2lvl[Place].VehiclePos.y, Config.Places2lvl[Place].VehiclePos.z), 2) then			
								QBCore.Functions.SpawnVehicle(Config.Places2lvl[Place].Vehicle, function(vehicle)
									Vehicle = vehicle
									DeletePed(BossPlaceNPC)
									SetVehicleNumberPlateText(vehicle, "BUI"..tostring(math.random(1000, 9999)))
									TaskWarpPedIntoVehicle(ped, vehicle, -1)
									SetEntityHeading(vehicle, Config.Places2lvl[Place].VehiclePos.h)
									SetEntityAsMissionEntity(vehicle, true, true)
									TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle))								
									SetVehicleEngineOn(vehicle, true, true)
									Plate = GetVehicleNumberPlateText(vehicle)

									RemoveBlip(BossPlaceBlip)
									exports.pNotify:SendNotification({text = "<b>Boss</b></br>Go to the pickup point and load the packages", timeout = 3500})	
									
									PackagesBlip = AddBlipForCoord(Config.Places2lvl[Place].PlaceLoad.x, Config.Places2lvl[Place].PlaceLoad.y, Config.Places2lvl[Place].PlaceLoad.z)		
									SetBlipSprite (PackagesBlip, 501)
									SetBlipDisplay(PackagesBlip, 4)
									SetBlipScale  (PackagesBlip, 0.8)
									SetBlipColour (PackagesBlip, 0)
									SetBlipAsShortRange(PackagesBlip, true)
									BeginTextCommandSetBlipName("STRING")
									AddTextComponentString('Packages Place')
									EndTextCommandSetBlipName(PackagesBlip)	
									
									Pallete = CreateObject(GetHashKey('prop_paints_pallete01'), Config.Places2lvl[Place].PlaceLoad.x, Config.Places2lvl[Place].PlaceLoad.y, Config.Places2lvl[Place].PlaceLoad.z-1, false, true, true)
									PlaceObjectOnGroundProperly(Pallete)
									FreezeEntityPosition(Pallete, true)
									doneWork = false

									Citizen.CreateThread(function()
										while true do 
											local sleep = 500
											local ped = PlayerPedId()
											local coords = GetEntityCoords(ped)
												if(GetDistanceBetweenCoords(coords,Config.Places2lvl[Place].PlaceLoad.x, Config.Places2lvl[Place].PlaceLoad.y, Config.Places2lvl[Place].PlaceLoad.z, false) < 2.5) and not haspackage then
													sleep = 0
													DrawText3Ds(Config.Places2lvl[Place].PlaceLoad.x, Config.Places2lvl[Place].PlaceLoad.y, Config.Places2lvl[Place].PlaceLoad.z + 0.25, 'To pick up the package, press [~g~E~w~]', 35)
													if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
														startAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search")
														exports.rprogress:Custom({
															Duration = 1000,
															Label = "You pick up the package...",
															Animation = {
																scenario = "", -- https://pastebin.com/6mrYTdQv
																animationDictionary = "", -- https://alexguirre.github.io/animations-list/
															},
															DisableControls = {
																Mouse = false,
																Player = true,
																Vehicle = true
															}
														})
														Citizen.Wait(1000)
														ClearPedTasks(ped)	

														anim = true
														
														local coordsPED = GetEntityCoords(ped)
														packmodel = math.random(1,3)
														if packmodel == 1 then
															pack = CreateObject(GetHashKey('prop_paints_can03'), coordsPED.x, coordsPED.y, coordsPED.z,  false,  true, true)
														elseif packmodel == 2 then
															pack = CreateObject(GetHashKey('prop_tool_cable01'), coordsPED.x, coordsPED.y, coordsPED.z,  false,  true, true)
														elseif packmodel == 3 then
															pack = CreateObject(GetHashKey('prop_tool_hardhat'), coordsPED.x, coordsPED.y, coordsPED.z,  false,  true, true)
														end
														SetEntityCollision(pack, false)		
														AttachEntityToEntity(pack, ped, GetPedBoneIndex(ped, 57005), 0.25, 0.05, -0.2, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
														haspackage = true
													end
												end
											Citizen.Wait(sleep)
											if not JobStarted then
												break 
											end
											if packnumber == 3 then
												packnumber = 0
												break
											end
										end
									end)

									Citizen.CreateThread(function()
										while true do 
											local sleep = 500
											local ped = PlayerPedId()
											local coords = GetEntityCoords(ped)
												if not IsPedInAnyVehicle(ped, false) and haspackage then
													sleep = 4
													local trunkpos = GetOffsetFromEntityInWorldCoords(Vehicle, 0, -2.5, 0)
													if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, trunkpos.x, trunkpos.y, trunkpos.z, true) < 2.5 then
														DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.25, 'To put down package, press [~g~E~w~]', 35)
														if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then															
															DeleteEntity(pack)
															startAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search")
															exports.rprogress:Custom({
																Duration = 1000,
																Label = "You put the package away...",
																Animation = {
																	scenario = "", -- https://pastebin.com/6mrYTdQv
																	animationDictionary = "", -- https://alexguirre.github.io/animations-list/
																},
																DisableControls = {
																	Mouse = false,
																	Player = true,
																	Vehicle = true
																}
															})
															Citizen.Wait(1000)
															ClearPedTasks(ped)
															haspackage = false
															packnumber = packnumber + 1
														end
													end
												end
											Citizen.Wait(sleep)
											if not JobStarted then
												break 
											end
											if packnumber == 3 then	
												doneWork = true	
												DeleteEntity(Pallete)
												RemoveBlip(PackagesBlip)				
												break
											end
										end
									end)

									while true do
										local sleep = 500
										local ped = PlayerPedId()
										local coords = GetEntityCoords(ped)
											if doneWork then
												exports.pNotify:SendNotification({text = "<b>Boss</b></br>You have loaded the vehicle, go to the construction site", timeout = 3500})
												
												ConstructionBlip = AddBlipForCoord(Config.Places2lvl[Place].PlaceUnLoad.x, Config.Places2lvl[Place].PlaceUnLoad.y, Config.Places2lvl[Place].PlaceUnLoad.z)		
												SetBlipSprite (ConstructionBlip, 479)
												SetBlipDisplay(ConstructionBlip, 4)
												SetBlipScale  (ConstructionBlip, 0.8)
												SetBlipColour (ConstructionBlip, 0)
												SetBlipAsShortRange(ConstructionBlip, true)
												BeginTextCommandSetBlipName("STRING")
												AddTextComponentString('Construction')
												EndTextCommandSetBlipName(ConstructionBlip)		
												
												while true do
													local sleep = 500
													local ped = PlayerPedId()
													local coords = GetEntityCoords(ped)
														if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Places2lvl[Place].PlaceUnLoad.x, Config.Places2lvl[Place].PlaceUnLoad.y, Config.Places2lvl[Place].PlaceUnLoad.z, true) < 9.5 then
															sleep = 0
															DrawMarker(25, Config.Places2lvl[Place].PlaceUnLoad.x, Config.Places2lvl[Place].PlaceUnLoad.y, Config.Places2lvl[Place].PlaceUnLoad.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 3.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
															if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Places2lvl[Place].PlaceUnLoad.x, Config.Places2lvl[Place].PlaceUnLoad.y, Config.Places2lvl[Place].PlaceUnLoad.z, true) < 2.5 then
																DrawText3Ds(Config.Places2lvl[Place].PlaceUnLoad.x, Config.Places2lvl[Place].PlaceUnLoad.y, Config.Places2lvl[Place].PlaceUnLoad.z+1.0, 'To unload the vehicle, press [~g~E~w~]', 35)
																if IsControlJustReleased(0, Keys['E']) and IsPedInAnyVehicle(ped, false) then
																	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
																	if GetVehicleNumberPlateText(vehicle) == Plate then
																		exports.rprogress:Custom({
																			Duration = 2500,
																			Label = "Unloading the vehicle...",
																			Animation = {
																				scenario = "", -- https://pastebin.com/6mrYTdQv
																				animationDictionary = "", -- https://alexguirre.github.io/animations-list/
																			},
																			DisableControls = {
																				Mouse = false,
																				Player = true,
																				Vehicle = true
																			}
																		})
																		Citizen.Wait(2500)	
																		TaskLeaveVehicle(ped, vehicle, 0)
																		Citizen.Wait(2500)
																		QBCore.Functions.DeleteVehicle(Vehicle)
																		RemoveBlip(ConstructionBlip)
																		QBCore.Functions.TriggerCallback('inside-builder:payout', function(money,exp)
																			Experience = Experience + exp
																			exports.pNotify:SendNotification({text = '<b>Boss</b></br>You have earned '..money..'$ and '..exp..' experience. <br> Totally experience [<b>'..Experience..']</b>', timeout = 3500})
																		end,PlayerData, Level)
																		Citizen.CreateThread(function()
																			Citizen.Wait(4000)
																			JobStart()
																		end)
																		break
																	end
																end
															end
														end
													Citizen.Wait(sleep)
												end
												break
											end	
										Citizen.Wait(sleep)
									end										
								end, vector3(Config.Places2lvl[Place].VehiclePos.x, Config.Places2lvl[Place].VehiclePos.y, Config.Places2lvl[Place].VehiclePos.z))
								break
							else
								exports.pNotify:SendNotification({text = "<b>Boss</b></br>The vehicle pickup location is occupied", timeout = 3500})
							end
						end
					end
				end
				Citizen.Wait(sleep)
				if not JobStarted then
					break 
				end
			end
		end)		
	elseif Level == 3 then
		Place = math.random(1, #Config.Places3lvl)
		exports.pNotify:SendNotification({text = "<b>Boss</b></br>Go to the client, he needs your help", timeout = 4500})

		local ped_hash = GetHashKey(Config.Places3lvl[Place].Type)
		RequestModel(ped_hash)
		while not HasModelLoaded(ped_hash) do
			Citizen.Wait(1)
		end	
		BossPlaceNPC = CreatePed(1, ped_hash, Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z-1, Config.Places3lvl[Place].Pos.h, false, true)
		SetBlockingOfNonTemporaryEvents(BossPlaceNPC, true)
		SetPedDiesWhenInjured(BossPlaceNPC, false)
		SetPedCanPlayAmbientAnims(BossPlaceNPC, true)
		SetPedCanRagdollFromPlayerImpact(BossPlaceNPC, false)
		SetEntityInvincible(BossPlaceNPC, true)
		FreezeEntityPosition(BossPlaceNPC, true)


		BossPlaceBlip = AddBlipForCoord(Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z)		
		SetBlipSprite (BossPlaceBlip, 525)
		SetBlipDisplay(BossPlaceBlip, 4)
		SetBlipScale  (BossPlaceBlip, 0.8)
		SetBlipColour (BossPlaceBlip, 0)
		SetBlipAsShortRange(BossPlaceBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Client')
		EndTextCommandSetBlipName(BossPlaceBlip)

		

		Citizen.CreateThread(function()
			while true do
				local sleep = 100
				local ped = PlayerPedId()
				local coords = GetEntityCoords(ped)
				if(GetDistanceBetweenCoords(coords,Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z, true) < 9.0) then	
					sleep = 4
					DrawMarker(25, Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
					if(GetDistanceBetweenCoords(coords,Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z, true) < 1.5) then
						DrawText3Ds(Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z+1.15, 'Hello, you have to help me with a few things.', 45)
						DrawText3Ds(Config.Places3lvl[Place].Pos.x, Config.Places3lvl[Place].Pos.y, Config.Places3lvl[Place].Pos.z+1.0, 'To talk about work, press [~g~G~w~]', 26)
						if(IsControlJustReleased(0, Keys['G']) and not IsPedInAnyVehicle(ped, false)) then
							TaskTurnPedToFaceEntity(ped, BossPlaceNPC, -1)
							FreezeEntityPosition(ped, true)
							startAnim(ped, 'special_ped@baygor@monologue_3@monologue_3d', 'trees_can_talk_3')
							startAnim(BossPlaceNPC, 'special_ped@baygor@monologue_3@monologue_3g', 'trees_can_talk_6')
							Citizen.Wait(3000)
							FreezeEntityPosition(ped, false)
							ClearPedTasks(ped)
							ClearPedTasks(BossPlaceNPC)

							RemoveBlip(BossPlaceBlip)
							CreateBlipsWorkLVL3()
							exports.pNotify:SendNotification({text = "<b>Client</b></br>Go to the designated places and do the work", timeout = 4500})
							while true do 
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								Citizen.Wait(4)
								for i, v in ipairs(Config.Places3lvl[Place].Places) do
									if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 6.0) and not v.Done then
										DrawMarker(25, v.Pos.x, v.Pos.y, v.Pos.z-0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
										if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.5) and not v.Done then
											DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z+1, 'To start work, press [~g~E~w~]', 30)
											if(IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false)) then
												SetEntityCoords(ped, v.Pos.x, v.Pos.y, v.Pos.z-0.99)
												SetEntityHeading(ped, v.Pos.h)

												if v.Tool == 'hammer' then
													hammer = CreateObject(GetHashKey('prop_tool_hammer'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(hammer, ped, GetPedBoneIndex(ped, 28422), 0.0, 0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)

													startAnim(ped, 'amb@world_human_hammering@male@base', 'base')
												elseif v.Tool == 'pneumatic hammer' then
													Phammer = CreateObject(GetHashKey('prop_tool_jackham'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(Phammer, ped, GetPedBoneIndex(ped, 28422), 0.0, 0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
													
													startAnim(ped, 'amb@world_human_const_drill@male@drill@base', 'base')
												elseif v.Tool == 'drill' then
													Drill = CreateObject(GetHashKey('prop_tool_drill'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(Drill, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.07, 0.0, 0.0, 0.0, 90.0, 1, 1, 0, 0, 2, 1)
														
													startAnim(ped, 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle')
													RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
													RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
													RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)
													drillSound = GetSoundId()													
													PlaySoundFromEntity(drillSound, "Drill", Drill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)											
												elseif v.Tool == 'weld' then
													weld = CreateObject(GetHashKey('prop_weld_torch'),coords.x, coords.y,coords.z, true, true, true)
													AttachEntityToEntity(weld, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
													
													startAnim(ped, 'amb@world_human_welding@male@base', 'base')												
												end
												exports.rprogress:Custom({
													Duration = v.WorkingTime,
													Label = "You are working...",
													Animation = {
														scenario = "", -- https://pastebin.com/6mrYTdQv
														animationDictionary = "", -- https://alexguirre.github.io/animations-list/
													},
													DisableControls = {
														Mouse = false,
														Player = true,
														Vehicle = true
													}
												})
												Citizen.Wait(v.WorkingTime)
												if v.Tool == 'hammer' then
													DeleteEntity(hammer)
												elseif v.Tool == 'pneumatic hammer' then
													DeleteEntity(Phammer)
												elseif v.Tool == 'drill' then
													DeleteEntity(Drill)
													StopSound(drillSound)	
												elseif v.Tool == 'weld' then			
													DeleteEntity(weld)
												end							
												ClearPedTasks(ped)
												v.Done = true
												RemoveBlip(v.blip)
												Done = Done + 1	
												exports.pNotify:SendNotification({text = "<b>Client</b></br>You did the job [<font style='color: #3bf5c3;'>"..Done.."</font>/"..#Config.Places3lvl[Place].Places.."]", timeout = 1500})									
											end
										end
									end
								end
								if Done == #Config.Places3lvl[Place].Places then
									for i, v in ipairs(Config.Places3lvl[Place].Places) do
										v.Done = false
									end
									Done = 0
									QBCore.Functions.TriggerCallback('inside-builder:payout', function(money,exp)
										Experience = Experience + exp
										Citizen.Wait(1000)
										exports.pNotify:SendNotification({text = '<b>Boss</b></br>You have earned '..money..'$ and '..exp..' experience. <br> Totally experience [<b>'..Experience..']</b>', timeout = 3500})
									end,PlayerData, Level)
									DeletePed(BossPlaceNPC)
									break
								end
							end
							Citizen.CreateThread(function()
								Citizen.Wait(4000)
								JobStart()
							end)
							break
						end
					end
				end
				Citizen.Wait(sleep)
				if not JobStarted then
					break 
				end
			end
		end)
	end
end

--##############################

function IsSpawnPointClear(coords, radius)
	local vehicles = GetVehiclesInArea(coords, radius)

	return #vehicles == 0
end

function GetVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

function GetClosestVehicle(coords)
	local vehicles        = GetVehicles()
	local closestDistance = -1
	local closestVehicle  = -1
	local coords          = coords

	if coords == nil then
		local playerPed = PlayerPedId()
		coords          = GetEntityCoords(playerPed)
	end

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if closestDistance == -1 or closestDistance > distance then
			closestVehicle  = vehicles[i]
			closestDistance = distance
		end
	end

	return closestVehicle, closestDistance
end

function GetVehiclesInArea(coords, area)
	local vehicles       = GetVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

--##############################

function startAnim(ped, dictionary, anim)
	Citizen.CreateThread(function()
	  RequestAnimDict(dictionary)
	  while not HasAnimDictLoaded(dictionary) do
		Citizen.Wait(0)
	  end
		TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)

		RequestAnimDict(dictionary)
		while not HasAnimDictLoaded(dictionary) do
		  Citizen.Wait(0)
		end
		  TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)

		  RequestAnimDict(dictionary)
		  while not HasAnimDictLoaded(dictionary) do
			Citizen.Wait(0)
		  end
			TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

Citizen.CreateThread(function()
	local doo = 0
	while true do
		sleep = 500
		if anim then
			sleep = 0
			RequestAnimDict('anim@heists@box_carry@')
			while not HasAnimDictLoaded('anim@heists@box_carry@') do
			  Citizen.Wait(0)
			end
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle' ,8.0, -8.0, -1, 49, 0, false, false, false)
			doo = doo + 1 
			if doo >= 3 then
				doo = 0
				anim = false
			end
		end			
		Citizen.Wait(sleep)
	end
end)

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function DrawText3Ds(x, y, z, text, shadow)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = shadow / 370
	if shadow ~= 0 then		
   		DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	end
    ClearDrawOrigin()
end
