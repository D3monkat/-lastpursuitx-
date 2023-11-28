RegisterCommand('pager', function()
    DreamCore.TriggerServerCallback('dream-pager:server:getPagerData', function(data)
        openPager(data)
    end)
end, false)

RegisterNUICallback('close-pager', function(_, cb)
    closePager()
    cb('ok')
end)

---@param data { to: number, from: string, message: string }
RegisterNUICallback('new-message', function(data, cb)
    TriggerServerEvent('dream-pager:server:createPage', data)
    cb('ok')
end)

function openPager(data)
    toggleRadioAnimation(false)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'open-pager',
        body = data,
    })
end

---@param data { to: number, from: string, message: string }
RegisterNetEvent('dream-pager:client:createPage', function(data)
    SendNUIMessage({
        type = 'incoming-page',
        body = {
            from = data.from,
            message = data.message,
            duration = Config.PAGE_DURATION_SECONDS * 1000,
        },
    })
end)

function closePager()
    toggleRadioAnimation(true)
    SetNuiFocus(false, false)
end

function toggleRadioAnimation(isHoldingRadio)
    loadAnimationDictionary("cellphone@")
    if isHoldingRadio == false then
        TriggerEvent("attachItemRadio","radio01")
        TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
        radioProp = CreateObject(`prop_cs_hand_radio`, 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(radioProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.14, 0.01, -0.02, 110.0, 120.0, -15.0, 1, 0, 0, 0, 2, 1)
    else
        StopAnimTask(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 1.0)
        ClearPedTasks(PlayerPedId())
        if radioProp ~= 0 then
            DeleteObject(radioProp)
            radioProp = 0
        end
    end
end

function loadAnimationDictionary(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end


RegisterKeyMapping('pager', 'Opens Pager', 'keyboard', Config.OPEN_PAGER_KEY)
