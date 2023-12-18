CreateThread(function()
    while Koci.Framework == nil do
        Koci.Framework = Utils.Functions:GetFramework()
        Wait(16)
    end
end)

function Koci.Client.HUD:MainThick()
    CreateThread(function()
        while not playerLoaded() do
            Wait(500)
        end
        local playerId = PlayerId()
        local playerPedId = PlayerPedId()
        while playerLoaded() do
            local oxygen, stamina
            local isTalking = NetworkIsPlayerTalking(playerId)
            self.data.bars.voice.isTalking = isTalking
            self.data.bars.voice.microphone = isTalking
            oxygen = math.floor(GetPlayerUnderwaterTimeRemaining(playerId) * 10)
            stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(playerId))
            self.data.bars.oxygen = IsPedSwimmingUnderWater(playerPedId) and oxygen or 100
            self.data.bars.stamina = stamina or 0
            self.data.bars.terminal = 100 -- ?
            self.data.bars.leaf = 100     -- ?
            if Config.FrameWork == "qb" then
                local health = math.floor(
                    (GetEntityHealth(playerPedId) - 100) /
                    (GetEntityMaxHealth(playerPedId) - 100) *
                    100
                )
                if health > 100 then
                    health = 100
                end
                if health < 0 then
                    health = 0
                end
                self.data.bars.health = health
                self.data.bars.armor = GetPedArmour(playerPedId)
                -- > Pause menu
                if IsPauseMenuActive() and self.data.isVisible then
                    Koci.Client.HUD:Toggle(false)
                end
            end
            -- > Vehicle HUD
            if Config.Settings.VehicleHUD.active then
                if IsPedInAnyVehicle(playerPedId) then
                    while self.data.vehicle.inVehicle and DoesEntityExist(vehicle) do
                        Wait(200)
                    end
                    local vehicle = GetVehiclePedIsIn(playerPedId)
                    if not IsThisModelABicycle(vehicle) then
                        if not Koci.Client.HUD.data.vehicle.inVehicle then
                            Koci.Client.HUD.data.vehicle.inVehicle = true
                            Koci.Client.HUD.data.vehicle.entity = vehicle
                            Koci.Client.HUD:ActivateVehicleHud(vehicle)
                            DisplayRadar(true)
                        end
                        Koci.Client.HUD.data.vehicle.fuel = {
                            level = self:GetFuelExport() or 100,
                            maxLevel = 100
                        }
                    end
                else
                    if Koci.Client.HUD.data.vehicle.inVehicle then
                        Koci.Client.HUD.data.vehicle.inVehicle = false
                        Koci.Client.HUD.data.vehicle.entity = nil
                        Koci.Client.HUD.data.vehicle.isPassenger = false
                        Koci.Client.HUD.data.vehicle.show = false
                        Koci.Client.HUD.data.vehicle.isSeatbeltOn = false
                        Koci.Client.HUD.data.vehicle.cruiseControlStatus = false
                        Koci.Client:SendReactMessage(
                            "UPDATE_HUD_VEHICLE",
                            Koci.Client.HUD.data.vehicle
                        )
                        DisplayRadar(false)
                    end
                end
            end
            Koci.Client:SendReactMessage(
                "UPDATE_HUD_STATUS_BARS",
                self.data.bars
            )
            Wait(200)
        end
    end)
end

function Koci.Client.HUD:fVehicleInfoThick(vehicle)
    CreateThread(function()
        while self.data.vehicle.inVehicle and DoesEntityExist(vehicle) do
            local currentSpeed = GetEntitySpeed(vehicle)
            local engineRunning = GetIsVehicleEngineRunning(vehicle)
            local rpm = engineRunning and GetVehicleCurrentRpm(vehicle) or 0
            local gear = engineRunning and GetVehicleCurrentGear(vehicle) or "N"
            if gear == 0 then
                gear = "R"
            end
            self.data.vehicle.speed = self.data.vehicle.kmh and math.floor(currentSpeed * 3.6) or
                math.floor(currentSpeed * 2.236936
                )
            if rpm > 0.5 and self.data.vehicle.speed == 0 then
                self.data.vehicle.speed = 1
            end
            self.data.vehicle.rpm = rpm
            self.data.vehicle.gear = gear
            self.data.vehicle.isPassenger = GetPedInVehicleSeat(vehicle, -1) ~= PlayerPedId()
            if not self.data.vehicle.isPassenger then
                Koci.Client:SendReactMessage(
                    "UPDATE_HUD_VEHICLE",
                    self.data.vehicle
                )
            end
            Wait(self.data.vehicle.thick.wait)
        end
    end)
end
