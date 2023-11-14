local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('huntingbait', function(source)
	TriggerClientEvent('kevin-hunting:usebait', source)
end)

RegisterNetEvent('kevin-hunting:removebait', function ()
	local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
	Player.Functions.RemoveItem('huntingbait', 1, false)
	TriggerClientEvent('inventory:client:ItemBox', PlayerID, QBCore.Shared.Items['huntingbait'], 'remove')
end)

QBCore.Functions.CreateCallback('kevin-hunting:haslicense', function(source, cb)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local licenseTable = Player.PlayerData.metadata['licences']
    local licenseItem = Player.Functions.GetItemByName('weaponlicense')
    cb(licenseTable.weapon, licenseItem)
end)

RegisterNetEvent('kevin-hunting:getdata', function (AnimalHash, ID)
	local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
	local data = {}
	if not ID then return end
	if AnimalHash == `a_c_deer` then
		data = {
			[1] = Config.StoreInfo[1].item,
			[2] = Config.StoreInfo[2].item,
			[3] = Config.StoreInfo[3].item,
			[4] = Config.StoreInfo[4].item,
		}
	elseif AnimalHash == `a_c_coyote` then
		data = {
			[1] = Config.StoreInfo[5].item,
			[2] = Config.StoreInfo[6].item,
			[3] = Config.StoreInfo[7].item,
			[4] = Config.StoreInfo[8].item,
		}
	elseif AnimalHash == `a_c_boar` then
		data = {
			[1] = Config.StoreInfo[9].item,
			[2] = Config.StoreInfo[10].item,
			[3] = Config.StoreInfo[11].item,
			[4] = Config.StoreInfo[12].item,
		}
	elseif AnimalHash == `a_c_mtlion` then
		data = {
			[1] = Config.StoreInfo[13].item,
			[2] = Config.StoreInfo[14].item,
			[3] = Config.StoreInfo[15].item,
			[4] = Config.StoreInfo[16].item,
		}
	elseif AnimalHash == `ig_orleans` then
		TriggerEvent('kevin-hunting:givebigfoot', PlayerID, ID)
		return
	end
	TriggerEvent('kevin-hunting:giveanimal',PlayerID, ID, data)
end)

RegisterNetEvent('kevin-hunting:giveanimal', function(source, ID, data)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local huntingrep = Player.PlayerData.metadata['hunting']
    if not ID then return end
    
    local item = data[1]
    local reputation = Config.OneStarRep
    local chance = math.random(1, 100)
    local alertchance = math.random(1, 100)
    
    if huntingrep >= Config.MidRep then
        if chance <= Config.MidRepDeer2Chance then
            item = data[2]
            reputation = Config.TwoStarRep
        elseif chance <= Config.MidRepDeer3Chance then
            item = data[3]
            reputation = Config.ThreeStarRep
        elseif chance <= Config.MidRepDeer4Chance then
            item = data[4]
            reputation = Config.FourStarRep
            if Config.UseAlerts and alertchance <= Config.FourStarAlertChance then
                TriggerClientEvent('kevin-hunting:alert', PlayerID)
            end
        end
    elseif huntingrep >= Config.HighRep then
        if chance <= Config.HighRepDeer2Chance then
            item = data[2]
            reputation = Config.TwoStarRep
        elseif chance <= Config.HighRepDeer3Chance then
            item = data[3]
            reputation = Config.ThreeStarRep
        elseif chance <= Config.HighRepDeer4Chance then
            item = data[4]
            reputation = Config.FourStarRep
            if Config.UseAlerts and alertchance <= Config.FourStarAlertChance then
                TriggerClientEvent('kevin-hunting:alert', PlayerID)
            end
        end
    end
    
    if Player.Functions.AddItem(item, 1) then
        TriggerClientEvent('inventory:client:ItemBox', PlayerID, QBCore.Shared.Items[item], 'add')
        local repreward = huntingrep + reputation
        Player.Functions.SetMetaData('hunting', repreward)

        local playerName = GetPlayerName(Player.PlayerData.source)
        local citizenID = Player.PlayerData.citizenid
        local playerID = Player.PlayerData.source

        local logMessage = '**Player: ' .. playerName .. '**\n' ..
		'**Citizen Id: ' .. citizenID .. '**\n' ..
		'**Player Id: ' .. playerID .. '**\n' ..
		'Item Received: ' .. item .. '\n' ..
		'Reputation Earned: ' .. reputation .. '\n' ..
		'Player Reputation: ' .. repreward .. '\n'

        TriggerEvent('qb-log:server:CreateLog', 'hunting', 'Hunting', 'green', logMessage)
    end
end)


RegisterNetEvent('kevin-hunting:givebigfoot', function (source, ID)
	local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
	local huntingrep = Player.PlayerData.metadata['hunting']
	if not ID then return end
	local item = 'bigfoot'
	if Player.Functions.AddItem(item, 1) then
		TriggerClientEvent('inventory:client:ItemBox', PlayerID, QBCore.Shared.Items['bigfoot'], 'add')
		local repreward = huntingrep + Config.FiveStarRep
		Player.Functions.SetMetaData('hunting', repreward)
		local bigfootalertchance = math.random(1, 100)
		if Config.UseAlerts then
			if bigfootalertchance <= Config.BigFootAlertChance then
				TriggerClientEvent('kevin-hunting:bigfootalert', PlayerID)
			end
		end

		TriggerEvent('qb-log:server:CreateLog', 'hunting', 'Hunting', 'green',
		'**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
		'**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
		'**'..'Player Id: '..Player.PlayerData.source..'**\n'..
		'Item Recieved: '..item..'\n'..
		'Reputation Earned: '..Config.FiveStarRep..'\n'..
		'Player Reputation: '..repreward..'\n')
	end
end)

