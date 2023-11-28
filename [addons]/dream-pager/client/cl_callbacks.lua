DreamCore = {}
DreamCore.ServerCallbacks = {}

RegisterNetEvent('DreamCore:Client:TriggerServerCallback', function(name, ...)
    if DreamCore.ServerCallbacks[name] then
        DreamCore.ServerCallbacks[name](...)
        DreamCore.ServerCallbacks[name] = nil
    end
end)

function DreamCore.TriggerServerCallback(name, cb, ...)
    DreamCore.ServerCallbacks[name] = cb
    TriggerServerEvent('DreamCore:Server:TriggerServerCallback', name, ...)
end
