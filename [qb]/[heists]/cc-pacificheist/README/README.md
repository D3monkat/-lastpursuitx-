# CC Pacific Heist (cc-pacificheist)
* Tebex: https://ccdev.tebex.io/
* Discord: https://discord.gg/N5ut9BYkSK

# Dependencies
* [lightsout by Kylend](https://github.com/dnelyk/Hacking_Minigames/tree/main/lightsout)
* [numbers by Kylend](https://github.com/dnelyk/Hacking_Minigames/tree/main/numbers)
* [mka-lasers by mkafrin](https://github.com/mkafrin/mka-lasers)
* [ultra-voltlab by ultrahacx](https://github.com/ultrahacx/ultra-voltlab)
* [memorygame by pushkart2](https://github.com/pushkart2/memorygame)
* [hacking by Jesper-Hustad](https://github.com/Jesper-Hustad/NoPixel-minigame/tree/main/fivem-script)
* [pd-safe by VHall1](https://github.com/VHall1/pd-safe)
* [qb-target by BerkieBb](https://github.com/BerkieBb/qb-target)
* [varhack by JoeSzymkowicz](https://github.com/JoeSzymkowiczFiveM/varhack)

# Installation
* **Add the items to qb-core/shared/items.lua**
* **Add the item info for the laptop to the giveitem command**
* **Drag all dependencies from MINIGAMES to your resources**
* **Add the doorlock config to qb-doorlock/configs**
* **Add "pacificheistalarm" to interact-sound/client/html/sounds**
* **Locate "room16_vault_trolleys" in cfx-gabz-mapdata/gabz_entityset_mods1.lua and set to false**
* **Add the NVGs to your smallresources and set the correct clothing index**
* **You may have to change the clothing piece in the nightvision.lua**
* **Configure the script to your liking in the config.lua**

# Items for shared/items.lua
```lua
["hardeneddecrypter"] = {["name"] = "hardeneddecrypter", ["label"] = "Hardened Decrypter", ["weight"] = 1000, ["type"] = "item", ["image"] = "hardeneddecrypter.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = ""},
["hardeneddrill"] = {["name"] = "hardeneddrill", ["label"] = "Hardened Drill", ["weight"] = 1000, ["type"] = "item", ["image"] = "hardeneddrill.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = ""},
["disruptor"] = {["name"] = "disruptor", ["label"] = "Disruptor", ["weight"] = 1000, ["type"] = "item", ["image"] = "disruptor.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Small disruptor device to shut off systems"},
['inkedbills'] = {['name'] = 'inkedbills', ['label'] = 'Inked Money Bag', ['weight'] = 2000, ['type'] = 'item', ['image'] = 'money-bag.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A bag full of inked bills'},
["laptop_red"] = {["name"] = "laptop_red", ["label"] = "Laptop", ["weight"] = 2500, ["type"] = "item", ["image"] = "laptop_red.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = ""},
['c4'] = {['name'] = 'c4', ['label'] = 'C4 Explosive', ['weight'] = 1000, ['type'] = 'item', ['ammotype'] = nil, ['image'] = 'weapon_stickybomb.png', ['unique'] = true, ['useable'] = false, ['description'] = 'A high-yield, timed explosive device'},
["nvg"] = {["name"] = "nvg", ["label"] = "NVG", ["weight"] = 5000, ["type"] = "item", ["image"] = "nvg.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "These allow you to see in the dark"},

```

# Add the item info to qb-inventory/server/main.lua under the giveitem command
```lua
elseif itemData["name"] == "laptop_red" then
	info.uses = 3
```

# Night Vision Goggles
```lua
-- qb-smallresources/server/nvg.lua
QBCore.Functions.CreateUseableItem("nvg", function(source)
    TriggerClientEvent("nvg:UseNVG", source)
end)

-- qb-smallresources/client/nvg.lua
local nvg = false

RegisterNetEvent("nvg:UseNVG", function()
    nvg = not nvg
    QBCore.Functions.Progressbar("remove_gear", "Using NVGs", 500, false, true, {}, {}, {}, {}, function()
        if nvg then
            SetNightvision(true)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "nvg", 0.25)
            SetPedPropIndex(PlayerPedId(), 0, 117, 0, true)
        else
            SetNightvision(false)
            SetPedPropIndex(PlayerPedId(), 0, 116, 0, true)
        end
    end)
end)
```
