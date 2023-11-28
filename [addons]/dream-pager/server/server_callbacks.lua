DreamCore = {}
DreamCore.ServerCallbacks = {}

RegisterNetEvent('DreamCore:Server:TriggerServerCallback', function(name, ...)
    local src = source
    DreamCore.TriggerServerCallback(name, src, function(...)
        TriggerClientEvent('DreamCore:Client:TriggerServerCallback', src, name, ...)
    end, ...)
end)

function DreamCore.CreateCallback(name, cb)
    DreamCore.ServerCallbacks[name] = cb
end

function DreamCore.TriggerServerCallback(name, source, cb, ...)
    if not DreamCore.ServerCallbacks[name] then return end
    DreamCore.ServerCallbacks[name](source, cb, ...)
end
