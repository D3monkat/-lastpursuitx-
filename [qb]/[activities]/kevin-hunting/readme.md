# Dependencies
- QBCore (latest/updated version with new core)
- qb-target https://github.com/qbcore-framework/qb-target
- qb-inventory/lj-inventory
- ox_lib https://github.com/overextended/ox_lib/releases/tag/v2.19.1 (download the ox_lib.zip)

------------------------------------------------------------------------------------
# The hunting rifle used can be found in https://github.com/NoobySloth/Custom-Weapons

* Add the images from the images file into your inventory html images
* Add the below lines into your qb-core>shared>item.lua at the bottom

```lua
    ["boar1"] 			 = {["name"] = "boar1",				["label"] = "Boar Carcass",			["weight"] = 3000,    ["type"] = "item",		["image"] = "boar1.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["boar2"] 			 = {["name"] = "boar2",				["label"] = "Boar Carcass",			["weight"] = 3500,    ["type"] = "item",		["image"] = "boar2.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["boar3"] 			 = {["name"] = "boar3",				["label"] = "Boar Carcass",			["weight"] = 3800,    ["type"] = "item",		["image"] = "boar3.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["boar4"] 			 = {["name"] = "boar4",				["label"] = "Boar Carcass",			["weight"] = 4000,    ["type"] = "item",		["image"] = "boar4.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "This looks like a protected boar."},
	["deer1"] 			 = {["name"] = "deer1",				["label"] = "Deer Carcass",			["weight"] = 3000,    ["type"] = "item",		["image"] = "deer1.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["deer2"] 			 = {["name"] = "deer2",				["label"] = "Deer Carcass",			["weight"] = 3500,    ["type"] = "item",		["image"] = "deer2.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["deer3"] 			 = {["name"] = "deer3",				["label"] = "Deer Carcass",			["weight"] = 3800,    ["type"] = "item",		["image"] = "deer3.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["deer4"] 			 = {["name"] = "deer4",				["label"] = "Deer Carcass",			["weight"] = 4000,    ["type"] = "item",		["image"] = "deer4.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "This looks like a protected deer."},
	["coyote1"] 		 = {["name"] = "coyote1",			["label"] = "Coyote Carcass",		["weight"] = 3000,    ["type"] = "item",		["image"] = "coyote1.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["coyote2"] 		 = {["name"] = "coyote2",			["label"] = "Coyote Carcass",		["weight"] = 3500,    ["type"] = "item",		["image"] = "coyote2.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["coyote3"] 		 = {["name"] = "coyote3",			["label"] = "Coyote Carcass",		["weight"] = 3800,    ["type"] = "item",		["image"] = "coyote3.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["coyote4"] 		 = {["name"] = "coyote4",			["label"] = "Coyote Carcass",		["weight"] = 4000,    ["type"] = "item",		["image"] = "coyote4.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "This looks like a protected coyote."},
	["mtlion1"] 		 = {["name"] = "mtlion1",			["label"] = "Mountain Lion Carcass",		["weight"] = 3000,    ["type"] = "item",		["image"] = "mtlion1.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["mtlion2"] 		 = {["name"] = "mtlion2",			["label"] = "Mountain Lion Carcass",		["weight"] = 3500,    ["type"] = "item",		["image"] = "mtlion2.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["mtlion3"] 		 = {["name"] = "mtlion3",			["label"] = "Mountain Lion Carcass",		["weight"] = 3800,    ["type"] = "item",		["image"] = "mtlion3.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
	["mtlion4"] 		 = {["name"] = "mtlion4",			["label"] = "Mountain Lion Carcass",		["weight"] = 4000,    ["type"] = "item",		["image"] = "mtlion4.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "This looks like a protected mountain lion."},
	["bigfoot"] 		 = {["name"] = "bigfoot",			["label"] = "Big Foot Carcass",				["weight"] = 9000,    ["type"] = "item",		["image"] = "bigfoot.png",      ["unique"] = false,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A human in a costume??"},
	["huntingbait"] 	 = {["name"] = "huntingbait",		["label"] = "Animal Bait",			    	["weight"] = 15,      ["type"] = "item",		["image"] = "huntingbait.png",  ["unique"] = false,		["useable"] = true,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["hunterslogo"] 	 = {["name"] = "hunterslogo",		["label"] = "Hunters Logo",			    	["weight"] = 1,    	  ["type"] = "item",		["image"] = "hunterslogo.png",  ["unique"] = false,		["useable"] = false,	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["hunterlicense"] 	 = {["name"] = "hunterlicense",		["label"] = "Hunting License",			    	["weight"] = 1,    	  ["type"] = "item",		["image"] = "huntinglicense.png",  ["unique"] = true,		["useable"] = true,	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    ['heart'] 				 = {['name'] = 'heart', 			  	  	['label'] = 'Heart', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'heart.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['lungs'] 				 = {['name'] = 'lungs', 			  	  	['label'] = 'Lungs', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'lungs.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['brain'] 				 = {['name'] = 'brain', 			  	  	['label'] = 'Brain', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'brain.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['intestines'] 			 = {['name'] = 'intestines', 			  	['label'] = 'Intestines', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'intestines.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['kidneys'] 			 = {['name'] = 'kidneys', 			  	  	['label'] = 'Kidneys', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'kidneys.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['stomach'] 			 = {['name'] = 'stomach', 			  	  	['label'] = 'Stomach', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'stomach.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['liver'] 				 = {['name'] = 'liver', 			  	  	['label'] = 'Liver', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'liver.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['humanmeat'] 			 = {['name'] = 'humanmeat', 			  	['label'] = 'Questionable Meat',	['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'humanmeat.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
    ["knife"] 			     = {["name"] = "knife",				    ["label"] = "Sharp Knife",			   	["weight"] = 1500,    	["type"] = "item",		["image"] = "knife.png",         ["unique"] = true,		["useable"] = true,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},


```

