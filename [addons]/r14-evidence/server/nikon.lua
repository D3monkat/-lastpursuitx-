local QBCore = GetResourceState('qb-core') == 'started' and exports['qb-core']:GetCoreObject()
local ESX = GetResourceState('es_extended') == 'started' and exports.es_extended:getSharedObject()
local ox_inventory = GetResourceState('ox_inventory') == 'started' and exports.ox_inventory

local ImageSpaces = {} -- for future functionality
local removeInProgress = false -- for future functionality
local inventoryMetadata = Config.Inventory.CustomMetadata.Enabled and Config.Inventory.CustomMetadata.Field or Config.Inventory.Ox and 'metadata' or 'info' 

-----------------------------------------------------------------------------------------------------------
------------------------------------        Camera Webhooks         ---------------------------------------
-----------------------------------------------------------------------------------------------------------

local Webhooks = { -- these webhooks keys MUST MATCH your config keys
    [1] = '',
    [2] = '',
    [3] = '',
    [4] = '',
    [5] = '',
    [6] = '',
    [7] = '',
}

-----------------------------------------------------------------------------------------------------------
------------------------------------         Initialization         ---------------------------------------
-----------------------------------------------------------------------------------------------------------

for k, v in pairs(Config.Camera) do
    local initialize = true

    if type(v) ~= 'table' then print(('Nikon initialization for %s has failed, please follow the camera guide and create a table, current data type is %s.'):format(k, type(v))) initialize = false end   
    if type(v.Path) ~= 'string' then print(('Nikon initialization for %s has failed, Path subfield is not a string, current data type is %s'):format(k, type(v.Path)))  initialize = false end
    if v.path == '' then print(('Nikon initialization for %s has failed, Path subfield is not a string, current data type is %s'):format(k, type(v.Path))) initialize = false end
    if Webhooks[k] == '' then print(('Nikon initialization for %s has failed, webhook is blank, please update your server-side webhooks table'):format(k)) initialize = false end

    if initialize then
        ImageSpaces[v.Path] = {}      
    end
end

-----------------------------------------------------------------------------------------------------------
------------------------------------        Camera Functions        ---------------------------------------
-----------------------------------------------------------------------------------------------------------

function RemovePhoto(imageSpace, photoId, photoTime) -- future functionality
    removeInProgress = true
    local count = 0
    local newphotos = table.clone(ImageSpaces[imageSpace])
    ImageSpaces[imageSpace] = {}

    for k, v in pairs(newphotos) do
        if k ~= photoId and v.time ~= photoTime then
            count = count + 1
            ImageSpaces[imageSpace][count] = v 
        end
    end
    removeInProgress = false
end

-----------------------------------------------------------------------------------------------------------
------------------------------------        Camera Events           ---------------------------------------
-----------------------------------------------------------------------------------------------------------

RegisterNetEvent('evidence:server:updateimagespace', function(photo, remove) -- for future functionality
    if not remove then
        local imageSpace = Config.Camera[photo.uploadPath].Path
        local imageSpaceSize = #ImageSpaces[imageSpace]

        ImageSpaces[imageSpace][imageSpaceSize + 1] = photo

        Config.Functions.ServerNotify(source, (Config.Notification.UploadedToImageSpace):format(imageSpace), "success")
    else -- for future functionality
        if removeInProgress then -- server already processing delete, cancel delete and have user try again
            TriggerClientEvent('nikon:client:canceldelete', source, 'System is already processing delete, please try again!')
            return
        else
            if not ImageSpaces[remove.imageSpace] or not ImageSpaces[remove.imageSpace][remove.photoId] then 
               TriggerClientEvent('nikon:client:canceldelete', source, 'System could not locate photo, please try again!') -- something has gone wrong, 
               return
            else
                RemovePhoto(Config.Camera[remove.imageSpace].Path, remove,photoId, remove.photoTime)
            end
        end
    end
end)

