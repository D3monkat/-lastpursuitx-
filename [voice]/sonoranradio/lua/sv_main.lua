local acePermsForRadio = false
local acePermsForTowerRepair = false

local QBCore = nil

if Config == nil then
    print('!!! CRITICAL ERROR !!!')
    print('Config file not found, did you forget to rename it?')
    print('!!! CRITICAL ERROR !!!')
else
    if Config.acePermsForRadio ~= nil then
        acePermsForRadio = Config.acePermsForRadio
    end

    if Config.acePermsForTowerRepair ~= nil then
        acePermsForTowerRepair = Config.acePermsForTowerRepair
    end

    if Config.enforceRadioItem then
        QBCore = exports['qb-core']:GetCoreObject()

        exports['qb-core']:AddItem('sonoran_radio', {
            name = 'sonoran_radio',
            label= 'Sonoran Radio',
            weight = 10,
            type = 'item',
            image = 'radio.png',
            unique = true,
            useable = true,
            shouldClose = true,
            combinable = false,
            description = 'Communicate with others through the Sonoran Radio'
        })
        QBCore.Functions.CreateUseableItem("sonoran_radio", function(source, item)
            TriggerClientEvent('qb-sonrad:use', source)
        end)

        QBCore.Functions.CreateCallback('qb-sonrad:server:GetItem', function(source, cb, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player ~= nil then
                local RadioItem = Player.Functions.GetItemByName(item)
                if RadioItem ~= nil and not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] then
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end)
    end
end

RegisterCommand("sradio", function(source, args, rawCommands)
    if source ~= 0 then
        print("This command can only be used from console.")
        return
    end
    if not args[1] then
        print("Missing command. Try \"sradio help\" fro help.")
        return
    end
    if args[1] == "help" then
        print([[
SonoranRadio Help
    help - shows this message
    update - attempt to update the radio script
]])
    elseif args[1] == "update" then
        print('Attempting to auto update...')
        RunAutoUpdater(true)
    else
        print('Missing command. Try \"sradio help\" for help.')
    end
end, true)

RegisterNetEvent("SonoranRadio::CheckPermissions")
AddEventHandler("SonoranRadio::CheckPermissions", function()
    if acePermsForRadio then
        if IsPlayerAceAllowed(source, "sonoranradio.use") then
            TriggerClientEvent("SonoranRadio::AuthorizeRadio", source)
        end
    else
        TriggerClientEvent("SonoranRadio::AuthorizeRadio", source)
    end
    if acePermsForTowerRepair then
        if IsPlayerAceAllowed(source, "sonoranradio.repair") then
            TriggerClientEvent("SonoranRadio::AuthorizeTowers", source)
        end
    else
        TriggerClientEvent("SonoranRadio::AuthorizeTowers", source)
    end
end)

local radios = {}

RegisterNetEvent('SonoranRadio::RadioPower')
AddEventHandler('SonoranRadio::RadioPower', function(power, playername)
    local src = source
    if power then
        radios[tonumber(src)] = { id = src, name = playername }
    else
        radios[tonumber(src)] = nil
    end
    TriggerClientEvent('SonoranRadio::GetRadios:Return', -1, radios)
end)

RegisterNetEvent('SonoranRadio::Msg:ToServer')
AddEventHandler('SonoranRadio::Msg:ToServer', function(recipient, payload)
    local sender = source
    TriggerClientEvent('SonoranRadio::Msg:ToClient', recipient, sender, payload)
end)