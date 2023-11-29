Config = {}
Config.AutoInstall = true -- if true, the app will automatically be installed on your phone
Config.Locale = "en" -- locale to use, must be in locales.lua
Config.VoiceScript = "pma-voice" -- pma-voice or saltychat
Config.Framework = "qbcore" -- esx, qbcore, or none
Config.LockedChannels = {
    {
        range = { 450.0, 451.0 },
        jobs = {
            ["police"] = true,
            ["bcso"] = true,
        }
    },
}
