RegisterNUICallback("OnHideSettingsMenu", function(_, cb)
    SetNuiFocus(false, false)
    cb(true)
end)

RegisterNUICallback("loadLocaleFile", function(_, cb)
    Wait(1)
    Koci.Client:SendReactMessage("setLocale", locales.ui)
    cb(true)
end)

RegisterNUICallback("OnSettingsSaved", function(data, cb)
    if data then
        Koci.Client:SendNotify(_t("hud.settings.saved"))
        local newVH = data.newVH
        Koci.Client.HUD:UpdateVehicleHud(newVH)
    else
        Koci.Client:SendNotify(_t("hud.settings.not_saved"))
    end
    cb(true)
end)

RegisterNUICallback("openBigMap", function(_, cb)
    SetNuiFocus(false, false)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_MP_PAUSE"), 0, -1)
    cb(true)
end)

RegisterNUICallback("openPauseMenu", function(_, cb)
    SetNuiFocus(false, false)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_LANDING_MENU"), 0, -1)
    cb(true)
end)