local Translations = {
    notify = {
        missing_item = "You are missing something...",
        failed = "Failed...",
        success = "Success!",
        alarm_lockdown = "Bank is under lockdown. All systems is locked.",
        explosion_in = "Exploding in: ",
        seconds = " seconds",
        thermite_success = "The door is burned open.",
        power = "Too much power!",
        bank_is_reset = "Security systems reenabled.",
        recently_robbed = "The bank has been robbed recently, try again later.",
        not_enough_cops = "Not enough cops."
    },
    target = {
        start_hacking = "Start hacking",
        drill_safe = "Drill",
        take_money = "Take money",
        take_gold = "Take gold",
        input_access_code = "Input access code",
        lockpick_safe = "Crack safe",
        disable_lasers = "Disable lasers",
        plant_c4 = "Plant C4",
        loot_table = "Loot table",
        reset_bank = "Reset security systems."
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})