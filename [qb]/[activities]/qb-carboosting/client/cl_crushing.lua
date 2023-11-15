--- Functions

--- Removes the VIN scratched vehicle from the player_vehicles database
---@return nil
local crushVehicle = function()
    if PlayerData.job.type ~= 'leo' then Utils.Notify(Locales['police_only'], 'error', 2500) return end
    -- if PlayerData.job.name ~= 'police' then Utils.Notify(Locales['police_only'], 'error', 2500) return end

    if cache.vehicle and cache.seat == -1 then
        local veh = cache.vehicle
        lib.hideTextUI()

        lib.callback(Shared.Resource .. ':server:CanCrushVehicle', false, function(result)
            if result then
                if lib.progressBar({
                    duration = 8000,
                    label = Locales['progressbar_crushing'],
                    useWhileDead = false,
                    canCancel = true,
                    disable = { car = true, move = true, combat = true, mouse = false }
                }) then
                    TriggerServerEvent(Shared.Resource .. ':server:CrushVehicle')
                    TaskLeaveVehicle(cache.ped, veh, 0)
                    Wait(1500)
                    Framework.Functions.DeleteVehicle(veh)
                else
                    Utils.Notify(Locales['canceled'], "error", 3500)
                end
            else
                Utils.Notify(Locales['cannot_crush'], 'error', 2500)
            end
        end)
    end
end

--- Zones

local enterCrush = function()
    if cache.vehicle and cache.seat == -1 then
        lib.showTextUI(Locales['e_crush'], {
            position = "left-center",
            icon = 'shield-halved',
            style = {
                borderRadius = 1,
                color = 'white'
            }
        })
    end
end

local exitCrush = function()
    lib.hideTextUI()
end

local inCrush = function()
    if IsControlJustPressed(0, 38) then
        crushVehicle()
    end
end

local crushZone = lib.zones.sphere({
    coords = Shared.Crushing,
    radius = Shared.CrushingRadius,
    debug = false,
    onEnter = enterCrush,
    onExit = exitCrush,
    inside = inCrush
})

--- Threads

CreateThread(function()
    while PlayerData.job == nil do Wait(10) end
    if PlayerData.job.type == 'leo' then
        local blip = AddBlipForCoord(Shared.Crushing.x, Shared.Crushing.y, Shared.Crushing.z)

        SetBlipSprite(blip, 380)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 0)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Locales['blip_crushing'])
        EndTextCommandSetBlipName(blip)
    end
end)
