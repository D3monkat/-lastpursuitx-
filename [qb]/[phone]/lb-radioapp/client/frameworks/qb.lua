CreateThread(function()
    if Config.Framework ~= "qbcore" then
        return
    end

    local QB = exports["qb-core"]:GetCoreObject()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end

    local PlayerJob = QB.Functions.GetPlayerData().job
    RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
        PlayerJob = job
    end)

    function GetJob()
        return PlayerJob.name
    end
end)
