local QBCore = GetResourceState('qb-core') == 'started' and exports['qb-core']:GetCoreObject()
local ESX = GetResourceState('es_extended') == 'started' and exports.es_extended:getSharedObject()
local ox_inventory = GetResourceState('ox_inventory') == 'started' and exports.ox_inventory

local Evidence, CarEvidence, NetImpactEvidence, PlayerPedImpacts, NetPedImpacts = setmetatable({}, ev_meta), {}, {}, {}, {}
local AddPacket = {}
local PlayerGSR, PlayerBAC, PlayerStatus, PlayerDrugs = {}, {}, {}, {}
local LoadedCars, CarFingerprints, Update, Models = {}, {}, {}, {}
local VehicleExtTampers, VehicleInteriorTampers = {}, {}
local AddPackage, RemovePackage = {}, {}
local ActivePlayers, PlayerIdentifiers = {}, {}

local inventoryMetadata = Config.Inventory.CustomMetadata.Enabled and Config.Inventory.CustomMetadata.Field or Config.Inventory.Ox and 'metadata' or 'info' 
local itemSerial = Config.Inventory.Ox and 'serial' or 'serie' 
local itemQuality = Config.Inventory.Ox and 'durability' or 'quality'
local ActiveFetch, bloodtypes, letters, numbers = {}, {}, {}, {}

local bloodtypedistro = {["A+"] = 34, ["A-"] = 6, ["B+"] = 9, ["B-"] = 2, ["AB+"] = 3, ["AB-"] = 1, ["O+"] = 38, ["O-"] = 7}
local evmeta = {
    [1] = {field = 'label', label = 'Type',},
    [2] = {field = 'tracking', label = 'Tracking ID',},
    [3] = {field = 'date', label = 'Date',},
    [4] = {field = 'ammolabel', label = 'Caliber',},
    [5] = {field = 'serie', label = 'Serial',},
    [6] = {field = 'serial', label = 'Serial',},
    [7] = {field = 'bloodtype', label = 'Bloodtype',},
    [8] = {field = 'fingerprint', label = 'Fingeprint',},
    [9] = {field = 'dnalabel', label = 'DNA Code',},
    [10] = {field = 'vehname', label = 'Vehicle Model',},
    [11] = {field = 'vehcolor', label = 'Vehicle Color',},
    [12] = {field = 'plate', label = 'VIN Match',},
    [13] = {field = 'description'},
    [14] = {field = 'result', label = 'Result',},
    [15] = {field = 'iteminfo'},
    [16] = {field = 'street', label = 'Collected',},
}

-- initalize random slect tables

