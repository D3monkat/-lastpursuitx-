MainMenu = RageUI.CreateMenu(ELEVATOR_MENU_TITLE, ELEVATOR_MENU_DESCRIPTION)

function RageUI.PoolMenus:GnMenu()
    MainMenu:IsVisible(function(Items)
        -- Items
        for k, v in pairs(currentZone.directions) do
            print(k, "Label: " .. tostring(v))
            Items:AddButton(ZONES[v].label, nil, { IsDisabled = false }, function(onSelected)
                if onSelected then
                    CreateThread(function()
                        RageUI.CloseAll()
                        currentZone = ZONES[v]
                        teleportPlayer(ZONES[v].coords)
                    end)
                end
            end, MainMenu)
        end
    end, function(Panels)
        -- Panels
    end)
end

function openTeleportMenu(zone)
    currentZone = ZONES[zone]
    RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
end
