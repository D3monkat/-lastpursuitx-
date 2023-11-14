Made by Sunny Scripts 
Discord: https://discord.gg/WK7nYmDhrN (24/7 support and updates)
Tebex: https://sunny-scripts.tebex.io/

# Description
# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [PS-PlayerGroups](https://github.com/Project-Sloth/ps-playergroups)
* [QB-Input](https://github.com/FjamZoo/qb-input)


# Installation

* **Command /postop when you want to give out Express Temp Job from Manager**

* **You can change functions.lua to client to change key and fuel SpawnVehicle**


* **Install all the dependencies**
* **Ensure the GOODS**
* **ENJOY**



# 1. Add this job into shared.lua

['postop'] = {
        label = 'PostOp',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                payment = 50
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 50
            },
        },
    },


INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('postop', 0, 'boss'),

# 2. Go to ps-playersgroup/client.lua
* **Add event**
```lua
RegisterNetEvent('group:leaveGroup',function ()
    TriggerEvent('leaveGroup')
end)
```
# 3. Go to ps-playersgroup/server.lua

* **Find**
```lua
AddEventHandler('playerDropped', function(reason)
```
* **Add** 'TriggerClientEvent('group:leaveGroup', src)' **after** 'if groupID > 0 then'

* **Find** 'RegisterNetEvent("groups:kickMember", function(player, groupID)'
* **Add** 'TriggerClientEvent('group:leaveGroup', player)' **after** 'RemovePlayerFromGroup(player, groupID)'

* **Find**  'function DestroyGroup(groupID)'
* **Add** 'TriggerClientEvent('group:leaveGroup', m[i])' **after** 'TriggerClientEvent("groups:GroupDestroy", m[i])'
# Ensure my addon files vehicle

# If you want to add money to fund's add this to your sql.



# ENJOY!!