RegisterNetEvent('kevin-hunting:sellcarcass', function (data)
	local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
	local item = data.item
    local carcass = Player.Functions.GetItemByName(item)
    if carcass then
        Player.Functions.RemoveItem(item, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[item], 'remove')
		Player.Functions.AddMoney(Config.PaymentType, data.price, 'Carcass Sold')
	else
		TriggerClientEvent('QBCore:Notify', PlayerID, 'You do not have any of this..', 'error')
    end
	TriggerClientEvent('kevin-hunting:DeerMenu',PlayerID)
end)

RegisterNetEvent('kevin-hunting:ValidateLicense', function ()
	local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
    local HasLicense = Player.Functions.GetItemByName(Config.HuntingLicenseItemName)
	local huntingrep = Player.PlayerData.metadata['hunting']
	if HasLicense then
		if HasLicense.info.firstname == Player.PlayerData.charinfo.firstname then
			if HasLicense.info.lastname == Player.PlayerData.charinfo.lastname then
				TriggerClientEvent('kevin-hunting:HuntingMenu', PlayerID, huntingrep)
			end
		else
			TriggerClientEvent('QBCore:Notify', PlayerID, 'This is not your licenses', 'error')
		end
	else
		TriggerClientEvent('QBCore:Notify', PlayerID, 'You do not have a license..', 'error')
	end
end)

QBCore.Functions.CreateCallback('kevin-hunting:HasLicensePayment',function(source, cb)
	local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local Payment = Config.LicenseCost
    if Player.PlayerData.money.cash >= Payment then
        Player.Functions.RemoveMoney(Config.PaymentType, Payment, 'Hunting License Payment')
        cb(true)
    else
        cb(false)
		TriggerClientEvent('QBCore:Notify', PlayerID, 'You cannot afford to do this..', 'error')
    end
end)

RegisterNetEvent('kevin-hunting:BuyHuntingLicense', function ()
	local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
    local HasLicense = Player.Functions.GetItemByName(Config.HuntingLicenseItemName)
	local Time = os.time()
	local CreatedDay = os.date('%m/%d/%Y' , Time)
	local DaysTillExpiration = Config.LicenseExpireDate
	local ExpireMath = Time + DaysTillExpiration * 24 * 60 * 60
	local ExpirationDate = os.date('%m/%d/%Y', ExpireMath)
	local info = {}
	info.firstname = Player.PlayerData.charinfo.firstname
	info.lastname = Player.PlayerData.charinfo.lastname
	info.created = CreatedDay
	info.expire = ExpirationDate
	Player.Functions.AddItem(Config.HuntingLicenseItemName, 1, nil, info)
	TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items[Config.HuntingLicenseItemName], 'add')
end)



QBCore.Functions.CreateUseableItem('knife', function(source, item)
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
	local currentCops = 0
	for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
		if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
			currentCops = currentCops + 1
		end
	end
	if currentCops >= Config.PoliceNeeded then
    	TriggerClientEvent('kevin-hunting:useknife', PlayerId)
	else
		TriggerClientEvent('QBCore:Notify', PlayerId, 'You can\'t do this right now..', 'error')
	end
end)

RegisterNetEvent('kevin-hunting:giveparts', function (pedId)
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    if not Player then return end
    if not pedId then return end
    local chance = math.random(1, 100)
    local info = {}
    if chance < Config.OrgansChance then
        for item, value in pairs(Config.BodyParts) do
            local quality = value.quality
            info.quality = quality
            if Player.Functions.AddItem(item, 1, false, info) then
                TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[item], 'add')

				TriggerEvent('qb-log:server:CreateLog', 'hunting', 'Hunting', 'green',
				'**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
				'**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
				'**'..'Player Id: '..Player.PlayerData.source..'**\n'..
				'Item Recieved: '..item..'\n'..
				'Item Quality: '..info.quality..'\n')
			end
        end
    else
        local quality = Config.BodyParts['humanmeat'].quality
        info.quality = quality
        if Player.Functions.AddItem('humanmeat', 1, false, info) then
            TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items['humanmeat'], 'add')

			TriggerEvent('qb-log:server:CreateLog', 'hunting', 'Hunting', 'green',
				'**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
				'**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
				'**'..'Player Id: '..Player.PlayerData.source..'**\n'..
				'Item Recieved: humanmeat'..'\n'..
				'Item Quality: '..info.quality..'\n')
		end
    end
end)

RegisterNetEvent('kevin-hunting:sellparts', function (data)
	local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
	if data == nil then return end
	local PlayerCoords = GetEntityCoords(GetPlayerPed(PlayerId))
	local dist = #(PlayerCoords - vector3(Config.BodyPartsPedCoords.x, Config.BodyPartsPedCoords.y, Config.BodyPartsPedCoords.z))
	if dist < 10.0 then
		if Player.Functions.RemoveItem(data.item, 1, false) then
			TriggerClientEvent('inventory:client:ItemBox', PlayerId,  QBCore.Shared.Items[data.item], 'remove')
			Player.Functions.AddMoney(Config.PaymentType, data.price, 'Organ Payment')

			TriggerEvent('qb-log:server:CreateLog', 'hunting', 'Hunting', 'green',
				'**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
				'**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
				'**'..'Player Id: '..Player.PlayerData.source..'**\n'..
				'Item Sold: '..data.item..'\n'..
				'Sold for: $'..data.price..'\n')
		end
	end
end)