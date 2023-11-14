CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = true
        local PaletoDist = #(pos - vector3(Config.PaletoBank['coords']['x'], Config.PaletoBank['coords']['y'], Config.PaletoBank['coords']['z']))
        local PacificDist = #(pos - vector3(Config.PacificBank['coords']['x'], Config.PacificBank['coords']['y'], Config.PacificBank['coords']['z']))
        local VaultDist = #(pos - vector3(Config.lowerVault['coords']['x'], Config.lowerVault['coords']['y'], Config.lowerVault['coords']['z']))

        if PaletoDist <= 20 then
            inRange = true
            if Config.PaletoBank['isOpened'] then
                local object = GetClosestObjectOfType(Config.PaletoBank['coords']['x'], Config.PaletoBank['coords']['y'], Config.PaletoBank['coords']['z'], 5.0, Config.PaletoBank['object'], false, false, false)
            
                if object ~= 0 then
                    SetEntityHeading(object, Config.PaletoBank['heading'].open)
                end
            else
                local object = GetClosestObjectOfType(Config.PaletoBank['coords']['x'], Config.PaletoBank['coords']['y'], Config.PaletoBank['coords']['z'], 5.0, Config.PaletoBank['object'], false, false, false)
            
                if object ~= 0 then
                    SetEntityHeading(object, Config.PaletoBank['heading'].closed)
                end
            end
        end

        -- Pacific Check
        if PacificDist <= 30 then
            inRange = true
            if Config.PacificBank['isOpened'] then
                local object = GetClosestObjectOfType(Config.PacificBank['coords']['x'], Config.PacificBank['coords']['y'], Config.PacificBank['coords']['z'], 20.0, Config.PacificBank['object'], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Config.PacificBank['heading'].open)
                end
            else
                local object = GetClosestObjectOfType(Config.PacificBank['coords']['x'], Config.PacificBank['coords']['y'], Config.PacificBank['coords']['z'], 20.0, Config.PacificBank['object'], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Config.PacificBank['heading'].closed)
                end
            end
        end

        if not inRange then
            Wait(5000)
        end

        -- Vault dist check
        if VaultDist <= 30 then
            inRange = true
            if Config.lowerVault['isOpened'] then
                local object = GetClosestObjectOfType(Config.lowerVault['coords']['x'], Config.lowerVault['coords']['y'], Config.lowerVault['coords']['z'], 20.0, Config.lowerVault['object'], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Config.lowerVault['heading'].open)
                end
            else
                local object = GetClosestObjectOfType(Config.lowerVault['coords']['x'], Config.lowerVault['coords']['y'], Config.lowerVault['coords']['z'], 20.0, Config.lowerVault['object'], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Config.lowerVault['heading'].closed)
                end
            end
        end

        if not inRange then
            Wait(5000)
        end

    Wait(1000)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:ClearTimeoutDoors', function()
    local PaletoObject = GetClosestObjectOfType(Config.PaletoBank['coords']['x'], Config.PaletoBank['coords']['y'], Config.PaletoBank['coords']['z'], 5.0, Config.PaletoBank['object'], false, false, false)
    if PaletoObject ~= 0 then
        SetEntityHeading(PaletoObject, Config.PaletoBank['heading'].closed)
    end

    local object = GetClosestObjectOfType(Config.PacificBank['coords']['x'], Config.PacificBank['coords']['y'], Config.PacificBank['coords']['z'], 20.0, Config.PacificBank['object'], false, false, false)
    if object ~= 0 then
        SetEntityHeading(object, Config.PacificBank['heading'].closed)
    end

    local Lowerobject = GetClosestObjectOfType(Config.lowerVault['coords']['x'], Config.lowerVault['coords']['y'], Config.lowerVault['coords']['z'], 20.0, Config.lowerVault['object'], false, false, false)
    if Lowerobject ~= 0 then
        SetEntityHeading(Lowerobject, Config.lowerVault['heading'].closed)
    end

    Config.PaletoBank['isOpened'] = false
    Config.PacificBank['isOpened'] = false
    Config.lowerVault['isOpened'] = false
end)