tablet_prop = nil

RegisterNetEvent('cd_dispatch:ToggleNUIFocus')
AddEventHandler('cd_dispatch:ToggleNUIFocus', function()
    NUI_status = true
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
    end
    SetNuiFocus(false, false)
end)

RegisterNetEvent('cd_dispatch:ToggleNUIFocus_2')
AddEventHandler('cd_dispatch:ToggleNUIFocus_2', function()
    NUI_status = true
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
        SetNuiFocusKeepInput(NUI_status)
        DisableControlAction(0, 1,   true)
        DisableControlAction(0, 2,   true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 21,  true)
        DisableControlAction(0, 24,  true)
        DisableControlAction(0, 25,  true)
        DisableControlAction(0, 47,  true)
        DisableControlAction(0, 58,  true)
        DisableControlAction(0, 263, true)
        DisableControlAction(0, 264, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 140, true)
        DisableControlAction(0, 141, true)
        DisableControlAction(0, 143, true)
        DisableControlAction(0, 75,  true)
        DisableControlAction(27, 75, true)
        SetPlayerCanDoDriveBy(PlayerId(), false)
    end
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    local count, keys = 0, {177, 200, 202, 322}
    while count < 100 do 
        Wait(0)
        count=count+1
        for c, d in pairs(keys) do
            DisableControlAction(0, d, true)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        StopAnimTask(PlayerPedId(), 'amb@world_human_seat_wall_tablet@female@base', 'base' ,8.0, -8.0, -1, 50, 0, false, false, false)
        NetworkRequestControlOfEntity(tablet_prop)
        SetEntityAsMissionEntity(tablet_prop)
        DeleteEntity(tablet_prop)
    end
end)

