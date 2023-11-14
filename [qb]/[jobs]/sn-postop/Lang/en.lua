local Translations = {
    error = {
        ["nogroup"] = "You need to be in a group!",
        ["overmem"] = "Too many people! We only need 2!",
        ["timeout"] = "You have done a great job, take a break and come back later!",
        ["vehicle"] = "WHERES MY OTHER VEHICLE!?",
        ["far"]     = "Get closer! You're too far away!",
        ["camhang"] = "You already got one!?",
        ["driver"]  = "You need to be on the driver's seat",
        ["diffveh"] = "This aint our vehicle?!",
        ["job"]     = "You are not a PostOp Manager.",
        ["job1"]     = "Go look for a Manager for this temp job!",
        ["item"]    = "Wait.. where did my parcel go?",
        ["ownjob"] = "Please Sign Out from the other jobs first!",
        ["errorjob"] = "You are not signed in as our employee?",
        ["leader"] = "Talk to me as a group leader!",
        ["occupied"] = "Something on the way!",
        ["duty"] = "You havent done the assigned job!"
    },
    info = {
        ["wait"] = "Patience.. Let me get you a job...",
        ["label"] = "Please deliver to %{value}",
        ["status"] = "%{value}/%{value2} to go",
        ["vehicle"] = "[E] - Turn In Vehicle",
        ["drop"] = "Delivery Spot",
        ["store"] = "Shop",
        ["company"] = "PostOP Headquarters",
        ["gara"] = "Vehicle Turn In",
        ["next"] = "Move on to the next one.",
        ["input"] = "Input ID",
        ["submit"] = "Submit",
    },
    success = {
        ["done"]  = "All done, let's head back!",
        ["money"] = "You've made $%{value}",
    },
    target = {
        ["prime"]   = "Sign In Prime",
        ["express"] = "Sign In Express",
        ["freight"] = "Sign In Freight",
        ["take"]    = "Grab Parcel",
        ["give"]    = "Deliver",
        ["duty"] = "Sign In",
        ["offduty"] = "Sign Out",
    },
    icon = {
        ["duty"] = "fa-solid fa-user",
        ["give"] = "fa-solid fa-hand",
        ["take"] = "fa-solid fa-box",
        ["offduty"] = "fa-solid fa-user",
        ["prime"] = "fa-solid fa-truck",
        ["express"] = "fa-solid fa-truck-fast",
        ["freight"] = "fa-solid fa-truck-moving"
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})