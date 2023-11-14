local missingIdentifierMessages = {
    ["steam"] = "missing_steam_identifier",
    ["license"] = "missing_license_identifier",
    ["ip"] = "missing_ip_identifier",
    ["discord"] = "missing_discord_identifier",
    ["xbl"] = "missing_xbl_identifier",
    ["live"] = "missing_live_identifier",
    ["fivem"] = "missing_fivem_identifier"
}

local card = nil
local requestAlreadySentCard = nil

local playersPendingConnection = {}

RegisterNetEvent("easy_allowlist:serverConfigLoaded", function()
    card = {
        ["type"] = "AdaptiveCard",
        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
        ["version"] = "1.5",
        ["body"] = {
            {
                ["type"] = "TextBlock",
                ["text"] = getLocalizedText("you_are_not_allowlisted"),
                ["wrap"] = true,
                ["horizontalAlignment"] = "Center",
                ["style"] = "default",
                ["size"] = "ExtraLarge",
                ["color"] = "Warning",
                ["weight"] = "Bolder"
            },
            {
                ["type"] = "ActionSet",
                ["actions"] = {
                    {
                        ["type"] = "Action.Submit",
                        ["style"] = "positive",
                        ["title"] = getLocalizedText("send_allowlist_request")
                    },
                    {
                        ["type"] = "Action.OpenUrl",
                        ["title"] = getLocalizedText("join_discord_server"),
                        ["url"] = config.discordInvite
                    }
                },
                ["spacing"] = "Large",
                ["separator"] = true
            }
        }
    }

    -- Removes the discord button if the invite is empty
    if(config.discordInvite == "" or not config.discordInvite) then
        table.remove(card.body[2].actions, 2)
    end

    -- Removes the button "send allowlist request"
    if(not config.showSendAllowlistRequestButton) then
        table.remove(card.body[2].actions, 1)
    end

    requestAlreadySentCard = {
        ["version"] = "1.5",
        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
        ["type"] = "AdaptiveCard",
        ["body"] = {
            {
                ["weight"] = "Bolder",
                ["text"] = getLocalizedText("you_have_already_sent_allowlist_request"),
                ["type"] = "TextBlock",
                ["color"] = "Good",
                ["size"] = "ExtraLarge",
                ["horizontalAlignment"] = "Center",
                ["wrap"] = true,
                ["style"] = "default"
            },
            {
                ["type"] = "TextBlock",
                ["text"] = "Your request ID: unknown",
                ["wrap"] = true,
                ["spacing"] = "Medium",
                ["horizontalAlignment"] = "Center",
                ["style"] = "default",
                ["size"] = "Large",
                ["color"] = "Warning"
            },
            {
                ["separator"] = true,
                ["spacing"] = "Large",
                ["type"] = "ActionSet",
                ["actions"] = {
                    {
                        ["type"] = "Action.OpenUrl",
                        ["title"] = getLocalizedText("join_discord_server"),
                        ["url"] = config.discordInvite
                    }
                }
            }
        }
    }

    -- Removes the discord button if the invite is empty
    if(config.discordInvite == "" or not config.discordInvite) then
        table.remove(requestAlreadySentCard.body[3].actions, 1)
    end
end)

local isCheckingPendingPlayers = false

local function checkPendingPlayers()
    if(isCheckingPendingPlayers) then
        return
    else
        isCheckingPendingPlayers = true
    end

    local pendingPlayers = nil 

    while pendingPlayers == nil or pendingPlayers > 0 do
        pendingPlayers = 0 

        for identifier, data in pairs(playersPendingConnection) do
            if GetPlayerName(data.playerId) then
                pendingPlayers = pendingPlayers + 1
            else
                playersPendingConnection[identifier] = nil
            end
        end

        Citizen.Wait(5000)
    end

    isCheckingPendingPlayers = false
end

function EasyAllowlist.acceptAllowlistOfPendingPlayer(identifier)
    if(playersPendingConnection[identifier]) then
        local playerId = playersPendingConnection[identifier].playerId
        local playerName = GetPlayerName(playerId)

        if(playerName) then
            EasyAllowlist.addToQueue(playerId, playersPendingConnection[identifier].deferrals)
        end

        playersPendingConnection[identifier] = nil
    end
end

local function presentAllowlistRequestSent(deferrals, playerId)
    local identifier = EasyAllowlist.getPlayerIdentifier(playerId)

    playersPendingConnection[identifier] = {
        deferrals = deferrals,
        playerId = playerId,
    }

    Citizen.CreateThread(checkPendingPlayers)

    local requestData = EasyAllowlist.getPlayerAllowlistRequest(playerId)

    -- Changes text to Your request id
    requestAlreadySentCard.body[2].text = getLocalizedText("your_request_id", requestData.requestId)

    deferrals.presentCard(requestAlreadySentCard, function(data, rawData)
            
    end)
end

local function presentAllowlistRequest(deferrals, playerId)
    local isThereAnyWhitelistedPlayer = hasFirstLoadFinished and true or false -- If first load is not finished, pretend there is already a whitelisted player
    
    if(not isThereAnyWhitelistedPlayer) then
        for k, v in pairs(EasyAllowlist.getAllowlistedPlayers()) do
            isThereAnyWhitelistedPlayer = true
            break
        end
    end

    if(not isThereAnyWhitelistedPlayer) then
        local identifier = EasyAllowlist.getPlayerIdentifier(playerId)
        EasyAllowlist.addIdentifierToAllowlist(identifier)

        deferrals.update(getLocalizedText("automatic_whitelist"))

        Citizen.Wait(5000)

        deferrals.done()
        return
    end

    -- Submit = send allowlist request
    deferrals.presentCard(card, function(data, rawData)
        EasyAllowlist.addPlayerToAllowlistRequests(playerId)

        presentAllowlistRequestSent(deferrals, playerId)
    end)
end

RegisterNetEvent('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerId = source

    if(not card) then
        setKickReason(GetCurrentResourceName() .. " not ready, try again in few minutes")

        CancelEvent()

        return
    end

    if(not EasyAllowlist.getPlayerIdentifier(playerId)) then
        setKickReason("Couldn't get your " .. config.mainIdentifier .. " identifier\n" .. getLocalizedText(missingIdentifierMessages[config.mainIdentifier]))

        CancelEvent()

        return
    end
    
    deferrals.defer()
    
    EasyAllowlist.updatePlayerData(playerId)

    Citizen.Wait(500)

    if(GetResourceState(EXTERNAL_SCRIPTS_NAMES["qb-core"]) == "started") then
        Citizen.Wait(7000)
    end

    if(not config.enableAllowlist or EasyAllowlist.isPlayerAllowlisted(playerId)) then
        EasyAllowlist.addToQueue(playerId, deferrals)
    else
        if(EasyAllowlist.isPlayerInAllowlistRequests(playerId)) then
            presentAllowlistRequestSent(deferrals, playerId)
        else
            presentAllowlistRequest(deferrals, playerId)
        end
    end
end)