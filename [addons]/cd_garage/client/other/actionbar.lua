if Config.VehicleKeys.ENABLE and Config.VehicleKeys.Hotwire.ENABLE then

    ActionBarTable = {}

    function ActionBar(seconds, size, chances)
        ActionBarTable.active = true
        ActionBarTable.result = nil
        ActionBarStart({seconds = seconds or 1, size = size or 20, chances = chances or 1})
        while ActionBarTable.active and ActionBarTable.result == nil do Wait(0) if not NUI_status then TriggerEvent('cd_garage:ToggleNUIFocus') end end
        if ActionBarTable.result == false and type(chances) == 'number' and chances > 1 then
            Wait(3000)
            ActionBar(seconds, size, chances-1)
        end
        return ActionBarTable.result
    end

    RegisterNUICallback('actionbarsuccess', function()
        ActionBarTable.active = false
        ActionBarTable.result = true
        ActionBarSuccess(L('success'), 2500)
    end)

    RegisterNUICallback('actionbarfail', function()
        ActionBarTable.active = false
        ActionBarTable.result = false
        ActionBarFail(L('fail'), 2500)
    end)

    RegisterNUICallback('actionbarclose', function()
        ActionBarTable.active = false
        ActionBarTable.result = nil
    end)

end