# Go to [qb] > qb-smallresources > server > logs.lua and  the following snippet in the local Webhooks

```lua
['hunting'] = 'put your discord channel webhook here',
```

* If you are unsure how to get a webhook this link can help you https://docs.gitlab.com/ee/user/project/integrations/discord_notifications.html

# Adding the hunting License

- Go to lj/qb-inventory > html > js > app.js  then search for the following :
```lua
        } else if (itemData.name == "weaponlicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
```
Once you found that snippet above paste the following snippet below it :

```lua
        } else if (itemData.name == "hunterlicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname + 
                "</span></p><p><strong>Date Issued: </strong><span>" +
                itemData.info.created +
                "</span></p><p><strong>Expiration Date: </strong><span>" +
                itemData.info.expire + "</a>"
            );
            } else if (itemData.name == "heart") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "lungs") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "brain") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "intestines") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "kidneys") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "stomach") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "liver") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "humanmeat") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
```

* In you lj/qb-inventory >server > server.lua find the following ***QBCore.Commands.Add("giveitem"*** once there add the following lines
```lua
    elseif itemData["name"] == "heart" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "lungs" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "brain" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "intestines" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "kidneys" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "stomach" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "liver" then
        info.quality = math.random(45, 100)
    elseif itemData["name"] == "humanmeat" then
        info.quality = math.random(45, 100)
```

* Add the following line to qb-core > server > player.lua any where around 87-140 area under metadata
```lua
    PlayerData.metadata['hunting'] = PlayerData.metadata['hunting'] or 0
```

* If you set it to be a hunter specifc job then add the following snippet to qb-core>shared>jobs.lua
```lua
    ['hunter'] = {
		label = 'LS Hunters', --- change if you like
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Hunter',
                payment = 50
            },
        },
	},
	```

# Ps-dispatch alerts
* Copy the following snippets and paste in ps-dispatch > client > cl_extraalerts.lua
```lua
local function IllegalHunting()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local sex = {
        'male',
        'female'
    }
    local gender = sex[math.random(#sex)]
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "anoncall", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "911",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        information = 'Hello someone just killed a protected animal.. hurry',
        dispatchMessage = "Incoming Call", -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('IllegalHunting', IllegalHunting)

local function BigFoot()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local sex = {
        'male',
        'female'
    }
    local gender = sex[math.random(#sex)]
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "anoncall2", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "911",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 1, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        information = 'Hello someone just killed a person in a bigfoot outfit.. hurry',
        dispatchMessage = "Incoming Call", -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('BigFoot', BigFoot)

local function BodyLooting()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local sex = {
        'male',
        'female'
    }
    local gender = sex[math.random(#sex)]
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "anoncall3", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "911",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 1, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        information = 'There is someone disecting a body..',
        dispatchMessage = "Incoming Call", -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('BodyLooting', BodyLooting)
```

* Copy the following and paste in server > sv_dispatchcodes.lua (PS. blips for the alerts are offset if you want it exactly where the activity happened then change the offset in the snippets below to false)
```lua
	["anoncall"] =  {displayCode = '911', description = "Illegal Hunting Activity", radius = 0, recipientList = {'police'}, blipSprite = 141, blipColour = 17, blipScale = 1.2, blipLength = 2, sound = "robberysound", offset = "true"},
	["anoncall2"] =  {displayCode = '911', description = "Illegal Hunting Activity", radius = 0, recipientList = {'police'}, blipSprite = 671, blipColour = 1, blipScale = 1.2, blipLength = 2, sound = "robberysound", offset = "true"},
	["anoncall3"] =  {displayCode = '911', description = "Body Disection", radius = 0, recipientList = {'police'}, blipSprite = 310, blipColour = 1, blipScale = 1.2, blipLength = 2, sound = "robberysound", offset = "true"},
```

# For the item detection to work properly ensure that the snippet below is in your qb-core > client >functions.lua

```lua
function QBCore.Functions.HasItem(items, amount)
    local isTable = type(items) == 'table'
	local isArray = isTable and table.type(items) == 'array' or false
	local totalItems = #items
    local count = 0
    local kvIndex = 2
	if isTable and not isArray then
        totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    for _, itemData in pairs(QBCore.PlayerData.items) do
        if isTable then
            for k, v in pairs(items) do
                local itemKV = {k, v}
                if itemData and itemData.name == itemKV[kvIndex] and ((not amount and not isArray and itemData.amount >= v) or (isArray and amount and itemData.amount >= amount) or (not amount and isArray)) then
                    count += 1
                end
            end
            if count == totalItems then
                return true
            end
        else -- Single item as string
            if itemData and itemData.name == items and (not amount or (amount and itemData.amount >= amount)) then
                return true
            end
        end
    end
    return false
end
```
