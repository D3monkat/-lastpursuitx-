local radActive = false

local thisUnit = {}
local unitStatus = nil

local thisCall = {}

local isTalking = false

local inVehicle = false

local authorized = false

RegisterNetEvent("SonoranCAD::sonrad:GetUnitInfo:Return")
AddEventHandler("SonoranCAD::sonrad:GetUnitInfo:Return", function(unit)
	SendNUIMessage({
		type = 'unitStatus',
		status = unit.status
	})
	-- TODO: Work with unit cache to fix this.
	-- thisUnit = unit
	-- if thisUnit ~= nil then
	-- 	if unitStatus ~= thisUnit.status then
	-- 		unitStatus = thisUnit.status
	-- 		SendNUIMessage({
	-- 			type = 'unitStatus',
	-- 			status = thisUnit.status
	-- 		})
	-- 		--print('status updated')
	-- 	end
	-- else
	-- 	SendNUIMessage({
	-- 		type = 'unitStatus',
	-- 		status = -1
	-- 	})
	-- end
end)

RegisterNetEvent("SonoranCAD::sonrad:UpdateCurrentCall")
AddEventHandler("SonoranCAD::sonrad:UpdateCurrentCall", function(call)
	local dispatch = call.dispatch
	DebugPrint(json.encode(dispatch))
	SendNUIMessage({
		type = 'callUpdate',
		call = dispatch
	})
end)

CreateThread(function()
	while true do
		Wait(5000)
		TriggerServerEvent("SonoranCAD::sonrad:GetUnitInfo")
		TriggerServerEvent("SonoranCAD::sonrad:GetCurrentCall")
	end
end)

local Radio = {
	Has = false,
	Open = false,
	On = false,
	Enabled = true,
	Handle = nil,
	Hud = "off",
	Prop = GetHashKey('prop_cs_hand_radio'),
	Bone = 28422,
	Offset = vector3(0.0, 0.0, 0.0),
	Rotation = vector3(0.0, 0.0, 0.0),
	Dictionary = {
		"cellphone@",
		"cellphone@in_car@ds",
		"cellphone@str",
		"random@arrests",
	},
	Animation = {
		"cellphone_text_in",
		"cellphone_text_out",
		"cellphone_call_listen_a",
		"generic_radio_chatter",
	},
	Clicks = true, -- Radio clicks
	TalkAnim = true
}

local QBCore = nil
local PlayerData = nil
if Config.enforceRadioItem then
	QBCore = exports['qb-core']:GetCoreObject()
	PlayerData = {}
end

CreateThread(function()
	if Config.enforceRadioItem then
		while QBCore.Functions.GetPlayerData() == nil do
			Wait(10)
		end
	end
end)

CreateThread(function()
	while Config.enforceRadioItem do
		Wait(1000)
		if LocalPlayer.state.isLoggedIn then
			--print("has radio")
			QBCore.Functions.TriggerCallback('qb-sonrad:server:GetItem', function(hasItem)
				if not hasItem then
					Radio.Has = false
					Radio:Toggle(false)
				else
					Radio.Has = true
				end
			end, "sonoran_radio")
		end
	end
end)


RegisterNetEvent("qb-sonrad:use")
AddEventHandler("qb-sonrad:use", function()
	radioToggle()
end)

-- Disable Attack when Radio is Open
CreateThread(function()
	while true do
		if Radio.Open then
			DisableControlAction(0, 142, true) -- Attack
			DisableControlAction(0, 200, true) -- Escape
		end
		Wait(0)
	end
end)

RegisterNetEvent("SonoranCAD::sonrad:UpdateCurrentCall")
AddEventHandler("SonoranCAD::sonrad:UpdateCurrentCall", function(call)
	local dispatch = call.dispatch
	DebugPrint(json.encode(dispatch))
	SendNUIMessage({
		type = 'callUpdate',
		call = dispatch
	})
end)

function radioToggle()
	if authorized then
		if not Config.enforceRadioItem then
			Radio.Has = true
		end

		if Radio.Has then
			radActive = not radActive
			Radio:Toggle(radActive)
			SendNUIMessage({
				type = 'setUiPositions',
				data = json.decode(GetResourceKvpString('ui_pos_dic') or '{}')
			})
			SendNUIMessage({
				type = 'setVisible',
				visibility = radActive
			})
			if radActive then
				SetNuiFocus(true, true)
			else
				SetNuiFocus(false, false)
			end

			local inVeh = IsPedInAnyVehicle(GetPlayerPed(-1), false)
			--if inVeh then SetNuiFocus(false, false) end
		else
			DebugPrint("Radio Requested, but player doesn't have a radio.")
		end


	else
		SendNotification("Radio: ~r~No Permission~r~")
	end
end