function PlayAnimation(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function GetClosestVehicle(distance)
    local coords = GetEntityCoords(PlayerPedId())
    local vehicle = GetGamePool('CVehicle')
    local result = nil
    local smallest_distance = 1000
    for cd = 1, #vehicle do
        local vehicle_coords = GetEntityCoords(vehicle[cd])
        local dist = #(coords-vehicle_coords)
        if dist < distance and dist < smallest_distance then
            smallest_distance = dist
            result = vehicle[cd]
        end
    end
    return result
end

function GetPlate(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    if GetResourceState('cd_garage') == 'started' then
        local cd_garage_config = exports['cd_garage']:GetConfig()
        if cd_garage_config.PlateFormats == 'trimmed' then
            return Trim(plate)
        elseif cd_garage_config.PlateFormats == 'with_spaces' then
            return plate
        elseif cd_garage_config.PlateFormats == 'mixed' then
            return string.gsub(plate, "^%s*(.-)%s*$", "%1")
        end
    end
    return string.gsub(plate, "^%s*(.-)%s*$", "%1")
end

function GetAllPlateFormats(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    local data = {
        trimmed = Trim(plate),
        with_spaces = plate,
        mixed = string.gsub(plate, "^%s*(.-)%s*$", "%1")
    }
    return data
end

function GetClosestPlayers(distance)
    local temp_table = {}
    local ped_coords = GetEntityCoords(PlayerPedId())
    for c, d in pairs(GetActivePlayers()) do
        if #(ped_coords-GetEntityCoords(GetPlayerPed(d))) < distance then
            temp_table[#temp_table+1] = GetPlayerServerId(d)
        end
    end
    return temp_table
end

local function GetPedSex(ped)
    local sex
    if IsPedModel(ped, 'mp_f_freemode_01') then
        sex = L('female')
    elseif IsPedModel(ped, 'mp_m_freemode_01') then
        sex = L('male')
    else
        sex = L('person')
    end
    return sex
end

local zone_names = {    AIRP = "Los Santos International Airport",    ALAMO = "Alamo Sea",    ALTA = "Alta",    ARMYB = "Fort Zancudo",    BANHAMC = "Banham Canyon Dr",    BANNING = "Banning",    BAYTRE = "Baytree Canyon",    BEACH = "Vespucci Beach",    BHAMCA = "Banham Canyon",    BRADP = "Braddock Pass",    BRADT = "Braddock Tunnel",    BURTON = "Burton",    CALAFB = "Calafia Bridge",    CANNY = "Raton Canyon",    CCREAK = "Cassidy Creek",    CHAMH = "Chamberlain Hills",    CHIL = "Vinewood Hills",    CHU = "Chumash",    CMSW = "Chiliad Mountain State Wilderness",    CYPRE = "Cypress Flats",    DAVIS = "Davis",    DELBE = "Del Perro Beach",    DELPE = "Del Perro",    DELSOL = "La Puerta",    DESRT = "Grand Senora Desert",    DOWNT = "Downtown",    DTVINE = "Downtown Vinewood",    EAST_V = "East Vinewood",    EBURO = "El Burro Heights",    ELGORL = "El Gordo Lighthouse",    ELYSIAN = "Elysian Island",    GALFISH = "Galilee",    GALLI = "Galileo Park",    golf = "GWC and Golfing Society",    GRAPES = "Grapeseed",    GREATC = "Great Chaparral",    HARMO = "Harmony",    HAWICK = "Hawick",    HORS = "Vinewood Racetrack",    HUMLAB = "Humane Labs and Research",    JAIL = "Bolingbroke Penitentiary",    KOREAT = "Little Seoul",    LACT = "Land Act Reservoir",    LAGO = "Lago Zancudo",    LDAM = "Land Act Dam",    LEGSQU = "Legion Square",    LMESA = "La Mesa",    LOSPUER = "La Puerta",    MIRR = "Mirror Park",    MORN = "Morningwood",    MOVIE = "Richards Majestic",    MTCHIL = "Mount Chiliad",    MTGORDO = "Mount Gordo",    MTJOSE = "Mount Josiah",    MURRI = "Murrieta Heights",    NCHU = "North Chumash",    NOOSE = "N.O.O.S.E",    OCEANA = "Pacific Ocean",    PALCOV = "Paleto Cove",    PALETO = "Paleto Bay",    PALFOR = "Paleto Forest",    PALHIGH = "Palomino Highlands",    PALMPOW = "Palmer-Taylor Power Station",    PBLUFF = "Pacific Bluffs",    PBOX = "Pillbox Hill",    PROCOB = "Procopio Beach",    RANCHO = "Rancho",    RGLEN = "Richman Glen",    RICHM = "Richman",    ROCKF = "Rockford Hills",    RTRAK = "Redwood Lights Track",    SanAnd = "San Andreas",    SANCHIA = "San Chianski Mountain Range",    SANDY = "Sandy Shores",    SKID = "Mission Row",    SLAB = "Stab City",    STAD = "Maze Bank Arena",    STRAW = "Strawberry",    TATAMO = "Tataviam Mountains",    TERMINA = "Terminal",    TEXTI = "Textile City",    TONGVAH = "Tongva Hills",    TONGVAV = "Tongva Valley",    VCANA = "Vespucci Canals",    VESP = "Vespucci",    VINE = "Vinewood",    WINDF = "Ron Alternates Wind Farm",    WVINE = "West Vinewood",    ZANCUDO = "Zancudo River",    ZP_ORT = "Port of South Los Santos",    ZQ_UAR = "Davis Quartz"}
local function GetStreetNames(coords)
    local street1 = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    local street2 = zone_names[GetNameOfZone(coords.x, coords.y, coords.z)]
    return {street1 = street1, street2 = street2 or ""}
end

local car_colours = {    --[[Black]]    { index = 0, label = 'black'},    { index = 1, label = 'black'},    { index = 2, label = 'black'},    { index = 3, label = 'grey'},    { index = 11, label = 'black'},    { index = 12, label = 'matte black'},    { index = 15, label = 'black'},    { index = 16, label = 'black'},    { index = 21, label = 'oil'},    { index = 147, label = 'carbon'},     --[[White]]    { index = 106, label = 'white'},    { index = 107, label = 'creme'},    { index = 111, label = 'white'},    { index = 112, label = 'white'},    { index = 113, label = 'beige'},    { index = 121, label = 'white'},    { index = 122, label = 'white'},    { index = 131, label = 'white'},    { index = 132, label = 'white'},    { index = 134, label = 'white'},    --[[Grey]]    { index = 4, label = 'silver'},    { index = 5, label = 'grey'},    { index = 6, label = 'grey'},    { index = 7, label = 'grey'},    { index = 8, label = 'grey'},    { index = 9, label = 'night'},    { index = 10, label = 'aluminum'},    { index = 13, label = 'grey'},    { index = 14, label = 'grey'},    { index = 17, label = 'grey'},    { index = 18, label = 'grey'},    { index = 19, label = 'silver'},    { index = 20, label = 'grey'},    { index = 22, label = 'grey'},    { index = 23, label = 'grey'},    { index = 24, label = 'grey'},    { index = 25, label = 'silver'},    { index = 26, label = 'titanium'},    { index = 66, label = 'grey'},    { index = 93, label = 'champagne'},    { index = 144, label = 'grey'},    { index = 156, label = 'grey'},    --[[Red]]    { index = 27, label = 'red'},    { index = 28, label = 'red'},    { index = 29, label = 'red'},    { index = 30, label = 'red'},    { index = 31, label = 'red'},    { index = 32, label = 'red'},    { index = 33, label = 'red'},    { index = 34, label = 'red'},    { index = 35, label = 'red'},    { index = 39, label = 'red'},    { index = 40, label = 'red'},    { index = 43, label = 'red'},    { index = 44, label = 'red'},    { index = 46, label = 'red'},    { index = 143, label = 'red'},    { index = 150, label = 'red'},    --[[Pink]]    { index = 135, label = 'pink'},    { index = 136, label = 'pink'},    { index = 137, label = 'pink'},    --[[Blue]]    { index = 54, label = 'blue'},    { index = 60, label = 'blue'},    { index = 61, label = 'blue'},    { index = 62, label = 'blue'},    { index = 63, label = 'blue'},    { index = 64, label = 'blue'},    { index = 65, label = 'blue'},    { index = 67, label = 'blue'},    { index = 68, label = 'blue'},    { index = 69, label = 'blue'},    { index = 70, label = 'blue'},    { index = 73, label = 'blue'},    { index = 74, label = 'blue'},    { index = 75, label = 'blue'},    { index = 77, label = 'blue'},    { index = 78, label = 'blue'},    { index = 79, label = 'blue'},    { index = 80, label = 'blue'},    { index = 82, label = 'blue'},    { index = 83, label = 'blue'},    { index = 84, label = 'blue'},    { index = 85, label = 'blue'},    { index = 86, label = 'blue'},    { index = 87, label = 'blue'},    { index = 127, label = 'blue'},    { index = 140, label = 'blue'},    { index = 141, label = 'blue'},    { index = 146, label = 'blue'},    { index = 157, label = 'blue'},    --[[Yellow]]    { index = 42, label = 'yellow'},    { index = 88, label = 'yellow'},    { index = 89, label = 'yellow'},    { index = 91, label = 'yellow'},    { index = 126, label = 'yellow'},    --[[Green]]    { index = 49, label = 'green'},    { index = 50, label = 'green'},    { index = 51, label = 'green'},    { index = 52, label = 'green'},    { index = 53, label = 'green'},    { index = 55, label = 'green'},    { index = 56, label = 'green'},    { index = 57, label = 'green'},    { index = 58, label = 'green'},    { index = 59, label = 'green'},    { index = 92, label = 'green'},    { index = 125, label = 'green'},    { index = 128, label = 'green'},    { index = 133, label = 'green'},    { index = 151, label = 'green'},    { index = 152, label = 'green'},    { index = 155, label = 'green'},    --[[Orange]]    { index = 36, label = 'orange'},    { index = 38, label = 'orange'},    { index = 41, label = 'orange'},    { index = 123, label = 'orange'},    { index = 124, label = 'orange'},    { index = 130, label = 'orange'},    { index = 138, label = 'orange'},    --[[Brown]]    { index = 45, label = 'copper'},    { index = 47, label = 'brown'},    { index = 48, label = 'brown'},    { index = 90, label = 'bronze'},    { index = 94, label = 'brown'},    { index = 95, label = 'brown'},    { index = 96, label = 'brown'},    { index = 97, label = 'brown'},    { index = 98, label = 'brown'},    { index = 99, label = 'beige'},    { index = 100, label = 'brown'},    { index = 101, label = 'brown'},    { index = 102, label = 'brown'},    { index = 103, label = 'brown'},    { index = 104, label = 'brown'},    { index = 105, label = 'brown'},    { index = 108, label = 'brown'},    { index = 109, label = 'brown'},    { index = 110, label = 'brown'},    { index = 114, label = 'brown'},    { index = 115, label = 'brown'},    { index = 116, label = 'beige'},    { index = 129, label = 'brown'},    { index = 153, label = 'brown'},    { index = 154, label = 'beige'},    --[[Purple]]    { index = 71, label = 'purple'},    { index = 72, label = 'purple'},    { index = 76, label = 'violet'},    { index = 81, label = 'purple'},    { index = 142, label = 'violet'},    { index = 145, label = 'purple'},    { index = 148, label = 'purple'},    { index = 149, label = 'purple'},    --[[Chrome]]    { index = 117, label = 'chrome'},    { index = 118, label = 'chrome'},    { index = 119, label = 'aluminum'},    --[[Metal]]    { index = 120, label = 'chrome'},    { index = 37, label = 'gold'},    { index = 158, label = 'gold'},    { index = 159, label = 'gold'},    { index = 160, label = 'gold'}}
local function GetVehicleColour(vehicle)
    local carcolour
    local primary, secondary = GetVehicleColours(vehicle)
    for t, u in pairs(car_colours) do
        if u.index == primary then
            carcolour = u.label
            break
        end
    end
    return carcolour
end

local function GetVehicleLabel(vehicle)
    if GetResourceState('cd_garage') == 'started' then
        return exports['cd_garage']:GetVehiclesData(GetEntityModel(vehicle)).name
    else
        local vehicle_label = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        if vehicle_label == 'null' or vehicle_label == 'carnotfound' or vehicle_label == 'NULL' then
            vehicle_label = L('vehicle')
        end
        if vehicle_label ~= 'null' or vehicle_label ~= 'carnotfound' or vehicle_label ~= 'NULL'then
            local text = GetLabelText(vehicle_label)
            if text == nil or text == 'null' or text == 'NULL' then
                vehicle_label = vehicle_label
            else
                vehicle_label = text
            end
        end
        return vehicle_label
    end
end

local function GetHeading(heading)
    if heading >= 315 or heading < 45 then
        return L('north_bound')
    elseif heading >= 45 and heading < 135 then
        return L('west_bound')
    elseif heading >=135 and heading < 225 then
        return L('south_bound')
    elseif heading >= 225 and heading < 315 then
        return L('east_bound')
    end
end


-- ██████╗██╗     ██╗███████╗███╗   ██╗████████╗    ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
--██╔════╝██║     ██║██╔════╝████╗  ██║╚══██╔══╝    ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
--██║     ██║     ██║█████╗  ██╔██╗ ██║   ██║       █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
--██║     ██║     ██║██╔══╝  ██║╚██╗██║   ██║       ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
--╚██████╗███████╗██║███████╗██║ ╚████║   ██║       ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
-- ╚═════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝


function GetPlayerInfo()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local streetnames = GetStreetNames(coords)
    local sex = GetPedSex(ped)
    local vehicle = nil
    if IsPedInAnyVehicle(ped, true) then
        vehicle = GetVehiclePedIsIn(ped, true)
        vehicle_label = GetVehicleLabel(vehicle)
        vehicle_colour = GetVehicleColour(vehicle)
        vehicle_plate = GetPlate(vehicle)
        heading = GetHeading(GetEntityHeading(ped))
        speed = GetEntitySpeed(vehicle)*2.236936
    else
        vehicle = GetClosestVehicle(5)
        if vehicle then
            vehicle_label = GetVehicleLabel(vehicle)
            vehicle_colour = GetVehicleColour(vehicle)
            vehicle_plate = GetPlate(vehicle)
        end
    end
    return {
        ped = ped,
        coords = coords,
        street_1 = streetnames.street1,
        street_2 = streetnames.street2,
        street = streetnames.street1..', '..streetnames.street2,
        sex = sex,
        vehicle = vehicle,
        vehicle_label = vehicle_label,
        vehicle_colour = vehicle_colour,
        vehicle_plate = vehicle_plate,
        heading = heading,
        speed = speed,
        unique_id = tostring(math.random(0000000,9999999))
    }
end