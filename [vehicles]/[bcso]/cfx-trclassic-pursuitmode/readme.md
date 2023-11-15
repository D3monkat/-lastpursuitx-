cfx-trclassic-pursuitmode Readme
Thank you for choosing cfx-trclassic-pursuitmode! This readme will guide you through the installation process and provide some essential information about the script.

Installation
To install cfx-trclassic-pursuitmode, follow the steps below:

Download the script from CFX Keymaster.
Locate your resource folder on your FiveM server.
Copy the downloaded cfx-trclassic-pursuitmode folder into the resource folder.
Make sure you have the cfx-trclassic-pursuitmode resource included in your server.cfg or resource manifest file.
Dependencies
Please note the following dependencies required for cfx-trclassic-pursuitmode:

ox_lib: Ensure that ox_lib is installed and started before running this script. ox_lib is a required file and ensures proper functionality.
Configuration
cfx-trclassic-pursuitmode allows you to customize the script according to your preferences. To modify the configuration, follow these steps:

Locate the config.lua file within the cfx-trclassic-pursuitmode folder.
Open the file using a text editor of your choice.
Adjust the configuration options to your liking.
Save the changes.
Support
If you have any questions, encounter issues, or need further assistance, feel free to reach out to us on Discord. Join our support server at https://discord.gg/T2xX5WwmEX and our team will be happy to help.

Enjoy cfx-trclassic-pursuitmode and take your police pursuits to the next level!

To Install with qb-hud or ps hud add the following

For PS hud (client.lua) replace
under `local cruiseOn = false` add `local pursuitmode = 0`
on line 797 change `speed = data[20]` to `speed = pursuitmode`
add a new line (on 798) and add `pursuit = pursuitmode,`
on line 938 change `cruiseOn` to `pursuitmode`
on line 979 change `cruiseOn` to `pursuitmode`
Then add the following lines at the bottom of the client.lua
```
RegisterNetEvent('ps-hud:pursuitmode', function(pursuit)
    PruiseOn = pursuit
    pursuitmode = pursuit
end)
```

If you are installing for qb-hud then do the following

Note for qb-hud this will only change the modes when the vehicle is moving.. When the vehicle is standing still and you try to change the modes it will show as nothing is changing but when you move it will then change to the correct mode that you want it for (dont know why this does it but I am looking into it)

under cruiseOn = false [Line 6] add `local pursuitmode = 0`
On line [641] (or close to it depending on what version of) change `speed = data[27] to what is below
```
    speed = pursuitmode,
    pursuit = pursuitmode,
```

721 you will see -- PlayerHud
under `if not (IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle)) then` around line 731 add the following after `then`
```
    if pursuitmode == 0 then
        cruiseOn = false
    end
```

769 you will see -- Vehicle Hud
under around 774
```
if IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
    if not wasInVehicle then
        DisplayRadar(true)
    end
```
add the following to look like this
```
if IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
    if not wasInVehicle then
        DisplayRadar(true)
    end
    wasInVehicle = true
    if pursuitmode > 0 then
        cruiseOn = true
    end
```

At the bottom of the resource (client.lua) add the following after the last end)
```
RegisterNetEvent('qb-hud:pursuitmode', function(pursuit)
    PruiseOn = pursuit
    pursuitmode = pursuit
end)
```
