local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
        SetDiscordAppId(1166461881934946354)
        SetDiscordRichPresenceAsset('px')
        SetDiscordRichPresenceAssetText('Kat is working on the next generation Server')
        SetDiscordRichPresenceAssetSmall('px')
        SetDiscordRichPresenceAssetSmallText('Kat is working on the next generation Server')

            QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
                SetRichPresence('Players: ' .. result .. '/' .. Config.Discord.maxPlayers)
                SetRichPresence('PursuitX | WIP')
            end)
                SetDiscordRichPresenceAction(0, 'Comming soon!', 'https://discord.gg/playhaven')

        Wait(60000)
end)


-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

-- local playersConnected = GlobalState.PlayerCount

-- AddStateBagChangeHandler('PlayerCount', nil, function(bagName, _, value)
--      if bagName ~= "global" or not value then return end
--      playersConnected = value
-- end)

-- CreateThread(function()
--     while true do
--         -- This is the Application ID (Replace this with you own)
--         -- MTE2NjQ2MTg4MTkzNDk0NjM1NA.GP0ffK.A6snMh2kGiI05qpO6vItWzwy3Unf-R0T_88Jc4 <<< bot token
--         SetDiscordAppId(1166461881934946354)

--         -- Here you will have to put the image name for the 'large' icon.
--         SetDiscordRichPresenceAsset('px')

--         -- (11-11-2018) New Natives:

--         -- Here you can add hover text for the 'large' icon.
--         SetDiscordRichPresenceAssetText('Kat is working on the next generation Server')

--         -- Here you will have to put the image name for the 'small' icon.
--         SetDiscordRichPresenceAssetSmall('px')

--         -- Here you can add hover text for the 'small' icon.
--         SetDiscordRichPresenceAssetSmallText('Kat is working on the next generation Server')

--         SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. #playersConnected .. "/64")
--         SetRichPresence('PursuitX | WIP')

--         -- (26-02-2021) New Native:

--         --[[
--             Here you can add buttons that will display in your Discord Status,
--             First paramater is the button index (0 or 1), second is the title and
--             last is the url (this has to start with 'fivem://connect/' or 'https://')
--         ]]--
--         SetDiscordRichPresenceAction(0, 'Comming soon!', 'https://discord.gg/playhaven')

--         -- It updates every minute just in case.
--         Wait(60000)
--     end
-- end)

