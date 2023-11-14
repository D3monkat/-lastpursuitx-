--Fleeca
RegisterServerEvent('qb-bankrobbery:server:modelSync', function(closestBank, k, model)
    TriggerClientEvent('qb-bankrobbery:client:modelSync', -1, closestBank, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:grabSync', function(closestBank, k, model)
    TriggerClientEvent('qb-bankrobbery:client:grabSync', -1, closestBank, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:lootSync', function(closestBank, type, k)
    TriggerClientEvent('qb-bankrobbery:client:lootSync', -1, closestBank, type, k)
end)


--Pacific
RegisterServerEvent('qb-bankrobbery:server:pacific:modelSync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:pacific:modelSync', -1, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:pacific:grabSync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:pacific:grabSync', -1, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:pacific:lootSync', function(type, k)
    TriggerClientEvent('qb-bankrobbery:client:pacific:lootSync', -1, type, k)
end)

--Paleto
RegisterServerEvent('qb-bankrobbery:server:paleto:modelSync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:paleto:modelSync', -1, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:paleto:grabSync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:paleto:grabSync', -1, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:paleto:lootSync', function(type, k)
    TriggerClientEvent('qb-bankrobbery:client:paleto:lootSync', -1, type, k)
end)

-- lowerVault
RegisterServerEvent('qb-bankrobbery:server:lowerVault:doorSync', function(type, k)
    TriggerClientEvent('qb-bankrobbery:client:lowerVault:doorSync', -1, type, k)
end)

RegisterServerEvent('qb-bankrobbery:server:lowerVault:bombSync', function(type, k)
    TriggerClientEvent('qb-bankrobbery:client:lowerVault:bombSync', -1, type, k)
end)

RegisterServerEvent('qb-bankrobbery:server:lowerVault:modelSync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:lowerVault:modelSync', -1, k, model)
end)

RegisterServerEvent('qb-bankrobbery:server:lowerVault:lootSync', function(type, k)
    TriggerClientEvent('qb-bankrobbery:client:lowerVault:lootSync', -1, type, k)
end)

RegisterServerEvent('qb-bankrobbery:server:lowerVault:elecsync', function(k, model)
    TriggerClientEvent('qb-bankrobbery:client:lowerVault:elecsync', -1, k, model)
end)


RegisterServerEvent('qb-bankrobbery:server:ExplosionLowerVault', function(k)
    TriggerClientEvent('qb-bankrobbery:client:LowerVaultExplosion', -1, k)
end)