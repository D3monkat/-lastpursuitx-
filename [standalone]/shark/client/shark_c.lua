QBCore = nil

if Config.Framework["framework"] == 'qb-core' then
	QBCore = exports['qb-core']:GetCoreObject()
end

local shark_net = nil
local AnyPlayerNearShark = nil
local isSharkAttack = false
local inZone = false
local sharkDoRepelent = false

-- RegisterCommand('shark', function(source, args, rawCommand)
	-- TriggerEvent('jake:client:spawnShark')
-- end)

RegisterNetEvent('jake:client:spawnShark')
AddEventHandler('jake:client:spawnShark', function()
    local model = GetHashKey('a_c_sharktiger')
    RequestModel(model)
	
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
    end
	
    local pCoords = GetEntityCoords(PlayerPedId())
	local EnemyShark = CreatePed(1, model, pCoords.x+10, pCoords.y+10, pCoords.z-2, 100, true, false)
	local netid = PedToNet(EnemyShark)
	shark_net = netid	
	
	-- AddBlipForEntity(NetToPed(shark_net))
	
	SetPedSeeingRange(NetToPed(shark_net), 100.0)
	SetPedHearingRange(NetToPed(shark_net), 80.0)
	SetPedCombatAttributes(NetToPed(shark_net), 46, 1)
	SetPedFleeAttributes(NetToPed(shark_net), 0, 0)
	SetPedCombatRange(NetToPed(shark_net),2)
	SetPedDiesInWater(NetToPed(shark_net), false)
	TaskCombatPed(NetToPed(shark_net), GetPlayerPed(-1), 0, 16)
	
	isSharkAttack = true
	
    if not NetworkGetEntityIsNetworked(NetToPed(shark_net)) then
        NetworkRegisterEntityAsNetworked(NetToPed(shark_net))
    end

	SetPedRelationshipGroupHash(NetToPed(shark_net), GetHashKey("HATES_PLAYER"))
	SetRelationshipBetweenGroups(5,GetHashKey("PLAYER"),GetHashKey("SHARK"))
	SetRelationshipBetweenGroups(5,GetHashKey("SHARK"),GetHashKey("PLAYER"))

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local pedcoords = GetEntityCoords(ped, true)		
			
		if inZone == false and isSharkAttack == false then
		
			local name = GetNameOfZone(pedcoords.x, pedcoords.y, pedcoords.z)

			if name == 'OCEANA' or name == 'PALCOV' then
				local InWater = IsEntityInWater(ped)
				if InWater and not sharkDoRepelent then
					inZone = true
					TriggerEvent('jake:client:spawnShark')

				end
			end		
		end
		
		if isSharkAttack == true then
		
			local count = 240 -- 20min
			while true do
				Citizen.Wait(5000) 
				count = count - 1
				if count <= 0 then
					break
				end
			end
			
			DeleteEntity(NetToPed(shark_net))
			shark_net = nil
			isSharkAttack = false 
		end
		
		local count = 24 -- 2min
		while true do
			Citizen.Wait(5000) 
			count = count - 1
			if count <= 0 then
				break
			end
		end
		
	end
end)

RegisterNetEvent('jake:client:sharkDoRepelent')
AddEventHandler('jake:client:sharkDoRepelent', function(name, slot)

	if sharkDoRepelent then return Notif('You already smell like farts...') end
	

	Notif('I smell like farts now...')
	TriggerServerEvent('jake:server:takeSharkRepelent', name, slot)
	sharkDoRepelent = true
	local count = 180 -- 15min
	while sharkDoRepelent do
		Citizen.Wait(5000) 
		count = count - 1
		if count <= 0 then
				sharkDoRepelent = false
				Notif('Fart smell has worn off...')
			break
		end
	end

end)

function Notif(msg)
	if Config.Framework["framework"] == 'qb-core' then
		QBCore.Functions.Notify(msg)
	elseif Config.Framework["framework"] == 'esx' then 
		ESX.ShowNotification(msg)
	end
end

