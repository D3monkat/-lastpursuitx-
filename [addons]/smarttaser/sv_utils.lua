webhookLink = ""

if main.framework.vRP then
    local Tunnel = module('vrp', 'lib/Tunnel')
    local Proxy = module('vrp', 'lib/Proxy')
    vRP = Proxy.getInterface('vRP')
    vRPclient = Tunnel.getInterface('vRP','vRP')
end

ESX = nil
if main.framework.ESX then
    ESX = exports["es_extended"]:getSharedObject()
end

QBCore = nil
if main.framework.QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

function logToDiscord(event, device, carrier, cartridgesRemaining, cartID)

    local name = GetPlayerName(carrier)
    local serialNumber = "X" .. math.random(10000000, 99999999)
    local embed
    local deviceName = tasers[device].name
    local battery = math.random(10, 100)
    local time = os.date("*t")
    local day = os.date("%A")
    local color = main.webhookOptions.colour
    local useCartID
    if cartID ~= nil then
        useCartID = true
    end
    if time.month < 10 then
        time.month = "0" .. time.month
    end

    if useCartID then
        embed = {
            {
                ["fields"] = {
                    {
                        ["name"] = "**"..main.translations.event.."**",
                        ["value"] = event,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.device.."**",
                        ["value"] = deviceName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.carrier.."**",
                        ["value"] = name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.cartridgeID.."**",
                        ["value"] = cartID,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.cartridgesRemaining.."**",
                        ["value"] = cartridgesRemaining,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.serialNumber.."**",
                        ["value"] = serialNumber,
                        ["inline"] = true
                    },
                    
                    {
                        ["name"] = "**"..main.translations.battery.."**",
                        ["value"] = battery .. "%",
                        ["inline"] = true
                    },
                },
                ["color"] = color,
                ["title"] = "**"..main.translations.embedTitle.."**",
                ["description"] = "",
                ["footer"] = {
                    ["text"] = main.translations.timestamp.. " " .. day .. " " .. time.day .. "/" .. time.month .. "/" .. time.year
                },
                ["thumbnail"] = {
                    ["url"] = main.webhookOptions.webhookImage,
                },
            }
        }
    else
        embed = {
            {
                ["fields"] = {
                    {
                        ["name"] = "**"..main.translations.event.."**",
                        ["value"] = event,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.device.."**",
                        ["value"] = deviceName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.carrier.."**",
                        ["value"] = name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.cartridgesRemaining.."**",
                        ["value"] = cartridgesRemaining,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**"..main.translations.serialNumber.."**",
                        ["value"] = serialNumber,
                        ["inline"] = true
                    },
                    
                    {
                        ["name"] = "**"..main.translations.battery.."**",
                        ["value"] = battery .. "%",
                        ["inline"] = true
                    },
                },
                ["color"] = color,
                ["title"] = "**"..main.translations.embedTitle.."**",
                ["description"] = "",
                ["footer"] = {
                    ["text"] = main.translations.timestamp.. " " .. day .. " " .. time.day .. "/" .. time.month .. "/" .. time.year
                },
                ["thumbnail"] = {
                    ["url"] = main.webhookOptions.webhookImage,
                },
            }
        }



    end
    PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = main.webhookOptions.webHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end