--- @ Start Core Func.

function Koci.Client:TriggerServerCallback(key, payload, func)
    if not func then
        func = function() end
    end
    Koci.Callbacks[key] = func
    TriggerServerEvent("0r-hud:Server:HandleCallback", key, payload)
end

--- A simple wrapper around SendNUIMessage that you can use to
--- dispatch actions to the React frame.
---
---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function Koci.Client:SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end


CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) and not IsThisModelABicycle(GetEntityModel(GetVehiclePedIsIn(ped, false)))then
                if exports["cdn-fuel"]:GetFuel(GetVehiclePedIsIn(ped, false)) <= 20 then -- At 20% Fuel Left
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "pager", 0.10)
                        QBCore.Functions.Notify(Lang:t("notify.low_fuel"), "error")
                        Wait(60000) -- repeats every 1 min until empty
                end
            end
        end
        Wait(10000)
    end
end)

---@param system ("esx_notify" | "qb_notify" | "custom_notify") System to be used
---@param type string inform / success / error
---@param title string Notification text
---@param text? string (optional) description, custom notify.
---@param duration? number (optional) Duration in miliseconds, custom notify.
---@param icon? string (optional) icon.
function Koci.Client:SendNotify(title, type, duration, icon, text)
    system = Config.NotifyType
    if system == "esx_notify" then
        if Config.FrameWork == "esx" then
            Koci.Framework.ShowNotification(title, type, duration)
        end
    elseif system == "qb_notify" then
        if Config.FrameWork == "qb" then
            Koci.Framework.Functions.Notify(title, type)
        end
    elseif system == "custom_notify" then
        Utils.Functions:CustomNotify(nil, title, type, text, duration, icon)
    end
end

--- Gets player data based on the configured framework.
---@return PlayerData table player data.
function Koci.Client:GetPlayerData()
    if Config.FrameWork == "esx" then
        return Koci.Framework.GetPlayerData()
    elseif Config.FrameWork == "qb" then
        return Koci.Framework.Functions.GetPlayerData()
    end
end

-- Draws 3D text at the specified world coordinates.
---@param x (number) The X-coordinate of the text in the world.
---@param y (number) The Y-coordinate of the text in the world.
---@param z (number) The Z-coordinate of the text in the world.
---@param text (string) The text to be displayed.
function Koci.Client:DrawText3D(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 70, 134, 123, 75)
    ClearDrawOrigin()
end

--- Loads a model on the client.
---@param model number|string The model to load, specified as either a number or a string.
function Koci.Client:LoadModel(model)
    if HasModelLoaded(model) then
        return
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

--- Displays a text UI based on the specified framework.
--- @param _type string (optional) The framework to use, defaults to Config.FrameWork if not provided.
--- @param message string The message to display in the text UI.
--- @param options table (optional) Additional options for displaying the text UI.
function Koci.Client:ShowTextUI(_type, message, options)
    _type = _type or Config.FrameWork
    if _type == "qb" then
        if not Utils.Functions:hasResource("qb-core") then
            Utils.Functions:debugPrint("qb-core is not active on your server !")
            return
        end
        exports["qb-core"]:DrawText(message, "right")
    elseif _type == "ox" then
        if not Utils.Functions:hasResource("ox_lib") then
            Utils.Functions:debugPrint("ox_lib is not active on your server !")
            return
        end
        if not options then
            options = {
                position = "left-center"
            }
        end
        lib.showTextUI(message, options)
    end
end

--- Hides the currently displayed text UI.
function Koci.Client:HideTextUI()
    if Utils.Functions:hasResource("ox_lib") then
        lib.hideTextUI()
    end
    if Utils.Functions:hasResource("qb-core") then
        exports["qb-core"]:HideText()
    end
end

-- @ End core func.
-- @ Start script func.

function playerLoaded()
    return Config.FrameWork == "esx" and
        Koci.Framework.IsPlayerLoaded() or
        LocalPlayer.state.isLoggedIn
end