RegisterNetEvent("SonoranRadio::AuthorizeRadio")
AddEventHandler("SonoranRadio::AuthorizeRadio", function()
	DebugPrint("Authorized for Radio Usage")
	authorized = true
end)

RegisterCommand('radio', radioToggle)
RegisterCommand('sonradradio', radioToggle)

RegisterCommand('radiotalk', function()
	Radio.TalkAnim = not Radio.TalkAnim
	if Radio.TalkAnim then
		SendNotification("Radio Talk Animation: ~g~On~g~")
	else
		SendNotification("Radio Talk Animation: ~r~Off~r~")
	end
end)

RegisterCommand('radioreset', function()
	SendNUIMessage({
		type = 'reset'
	})
end)

RegisterCommand('radiohud', function(source, args, rawCommand)
	if #args < 1 then
		SendNotification("~r~Error: ~w~Please specify hud size using ~b~/radiohud (size)")
		SendNotification("~b~small~w~, ~b~medium~w~, ~b~large~w~, or ~b~off~w~.")
	else
		Radio.Hud = args[1]
		SendNUIMessage({
			type = 'radioHud',
			size = args[1]
		})
	end
end)

-- Talking Animation
-- RegisterCommand('sonradtalk', function()
-- 	Radio:Talking(isTalking)
-- end)

RegisterNetEvent('SonoranRadio::API:NextPreset')
AddEventHandler('SonoranRadio::API:NextPreset', function()
    SendNUIMessage({
        type = 'pushButton',
        button = 'next'
    })
end)

RegisterNetEvent('SonoranRadio::API:PrevPreset')
AddEventHandler('SonoranRadio::API:PrevPreset', function()
    SendNUIMessage({
        type = 'pushButton',
        button = 'prev'
    })
end)

RegisterNetEvent('SonoranRadio::API:PowerToggle')
AddEventHandler('SonoranRadio::API:PowerToggle', function()
    SendNUIMessage({
        type = 'pushButton',
        button = 'power'
    })
end)

RegisterNetEvent('SonoranRadio::API:PanicButton')
AddEventHandler('SonoranRadio::API:PanicButton', function()
    SendNUIMessage({
        type = 'pushButton',
        button = 'panic'
    })
end)

RegisterNetEvent('SonoranRadio::API:SetPreset')
AddEventHandler('SonoranRadio::API:SetPreset', function(number)
    SendNUIMessage({
        type = 'goToPreset',
        preset = number
    })
end)

-- Next
RegisterCommand('sonradnext', function()
	TriggerEvent('SonoranRadio::API:NextPreset')
end)

-- Previous
RegisterCommand('sonradprev', function()
	TriggerEvent('SonoranRadio::API:PrevPreset')
end)

-- Power
RegisterCommand('sonradpower', function()
	TriggerEvent('SonoranRadio::API:PowerToggle')
end)

-- Panic
RegisterCommand('sonradpanic', function()
	TriggerEvent('SonoranRadio::API:PanicButton')
end)
RegisterKeyMapping('sonradradio', 'Show Radio', 'keyboard', '')
RegisterKeyMapping('sonradnext', 'Next Preset', 'keyboard', '')
RegisterKeyMapping('sonradprev', 'Prev Preset', 'keyboard', '')
RegisterKeyMapping('sonradpower', 'Radio Power', 'keyboard', '')
RegisterKeyMapping('sonradpanic', 'Radio Panic', 'keyboard', '')

function Radio:Talking(toggle)
	local inVeh = IsPedInAnyVehicle(GetPlayerPed(-1), false)
	if self.TalkAnim then
		if toggle and not inVeh then
			if self.Open then
				RequestAnimDict("cellphone@")
				while not HasAnimDictLoaded("cellphone@") do Wait(5) end
				TaskPlayAnim(PlayerPedId(), "cellphone@","cellphone_text_to_call", 8.0, 0.0, -1, 50, 0, false, false, false)

				-- Wait(300)
				-- RequestAnimDict("cellphone@str")
				-- while not HasAnimDictLoaded("cellphone@str") do Wait(5) end
				-- TaskPlayAnim(PlayerPedId(), "cellphone@str","cellphone_call_listen_a", 8.0, 0.0, -1, 50, 0, false, false, false)

				isTalking = true


			else
				RequestAnimDict("random@arrests")
				while not HasAnimDictLoaded("random@arrests") do Wait(5) end
				TaskPlayAnim(PlayerPedId(), "random@arrests","generic_radio_chatter", 8.0, 0.0, -1, 49, 0, 0, 0, 0)
				isTalking = true
			end
		else
			if self.Open then
				-- cellphone@cellphone_call_to_text
				-- cellphone@cellphone_text_read_base
				--

				--StopAnimTask(PlayerPedId(), "cellphone@","cellphone_text_to_call", 4.0)
				if inVeh then return end
				--Citizen.Wait(700)
				RequestAnimDict("cellphone@")
				while not HasAnimDictLoaded("cellphone@") do Wait(5) end
				--TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_in", 4.0, -1, -1, 50, 0, false, false, false)
				TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_call_to_text", 4.0, -1, -1, 50, 0, false, false, false)
				isTalking = false
			else
				StopAnimTask(PlayerPedId(), "random@arrests","generic_radio_chatter", -4.0)
				isTalking = false
			end
		end
	else
		if isTalking then
			StopAnimTask(PlayerPedId(), "cellphone@str","cellphone_call_listen_a", -4.0)
			StopAnimTask(PlayerPedId(), "random@arrests","generic_radio_chatter", -4.0)
			isTalking = false
		end
	end
