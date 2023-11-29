PublicSharedConfig = {
    -- ⚡ Specify the framework you're using. Can be the following: esx, qbcore, custom
    Framework = "qbcore",

    -- 🗣️ Specify the language you're using. For more information on available languages visit our docs in https://docs.cdev.shop/fivem-resources/locales
    Language = "en",

    -- 👀 Specify the third eye/target resource you're using. Can be the following: qbcore, qtarget, ox, renewed(doesn't work in all props), custom
    Target = "ox",

    -- 🎒 Specify the inventory resource you're using. Can be the following: qbcore, ox, custom
    Inventory = "ox",

    -- 🚗 Specify the garage resource you're using. Can be the following: qbcore, esx, codesign, loaf, custom (only for cdev_restaurants)
    Garage = "codesign",

    -- 🕒 Specify the progress bar resource you're using. Can be the following: qbcore, ox, custom (only for cdev_restaurants)
    ProgressBar = "ox",

    -- 💬 Set this to true if you want to use your own notification UI instead of the cDev one. (Implement in public/client/api.lua)
    UseCustomNotifications = false,

    -- 📦 Set this to false if you use a custom database system. (Implement in public/server/api.lua, also remove the dependency in fxmanifest.lua)
    UseMySQL = true,

    -- 📄 Enable discord logs (webhook URL in public/server/api.lua)
    DiscordLogs = false,

    -- ⚙️ Enable debug mode (prints in console)
    Debug = false,
}
