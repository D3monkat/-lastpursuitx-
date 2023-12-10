local Translations = {
    general = {
        enable = 'Enable',
        autopilot = 'Autopilot',
        crashAvoidance = 'Crash Avoidance',
        autoLaneChange = 'Auto Lange Change',
        autoPark = 'Auto Park',
        smartSummon = 'Smart Summon',
        danceMode = 'Dance Mode',
        reverseCamera = 'Reverse Camera',
        adaptiveLighting = 'Adaptive Lighting',
        hud = 'HUD'
    },

    success = {
        danceModeActive = 'Dance Mode activated.',
        smartSummonActive = 'Smart Summon activated.',
        smartSummonReachDestination = 'Smart Summon has reached the destination.'
    },

    warning = {
        noWaypoint = 'No waypoint set.',
        needToExitVehicle = 'Only available after you exit your vehicle.',
        needToEnterVehicle = 'Only available if you drive a supported vehicle.',
        noParkingLotFound = 'No parking lot was found in the area.',
        needToEnableHighBeams = 'The high beams of your vehicle must be turned on.',
        vehicleTooFarAway = 'Your vehicle is too far away.',
        autopilotMustBeDisabled = 'Autopilot must be disabled.',
        autopilotMustBeEnabled = 'Autopilot must be enabled.'
    },

    error = {
        danceModeCancel = 'Dance Mode cancelled.',
        smartSummonCancel = 'Smart Summon cancelled.',
        adaptiveLightingCancel = 'Adaptive Lighting cancelled. The high beams of your vehicle must be turned on.',
        commandNotFound = 'Command not found.',
        commandDisabled = 'Command is disabled.',
        argumentDisabled = 'Argument is disabled.'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