end

function Radio:Toggle(toggle)
	local playerPed = PlayerPedId()
	local count = 0

	if IsEntityDead(playerPed) then
		self.Open = false

		DetachEntity(self.Handle, true, false)
		DeleteEntity(self.Handle)

		return
	end

	if self.Open == toggle then
		return
	end
	if IsPlayerFreeAiming(PlayerId()) or IsPedInAnyVehicle(GetPlayerPed(-1)) then
		return
	end

	self.Open = toggle

	local dictionaryType = 1 + (IsPedInAnyVehicle(playerPed, false) and 1 or 0)
	local animationType = 1 + (self.Open and 0 or 1)
	local dictionary = self.Dictionary[dictionaryType]
	local animation = self.Animation[animationType]

	RequestAnimDict(dictionary)

	while not HasAnimDictLoaded(dictionary) do
		Citizen.Wait(150)
	end

	if self.Open then
		RequestModel(self.Prop)
		while not HasModelLoaded(self.Prop) do
			Citizen.Wait(150)
		end
		self.Handle = CreateObject(self.Prop, 0.0, 0.0, 0.0, true, true, false)
		local bone = GetPedBoneIndex(playerPed, self.Bone)
		SetCurrentPedWeapon(playerPed, GetHashKey('weapon_unarmed'), true)
		AttachEntityToEntity(self.Handle, playerPed, bone, self.Offset.x, self.Offset.y, self.Offset.z, self.Rotation.x, self.Rotation.y, self.Rotation.z, true, false, false, false, 2, true)
		SetModelAsNoLongerNeeded(self.Handle)
		TaskPlayAnim(playerPed, dictionary, animation, 4.0, -1, -1, 50, 0, false, false, false)
	elseif DoesEntityExist(self.Handle) then
		local radioHndl = self.Handle
		TaskPlayAnim(playerPed, dictionary, animation, 4.0, -1, -1, 50, 0, false, false, false)
		Citizen.Wait(700)
		StopAnimTask(playerPed, dictionary, animation, 1.0)
		NetworkRequestControlOfEntity(radioHndl)
		while not NetworkHasControlOfEntity(radioHndl) and count < 5000 do
			Citizen.Wait(0)
			count = count + 1
		end
		DetachEntity(radioHndl, true, false)
		DeleteEntity(radioHndl)
	end
end

function Radio:Destroy()
	local playerPed = PlayerPedId()
	local count = 0
	NetworkRequestControlOfEntity(self.Handle)
	while not NetworkHasControlOfEntity(self.Handle) and count < 5000 do
		Citizen.Wait(0)
		count = count + 1
	end
	DetachEntity(self.Handle, true, false)
	DeleteEntity(self.Handle)
end

Citizen.CreateThread(function()
    SetNuiFocus(false, false)
	TriggerServerEvent("SonoranRadio::CheckPermissions")
    while true do
        local ped = GetPlayerPed(-1)
        if DoesEntityExist(ped) then
            local pos = GetEntityCoords(ped)
            local posArr = {math.floor(pos.x), math.floor(pos.y), math.floor(pos.z)}
            SendNUIMessage({type = 'setPos', position = posArr })
        end
        Citizen.Wait(5000)
    end
    -- For Development Only
    DebugPrint('Sonoran Radio Started!')
end)

CreateThread(function()
	while true do
		local hours = GetClockHours()
		local minutes = GetClockMinutes()
		if hours < 9 then hours = "0" .. tostring(hours) end
		if minutes < 9 then minutes = "0" .. tostring(minutes) end
		SendNUIMessage({type = 'time', time = hours .. ':' .. minutes})
		Wait(500)
	end
end)

function SendNotification(message)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(message)
	EndTextCommandThefeedPostTicker(false, false)
end

