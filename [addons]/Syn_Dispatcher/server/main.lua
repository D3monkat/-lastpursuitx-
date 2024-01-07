Citizen.CreateThread( function()
    if Config.Framework == "ESX" then 
        ESX = exports["es_extended"]:getSharedObject()
    end 
end)


local AreaCooldown = {}

RegisterServerEvent("Syn_Dispatcher:server:DipatchCall")
AddEventHandler("Syn_Dispatcher:server:DipatchCall", function(calltable, includeSuspect, isCop, DispatchedJob, recievedcoords)

    if calltable ~= nil then
        
        local SkipAlert = false
        holdingtable = {}
        for i = 1, #AreaCooldown do 
            if AreaCooldown[i] and AreaCooldown[i].coords then 
                if #(recievedcoords - AreaCooldown[i].coords) < Config.ServerSidedAlertSpamRestrictionDistance then 
                    SkipAlert = true 
                    break 
                end 
                if Config.Debug then 
                    print("TimeSinceLastDispathercallAtLoc" , GetGameTimer() - AreaCooldown[i].cooldown)
                end
                if (GetGameTimer() - AreaCooldown[i].cooldown) < (Config.ServerSidedAlertSpamRestrictionDuration * 1000) then 
                    holdingtable[#holdingtable+1] = AreaCooldown[i]
                end
            end 
        end 
        AreaCooldown = holdingtable
          
        for i = 1, #Config.IgnoredAreas do 
            if Config.IgnoredAreas[i] and Config.IgnoredAreas[i].coords then 
                if #(recievedcoords -  Config.IgnoredAreas[i].coords) < Config.IgnoredAreas[i].distance then 
                    SkipAlert = true 
                    break 
                end 
            end 
        end  

        if not SkipAlert then 
            if Config.Framework == "ESX" then 
                local xPlayers = ESX.GetExtendedPlayers() -- Returns all xPlayers
                for _, xPlayer in pairs(xPlayers) do
                    if xPlayer["job"]["name"] == DispatchedJob then
                        TriggerClientEvent("Syn_Dispatcher:client:DipatchCall", xPlayer.source , calltable, includeSuspect ,isCop, DispatchedJob)
                    end
                end

                AreaCooldown[#AreaCooldown+1] = {cooldown = GetGameTimer(), coords = recievedcoords}
            else 
                TriggerClientEvent("Syn_Dispatcher:client:DipatchCall", -1 , calltable, includeSuspect ,isCop, DispatchedJob)
                AreaCooldown[#AreaCooldown+1] = {cooldown = GetGameTimer(), coords = recievedcoords}
            end 
        end 
    end
end)