function Koci.Client.HUD:Start(xPlayer)
    if not xPlayer then
        xPlayer = Koci.Client:GetPlayerData()
    end
    self:MainThick()
    self:SetMiniMap(self.data.vehicle.miniMap.style)
    self.data.vehicle.kmh = Config.Settings.VehicleHUD.kmH
    Koci.Client:SendReactMessage("SET_HUD_STATUS_BARS_ACTIVE", Config.Settings.StatusBars)
    Koci.Client:SendReactMessage("SET_HUD_VEHICLE_ACTIVE", Config.Settings.VehicleHUD)
    Koci.Client:SendReactMessage("SET_HUD_SETTINGS_HELP_GUIDES", Config.HelpGuides)
    Wait(500)
    Koci.Client:SendReactMessage("LOAD_HUD_STORAGE")
    Wait(500)
    Koci.Client:SendReactMessage("setVisible", true)
    DisplayRadar(false)
end

function Koci.Client.HUD:Toggle(state)
    if state == nil then
        self.data.isVisible = not self.data.isVisible
    else
        self.data.isVisible = state
    end
    Koci.Client:SendReactMessage("setVisible", self.data.isVisible)
end

function Koci.Client.HUD:SetMiniMap(_type)
    Wait(50)
    local defaultAspectRatio = 1920 / 1080
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio - aspectRatio) / 3.6) - 0.008
    end
    local defaultAspectRatio = 1920 / 1080
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio - aspectRatio) / 3.6) - 0.008
    end
    local minimap = RequestScaleformMovie("minimap")
    if not HasScaleformMovieLoaded(minimap) then
        RequestScaleformMovie(minimap)
        while not HasScaleformMovieLoaded(minimap) do
            Wait(1)
        end
    end
    if _type == "square" then
        RequestStreamedTextureDict("squaremap", false)
        if not HasStreamedTextureDictLoaded("squaremap") then
            Wait(150)
        end
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
        AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")
    else
        RequestStreamedTextureDict("circlemap", false)
        if not HasStreamedTextureDictLoaded("circlemap") then
            Wait(150)
        end
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
        AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "circlemap", "radarmasksm")
    end
    SetMinimapComponentPosition("minimap", "L", "B", 0.0 + minimapOffset, -0.047, 0.1638, 0.183)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + minimapOffset, 0.00, 0.128, 0.20)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.01 + minimapOffset, 0.025, 0.262, 0.300)
    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetRadarBigmapEnabled(true, false)
    SetMinimapClipType(_type == "square" and 0 or 1)
    Wait(500)
    SetRadarBigmapEnabled(false, false)
end

function Koci.Client.HUD:GetFuelExport()
    if GetResourceState("ox_fuel") == "started" then
        if Entity(self.data.vehicle.entity) then
            local ent = Entity(self.data.vehicle.entity).state.fuel or 0
            if Config.FrameWork == "esx" then
                return Koci.Framework.Math.Round(ent, 2)
            elseif Config.FrameWork == "qb" then
                return Koci.Framework.Shared.Round(ent, 2)
            end
        else
            return false
        end
    elseif GetResourceState("cdn-fuel") == "started" then
        if Config.FrameWork == "esx" then
            return Koci.Framework.Math.Round(Entity(self.data.vehicle.entity).state.fuel or 0, 2)
        elseif Config.FrameWork == "qb" then
            return Koci.Framework.Shared.Round(exports["cdn-fuel"]:GetFuel(self.data.vehicle.entity) or 0, 2)
        end
    else
        local response = Koci.Utils:CustomFuelExport()
        if not response then
            TriggerServerEvent("0r-hud:Server:ErrorHandle", _t("hud.export.fuel_missing"))
        end
        return response
    end
end

function Koci.Client.HUD:VehicleDriverCheck(vehicle)
    if not DoesEntityExist(vehicle) then
        return false
    end
    if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
        return true
    end
    return false
end

function Koci.Client.HUD:ActivateVehicleHud(veh)
    self.data.vehicle.show = true
    self:fVehicleInfoThick(veh)
end

function Koci.Client.HUD:UpdateVehicleHud(data)
    if self.data.vehicle.miniMap.style ~= data.miniMap.style then
        self.data.vehicle.miniMap.style = data.miniMap.style
        self:SetMiniMap(data.miniMap.style)
    end
    if self.data.vehicle.speedoMeter.fps ~= data.speedoMeter.fps then
        self.data.vehicle.speedoMeter.fps = data.speedoMeter.fps
        local w = 100
        if data.speedoMeter.fps == 15 then
            w = 200
        elseif data.speedoMeter.fps == 30 then
            w = 100
        elseif data.speedoMeter.fps == 60 then
            w = 50
        end
        self.data.vehicle.thick.wait = w
    end
end