RegisterNUICallback('data', function(data, cb)
    --print('data:' .. json.encode(data))
    if data.type == 'hide' then
		radActive = false
		Radio:Toggle(radActive)
		if not inVehicle or data.force then
			SendNUIMessage({
				type = 'setVisible',
				visibility = radActive
			})
		end
		SetNuiFocusKeepInput(false)
		SetNuiFocus(false, false)
    end

	if data.type == 'notify' then
		SendNotification(data.message)
	end

	if data.type == 'panic' then
		TriggerServerEvent('SonoranCAD::callcommands:SendPanicApi')
	end

	if data.type == 'power' then
		TriggerServerEvent('SonoranRadio::RadioPower', data.power, GetPlayerName(PlayerId()))
		Radio.On = data.power
	end

	if data.type == 'talking' then
		Radio:Talking(data.talking)
	end

	if data.type == 'setUiPositions' then
		-- save positions of components in the UI
		SetResourceKvp('ui_pos_dic', json.encode(data.data))
	end

    cb('OK')
end)

AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() ~= resource then return end
	DebugPrint('Sonoran Radio Starting...')
	TriggerEvent("chat:addSuggestion", "/radio", "Open the Sonoran Radio Interface")
	TriggerEvent("chat:addSuggestion", "/radioreset", "Reconnect radio to teamspeak")
	TriggerEvent("chat:addSuggestion", "/radiotalk", "Toggle your radio talk animation")
	DebugPrint('Sonoran Radio Started!')
end)

AddEventHandler('onResourceStop', function(resource)
	if GetCurrentResourceName() ~= resource then return end
	DebugPrint('Sonoran Radio Stopping...')
	TriggerEvent("chat:removeSuggestion", "/radio")
	TriggerEvent("chat:removeSuggestion", "/radioreset")
	TriggerEvent("chat:removeSuggestion", "/radiotalk")
	Radio:Destroy()
end)

RegisterNetEvent('SonoranRadio::GetRadios:Return')
AddEventHandler('SonoranRadio::GetRadios:Return', function(radios)
	SendNUIMessage({
		type = "getRadios",
		radios = radios
	})
end)

CreateThread(function()
	while true do

		local veh = GetVehiclePedIsIn(GetPlayerPed(), false)
		local prevState = inVehicle
		--DebugPrint("Getting Players Vehicle")

		if not IsPedInAnyVehicle(PlayerPedId(), false) then
			-- player is in vehicle
			inVehicle = false
		else
			inVehicle = true
		end

		--DebugPrint("Updating Radio State")
		SendNUIMessage({
			type = "inVehicle",
			vehState = inVehicle
		})

		if prevState ~= inVehicle then
			SendNUIMessage({
				type = 'setVisible',
				visibility = false
			})
		end

		Wait(100)
	end
end)

local PlayerDead = false
local RadioLastState = nil

RegisterNetEvent("SonoranRadio::PlayerDeath", function()
	PlayerDead = true
	if Config.disableRadioOnDeath then
		if Radio.On then
			Radio.Enabled = false
			Radio:Toggle(false)
			SendNUIMessage({
				type = 'setVisible',
				visibility = false
			})
			SendNUIMessage({
				type = 'power',
				power = false
			})
			SendNUIMessage({
				type = 'radioHud',
				size = "off"
			})
			SetNuiFocus(false, false)
			DebugPrint("Radio Disabled Due to Death.")
		end
	end
end)

RegisterNetEvent("SonoranRadio::PlayerRevive", function()
	PlayerDead = false
	if Config.disableRadioOnDeath then
		if Config.restoreRadioStateWhenAlive then
			if Radio.Enabled == false then
				SendNUIMessage({
					type = 'power',
					power = true
				})
				SendNUIMessage({
					type = 'radioHud',
					size = Radio.Hud
				})
			end
		end
		Radio.Enabled = true
	end
end)

local QBDeath = false;

CreateThread(function()
	local QBCore = nil
	if Config.deathDetectionMethod == 'qbcore' then
		QBCore = exports['qb-core']:GetCoreObject()
	end

	while true do
		if QBCore ~= nil then
			local PlayerData = QBCore.Functions.GetPlayerData()
			if PlayerData ~= nil then
				--print("Is Dead: " .. tostring(PlayerData.metadata["isdead"]))
				--print("Is Last Stand: " .. tostring(PlayerData.metadata["islaststand"]))
				QBDeath = PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"]
			end
		end

		if Config.deathDetectionMethod == "auto" or Config.deathDetectionMethod == "qbcore" then
			local IsPlayerDead = IsEntityDead(PlayerPedId()) or QBDeath
			if IsPlayerDead then
				TriggerEvent("SonoranRadio::PlayerDeath")
			else
				TriggerEvent("SonoranRadio::PlayerRevive")
			end
		end
		--print("QBDeath:" .. tostring(QBDeath))
		--print("EntityDead:" .. tostring(IsEntityDead(PlayerPedId())))
		--print("Radio Enabled: " .. tostring(Radio.Enabled))
		Wait(1000)
	end
end)