RegisterNetEvent('evidence:server:fetchnetphotos', function(data) -- for future functionality
    local imageSpace = Config.Camera[data.imageSpace].Path

    if Config.Camera[data.imageSpace].Password and data.password ~= Config.Camera[data.imageSpace].Password then return else end

    local sendpackage = {}
    local page = data.page - 1 or 0
    local amount = data.amount - 1 or 19
    local imageSpaceSize = #ImageSpaces[imageSpace] -- check to make sure it doesn't check the length of a nil value
    local loopStart = imageSpaceSize - (page * amount)
    local loopEnd = imageSpaceSize - (page * amount) - amount

    if ImageSpaces[imageSpace] and next(ImageSpaces[imageSpace]) then
        for i = loopStart, loopEnd , -1 do
            if ImageSpaces[imageSpace][i] then
                local v = table.clone(ImageSpaces[imageSpace][i])
                v.photoId = i
                sendpackage[#sendpackage + 1] = v
            end
        end
    end
  
    TriggerClientEvent('evidence:client:receivenetphotos', source, sendpackage, loopEnd > 1)
end)

RegisterNetEvent('evidence:server:uploadphoto', function(uploadPath, photo)
    if uploadPath == 1 or photo.uploadPath == 1 then print(("%s attempted to upload image to local storage via %s??? %s "):format(source, GetInvokingResource() or 'client', json.encode(photo))) return end

    local imageSpace = Config.Camera[uploadPath].Path

    local imageSpaceSize = #ImageSpaces[imageSpace]

    ImageSpaces[imageSpace][imageSpaceSize + 1] = photo

    PerformHttpRequest(Webhooks[uploadPath], function(err, text, headers) end, 'POST', json.encode({content = photo.url}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent("evidence:server:updatecamerainfo", function(data)
    local src = source
    local PlayerItems = Config.Functions.GetInventoryServer(source)

    if PlayerItems and PlayerItems[data.slot] and PlayerItems[data.slot].name == 'nikon' then -- check for name of item being modified
        Config.Functions.UpdateMetadata(source, data.slot, data.info)
    end
end)

RegisterNetEvent("evidence:server:updateSDcard", function(data)
    local src = source
    local PlayerItems = Config.Functions.GetInventoryServer(source)

    if PlayerItems and PlayerItems[data.slot] and PlayerItems[data.slot].name == 'sdcard' then -- check for name of item being modified
        PlayerItems[data.slot][inventoryMetadata].name = data.name

        Config.Functions.UpdateMetadata(source, data.slot, PlayerItems[data.slot][inventoryMetadata])
    end
end)

RegisterNetEvent('evidence:server:setinvbusy', function(bool) -- this disables inventory while in the camera
    if Config.Inventory.Ox then
        Player(source).state.invBusy = bool
    elseif Config.Inventory.QB then
        Player(source).state.inv_busy = bool
    elseif Config.Inventory.CustomStatebags.Busy then
        Player(source).state[Config.Inventory.CustomStatebags.Busy] = bool
    end
end)

RegisterNetEvent('evidence:server:sdcard', function(data) -- this event handles giving and taking SD cards from the camera 
    local src = source
    local PlayerItems = Config.Functions.GetInventoryServer(source)

    if data.info then
        if Config.Functions.AddItem(src, "sdcard", 1, false, data.info) then
            TriggerClientEvent("evidence:client:confirmeject", src)
        else
            Config.Functions.ServerNotify(src, 'Something went wrong!', "error")
        end
    elseif data.slot then
        local photos = PlayerItems[data.slot][inventoryMetadata].photos
        local name = PlayerItems[data.slot][inventoryMetadata].name

        if Config.Functions.RemoveItem(src, "sdcard", 1, data.slot) then     
            TriggerClientEvent("evidence:client:confirminsert", src, {name = name, photos = photos or {}})
        else
            Config.Functions.ServerNotify(src, 'Something went wrong!', "error")
        end
    end
end)

RegisterNetEvent('evidence:server:updatemdt', function(data)
    local src = source
    local table = Config.MDT.DRX and 'drx_mdw_incidents' or Config.MDT.PS and 'mdt_incidents'
    local query = ('SELECT * FROM %s WHERE %s = ?'):format(table, 'id')
    local report = nil

    MySQL.query(query, {tonumber(data.id)}, function(result)
        if result and next(result) then
            report = result[1]
        else
            report = ''
        end
    end)

    while not report do
        Wait(500)
    end

    if report ~= '' then
        local newev = report.evidence and json.decode(report.evidence) or {}
        local newphoto = nil

        if Config.MDT.DRX then
            newphoto = {
                description = data.description,
                identifier = data.title,
                id = #newev + 1,
                image = data.url,
            }            
        elseif Config.MDT.PS then
            newphoto = data.url
        end

        newev[#newev + 1] = newphoto


        MySQL.Async.execute('UPDATE '.. table ..' SET evidence = ? WHERE id = ?', {json.encode(newev), report.id})

        Config.Functions.ServerNotify(src, (Config.Notification.UploadedToMDT):format(report.id), "success")
    else
        Config.Functions.ServerNotify(src, (Config.Notification.DidNotFindReport):format(report.id), "error")
    end
end)

-----------------------------------------------------------------------------------------------------------
------------------------------------     Create Useable Items       ---------------------------------------
-----------------------------------------------------------------------------------------------------------

local ActiveCameras = {}

RegisterNetEvent('nikon:server:CancelTime', function()
    ActiveCameras[source] = nil
end)

Config.Functions.CreateUseableItem("nikon", function(source, item, inv, slot, data)
    local src = source
    local items = nil

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    ActiveCameras[src] = true

    print('here')

    TriggerClientEvent("nikon:Toggle", src, item.slot, items or Config.Functions.GetInventoryServer(src), item.id)
end)

Config.Functions.CreateUseableItem("sdcard", function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    TriggerClientEvent("nikon:useSDCard", src, item.slot, items or Config.Functions.GetInventoryServer(src))
end)

-----------------------------------------------------------------------------------------------------------
------------------------------------       Create Callbacks         ---------------------------------------
-----------------------------------------------------------------------------------------------------------

Config.Functions.RegisterCallback('nikon:GetWebhook', function(source, cb, uploadPath)
    local webhook = falset

    if uploadPath then       
        if not Webhooks[uploadPath] then print(('%s attempted to access a camera webhook for image space %s that does not exist, please ensure your main config and server webhooks table match.'):format(source, uploadPath)) webhook = 'missing' cb(webhook) return end
        if Webhooks[uploadPath] == '' then print(('%s attempted to access a blank camera webhook for image space %s, please check your server webhooks table.'):format(source, uploadPath)) webhook = 'blank' cb(webhook) return end

        webhook = Webhooks[uploadPath]
    else
        webhook = 'nopath'
        print(('%s attempted to access a camera webhook but supplied no upload path information, please check your config. %s'):format(source, uploadPath))       
    end

    cb(webhook)
end)

-----------------------------------------------------------------------------------------------------------
------------------------------------           Threads              ---------------------------------------
-----------------------------------------------------------------------------------------------------------

CreateThread(function() -- sends current time to the camera for timestamps
    while true do
        while next(ActiveCameras) do
            local date = os.date("%m/%d/%y @ %I:%M")
            local time = os.time()
            local camdate = os.date("%m / %d / %y   %I : %M : %S")

            for k, v in pairs(ActiveCameras) do
                TriggerClientEvent('nikon:client:time', k, date, time, camdate)
            end
            Wait(1000)
        end
        Wait(100)
    end
end)