for i = 48, 57 do numbers[#numbers + 1] = string.char(i) end -- build numbers table for randint
for i = 65, 90 do letters[#letters + 1] = string.char(i) end -- start building letters table for randstr
for i = 97, 122 do letters[#letters + 1] = string.char(i) end -- finish building letters table for randstr
for k, v in pairs(bloodtypedistro) do bloodtypes[#bloodtypes + 1] = k end -- create bloodtype table with average distribution

-- initalize evidence metatable

local evcount = 0

------------------------------------------------------------------------------------------------------------
--------------------------------------------    VERSION CHECK   --------------------------------------------
------------------------------------------------------------------------------------------------------------

PerformHttpRequest('https://raw.githubusercontent.com/regalonefour/r14-versions/main/r14-evidence.txt', function(err, version, headers)
    local curVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

    if not version then print('Could not complete version request.') return end

    if utf8.codepoint(version:sub(#version, #version)) == 10 then version = version:sub(1, #version - 1) end -- controls for data link escape character at the end of string from github, removes it if found

    if version ~= curVersion then
        print(('^3Current Version: %s, Latest Version: %s'):format(curVersion, version))
        print('Please download the latest version of r14-evidence from your keymaster!^0')
    end
end)

------------- framework startup events -----------------------

if Config.Framework.QB then
    RegisterNetEvent('QBCore:Server:OnJobUpdate', function(playerServerId) -- cache player data on loaded
        PlayerIdentifiers[playerServerId] = Config.Functions.PlayerDataServer(playerServerId)
    end)

    RegisterNetEvent('QBCore:Server:PlayerLoaded', function(Player) -- cache player data on loaded
        PlayerIdentifiers[Player.PlayerData.source] = Config.Functions.PlayerDataServer(Player.PlayerData.source)
        end)
elseif Config.Framework.ESX then
    RegisterNetEvent('esx:playerLoaded', function(playerServerId) -- cache player data on loaded
        PlayerIdentifiers[playerServerId] = Config.Functions.PlayerDataServer(playerServerId)
    end)

    RegisterNetEvent('esx:setJob', function(playerServerId)
        PlayerIdentifiers[playerServerId] = Config.Functions.PlayerDataServer(playerServerId)
    end)
elseif Config.Framework.Ox then
    -- wip
elseif Config.Framework.Qbox then
    -- wip
elseif Config.Framework.Standalone then
    -- you must write this yourself
end

----------- functions ------------------

function RandInt(count)
    local retval = ''

    for i = 1, count, 1 do retval = ('%s%s'):format(retval, numbers[math.random(1, #numbers)]) end

    return retval
end

function RandStr(count)
    local retval = ''

    for i = 1, count do retval = ('%s%s'):format(retval, letters[math.random(1, #letters)]) end

    return retval
end

local function GetSubfield(table, access)
    local subfields = {string.strsplit('.', access)}
    local retval = nil

    for k, v in ipairs(subfields) do
        retval = retval?[v] or table[v]
    end

    return retval
end

function CreateCitizenId()
    local UniqueFound = false
    local citizenid = nil
    while not UniqueFound do   
        citizenid = string.upper(tostring(RandStr(3) .. RandInt(5)))
        local result = MySQL.prepare.await(('SELECT COUNT(*) as count FROM %s WHERE citizenid = ?'):format(Config.DB.Identifiers), { citizenid })
        if result == 0 then
            UniqueFound = true
        end
    end
    return citizenid
end

function CreateFingerprint()
    local UniqueFound = false
    local fingerprint = nil
    while not UniqueFound do
        fingerprint = string.upper(tostring(RandStr(2) .. RandInt(3) .. RandStr(1) .. RandInt(2) .. RandStr(3) .. RandInt(4)))
        local result = MySQL.prepare.await(('SELECT COUNT(*) as count FROM `%s` WHERE `fingerprint` = ?'):format(Config.DB.Identifiers), { fingerprint })
        if result == 0 then
            UniqueFound = true
        end
    end
    return fingerprint
end

local function FetchIdentifiers(ident)
    ActiveFetch[ident] = true -- start fetch

    local query = ('SELECT * FROM %s WHERE %s LIKE ?'):format(Config.DB.Identifiers, 'identifier')
    local retval = nil

    complete1 = false

    MySQL.query(query, {ident}, function(result)
        if result and next(result) then
            retval = {
                citizenid = result[1].citizenid,
                bloodtype = result[1].bloodtype,
                fingerprint = result[1].fingerprint,
            }
        end
        complete1 = true
    end)

    while not complete1 do
        Wait(50)
    end

    if not retval then
        local citizenid = CreateCitizenId()
        local fingerprint = CreateFingerprint()
        local bloodtype = bloodtypes[math.random(1, #bloodtypes)]

        while not citizenid and not fingerprint do Wait(50) end

        retval = {ident, citizenid, bloodtype, fingerprint} -- generate identifiers

        MySQL.insert(('INSERT INTO %s (identifier, citizenid, bloodtype, fingerprint) VALUES (?, ?, ?, ?)'):format(Config.DB.Identifiers), retval)

        retval = {identifier = ident, citizenid = citizenid, bloodtype = bloodtype, fingerprint = fingerprint}
    end

    return retval
end

local function GetPlayerIdentifiers(source)
    if not source or source == '' then print('GetPlayerIdentifiers triggered without source, please consult a dev!') return end
    if type(source) == 'string' then source = tonumber(source) end


    local retval = false
    local PlayerData = Config.Functions.PlayerDataServer(source)

    while ActiveFetch[PlayerData.identifier] do Wait(50) end

    if PlayerIdentifiers[PlayerData.identifier] then
        retval = PlayerIdentifiers[PlayerData.identifier]
    else
        PlayerIdentifiers[PlayerData.identifier] = PlayerData
        
        if not PlayerData.bloodtype or not PlayerData.fingerprint or not PlayerData.citizenid then
            local newidentifiers = FetchIdentifiers(PlayerData.identifier)

            ActiveFetch[PlayerData.identifier] = nil

            while not newidentifiers do
                Wait(50)
            end

            for k, v in pairs(newidentifiers) do 
                PlayerIdentifiers[PlayerData.identifier][k] = v
            end 
        end

        retval = PlayerIdentifiers[PlayerData.identifier]
    end

    return retval
end

function RemoveEvidence(evid, handler)
    if not Evidence[evid] then print(('Evidence ID %s not found in database while trying to remove %s'):format(evid, handler)) return end

    RemovePackage[evid] = {remove = true, type = Evidence[evid].evtype}

    if Evidence[evid].net then 
        RemovePackage[evid].net = true 

        if Evidence[evid].evtype == 'netimpact' then
            if NetImpactEvidence[Evidence[evid].netid] and NetImpactEvidence[Evidence[evid].netid][evid] then
                NetImpactEvidence[Evidence[evid].netid][evid] = nil
            end
        else
            if Evidence[evid].cid then
                if PlayerPedImpacts[Evidence[evid].cid] and PlayerPedImpacts[Evidence[evid].cid][evid] then
                    PlayerPedImpacts[Evidence[evid].cid][evid] = nil
                end
            else
                if NetPedImpacts[Evidence[evid].netid] and NetPedImpacts[Evidence[evid].netid][evid] then
                    NetPedImpacts[Evidence[evid].netid][evid] = nil
                end
            end
        end        
    end

    if Evidence[evid].plate and Evidence[evid].evtype ~= 'fragment'  then 
        CarEvidence[Evidence[evid].plate][evid] = nil
        RemovePackage[evid].plate = Evidence[evid].plate 
    end

    Evidence[evid] = nil

    evcount = evcount - 1
end

local function DeleteOldest()
    local evlist = {}
    local count = 0

    for k, v in pairs(Evidence) do
        evlist[count + 1] = {time = v.time, evid = k}

        count = count + 1
    end
    
    table.sort(evlist, function(ev1, ev2) 
      return ev1.time < ev2.time
    end)    

    for i = 1, Config.EvidenceLimits.RemoveAfterLimit, 1 do
        RemoveEvidence(evlist[i].evid, 'delete oldest')
    end
end

local function AddEvidence(ev_id, evtype)
    evcount = evcount + 1    

    if evcount > Config.EvidenceLimits.Max then
        DeleteOldest()
    end

    if not Evidence[ev_id] then 
        Wait(500) 
        return
    end

    AddPackage[ev_id] = table.clone(Evidence[ev_id])
end

local function DnaHash(s)
    local h = string.gsub(s, ".", function(c)
        return string.format("%02x", string.byte(c))
    end)
    return h
end

local function CreateLatentId(item) -- this function prevents duplicate evidence id's in weapon/item evidence
    local latentList = {}
    local latentId = math.random(100000, 999999)

    if item[inventoryMetadata].latentprints then
        for k, v in pairs(item[inventoryMetadata].latentprints) do
            latentList[v.evidenceId] = true
        end
    end

    if item[inventoryMetadata].latentblood then
        for k, v in pairs(item[inventoryMetadata].latentblood) do
            latentList[v.evidenceId] = true
        end
    end

    while latentList[latentId] do
        latentId = math.random(100000, 999999)
    end

    return latentId
end

local function CreateEvidenceId()
    local evidenceId = math.random(100000, 999999)
    while Evidence[evidenceId] do
        evidenceId = math.random(100000, 999999)
    end
    return evidenceId
end

function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.Sync.fetchScalar('SELECT '.. Config.DB.Plate ..' FROM '.. Config.DB.Vehicle ..' WHERE '.. Config.DB.Plate ..' = ?', {plate})

    if result then
        retval = true
    end
    return retval
end

function LoadCarEvidence(plate)
    if not LoadedCars[plate] then        
        LoadedCars[plate] = true
        Update[plate] = {time = 5000, evtable = {}}

        local result = MySQL.Sync.fetchAll('SELECT evidence FROM '.. Config.DB.Vehicle ..' WHERE '.. Config.DB.Plate ..' = ?', {plate})
        
        if result[1] then
            evtable = json.decode(result[1].evidence)
        
            if Config.Debug.Database.enabled then print(('Vehicle evidence called for %s, following evidence loaded from database: %s'):format(plate, json.encode(evtable))) end

            if not CarEvidence[plate] then CarEvidence[plate] = {} end

            if evtable and next(evtable) then
                for k, v in pairs(evtable) do
                    if not v.time or v.time - os.time() >= 0 then
                        local data = {}

                        for a, b in pairs(v) do
                            data[a] = b
                        end

                        data.noupdate = true

                        if data.evtype == 'carblood' then
                            TriggerEvent('evidence:server:CreateCarBlood', data)
                        elseif data.evtype == 'carfingerprint' then -- don't want to rewrite carfingerpint function, adding logic here, make sure to update if car fingerpints change
                            local evidenceId = CreateEvidenceId()

                            Evidence[evidenceId] = {
                                evtype = 'carfingerprint',
                                fingerprint = v.fingerprint,
                                plate = plate,
                                location = v.location,
                                time = v.time,
                                seat = v.seat,
                            }

                            CarEvidence[plate][evidenceId] = {
                                evtype = 'carfingerprint',
                                fingerprint = v.fingerprint,
                                plate = plate,
                                location = v.location,
                                time = v.time,
                                seat = v.seat,
                            }

                            AddEvidence(evidenceId, Evidence[evidenceId].evtype)
                        elseif data.evtype == 'carcasing' then
                            TriggerEvent('evidence:server:CreateCarCasing', data)
                        end
                    end
                end
            end
        end

        Update[plate] = nil
    else
        if Config.Debug.Database.enabled then print(('No evidence found server side for %s, setting blank table'):format(plate, json.encode(evtable))) end 

        if not CarEvidence[plate] then CarEvidence[plate] = {} end
    end  
end

local function UpdateDB(vehplate)
    if not LoadedCars[vehplate] then return end

    if not Update[vehplate] then
        Update[vehplate] = {time = 5000, evtable = {}}

        CreateThread(function()
            local plate = vehplate

            while Update[vehplate].time > 0 do               
                Update[plate].time = Update[plate].time - 1000 
                Wait(1000)
            end

            for evid, info in pairs(CarEvidence[plate]) do
                Update[plate].evtable[#Update[plate].evtable+1] = info
            end

            MySQL.Async.execute('UPDATE '.. Config.DB.Vehicle ..' SET '.. Config.DB.Evidence ..' = ? WHERE '.. Config.DB.Plate ..' = ?', {json.encode(Update[plate].evtable), plate})

            if Config.Debug.Database.enabled then print(('Vehicle evidence for %s updated with following evidence: %s'):format(plate, json.encode(Update[plate].evtable))) end     
            
            Update[plate].evtable = nil

        end)
    else
        Update[vehplate].time = 5000 
    end    
end

local function SendEvidence()
    if not next(AddPackage) then return end

    local sendpackage = {}
    local count = 0
    
    for k, v in pairs(AddPackage) do
        if count < 15 then
            sendpackage[k] = v

            count = count + 1

            AddPackage[k] = nil
        end
    end

    for k, v in pairs(ActivePlayers) do
        if v.sync then
            TriggerClientEvent("evidence:client:AddEvidence", k, sendpackage)
        end
    end
end

local function SendRemove()
    local removepackage = table.clone(RemovePackage)
    RemovePackage = {}

    if next(removepackage) then
        TriggerClientEvent("evidence:client:RemoveEvidence", -1, removepackage)
    end
end

local function OxMetadata(metadata)
    local description = nil

    local newmeta = {}

    for i = 1, #evmeta do
        if metadata[evmeta[i].field] then
            if description then
                description = ('%s  \n%s%s'):format(description, evmeta[i].label and ('**%s:** '):format(evmeta[i].label) or '', metadata[evmeta[i].field])
            else
                description = ('%s%s'):format(evmeta[i].label and ('**%s:** '):format(evmeta[i].label) or '', metadata[evmeta[i].field])
            end
        end
    end
    
    metadata.evtype = metadata.type
    metadata.type = nil
    metadata.description = description

    return metadata
end

----------- general events -------------------

RegisterNetEvent('evidence:server:bagitem', function(data)
    local PlayerItems = Config.Functions.GetInventoryServer(source)
    local item = table.clone(PlayerItems[data.slot])

    if PlayerItems[data.slot] then
        if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
            if Config.Functions.RemoveItem(source, item.name, 1, data.slot) then
                local description = ''
                local qual = item[inventoryMetadata] and item[inventoryMetadata][itemQuality] and math.ceil(item[inventoryMetadata][itemQuality])

                if qual and qual - item[inventoryMetadata][itemQuality] < 0.5 then qual = tostring(math.floor(item[inventoryMetadata][itemQuality])) end

                if Config.Inventory.Ox then
                    if item[inventoryMetadata][itemSerial] then description = ('%s **%s:** %s  \n'):format(description, 'Serial Number', item[inventoryMetadata][itemSerial]) end
                    if item[inventoryMetadata].ammo then description = ('%s **%s:** %s  \n'):format(description, 'Loaded Ammo', item[inventoryMetadata].ammo) end
                    if item[inventoryMetadata][itemQuality] then description = ('%s **%s:** %s  \n'):format(description, 'Durability', item[inventoryMetadata][itemQuality]) end
                else
                    if item[inventoryMetadata][itemSerial] then description = ('%s <p><strong>%s: </strong><span> %s </span></p>'):format(description, 'Serial Number', item[inventoryMetadata][itemSerial]) end
                    if item[inventoryMetadata].ammo then description = ('%s <p><strong>%s: </strong><span> %s </span></p>'):format(description, 'Loaded Ammo', item[inventoryMetadata].ammo) end
                    if item[inventoryMetadata][itemQuality] then description = ('%s <p><strong>%s: </strong><span> %s </span></p>'):format(description, 'Durability', qual) end
                end

                local info = {
                    label = item.label,
                    type = "item",
                    item = item,
                    iteminfo = description or 'Ha hahaha',
                    date = os.date("%m/%d/%y @ %I:%M"),
                    street = data.street,
                    tracking = CreateEvidenceId(),
                }

                if Config.Inventory.Ox or Config.Inventory.QS then info = OxMetadata(info) end

                if not Config.Functions.AddItem(source, "filled_evidence_bag", 1, data.slot, info) then
                    Config.Functions.ServerNotify(source, 'Something went terribly wrong!', "error")
                end
            else
                Config.Functions.AddItem(source, "empty_evidence_bag", 1, false, info)
            end
        else
            Config.Functions.ServerNotify(source, Config.Notification.NoBag, "error")
        end
    else
        Config.Functions.ServerNotify(source, 'Something went wrong!', "error")
    end
end)

RegisterNetEvent('evidence:server:unbagitem', function(data)
    local PlayerItems = Config.Functions.GetInventoryServer(source)
    local item = table.clone(PlayerItems[data.slot] and PlayerItems[data.slot])

    if item and item.name == 'filled_evidence_bag' then
        if Config.Functions.RemoveItem(source, "filled_evidence_bag", 1, data.slot) then
            if Config.Functions.AddItem(source, item[inventoryMetadata].item.name, 1, data.slot, item[inventoryMetadata].item[inventoryMetadata]) then
                if not Config.AuthorizedJobs.LEO.Check(source) then
                    print(('%s %s (%s) unbagged a %s.'):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname, source, item[inventoryMetadata].item[inventoryMetadata].name))
                    TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'Civilian unbagged evidence (r14-evidence)', 'red', ('%s %s (%s) unbagged a %s.'):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname, source, item[inventoryMetadata].item[inventoryMetadata].name), false) 
                end
            end
        else
            Config.Functions.AddItem(source, "empty_evidence_bag", 1, false, info)
        end
    else
        Config.Functions.ServerNotify(source, 'Something went wrong!', "error")
    end
end)

RegisterNetEvent('evidence:server:notifytarget', function(target, notify)
    local src = source
    Config.Functions.ServerNotify(target, (notify):format(src))
end)

RegisterNetEvent('evidence:server:updatelatentevidence', function(data) -- this event handles weapon fingerprints
    local src = source

    if src == '' then print('evidence:server:updatelatentevidence was triggered from server and rejected') return end

    local PlayerItems = Config.Functions.GetInventoryServer(src)
    local Player = GetPlayerIdentifiers(src)

    if PlayerItems and PlayerItems[data.slot] then

        if data.fingerprint then
            if PlayerItems[data.slot][inventoryMetadata] and PlayerItems[data.slot][inventoryMetadata].latentprints then
                for k, v in pairs(PlayerItems[data.slot][inventoryMetadata].latentprints) do
                    local newintegrity = v.integrity or 0 - math.random(0, 3)

                    if newintegrity > 0 then
                        local chance = math.random(1,1000) 
                        local against = (newintegrity + ((100 - newintegrity) / 2)) * 10

                        if chance > against then newintegrity = 0 end
                    end

                    if newintegrity <= 0 then
                        PlayerItems[data.slot][inventoryMetadata].latentprints[k] = nil
                    else
                        PlayerItems[data.slot][inventoryMetadata].latentprints[k].integrity = newintegrity
                    end
                end
            end

            if data.nogloves then
                if PlayerItems[data.slot][inventoryMetadata].latentprints then
                    PlayerItems[data.slot][inventoryMetadata].latentprints[Player.fingerprint] = {integrity = 100, evidenceId = CreateLatentId(PlayerItems[data.slot])}
                else
                    PlayerItems[data.slot][inventoryMetadata].latentprints = {[Player.fingerprint] = {integrity = 100, evidenceId = CreateLatentId(PlayerItems[data.slot])}}
                end
            end
        end

        if data.blood then
            local Victim = GetPlayerIdentifiers(data.victim)

            if PlayerItems[data.slot][inventoryMetadata].latentblood then
                PlayerItems[data.slot][inventoryMetadata].latentblood[DnaHash(Victim.citizenid)] = {bloodtype = Victim.bloodtype, evidenceId = CreateLatentId(PlayerItems[data.slot])}
            else
                PlayerItems[data.slot][inventoryMetadata].latentblood = {[DnaHash(Victim.citizenid)] = {bloodtype = Victim.bloodtype, evidenceId = CreateLatentId(PlayerItems[data.slot])}}
            end
        end

        Config.Functions.UpdateMetadata(src, data.slot, PlayerItems[data.slot][inventoryMetadata])
    end
end)

RegisterNetEvent('evidence:server:AddLatentEvToInventory', function(data)
    local src = source
    local latentType = data.info.type

    data.info.date = os.date("%m/%d/%y @ %I:%M")

    if src == '' then print('evidence:server:AddLatentEvToInventory was triggered from server and rejected') return end

    local PlayerItems = Config.Functions.GetInventoryServer(src)
    local Player = GetPlayerIdentifiers(src)

    if Config.Inventory.Ox or Config.Inventory.QS then data.info = OxMetadata(data.info) end

    if PlayerItems and PlayerItems[data.slot] and Config.Functions.RemoveItem(src, "empty_evidence_bag", 1) then
        if Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, data.info) then

            if latentType == 'blood' then
                PlayerItems[data.slot][inventoryMetadata].item[inventoryMetadata].latentblood[data.info.dnalabel] = nil
    
                if not next(PlayerItems[data.slot][inventoryMetadata].item[inventoryMetadata].latentblood) then PlayerItems[data.slot][inventoryMetadata].item[inventoryMetadata].latentblood = nil end
            elseif latentType == 'fingerprint' then
                PlayerItems[data.slot][inventoryMetadata].item[inventoryMetadata].latentprints[data.info.fingerprint] = nil
                if not next(PlayerItems[data.slot][inventoryMetadata].item[inventoryMetadata].latentprints) then PlayerItems[data.slot][inventoryMetadata].item[inventoryMetadata].latentprints = nil end
            end

            Config.Functions.UpdateMetadata(src, data.slot, PlayerItems[data.slot][inventoryMetadata])
        else

            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end

end)

RegisterNetEvent('evidence:server:wipeweapon', function(data) -- finish for blood
    local src = source

    if src == '' then print('evidence:server:wipeweapon was triggered from server and rejected') return end

    local PlayerItems = Config.Functions.GetInventoryServer(src)
    local Player = GetPlayerIdentifiers(src)

    if PlayerItems and PlayerItems[data.slot] then 
        if PlayerItems[data.slot][inventoryMetadata].latentprints then
            PlayerItems[data.slot][inventoryMetadata].latentprints = nil
        end

        if PlayerItems[data.slot][inventoryMetadata].latentblood then
            PlayerItems[data.slot][inventoryMetadata].latentblood = nil
        end

        Config.Functions.UpdateMetadata(src, data.slot, PlayerItems[data.slot][inventoryMetadata])
    end

end)

RegisterNetEvent('evidence:server:FetchEv', function()
    local src = source
    local strsrc = tostring(src)

    if not ActivePlayers[strsrc] then 
        ActivePlayers[strsrc] = {bucket = GetPlayerRoutingBucket(strsrc), sync = true} 
    else
        ActivePlayers[strsrc].sync = true
    end

    local fetchevtable = table.clone(Evidence)

    while next(fetchevtable) do
        local count = 250
        local evpackage = {}

        for k, v in pairs(fetchevtable) do
            if count > 0 then
                evpackage[k] = v
                fetchevtable[k] = nil
                count = count - 1
            end
        end

        TriggerClientEvent('evidence:client:AddEvidence', src, evpackage)   
        Wait(300)
    end

    TriggerClientEvent('evidence:client:SetLoaded', src)   
end)

RegisterNetEvent('evidence:server:LoadCarEvidence', function(plate)
    if IsVehicleOwned(plate) then LoadCarEvidence(plate) else CarEvidence[plate] = {} end
end)

RegisterNetEvent('evidence:server:UpdateStatus', function(data)
    local src = source
    local cid = GetPlayerIdentifiers(src).citizenid 
    PlayerStatus[cid] = data
end)

RegisterNetEvent('evidence:server:IncreaseBAC', function(data)
    local src = source
    local cid = GetPlayerIdentifiers(src).citizenid 
    
    if not PlayerBAC[cid] then
        PlayerBAC[cid] = data
    else
        PlayerBAC[cid] = PlayerBAC[cid] + data
    end
end)

RegisterNetEvent('evidence:server:DecreaseBAC', function(data)
    local src = source
    local cid = GetPlayerIdentifiers(src).citizenid

    if PlayerBAC[cid] then
        PlayerBAC[cid] = PlayerBAC[cid] - data

        if PlayerBAC[cid] <= 0 then PlayerBAC[cid] = nil end
    end
end)

RegisterNetEvent('evidence:server:SetGSR', function(bool, citizenid)
    local src = source
    local cid = citizenid or GetPlayerIdentifiers(src).citizenid 
    
    if bool then
        PlayerGSR[cid] = os.time() + 15 --(60 * Config.GSR.FadeTime)
    else
        PlayerGSR[cid] = nil
    end
end)

RegisterNetEvent('evidence:server:SetExteriorTamper', function(bool, plate)
    local src = source  

    if bool then
        VehicleExtTampers[plate] = {status = bool, time = Config.EvidenceFadeTime.VehTampers}
    elseif VehicleExtTampers[plate] then
        VehicleExtTampers[plate] = nil
    end
end)

RegisterNetEvent('evidence:server:SetIgnitionTamper', function(bool, plate)
    local src = source  
    
    if bool then
        VehicleInteriorTampers[plate] = {status = bool, time = Config.EvidenceFadeTime.VehTampers}
    elseif VehicleInteriorTampers[plate] then
        VehicleInteriorTampers[plate] = nil
    end
end)

RegisterNetEvent('evidence:server:useaccesstool', function(item) -- manages access tool uses if enabled
    local src = source
    local PlayerItems = Config.Functions.GetInventoryServer(source)
    local slot = nil

    for k, v in pairs(PlayerItems) do
        if v.name == 'accesstool' then
            slot = k
        end
    end

    if not slot then return end

    if Config.Consume.AccessTool then
        if not PlayerItems[slot][inventoryMetadata].uses then PlayerItems[slot][inventoryMetadata].uses = Config.Consume.AccessTool end

        if PlayerItems[slot][inventoryMetadata].uses - 1 == 0 then
            Config.Functions.RemoveItem(source, 'accesstool', 1, slot)
        else
            PlayerItems[slot][inventoryMetadata].uses = PlayerItems[slot][inventoryMetadata].uses - 1

            Config.Functions.UpdateMetadata(src, slot, PlayerItems[slot][inventoryMetadata])          
        end
    end
end)

RegisterNetEvent('evidence:server:washCar', function()
    local src = source

    if Config.Functions.RemoveMoney(src, Config.CarWash.Settings.Price, 'Automatic Touchless Carwash') then
        TriggerClientEvent('evidence:client:washCar', src)
    end
end)

----------- drug testing events --------------------------

if Config.DrugTesting.Enabled then
    if Config.DrugTesting.UsingQBSR then
        RegisterNetEvent('consumables:server:useMeth', function()
            local cid = GetPlayerIdentifiers(source).citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['meth'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useOxy', function()
            local cid = GetPlayerIdentifiers(source).citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['oxycodone'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useXTCBaggy', function()
            local cid = GetPlayerIdentifiers(source).citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['ecstacy'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useCrackBaggy', function()
            local cid = GetPlayerIdentifiers(source).citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['cocaine'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useCokeBaggy', function()
            local cid = GetPlayerIdentifiers(source).citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['cocaine'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)
    end

    if Config.DrugTesting.EventTriggers then
        for k, v in pairs(Config.DrugTesting.EventTriggers) do
            if not v.type or (v.type and v.type == 'server') then
                CreateThread(function()
                    RegisterNetEvent(v.event, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg10)
                        local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
                        local src = source
                        local cid = nil

                        if Config.Debug.PrintEventTriggerArgs.enabled then
                            local debugArgs = {}

                            for k, v in ipairs(args) do debugArgs[k] = {key = k, value = v} end 

                            print('Debugging Drug Event Trigger!')
                            print(('Event Name: ^5%s^0'):format(v.event))
                            print(('Current Argument (drugArgPos): ^5%s^0'):format(v.drugArgPos))
                            print(('Value Found At Argument %s: ^5%s^0'):format(v.drugArgPos, type(v.drugArgValue) == 'table' and json.encode(args[v.drugArgPos], {indent = true}) or args[v.drugArgPos]))
                            print(('Value Being Checked Against: ^5%s^0'):format(type(v.drugArgValue) == 'table' and json.encode(v.drugArgValue, {indent = true}) or v.drugArgValue))
                            print(('Args Being Received By Event: ^5{^0'):format(json.encode(debugArgs, {indent = true})))
                            for k, v in pairs(debugArgs) do print(('^5    Argument %s:  %s^0'):format(v.key, type(args[v.value]) == 'table' and json.encode(v.value, {indent = true}) or v.value)) end
                            print('^5}^0')

                            if type(args[v.drugArgPos]) == 'table' and not drugArgSubfield then 
                                print('The value being checked in the drugArgPos position is a table but you do not have a drugArgSubfield defined to access it.')
                                print('Please set the drugArgSubfield to the key value, either the value before the colon, or if there is not one, the number of the line.')
                            end

                            if not src or src == '' then 
                                print('This server event is being triggered by the server, meaning it does not come with a source to check.')
                                print('You will either need to provide the CID of the character and the position it is at using cidArgPos and cidArgSubfield if the argument is a table value. ')
                                print('Or provided the source of the original player activating it using srcArgPos and srcArgSubfield if the argument is a table value. ')
                            end
                        end

                        if not src and v.sourceArgPos then 
                            if args[v.sourceArgPos] then
                                if v.sourceArgSubfield then 
                                    src = args[v.sourceArgPos][v.sourceArgSubfield]
                                else 
                                    src = args[v.sourceArgPos]
                                end
                            end
                        end

                        if not src then print(('Failed to find source in %s, please check config to ensure your config settings are correct.'):format(v.event)) return end

                        local cid = src and Config.Functions.PlayerDataServer(src)
                        local cid = cid and cid.citizenid and cid.citizenid

                        if not cid and v.cidArgPos then 
                            if args[v.cidArgPos] then
                                if v.cidArgSubfield then 
                                    cid = args[v.cidArgPos][v.cidArgSubfield]
                                else 
                                    cid = args[v.cidArgPos]
                                end
                            end
                        end

                        if not cid then print(('Failed to find cid in %s, please check config to ensure your config settings are correct.'):format(v.event)) return end

                        local checkArg = v.drugArgPos and v.drugArgSubfield and args[v.drugArgPos][v.drugArgSubfield] or v.drugArgPos and args[v.drugArgPos]
                        local checkValue = v.drugArgPos and v.drugArgValue

                        if (not checkArg and not checkValue) or (checkArg and not checkValue) or (checkArg and checkValue and checkArg == checkValue) or (checkArg and type(checkValue) == 'table' and checkValue and checkValue[checkArg]) then
                            TriggerEvent('evidence:server:SetDrugStatus', {drug = type(checkValue) == 'table' and checkValue[checkArg] or v.drugType, cid = cid, hours = v.positiveTime})
                        end
                    end)
                end)
            end
        end
    end
end

if Config.Breathalyzer.Enabled and Config.Breathalyzer.EventTriggers and next(Config.Breathalyzer.EventTriggers) then
    for k, v in pairs(Config.Breathalyzer.EventTriggers) do
        if (not v.type or v.type and v.type == 'server') and v.event ~= 'evidence:client:SetStatus' then
            RegisterNetEvent(v.event, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg10)
                local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}

                if Config.Debug.PrintEventTriggerArgs.enabled then
                    local debugArgs = {}

                    for k, v in ipairs(args) do debugArgs[k] = {key = k, value = v} end 

                    print('Debugging Breathalyzer Event Trigger!')
                    print(('Event Name: ^5%s^0'):format(v.event))
                    print(('Current Argument (alcoholArgPos): ^5%s^0'):format(v.alcoholArgPos))
                    print(('Value Found At Argument %s: ^5%s^0'):format(v.alcoholArgPos, type(v.alcoholArgValue) == 'table' and json.encode(args[v.alcoholArgPos], {indent = true}) or args[v.alcoholArgPos]))
                    print(('Value Being Checked Against: ^5%s^0'):format(type(v.alcoholArgValue) == 'table' and json.encode(v.alcoholArgValue, {indent = true}) or v.alcoholArgValue))
                    print(('Args Being Received By Event: ^5{^0'):format(json.encode(debugArgs, {indent = true})))
                    for k, v in pairs(debugArgs) do print(('^5    Argument %s:  %s^0'):format(v.key, type(args[v.value]) == 'table' and json.encode(v.value, {indent = true}) or v.value)) end
                    print('^5}^0')
                end

                checkArg = v.alocholArgPos and v.alcoholArgSubfield and args[v.alcoholArgPos] and args[v.alcoholArgPos][v.alcoholArgSubfield] or v.alcoholArgPos and args[v.alcoholArgPos]
                checkValue = v.alcoholArgPos and v.alcoholArgValue

                if (not checkArg and not checkValue) or (checkArg and not checkValue) or (checkArg and checkValue and checkArg == checkValue) or (checkArg and type(checkValue) == 'table' and checkValue and checkValue[checkArg]) then
                    TriggerClientEvent('evidence:client:SetStatus', source, 'alcohol', 200, type(checkValue[checkArg]) == 'number' and checkValue[checkArg])
                end                
            end)            
        end
    end
end


RegisterNetEvent('evidence:server:SetDrugStatus', function(data, remove)
    local src = source ~= '' and source
    local Player = src and src ~= '' and Config.Functions.PlayerDataServer(src)
    local cid = data.cid or Player.citizenid 
    local time = data.hours or Config.DrugTesting.DefaultPositiveTime

    if data.hours and not time or type(time) ~= 'number' then print('evidence:server:SetDrugStatus was rejected due to recieving data.hours field that was not a number') return end
    if not data.hours and not time or type(time) ~= 'number' then print('evidence:server:SetDrugStatus was rejected due to DefaultPositiveTime not being a number') return end
    if not data.drug then print('evidence:server:SetDrugStatus was rejected due to being triggered without a specified drug, please check your code!') return end
    if not src and not cid then print('evidence:server:SetDrugStatus was rejected due to being triggered without source or data.cid defined, please check your code!') return end

    if remove and PlayerDrugs[cid] then
        if Config.Debug.ConfirmDrugPositive.enabled then print(('%s set negative for %s'):format(cid, data.drug)) end
        PlayerDrugs[cid][data.drug] = nil
    else
        if Config.Debug.ConfirmDrugPositive.enabled then print(('%s set positive for %s for %s hours'):format(cid, data.drug, time or Config.DrugTesting.DefaultPositiveTime)) end

        if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
        PlayerDrugs[cid][data.drug] = os.time() + (60 * 60 * time)   
    end   
end)

----------- evidence creation events --------------------------

RegisterNetEvent('evidence:server:CreateEvidence', function(data) -- security vulnerability patched 11/26/2022   
    for k, v in pairs(data) do
        v.src = source
        TriggerEvent(('evidence:server:Create%s'):format(v.event), v)
    end
end)

RegisterNetEvent('evidence:server:CreateCasing', function(data)
    if type(data) ~= 'table' then print('Received casing from outdated event trigger. Please check your resources for duplicated code containing the \'evidence:server:CreateCasing\' event.') return end

    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Casings * 60)    
    local serialNumber = nil

    if data.curserial and data.weapon == data.curwephash then
        serialNumber = data.curserial
    else
        local inventory = Config.Functions.GetInventoryServer(src)
        for k, v in pairs(inventory) do
            if v.hash and v.hash == data.weapon or joaat(v.name) == data.weapon then
                serialNumber = v[inventoryMetadata][itemSerial]
            end
        end
    end

    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'casing',
        weapon = data.weapon,
        serial = serialNumber or 'Unknown',
        coords = data.coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateBulletImpact', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Impact * 60)

    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'impact',
        ammotype = data.ammotype,
        coords = data.coords,
        norm = data.norm,
        time = time,
    }
    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)  

RegisterNetEvent('evidence:server:CreateVehicleFragment', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Fragment * 60)

    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'fragment',
        vehcolor = data.vehcolor,
        vehname = data.vehname,
        plate = data.plate,
        coords = data.coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateNetworkedBulletImpact', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local model = GetEntityModel(NetworkGetEntityFromNetworkId(data.netid))
    local time = os.time() + (Config.EvidenceFadeTime.NetImpact * 60)

    Evidence[evidenceId] = {
        evtype = 'netimpact',
        ammotype = data.ammotype,
        netid = data.netid,
        offset = data.offset,
        normoffset = data.normoffset,
        model = model,
        time = time,
        net = true,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)

    if not NetImpactEvidence[data.netid] then NetImpactEvidence[data.netid] = {} end

    NetImpactEvidence[data.netid][evidenceId] = true
    Models[data.netid] = model
end)  

RegisterNetEvent('evidence:server:CreateNetworkedPedBulletImpact', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local model = GetEntityModel(NetworkGetEntityFromNetworkId(data.netid))
    local time = os.time() + (Config.EvidenceFadeTime.NetPedImpact* 60)
    local cid = nil
    if data.isplayer then cid = GetPlayerIdentifiers(src).citizenid end

    Evidence[evidenceId] = {
        evtype = 'netpedimpact',
        ammotype = data.ammotype,
        netid = data.netid,
        boneindex = data.boneindex,
        model = model,
        time = time,
        cid = cid,
        net = true,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)

    if data.isplayer then
        if not PlayerPedImpacts[cid] then PlayerPedImpacts[cid] = {} end

        PlayerPedImpacts[cid][evidenceId] = true
        Evidence[evidenceId].cid = cid
    else
        if not NetPedImpacts[data.netid] then NetPedImpacts[data.netid] = {} end

        NetPedImpacts[data.netid][evidenceId] = model
        Models[data.netid] = model
    end
end)  

RegisterNetEvent('evidence:server:CreateBloodDrop', function()
    local src = source
    TriggerClientEvent('evidence:client:GetBloodInfo', src)
end)

RegisterNetEvent('evidence:server:CreateBlood', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Blood * 60)
    local PlayerData = GetPlayerIdentifiers(src)
    local citizenid = data.citizenid or PlayerData.citizenid
    local bloodtype = data.bloodtype or PlayerData.bloodtype

    Evidence[evidenceId] = {
        bucket = bucket, 
        evtype = 'blood',
        citizenid = citizenid,
        bloodtype = bloodtype,
        coords = data.coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateFingerDrop', function(coords)
    TriggerClientEvent('evidence:client:CreateFingerprint', source)
end)

RegisterNetEvent('evidence:server:CreateFingerprint', function(coords)
    local src = source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Fingerprint * 60)
    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'fingerprint',
        fingerprint = GetPlayerIdentifiers(src).fingerprint,
        coords = coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateLockTampering', function(coords)
    local src = source
    local evidenceId = CreateEvidenceId()
    local time = os.time()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Tampering * 60)
    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'tampering',
        time = time,
        coords = coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateCarCasing', function(data) -- FIX
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local serialNumber = nil
    local time = data.time or os.time() + (Config.EvidenceFadeTime.VehCasings * 60 * 60 * 24)

    if data.curserial and data.weapon == data.curwephash then
        serialNumber = data.curserial
    elseif data.noupdate and data.serial then
        serialNumber = data.serial
    else
        local inventory = Config.Functions.GetInventoryServer(src)
        for k, v in pairs(inventory) do
            if v.hash and v.hash == data.weapon or joaat(v.name) == data.weapon then
                serialNumber = v[inventoryMetadata][itemSerial]
            end
        end
    end
    
    Evidence[evidenceId] = {
        evtype = 'carcasing',
        weapon = data.weapon,
        serial = serialNumber or 'Unknown',
        plate = data.plate,
        time = time, 
    }

    if IsVehicleOwned(data.plate) then LoadCarEvidence(data.plate) elseif not CarEvidence[data.plate] then CarEvidence[data.plate] = {} end

    CarEvidence[data.plate][evidenceId] = {
        evtype = 'carcasing',
        type = data.weapon,
        serial = serialNumber,
        plate = data.plate,
        time = time,
    }

    if not data.noupdate then UpdateDB(data.plate) end
    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateCarFingerprint', function(plate, location, seat)
    if not seat then TriggerClientEvent('evidence:client:FetchCarFingerprintSeat', source, plate, location) return end -- fetch seat from client if missing, maintains compatability with original event handler

    local src = source
    local evidenceId = CreateEvidenceId()
    local fingerprint = GetPlayerIdentifiers(src).fingerprint
    local time = os.time() + (Config.EvidenceFadeTime.VehFingerprints * 60 * 60 * 24)
    
    if not location and seat ~= 'exterior' then location = ('Seat %s'):format(seat) end

    if CarFingerprints[plate]?[location]?[fingerprint] and os.time() < CarFingerprints[plate]?[location]?[fingerprint] then return end

    Evidence[evidenceId] = {
        evtype = 'carfingerprint',
        fingerprint = fingerprint,
        plate = plate,
        location = location,
        time = time,
        seat = seat,
    }

    if IsVehicleOwned(plate) then LoadCarEvidence(plate) elseif not CarEvidence[plate] then CarEvidence[plate] = {} end

    CarEvidence[plate][evidenceId] = {
        evtype = 'carfingerprint',
        fingerprint = fingerprint,
        plate = plate,
        location = location,
        time = time,
        seat = seat,
    }

    if not CarFingerprints[plate] then CarFingerprints[plate] = {} end
    if not CarFingerprints[plate][location] then CarFingerprints[plate][location] = {} end
    
    CarFingerprints[plate][location][fingerprint] = os.time() + (Config.EvidenceFadeTime.VehFingerprints * 60 * 10) -- block new fingerprints at this location from this fingerprint for 10 minutes

    UpdateDB(plate)
    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

RegisterNetEvent('evidence:server:CreateCarBlood', function(data)
    if not data.seat then print('Rejected car blood with no seat information! Following data recieved from client:', json.encode(data)) return end

    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local time = data.time or os.time() + (Config.EvidenceFadeTime.VehBlood * 60 * 60 * 24)
    local seat = data.seat
    local PlayerData = src and src ~= '' and GetPlayerIdentifiers(src)
    local citizenid = data.citizenid or PlayerData?.citizenid
    local bloodtype = data.bloodtype or PlayerData?.bloodtype

    Evidence[evidenceId] = {
        evtype = 'carblood',
        citizenid = citizenid,
        bloodtype = bloodtype,
        plate = data.plate,
        seat = seat, 
        time = time,
    }

    if IsVehicleOwned(data.plate) then LoadCarEvidence(data.plate) elseif not CarEvidence[data.plate] then CarEvidence[data.plate] = {} end

    CarEvidence[data.plate][evidenceId] = {
        evtype = 'carblood',
        citizenid = citizenid,
        bloodtype = bloodtype,
        plate = data.plate,
        seat = seat,
        time = time,        
    }

    if not data.noupdate then UpdateDB(data.plate) end 
    AddEvidence(evidenceId, Evidence[evidenceId].evtype)
end)

------- events that link into qb-garages --------------

RegisterNetEvent(Config.VehInAndOut.InEvent, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) -- this saves the evidence table to the database when a car is put into a garage
    local src = source
    local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
    
    local state = Config.VehInAndOut.InStateVarSubfield and type(args[Config.VehInAndOut.InStateVar]) == 'table' and GetSubfield(args[Config.VehInAndOut.InStateVar], Config.VehInAndOut.InPlateVarSubfield) and args[Config.VehInAndOut.InStateVar]
    local plate = Config.VehInAndOut.InPlateVarSubfield and type(args[Config.VehInAndOut.InPlateVar]) == 'table' and GetSubfield(args[Config.VehInAndOut.InPlateVar], Config.VehInAndOut.InPlateVarSubfield) and args[Config.VehInAndOut.InPlateVar]

    -- verify state

    if type(state) == 'table' then print('Expecting number or string for vehicle state, received table when attempting to load vehicle from garage. Please check your event for an arguemnt mismatch.') return end

    -- verify plate

    if type(plate) == 'table' then print('Expecting string for vehicle plate, received table when attempting to put vehicle in garage. Please check your event for an arguemnt mismatch.') return end
    if type(plate) == 'string' and #plate > 8 then print('Expecting string for vehicle plate, receieved unknown string '.. plate ..' instead. Please check your event for an agument mismatch.') return end

    if state == Config.VehInAndOut.InState then
        local evtable = {}

        if not LoadedCars[plate] then LoadCarEvidence(plate) end

        if CarEvidence[plate] and next(CarEvidence[plate]) then
            for k, v in pairs(CarEvidence[plate]) do
                evtable[#evtable+1] = Evidence[k]
                RemoveEvidence(k, 'putting vehicle away')
            end

            if Config.Debug.Database.enabled then print(('Vehicle %s put into garage with following evidence: %s'):format(plate, json.encode(evtable))) end

            CarEvidence[plate] = nil
        else
            if Config.Debug.Database.enabled then print(('No evidence in table, vehicle %s put into garage with blank evidence table: %s'):format(plate, json.encode(evtable))) end
        end

        MySQL.Async.execute('UPDATE '.. Config.DB.Vehicle ..' SET '.. Config.DB.Evidence ..' = ? WHERE '.. Config.DB.Plate ..' = ?', {json.encode(evtable), plate})

        if LoadedCars[plate] then LoadedCars[plate] = nil end
    end
end)

RegisterNetEvent(Config.VehInAndOut.OutEvent, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) -- this loads the evidence table to the database when a car is taken out of a garage
    local src = source
    local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
    
    local state = args[Config.VehInAndOut.OutStateVar]
    local plate = args[Config.VehInAndOut.OutPlateVar]

    -- verify state

    if type(state) == 'table' then print('Expecting number or string for vehicle state, received table when attempting to load vehicle from garage. Please check your event for an arguemnt mismatch.') return end

    -- verify plate

    if type(plate) == 'table' then print('Expecting string for vehicle plate, received table when attempting to load vehicle from garage. Please check your event for an arguemnt mismatch.') return end
    if type(plate) == 'string' and #plate > 8 then print('Expecting string for vehicle plate, receieved unknown string '.. plate ..' instead. Please check your event for an agument mismatch.') return end

    if state == Config.VehInAndOut.OutState then
        LoadCarEvidence(plate)
    end
end)

------------- evidence gathering events ---------------

RegisterNetEvent('evidence:server:AddEvidenceToInventory', function(evidenceId, info)
    local src = source

    info.date = os.date("%m/%d/%y @ %I:%M")

    if Config.Inventory.Ox or Config.Inventory.QS then info = OxMetadata(info) end

    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        if Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, info) then
            RemoveEvidence(evidenceId, 'adding evidence to inventory')
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddGSRToInventory', function(gsrInfo)
    local src = source

    gsrInfo.date = os.date("%m/%d/%y @ %I:%M")
    gsrInfo.tracking = CreateEvidenceId()

    if Config.Inventory.Ox or Config.Inventory.QS then gsrInfo = OxMetadata(gsrInfo) end

    if Config.Consume.GSR then 
        Config.Functions.RemoveItem(source, 'gsrtestkit', 1)
    end

    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        if not Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, gsrInfo) then
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddBACToInventory', function(BACInfo)
    local src = source

    BACInfo.date = os.date("%m/%d/%y @ %I:%M")
    BACInfo.tracking = CreateEvidenceId()

    if Config.Inventory.Ox or Config.Inventory.QS then BACInfo = OxMetadata(BACInfo) end

    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        if not Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, BACInfo) then
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddDrugTestToInventory', function(drugInfo)
    local src = source
    local otherPlayerDNA = DnaHash(GetPlayerIdentifiers(drugInfo.player).citizenid)
    
    drugInfo.date = os.date("%m/%d/%y @ %I:%M")
    drugInfo.dnalabel = otherPlayerDNA
    drugInfo.tracking = CreateEvidenceId()
    
    if Config.Inventory.Ox or Config.Inventory.QS then     
        drugInfo.result = nil

        drugInfo = OxMetadata(drugInfo)
    else
        drugInfo.result = ('<p><strong>DNA: </strong><span> %s </span></p>%s'):format(otherPlayerDNA, drugInfo.description)

        drugInfo.description = nil
    end
    
    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        if not Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, drugInfo) then
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddDNAToInventory', function(playerId, street)
    local src = source

    local otherPlayer = GetPlayerIdentifiers(playerId)

    if Config.Consume.DNA then
        Config.Functions.RemoveItem(source, 'dnatestkit', 1)
    end

    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        local info = {
            label = "DNA Sample",
            type = "dna",
            dnalabel = DnaHash(otherPlayer.citizenid),
            date = os.date("%m/%d/%y @ %I:%M"),
            street = street,
            tracking = CreateEvidenceId(),
        }

        if Config.Inventory.Ox or Config.Inventory.QS then info = OxMetadata(info) end


        if not Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, info) then
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddCarEvToInventory', function(evidenceId, evinfo, plate)
    local src = source

    evinfo.date = os.date("%m/%d/%y @ %I:%M")

    if Config.Inventory.Ox or Config.Inventory.QS then evinfo = OxMetadata(evinfo) end

    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        if Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, evinfo) then
            RemoveEvidence(evidenceId, 'adding car evidence to inventory')

            UpdateDB(plate)
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
            TriggerClientEvent('evidence:client:unsetcarev', {evidenceId = evidenceId, plate = plate})
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
        TriggerClientEvent('evidence:client:unsetcarev', {evidenceId = evidenceId, plate = plate})
    end
end)

------------------------ misc events ----------------------------------

RegisterNetEvent('evidence:server:UpdateBag', function(slot, info, note, edited)
    local src = source
    local items = Config.Functions.GetInventoryServer(src)

    print(slot, json.encode(info), note, edited)

    if edited then
        info.notes[note].edited.timestamp = os.date("%m/%d/%y @ %I:%M")
    else
        info.notes[note].created.timestamp = os.date("%m/%d/%y @ %I:%M")
    end

    Config.Functions.UpdateMetadata(src, slot, info) 
end)

RegisterNetEvent('evidence:server:ChangePlayerNetID', function(netid)
    local src = source
    local cid = GetPlayerIdentifiers(src).citizenid 
    local evtable = {}

    if PlayerPedImpacts[cid] and next(PlayerPedImpacts[cid]) then
        for k, v in pairs(PlayerPedImpacts[cid]) do
            Evidence[k].netid = netid
            evtable[k] = v
            evtable[k].netid = netid
        end
        
        TriggerClientEvent('evidence:client:UpdatePlayerID', -1, evtable)
    end
end)

---------------------------- qb-target events --------------------------------

RegisterNetEvent('evidence:server:frisk', function(playerId)
    local src = source
    local items = Config.Functions.GetInventoryServer(playerId)
    local foundweapon, foundcontraband = false
    if Config.Inventory.Ox then weaponList = exports.ox_inventory:Items() end


    for k, v in pairs(items) do
        if v.type == 'weapon' or (v.name == 'filled_evidence_bag' and v[inventoryMetadata].item and v[inventoryMetadata].item.type == 'weapon') or (weaponList and weaponList[v.name] and weaponList[v.name].weapon) then
            foundweapon = true
        elseif Config.FriskContrabandItems[v.name] then
            foundcontraband = true
        end
    end

    if Config.Debug.PrintTest.enabled then
        local itemlist = {}
        for k, v in pairs(items) do
            table.insert(itemlist, v.label)            
        end
        print(('Frisk result for %s returns %s, items in pocket: %s'):format(playerId, found, json.encode(itemlist))) 
    end 


    if foundweapon then
        Config.Functions.ServerNotify(src, 'You detect something that may be a weapon')
    end

    if foundcontraband then
        Config.Functions.ServerNotify(src, 'You detect something that may be contraband.')
    end

    if not foundweapon and not foundcontraband then     
        Config.Functions.ServerNotify(src, 'You do not detect anything suspicious.')
    end
end)

---- evidence clearing events -------------------

RegisterNetEvent('evidence:server:ClearEvidence', function(pos)
    for k, v in pairs(Evidence) do
        if v.coords and #(vector3(v.coords.x, v.coords.y, v.coords.z) - pos) < 20 then          
            RemoveEvidence(k, 'using clear evidence command')
        elseif v.net then
            local evcoords = GetEntityCoords(NetworkGetEntityFromNetworkId(v.netid))
            if #(evcoords - pos) < 20 then               
                RemoveEvidence(k, 'using clear evidence command for networked entity')
            end
        end
    end
end)

RegisterNetEvent('evidence:server:wipearea', function(data)
    local PlayerItems = Config.Functions.GetInventoryServer(source)
    local cleanerVerified = nil

    for k, v in pairs(PlayerItems) do
        if v.name == data.clean then
            cleanerVerified = true
        end
    end

    if data.seat and CarEvidence[data.plate] then

        for k, v in pairs(CarEvidence[data.plate]) do
            if v.evtype == 'carfingerprint' or (cleanerVerified and v.evtype == 'carblood') then
                if v.seat == data.seat then
                    local chance = math.random(1, 100)
                    local against = v.evtype == 'carfingerprint' and 70 or v.evtype == 'carblood' and 50

                    if chance < against then 
                        RemoveEvidence(k, 'using evidence:server:wipearea')
                    end
                end
            end           
        end
    else
        local pos = GetEntityCoords(GetPlayerPed(source))

        for k, v in pairs(Evidence) do
            if v.evtype == 'fingerprint' or (cleanerVerified and v.evtype == 'blood') then

                if v.coords and (#(vector3(v.coords.x, v.coords.y, v.coords.z) - pos) < 1.0 or #(vector3(v.coords.x, v.coords.y, v.coords.z - 1.0) - pos) < 1.0) then
                    local chance = math.random(1, 100)
                    local against = v.evtype == 'fingerprint' and 70 or v.evtype == 'blood' and 50

                    if chance < against then                   
                        RemoveEvidence(k, 'using evidence:server:wipearea')
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('evidence:server:RemoveCarEvidence', function(plate)
    if CarEvidence[plate] and next(CarEvidence[plate]) then
        for k, v in pairs(CarEvidence[plate]) do           
            RemoveEvidence(k, 'removing car evidence')    
        end
        CarEvidence[plate] = nil
    end

    if Config.Debug.Database.enabled then print('Vehicle cleaned, blank table uploaded to plate:', plate) end 

    MySQL.Async.execute('UPDATE '.. Config.DB.Vehicle ..' SET '.. Config.DB.Evidence ..' = ? WHERE '.. Config.DB.Plate ..' = ?', {json.encode({}), plate})
    TriggerClientEvent("evidence:client:RemoveCarEvidence", -1, plate)
end)

RegisterNetEvent('evidence:server:RemoveNetPedImpacts', function()
    local src = source
    local cid = GetPlayerIdentifiers(src).citizenid 

    if PlayerPedImpacts[cid] and next(PlayerPedImpacts[cid]) then
        for k, v in pairs(PlayerPedImpacts[cid]) do
            RemoveEvidence(k, 'removing network ped impacts')
        end

        PlayerPedImpacts[cid] = nil
    end
end)  

RegisterNetEvent('evidence:server:RemoveNetImpacts', function(netid)
    local src = source

    if NetImpactEvidence[netid] and next(NetImpactEvidence[netid]) then
        for k, v in pairs(NetImpactEvidence[netid]) do
            RemoveEvidence(k, 'removing network entity impacts')
        end

        NetImpactEvidence[netid] = nil
    end
end)  

RegisterNetEvent('evidence:server:fingerprint', function(data)
    local src = source

    local info = {
        label = 'Fingerprint Reader Printout',
        tracking = CreateEvidenceId(),
        type = 'fingerprint',
        street = data.street,
        fingerprint = GetPlayerIdentifiers(data.player).fingerprint,
        date = os.date("%m/%d/%y @ %I:%M"),
    }

    if Config.Inventory.Ox or Config.Inventory.QS then info = OxMetadata(info) end

    if Config.Functions.RemoveItem(source, "empty_evidence_bag", 1) then
        if not Config.Functions.AddItem(source, "filled_evidence_bag", 1, false, info) then
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

--------- commands -------------

Config.Functions.CreateCommand("clearevidence", "Clear Area of Evidence (Police Only)", {}, false, function(source)
    local src = source

    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:ClearEvidenceInArea', src)
    else
        Config.Functions.ServerNotify(src, Config.Notification.IncorrectJob, 'error')
    end
end)

Config.Functions.CreateCommand("searchvehicle", "Search a vehicle for evidence (Police Only)", {}, false, function(source)
    local src = source

    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:checkcarevidence', source)
    else
        Config.Functions.ServerNotify(src, Config.Notification.IncorrectJob, 'error')
    end
end)

if Config.Debug.DebugCommand then
    Config.Functions.CreateCommand("r14debug", "Set debug variables in runtime (Admin Only)", {}, false, function(source)
        local src = source

        TriggerClientEvent('evidence:client:debugmenu', src)
    end)
end

RegisterNetEvent('evidence:server:SetServerDebugVariable', function(data)
    Config.Debug[data.var].enabled = not data.bool
    
    TriggerClientEvent('evidence:client:setdebugvariable', -1, data)
end)

Config.Functions.CreateCommand("bagevidence", "Bag evidence from inventory", {}, false, function(source)   
    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:bagevidence', source, Config.Functions.GetInventoryServer(source))
    else
        Config.Functions.ServerNotify(source, Config.Notification.IncorrectJob, 'error')
    end
end)

Config.Functions.CreateCommand("bagev", "Bag evidence from inventory", {}, false, function(source)
    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:bagevidence', source, Config.Functions.GetInventoryServer(source))
    else
        Config.Functions.ServerNotify(source, Config.Notification.IncorrectJob, 'error')
    end
end)

Config.Functions.CreateCommand("wipeclean", "Wipe down the weapon you are holding or the area you are in", {}, false, function(source)
    TriggerClientEvent('evidence:client:cleanweapon', source, Config.Functions.GetInventoryServer(source))  
end)

Config.Functions.CreateCommand("19622", "Don't you dare do it.", {}, false, function(source, args)
    local target = args[1]

	local message = args
	table.remove(message, 1)
	local message = table.concat(args, ' ')
    local message = '        ' .. message .. '        '
    local targetveh = GetVehiclePedIsIn(GetPlayerPed(target))
    local original = GetVehicleNumberPlateText(targetveh)

    for i = 1, #message, 1 do
        local plate = string.sub(message, i, i + 8)
        SetVehicleNumberPlateText(targetveh, plate)
        Wait(100)
    end

    SetVehicleNumberPlateText(targetveh, original)
end, "admin")

-- callbacks ----

Config.Functions.RegisterCallback('evidence:GetDate', function(source, cb)
    local date = os.date("%m/%d/%y @ %I:%M")
    cb(date)
end)

Config.Functions.RegisterCallback('evidence:GetTime', function(source, cb)
    local time = os.time()
    cb(time)
end)


Config.Functions.RegisterCallback('evidence:GetCamDate', function(source, cb)
    local date = os.date("%m / %d / %y   %I : %M : %S")
    cb(date)
end)

Config.Functions.RegisterCallback('police:GetPlayerStatus', function(source, cb, playerId)
    local cid = GetPlayerIdentifiers(playerId).citizenid
    local statList = {}
    if cid then
        if PlayerStatus[cid] and next(PlayerStatus[cid]) then
            for k, v in pairs(PlayerStatus[cid]) do
                statList[k] = v.text
            end
        end
    end

    if Config.Debug.PrintTest.enabled then print(('Investigate Result for %s returns %s'):format(cid, json.encode(statList))) end 

    cb(statList)
end)

Config.Functions.RegisterCallback('police:GetPlayerGSR', function(source, cb, playerId, citizenId)
    local cid = citizenId or GetPlayerIdentifiers(playerId).citizenid
    local gsrpos = false

    if cid then
        if PlayerGSR[cid] and PlayerGSR[cid] > os.time() then
            gsrpos = true
        end
    end

    if Config.Debug.PrintTest.enabled then print(('GSR Test Result for %s returns %s'):format(cid, gsrpos)) end 

    cb(gsrpos)
end)

Config.Functions.RegisterCallback('police:GetExteriorTampering', function(source, cb, plate)
    local tamper = false

    if plate then
        if VehicleExtTampers[plate] and VehicleExtTampers[plate].status then
            tamper = true
        end
    end

    if Config.Debug.PrintTest.enabled then print(('Vehicle exterior tampering inspection for %s returns %s'):format(plate, tamper)) end 

    cb(tamper)
end)

Config.Functions.RegisterCallback('police:GetIgnitionTampering', function(source, cb, plate)
    local tamper = false

    if plate then
        if VehicleInteriorTampers[plate] and VehicleInteriorTampers[plate].status then
            tamper = true
        end
    end

    if Config.Debug.PrintTest.enabled then print(('Vehicle ignition tampering inspection for %s returns %s'):format(plate, tamper)) end 

    cb(tamper)
end)

if Config.Breathalyzer then
    Config.Functions.RegisterCallback('police:GetPlayerBAC', function(source, cb, playerId)
        local cid = GetPlayerIdentifiers(playerId).citizenid
        local BAC = "0.0"

        if cid then
            if PlayerBAC[cid] then
                if PlayerBAC[cid] > 1000 then BAC = 1000 else BAC = PlayerBAC[cid] / 1000 end
                BAC = string.format("%.2f", BAC)
            end
        end

        if Config.Debug.PrintTest.enabled then print(('BAC Test Result for %s returns %s'):format(cid, BAC)) end 

        cb(BAC)
    end)
end

if Config.DrugTesting.Enabled then
    Config.Functions.RegisterCallback('police:GetDrugTestResults', function(source, cb, playerId)
        local src = source
        local cid = GetPlayerIdentifiers(playerId).citizenid
        local TestResults = {}

        if not Config.Functions.RemoveItem(source, 'drugtestkit', 1) then
            Config.Functions.ServerNotify(src, "You do not have a drug test kit!", "error") return
        end

        if cid then
            if PlayerDrugs[cid] then
                for k, v in pairs(Config.DrugTesting.Drugs) do
                    if PlayerDrugs[cid][k] and PlayerDrugs[cid][k] - os.time() > 0 then
                        TestResults[k] = 'POSITIVE'
                    else
                        TestResults[k] = 'Negative'
                    end
                end
            else
                for k, v in pairs(Config.DrugTesting.Drugs) do
                    TestResults[k] = 'Negative'
                end
            end
        end

        if Config.Debug.PrintTest.enabled then print(('Drug Test Result for %s returns %s'):format(cid, json.encode(TestResults))) end 

        cb(TestResults)
    end)
end

--- create usable items ---

local function GetClosestPlayer(source)
    local srcPed = GetPlayerPed(source)
    local found = nil
    local dist = nil

    for k, v in pairs(ActivePlayers) do
        if tostring(k) ~= tostring(source) then
            local playerPed = GetPlayerPed(k)
            local checkdist = #(GetEntityCoords(srcPed) - GetEntityCoords(playerPed))

            if checkdist < 3 and (not dist or checkdist < dist) then
                found = k
                dist = checkdist
                netid =  NetworkGetNetworkIdFromEntity(playerPed)
            end
        end
    end

    return found, netid, dist
end

Config.Functions.CreateUseableItem("accesstool", function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    TriggerClientEvent('evidence:client:accesstool', src)
end)

Config.Functions.CreateUseableItem('gsrtestkit', function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    local target, netid, dist = GetClosestPlayer(src)

    if not target then Config.Functions.ServerNotify(src, 'No one nearby!', 'error') return end

    TriggerClientEvent('evidence:client:GSRtest', src, {target = target, netid = netid})
end)

Config.Functions.CreateUseableItem('dnatestkit', function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    local target, netid, dist = GetClosestPlayer(src)

    if not target then Config.Functions.ServerNotify(src, 'No one nearby!', 'error') return end

    TriggerClientEvent('evidence:client:DNAswab', src, {target = target, netid = netid})
end)

Config.Functions.CreateUseableItem('drugtestkit', function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    local target, netid, dist = GetClosestPlayer(src)

    if not target then Config.Functions.ServerNotify(src, 'No one nearby!', 'error') return end

    TriggerClientEvent('evidence:client:drugtest', src, {target = target, netid = netid})
end)

Config.Functions.CreateUseableItem('breathalyzer', function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    local target, netid, dist = GetClosestPlayer(src)

    if not target then Config.Functions.ServerNotify(src, 'No one nearby!', 'error') return end

    TriggerClientEvent('evidence:client:breathalyze', src, {target = target, netid = netid})
end)

Config.Functions.CreateUseableItem('fingerprintreader', function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    local target, netid, dist = GetClosestPlayer(src)

    if not target then Config.Functions.ServerNotify(src, 'No one nearby!', 'error') return end

    TriggerClientEvent('evidence:client:fingerprint', src, {target = target, netid = netid})
end)

for k, v in pairs(Config.EvidenceCleanup.RemoveFingerprints) do -- create microfiber cloth and other rag items specified in config
    Config.Functions.CreateUseableItem(k, function(source, item, inv, slot, data)
        local src = source

        if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

        TriggerClientEvent('evidence:client:cleanweapon', src, Config.Functions.GetInventoryServer(src))  
    end)
end

Config.Functions.CreateUseableItem("filled_evidence_bag", function(source, item, inv, slot, data)
    local src = source

    if Config.Inventory.Ox then item = inv.items[slot] src = inv.id if type(source) == 'string' and source ~= 'usingItem' then return end end  

    if not item then return end

    local data = {
        item = item, 
        info = {}
    }

    if not item[inventoryMetadata].type then item[inventoryMetadata].type = item[inventoryMetadata].evtype end

    if item[inventoryMetadata] then 
        if item[inventoryMetadata].type == 'casing' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item[inventoryMetadata].tracking},
                [2] = {label = 'Serial Number', copy = string.upper(item[inventoryMetadata].serie or item[inventoryMetadata].serial)},
                [3] = {label = 'Caliber', copy = item[inventoryMetadata].ammolabel},
            }
        elseif item[inventoryMetadata].type == 'fingerprint' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item[inventoryMetadata].tracking},
                [2] = {label = 'Fingerprint ID', copy = item[inventoryMetadata].fingerprint},
            }
        elseif item[inventoryMetadata].type == 'blood' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item[inventoryMetadata].tracking},
                [2] = {label = 'DNA ID', copy = item[inventoryMetadata].dnalabel},
                [3] = {label = 'Blood Type', copy = item[inventoryMetadata].bloodtype},
            }
        elseif item[inventoryMetadata].type == 'dna' then
            data.info = {
                [1] = {label = 'DNA', copy = item[inventoryMetadata].dnalabel},
            }
        elseif item[inventoryMetadata].type == 'fragment' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item[inventoryMetadata].tracking},
                [2] = {label = 'Make and Model', copy = item[inventoryMetadata].vehname},
                [3] = {label = 'Color', copy = item[inventoryMetadata].vehcolor},
                [4] = {label = 'VIN Match', copy = item[inventoryMetadata].plate},
            }
        elseif item[inventoryMetadata].type == 'drugtest' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item[inventoryMetadata].tracking},
                [2] = {label = 'DNA', copy = item[inventoryMetadata].dnalabel},
            }

            for k, v in pairs(item[inventoryMetadata].drugs) do
                data.info[#data.info + 1] = {label = Config.DrugTesting.Drugs[k].label, copy = ('%s: %s'):format(Config.DrugTesting.Drugs[k].label, v)}
            end
        elseif item[inventoryMetadata].type == 'item' then
            previtem = table.clone(item[inventoryMetadata].item)
            data.info = {
                [1] = {label = 'Tracking ID', copy = item[inventoryMetadata].tracking},
                [2] = {label = 'Item Type', copy = item[inventoryMetadata].item.label},
            }

            if previtem[inventoryMetadata].serie then data.info[#data.info + 1] = {label = 'Serial Number', copy = string.upper(previtem[inventoryMetadata].serie)} end

            if previtem[inventoryMetadata][itemQuality] then 
                local qual = math.ceil(previtem[inventoryMetadata][itemQuality])

                if math.ceil(previtem[inventoryMetadata][itemQuality]) - previtem[inventoryMetadata][itemQuality] < 0.5 then qual = tostring(math.floor(previtem[inventoryMetadata][itemQuality])) end

                data.info[#data.info + 1] = {label = 'Weapon Durability', copy = qual..'%'} 
            end

            if previtem[inventoryMetadata].ammo then 
                data.info[#data.info + 1] = {label = 'Loaded Ammunition', copy = previtem[inventoryMetadata].ammo} 
            end

            data.info[#data.info + 1] = {retrieve = true, label = item[inventoryMetadata].item.label}
        end

        TriggerClientEvent('evidence:client:BagMenu', src, data)

        data = nil
    else       
        Config.Functions.ServerNotify(src, "Something went terribly wrong!", "error")
    end
end)

---- server threads --------

CreateThread(function()
    while true do
        SendEvidence()

        SendRemove()

        Wait(1000)
    end
end)

CreateThread(function() -- this thread checks for expired evidence drops and removes them
    while true do
        Wait(60000)
        for k, v in pairs(Evidence) do
            if not CarEvidence[k] and v.time then
                if v.time - os.time() <= 0 then
                    RemoveEvidence(k, ('fading %s %s'):format(v.evtype, k))  
                    if Config.Debug.PrintFade.enabled then print(('Evidence %s has been removed from table, type was: %s'):format(k, v.evtype)) end
                end
            end
        end 
    end
end)

CreateThread(function() -- this thread decreases player BAC's over time if enabled
    while Config.Breathalyzer do
        Wait(300000)        
        if next(PlayerBAC) then    
            for k, v in pairs(PlayerBAC) do
                PlayerBAC[k] = v - 10
                if PlayerBAC[k] <= 0 then PlayerBAC[k] = nil end
            end
        end    
        if Config.Debug.PrintBAC.enabled then print(('Player BAC loop updated: %s'):format(json.encode(PlayerBAC))) end 
    end
end)

CreateThread(function() -- this thread decreases removes vehicle tampers
    while true do
        Wait(60000)        
        if next(VehicleExtTampers) then    
            for k, v in pairs(VehicleExtTampers) do
                VehicleExtTampers[k].time = v.time - 10
                if VehicleExtTampers[k].time <= 0 then VehicleExtTampers[k] = nil end
            end
        end    
        if Config.Debug.PrintTamperLoop.enabled then print(('Vehicle exterior tampering loop updated: %s'):format(json.encode(VehicleExtTampers))) end 
        if next(VehicleInteriorTampers) then    
            for k, v in pairs(VehicleInteriorTampers) do
                VehicleInteriorTampers[k].time = v.time - 10
                if VehicleInteriorTampers[k].time <= 0 then VehicleInteriorTampers[k] = nil end
            end
        end    
        if Config.Debug.PrintTamperLoop.enabled then print(('Vehicle interior tampering loop updated: %s'):format(json.encode(VehicleInteriorTampers))) end 
    end
end)

CreateThread(function() -- this thread keeps track of netids for 
    while true do
        Wait(2000)
        if NetImpactEvidence and next(NetImpactEvidence) then
            for k, v in pairs(NetImpactEvidence) do
                 if not DoesEntityExist(NetworkGetEntityFromNetworkId(k)) or GetEntityModel(NetworkGetEntityFromNetworkId(k)) ~= Models[k] then
                    for i, e in pairs(v) do
                        RemoveEvidence(i, 'removing net impact from reused net id')
                    end
                    Models[k] = nil
                    NetImpactEvidence[k] = nil
                    if Config.Debug.PrintFade.enabled then print(('Evidence for netid %s has been removed from table, table as follows: %s'):format(k, v)) end
                end
            end
        end
        if NetPedImpacts and next(NetPedImpacts) then
            for k, v in pairs(NetPedImpacts) do
                if not DoesEntityExist(NetworkGetEntityFromNetworkId(k)) or GetEntityModel(NetworkGetEntityFromNetworkId(k)) ~= Models[k] then
                    for i, e in pairs(v) do
                        RemoveEvidence(i, 'removing net ped impact from reused net ped id')
                    end
                    NetPedImpacts[k] = nil
                    Models[k] = nil
                    if Config.Debug.PrintFade.enabled then print(('Evidence for networked ped with netid %s has been removed from table, table as follows: %s'):format(k, v)) end
                end
            end
        end
    end
end)

local function CheckSync(checksrc) -- this function checks for the current sync
    checksrc = tonumber(checksrc)

    if Config.AuthorizedJobs.LEO.Check(checksrc) or Config.AuthorizedJobs.LEO.Check(checksrc) or Config.AuthorizedJobs.LEO.Check(checksrc) then return true else return nil end
end

CreateThread(function()
    while true do
        local serverplayers = GetPlayers()
        local srclist = {}

        for k, v in pairs(serverplayers) do
            srclist[v] = true   
        end

        for k, v in pairs(srclist) do
            local cursrc = k
            local bucket = GetPlayerRoutingBucket(tostring(cursrc))

            if not ActivePlayers[cursrc] then ActivePlayers[cursrc] = {bucket = bucket, sync = CheckSync(cursrc)} else ActivePlayers[cursrc].sync = ActivePlayers[cursrc].sync or CheckSync(cursrc) end

            if ActivePlayers[cursrc] and ActivePlayers[cursrc].bucket and bucket ~= ActivePlayers[cursrc].bucket then
                TriggerClientEvent('evidence:client:SetBucket', cursrc, bucket)
            end

            ActivePlayers[cursrc].bucket = bucket

            Wait(50) -- slow down for loop for less resource usage
        end 

        for k, v in pairs(ActivePlayers) do
            if not srclist[k] then
                ActivePlayers[k] = nil
            end
        end

        Wait(3500)
    end
end)

RegisterNetEvent('evidence:client:togglesync', function(bool) -- used to toggle syncing of evidence from server
    if not ActivePlayers[src] then 
        ActivePlayers[src] = {bucket = GetPlayerRoutingBucket(tostring(src)), sync = bool} 
    else
        ActivePlayers[src].sync = bool
    end
end)