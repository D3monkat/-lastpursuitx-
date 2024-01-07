# HRSGears-edited
A manual gear mode you can use for 0r-hudv2. Support is not provided. It is only an example.

# Hud Events
```
RegisterNetEvent("0r-hud:Client:SetManualGear", function(newGear)
    Koci.Client.HUD.data.vehicle.manualGear = newGear
end)
TriggerEvent("hrsgears:SetManualMode", Koci.Client.HUD.data.vehicle.manualMode)
```

# HRSGears Event
```
RegisterNetEvent("hrsgears:SetManualMode", function(data)
    manualon = data
end)
```
## Thanks and Credits

- [@HugoSimoes12345](https://github.com/HugoSimoes12345/HRSGears) For design and development.

# Fivem HRSGears (manual gearbox)

Please read the config file

the last gear allways need to be 0.90!!!!!
gear ratios from 1 to 6 gears vehicle are native GTA V gear ratios and i create the other
in config.lua in config.vehicles you can add more gear ratios for specified vehicles 
gear up = shift / controller A , gear down = r / controller B 
Lscustom transmission upgrade adds another Gear to the vehicle

to install this on your server just drag and drop the resource inside your resource folder and start it on your server config, it would be cool if you keep the resource name as HRSGears.
