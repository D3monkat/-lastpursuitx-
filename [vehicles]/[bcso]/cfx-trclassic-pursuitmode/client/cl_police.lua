QBCore = exports["qb-core"]:GetCoreObject()

local playerJob = nil

local Jobs = {
    police = true,
}

function IsAuthorizedToSwitchMode()
    local playerData = QBCore.Functions.GetPlayerData()
    playerJob = playerData.job.name

    if Jobs[playerJob] then
        return true
    end
    return false
end

