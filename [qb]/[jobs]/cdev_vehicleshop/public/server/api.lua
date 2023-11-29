ResourceAPI = {}

-- 🚗 Create a new vehicle on the database for the given character identifier.
ResourceAPI.CreateNewVehicle = function(source, characterIdentifier, vehicleModel, plate, props, vehType)
    if clib.config.isQBCore then
        ResourceAPI.Queries.QB_InsertVehicle(
            clib.api.Character.GetPlayerLicenseFromSource(source),
            characterIdentifier,
            vehicleModel,
            plate,
            props
        )
    elseif clib.config.isESX then
        ResourceAPI.Queries.ESX_InsertVehicle(characterIdentifier, plate, props, vehType)
    else
        -- 🔧 If using custom, implement your own code here
        ResourceAPI.Queries.Custom_InsertVehicle()
    end
end

-- 🚗 Check if the vehicle plate exist

ResourceAPI.CheckPlate = function(plate)
    if clib.config.isQBCore then
        return #clib.db.Query("SELECT * FROM player_vehicles WHERE plate = ?", {plate}) > 0
    elseif clib.config.isESX then
        return #clib.db.Query("SELECT * FROM owned_vehicles WHERE plate = ?", {plate}) > 0
    else
        -- 🔧 If using custom, implement your own code here
    end
end

-- 💸 Check if the player has enough money to buy the vehicle
ResourceAPI.CheckHasMoneyToBuyVehicle = function(source, vehiclePrice)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        return clib.api.Character.GetCharacterBankFromSource(source) >= vehiclePrice
    else
        return clib.api.Character.GetCharacterCashFromSource(source) >= vehiclePrice
    end
end

-- 💸 Charge the player for the vehicle
ResourceAPI.ChargePlayerForVehicle = function(source, vehiclePrice)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        clib.api.Character.RemoveCharacterBankFromSource(source, vehiclePrice)
    else
        clib.api.Character.RemoveCharacterCashFromSource(source, vehiclePrice)
    end
end

-- 💸 Refund the player for the vehicle
ResourceAPI.RefundPlayerForVehicle = function(source, vehiclePrice)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        clib.api.Character.AddCharacterBankForSource(source, vehiclePrice)
    else
        clib.api.Character.AddCharacterCashForSource(source, vehiclePrice)
    end
end

-- 💸 Pay sale bonus to employee
ResourceAPI.GiveSaleBonusToEmployee = function(source, amount)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        clib.api.Character.AddCharacterBankForSource(source, amount)
    else
        clib.api.Character.AddCharacterCashForSource(source, amount)
    end
end

-- 💸 Check if player (boss in this case) has enough money to deposit to vault
ResourceAPI.CheckHasMoneyToDepositToVault = function(source, amount)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        return clib.api.Character.GetCharacterBankFromSource(source) >= amount
    else
        return clib.api.Character.GetCharacterCashFromSource(source) >= amount
    end
end

-- 💸 Take the money from the player (boss in this case) in order to deposit to vault
ResourceAPI.ChargePlayerForDepositToVault = function(source, amount)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        clib.api.Character.RemoveCharacterBankFromSource(source, amount)
    else
        clib.api.Character.RemoveCharacterCashFromSource(source, amount)
    end
end

-- 💸 Give money to player (boss in this case) from vault
ResourceAPI.GiveMoneyToPlayerFromVault = function(source, amount)
    if PublicSharedResourceConfig.UseBankInsteadOfCash then
        clib.api.Character.AddCharacterBankForSource(source, amount)
    else
        clib.api.Character.AddCharacterCashForSource(source, amount)
    end
end

ResourceAPI.ShouldEnableAutomaticFreeShop = function(job)
    if not PublicSharedResourceConfig.EnableAutomaticFreeShop then
        return false
    end

    if clib.config.isQBCore then
        return clib.frameworks.QBCore.Functions.GetDutyCount(job) == 0
    elseif clib.config.isESX then
        local players = clib.frameworks.ESX.GetPlayers()
        local onDuty = 0

        for i = 1, #players, 1 do
            local xPlayer = clib.frameworks.ESX.GetPlayerFromId(players[i])

            if xPlayer.job.name == job then
                onDuty = onDuty + 1
            end
        end

        return onDuty == 0
    else
        -- 🔧 If using custom, implement your own code here
        return false
    end
end

-- 📦 Database queries
ResourceAPI.Queries = {
    FetchEmployeeMapFromShop = function(shop_id)
        return clib.db.Query("SELECT * FROM cdev_vshop_employees WHERE shop_id = ?", { shop_id })
    end,
    FetchStockFromShop = function(shop_id)
        return clib.db.Query("SELECT * FROM cdev_vshop_stock WHERE shop_id = ?", { shop_id })
    end,
    FetchShops = function()
        return clib.db.Query("SELECT * FROM cdev_vshop_shops")
    end,
    FetchVehicles = function()
        return clib.db.Query("SELECT * FROM cdev_vshop_vehicles")
    end,
    FetchShopOrders = function()
        return clib.db.Query("SELECT * FROM cdev_vshop_orders")
    end,
    ESX_FetchVehicles = function()
        return clib.db.Query([[
            SELECT
                v.model,
                v.price,
                v.name,
                vc.label as category
            FROM
                vehicles v
            LEFT JOIN
                vehicle_categories vc
            ON
                v.category = vc.name
        ]])
    end,
    CheckIfVehiclesCreated = function()
        return clib.db.Query("SHOW TABLES LIKE 'cdev_vshop_vehicles'")
    end,
    CreateVehiclesTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_vshop_vehicles` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `model` varchar(50) NOT NULL DEFAULT '0',
                `price` int(11) NOT NULL DEFAULT 0,
                `thumbnail` varchar(255) NOT NULL DEFAULT '0',
                `category` varchar(255) NOT NULL DEFAULT '',
                PRIMARY KEY (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        ]])
    end,
    InsertDefaultVehicle = function(model, price, category)
        clib.db.Insert("INSERT INTO cdev_vshop_vehicles(id, model, price, thumbnail, category) VALUES(NULL, ?, ?, ?, ?)", {
            model,
            price,
            'https://static.cdev.shop/resources/vehicle-shop/thumbnails/' .. model .. '.png',
            category,
        })
    end,
    CreateShopOrdersTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_vshop_orders` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL DEFAULT 0,
              `customer` varchar(255) NOT NULL,
              `customer_name` varchar(255) DEFAULT NULL,
              `vehicle_id` int(11) NOT NULL DEFAULT 0,
              `vehicle_name` varchar(255) DEFAULT NULL,
              `order_cost` int(11) NOT NULL DEFAULT 0,
              `type` int(11) NOT NULL DEFAULT 1,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
        ]])
    end,
    CreateShopsTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_vshop_shops` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) NOT NULL DEFAULT '',
              `blip` int(11) NOT NULL DEFAULT 0,
              `blipSize` float DEFAULT NULL,
              `blipColor` int(11) NOT NULL DEFAULT 0,
              `blipLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `tablets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `showroom` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `spawns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `management` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `vault` int(11) NOT NULL DEFAULT 0,
              `logo` varchar(255) NOT NULL DEFAULT '',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
        ]])
    end,
    CreateShopStockTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_vshop_stock` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `vehicle_id` int(11) NOT NULL,
              `amount` int(11) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
        ]])
    end,
    CreateShopEmployees = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_vshop_employees` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) DEFAULT NULL,
              `identifier` varchar(255) NOT NULL,
              `role` int(11) NOT NULL,
              `shop_id` int(11) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        ]])
    end,
    InsertShop = function(name, logo, blip, blipSize, blipColor, blipLocation, tablets, showroom, spawns, management, settings,
                          vaultMoney)
        clib.db.Insert([[
            INSERT INTO cdev_vshop_shops(id, name, logo, blip, blipSize, blipColor, blipLocation, tablets, showroom, spawns, management, settings, vault)
            VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ]], {
            name,
            logo,
            blip,
            blipSize,
            blipColor,
            blipLocation,
            tablets,
            showroom,
            spawns,
            management,
            settings,
            vaultMoney,
        })
    end,
    UpdateShop = function(name, logo, blip, blipSize, blipColor, blipLocation, tablets, showroom, spawns, management, vaultMoney,
                          settings, id)
        clib.db.Update([[
            UPDATE cdev_vshop_shops
            SET name = ?, logo = ?, blip = ?, blipSize = ?, blipColor = ?, blipLocation = ?, tablets = ?, showroom = ?, spawns = ?, management = ?, vault = ?, settings = ?
            WHERE id = ?
        ]], {
            name,
            logo,
            blip,
            blipSize,
            blipColor,
            blipLocation,
            tablets,
            showroom,
            spawns,
            management,
            vaultMoney,
            settings,
            id
        })
    end,
    DeleteShop = function(shopId)
        clib.db.Update("DELETE FROM cdev_vshop_shops WHERE id = ?", { shopId })
    end,
    UpdateShopEmployee = function(employeeRole, employeeIdentifier, shopId)
        clib.db.Update([[UPDATE cdev_vshop_employees SET role = ? WHERE identifier = ? AND shop_id = ?]],
            { employeeRole, employeeIdentifier, shopId })
    end,
    InsertShopEmployee = function(employeeName, employeeIdentifier, employeeRole, shopId)
        clib.db.Update([[
            INSERT INTO cdev_vshop_employees(id, name, identifier, role, shop_id)
            VALUES(NULL, ?, ?, ?, ?)]],
            { employeeName, employeeIdentifier, employeeRole, shopId })
    end,
    DeleteShopEmployee = function(employeeIdentifier, shopId)
        clib.db.Update([[
            DELETE FROM cdev_vshop_employees
            WHERE identifier = ? AND shop_id = ?
        ]], {
            employeeIdentifier,
            shopId,
        }
        )
    end,
    QueryIfVehicleExists = function(vehicleModel)
        return clib.db.Query("SELECT * FROM cdev_vshop_vehicles WHERE model = ?", { vehicleModel })
    end,
    InsertDefaultVehicleFromMenu = function(vehicleModel, price, thumbnail, category)
        clib.db.Insert([[
            INSERT INTO cdev_vshop_vehicles(id, model, price, thumbnail, category)
            VALUES(NULL, ?, ?, ?, ?)
        ]], {
            vehicleModel,
            price,
            thumbnail,
            category,
        })
    end,
    UpdateDefaultVehicleFromMenu = function(vehicleModel, price, thumbnail, category, vehicleId)
        clib.db.Update([[
            UPDATE cdev_vshop_vehicles
            SET model = ?, price = ?, thumbnail = ?, category = ?
            WHERE id = ?
        ]], {
            vehicleModel,
            price,
            thumbnail,
            category,
            vehicleId,
        })
    end,
    UpdateShopStockEntry = function(amount, vehicleId, shopId)
        clib.db.Update([[
            UPDATE cdev_vshop_stock
            SET amount = ?
            WHERE vehicle_id = ? AND shop_id = ?
        ]], {
            amount,
            vehicleId,
            shopId,
        })
    end,
    InsertShopStockEntry = function(shopId, vehicleId, amount)
        clib.db.Insert([[
            INSERT INTO cdev_vshop_stock(id, shop_id, vehicle_id, amount)
            VALUES(NULL, ?, ?, ?)
        ]], {
            shopId,
            vehicleId,
            amount,
        })
    end,
    DeleteShopStockEntry = function(vehicleId, shopId)
        clib.db.Update([[
            DELETE FROM cdev_vshop_stock
            WHERE vehicle_id = ? AND shop_id = ?
        ]], {
            vehicleId,
            shopId,
        })
    end,
    UpdateShopSettings = function(settings, shopId)
        clib.db.Update([[
            UPDATE cdev_vshop_shops
            SET settings = ?
            WHERE id = ?
        ]], {
            settings,
            shopId,
        })
    end,
    InsertShopOrder = function(shopId, characterIdentifier, characterName, vehicleId, vehicleModel, price, type)
        clib.db.Insert([[
            INSERT INTO cdev_vshop_orders(id, shop_id, customer, customer_name, vehicle_id, vehicle_name, order_cost, type)
            VALUES(NULL, ?, ?, ?, ?, ?, ?, ?)
        ]], {
            shopId,
            characterIdentifier,
            characterName,
            vehicleId,
            vehicleModel,
            price,
            type,
        })
    end,
    DeleteShopOrder = function(orderId)
        clib.db.Query([[
            DELETE FROM cdev_vshop_orders
            WHERE id = ?
        ]], {
            orderId,
        })
    end,
    DeleteDefaultVehicleFromMenu = function(vehicleId)
        clib.db.Update("DELETE FROM cdev_vshop_vehicles WHERE id = ?", { vehicleId })
    end,
    UpdateShopShowroom = function(showroom, shopId)
        clib.db.Update([[
            UPDATE cdev_vshop_shops
            SET showroom = ?
            WHERE id = ?
        ]], {
            showroom,
            shopId
        })
    end,
    UpdateShopVault = function(vault, shopId)
        clib.db.Update([[
            UPDATE cdev_vshop_shops
            SET vault = ?
            WHERE id = ?
        ]], {
            vault,
            shopId
        })
    end,
    QB_InsertVehicle = function(license, characterIdentifier, vehicleModel, plate, props)
        clib.db.Insert([[
            INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ]], {
            license,
            characterIdentifier,
            vehicleModel,
            joaat(vehicleModel),
            json.encode(props),
            plate,
            0
        })
    end,
    ESX_InsertVehicle = function(characterIdentifier, plate, props, vehType)
        clib.db.Insert([[
            INSERT INTO owned_vehicles (owner, plate, vehicle, `type`)
            VALUES (?, ?, ?, ?)
        ]], {
            characterIdentifier,
            plate,
            json.encode(props),
            vehType
        })
    end,
    Custom_InsertVehicle = function()
        -- 🔧 If using custom, implement your own code here
    end,
    UpsertDefaultVehicle = function(vehicleModel, category, price)
        local vehicle = clib.db.Query("SELECT * FROM cdev_vshop_vehicles WHERE model = ?", { vehicleModel })
        if vehicle and #vehicle > 0 then
            clib.db.Update([[
                UPDATE cdev_vshop_vehicles
                SET price = ?, category = ?
                WHERE model = ?
            ]], {
                price,
                category,
                vehicleModel,
            })
        else
            clib.db.Insert([[
                INSERT INTO cdev_vshop_vehicles(id, model, price, thumbnail, category)
                VALUES(NULL, ?, ?, ?, ?)
            ]], {
                vehicleModel,
                price,
                vehicleModel .. '.png',
                category,
            })
        end
    end,
    CreatePreStockTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS cdev_vshop_prestock (
                id int(11) NOT NULL AUTO_INCREMENT,
                shop_id int(11) NOT NULL DEFAULT 0,
                vehicle_id int(11) NOT NULL DEFAULT 0,
                spot_id int(11) NOT NULL,
                PRIMARY KEY (id)
              ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
        ]])
    end,
    FetchPreStock = function(shopId)
        return clib.db.Query("SELECT * FROM cdev_vshop_prestock WHERE shop_id = ?", { shopId })
    end,
    UpdatePreStock = function(shopId, vehicleId, spotId)
        return clib.db.Insert("INSERT INTO cdev_vshop_prestock(shop_id, vehicle_id, spot_id) VALUES(?, ?, ?)", { shopId, vehicleId, spotId })
    end,
    RemovePreStock = function(preStockId)
        return clib.db.Update("DELETE FROM cdev_vshop_prestock WHERE id = ?", { preStockId })
    end
}

function LoadStash(shopId)
    -- 🔧 If your inventory needs to load the stash server side, do it here. This function is called whenever the stash is opened
    if clib.config.public.Inventory == "ox" then
        exports.ox_inventory:RegisterStash("company_" .. shopId, "Stash " .. shopId,
            PublicSharedResourceConfig.DealershipJob.StashSlotCount,
            PublicSharedResourceConfig.DealershipJob.StashWeightCapacity, false)
    else
        -- 🔧 If using custom, implement your own code here
    end
end

-- 📷 Take a screenshot of a vehicle and return the filename (for thumbnails)
ResourceAPI.TakeScreenshot = function(source, model)
    local file = promise.new()

    exports[PublicSharedResourceConfig.ThumbnailGenerator.ScreenshotDependency]:requestClientScreenshot(source, {
        fileName = GetResourcePath(GetCurrentResourceName()) .. "/data/thumbnails/" .. model .. ".png",
    }, function()
        file:resolve(model .. ".png")
    end)

    return Citizen.Await(file)
end

-- 🚗 Spawn a vehicle server side
ResourceAPI.SpawnVehicleServer = function(model, plate, coords, heading)
    local CreateAutomobile = GetHashKey("CREATE_AUTOMOBILE")
    local veh = Citizen.InvokeNative(CreateAutomobile, model, coords, heading, true, true)

    SetVehicleNumberPlateText(veh, plate)

    return veh
end

-- 🚗 Get all vehicles from the current framework and return them in order to be inserted into the database
-- (Only executed once at first startup or when you run /refreshsupply)
ResourceAPI.GetInitialVehicles = function()
    local vehicles = {}

    if clib.config.isQBCore then
        for k, v in pairs(clib.frameworks.QBCore.Shared.Vehicles) do
            vehicles[#vehicles + 1] = {
                model = k,
                price = v.price,
                category = v.categoryLabel and v.categoryLabel or v.category,
            }
        end
    elseif clib.config.isESX then
        local vehicles_data = ResourceAPI.Queries.ESX_FetchVehicles()

        for _, vehicle in ipairs(vehicles_data) do
            vehicles[#vehicles + 1] = {
                model = vehicle.model,
                price = vehicle.price,
                category = vehicle.category,
            }
        end
    else
        vehicles = PublicSharedResourceConfig.DefaultVehicles
    end

    return vehicles
end

-- 🚗 Get all vehicles from our database and update them with the correct name/category
ResourceAPI.UpdateAllVehicles = function()
    local allVehicles = ResourceAPI.Queries.FetchVehicles()

    local _table

    if clib.config.isQBCore then
        _table = clib.frameworks.QBCore.Shared.Vehicles
    elseif clib.config.isESX then
        _table = ResourceAPI.Queries.ESX_FetchVehicles()
    else
        _table = PublicSharedResourceConfig.DefaultVehicles
    end

    for _, v in pairs(allVehicles) do
        if clib.config.isQBCore then
            local entry = _table[v.model]

            if entry then
                v.name = entry.name
            end
        else
            local _, entry = table.find(_table, function(_, _v) return _v.model == v.model end)

            if entry then
                v.name = entry.name
                v.category = entry.category or v.category
            end
        end
    end

    return allVehicles
end

ResourceAPI.SpawnFlatbedServerSide = function(source, name)
    local ped = GetPlayerPed(source)
    local vehicle = ResourceAPI.SpawnVehicleServer(joaat(PublicSharedResourceConfig.VehiclePickupOptions.VehicleModel), "tow" .. name, GetEntityCoords(ped), GetEntityHeading(ped))

    while not string.starts(GetVehicleNumberPlateText(vehicle), "TOW") do
        Wait(1)
    end

    Entity(vehicle).state.towing = false

    local plate = GetVehicleNumberPlateText(vehicle)

    return NetworkGetNetworkIdFromEntity(vehicle), plate
end

-- 🚗 This function is called when a player begins a test drive.
ResourceAPI.OnBeginTestDriveServer = function(source, vehicleNetId)
    local veh = NetworkGetEntityFromNetworkId(vehicleNetId)

    local plate = formatPlate(GetVehicleNumberPlateText(veh))

    while plate == "" do
        plate = formatPlate(GetVehicleNumberPlateText(veh))
        Wait(100)
    end

    CreateThread(function()
        local minutes = math.ceil(PublicSharedResourceConfig.TestDriveVehiclePoofTime / 60)

        if not PublicSharedResourceConfig.ChargePlayerForTestDriveVehicle then
            clib.api.SNotify.AddDefaultNotification(
                source,
                clib.localizer.get("test_drive"),
                clib.localizer.get("test_drive_started")
                :gsub("{min}", minutes),
                5
            )
        else
            clib.api.SNotify.AddDefaultNotification(
                source,
                clib.localizer.get("test_drive"),
                clib.localizer.get("test_drive_started_charge")
                :gsub("{min}", minutes)
                :gsub("{price}", PublicSharedResourceConfig.ChargePlayerForTestDriveVehicleAmount),
                5
            )
        end

        for i = 1, minutes do
            Wait(60 * 1000)

            veh = NetworkGetEntityFromNetworkId(vehicleNetId)

            if not DoesEntityExist(veh) or formatPlate(GetVehicleNumberPlateText(veh)) ~= plate then
                return
            end

            if i < minutes then
                if not PublicSharedResourceConfig.ChargePlayerForTestDriveVehicle then
                    clib.api.SNotify.AddDefaultNotification(
                        source,
                        clib.localizer.get("test_drive"),
                        clib.localizer.get("test_drive_min")
                        :gsub("{min}", minutes - i),
                        5
                    )
                else
                    clib.api.SNotify.AddDefaultNotification(
                        source,
                        clib.localizer.get("test_drive"),
                        clib.localizer.get("test_drive_charge_min")
                        :gsub("{min}", minutes - i)
                        :gsub("{price}", PublicSharedResourceConfig.ChargePlayerForTestDriveVehicleAmount),
                        5
                    )
                end
            end
        end

        veh = NetworkGetEntityFromNetworkId(vehicleNetId)

        if DoesEntityExist(veh) and formatPlate(GetVehicleNumberPlateText(veh)) == plate then
            if PublicSharedResourceConfig.PoofTestDriveVehicle then
                DeleteEntity(veh)
            elseif PublicSharedResourceConfig.KillTestDriveVehicleEngine then
                TriggerClientEvent("cdev_vehicleshop:killEngineTestDrive", NetworkGetEntityOwner(veh), vehicleNetId)
            end

            if not PublicSharedResourceConfig.ChargePlayerForTestDriveVehicle then
                clib.api.SNotify.AddDefaultNotification(
                    source,
                    clib.localizer.get("test_drive"),
                    clib.localizer.get("time_is_up"),
                    5
                )
            else
                clib.api.SNotify.AddDefaultNotification(
                    source,
                    clib.localizer.get("test_drive"),
                    clib.localizer.get("time_is_up_charge")
                    :gsub("{price}", PublicSharedResourceConfig.ChargePlayerForTestDriveVehicleAmount),
                    5
                )

                clib.api.Character.RemoveCharacterCashFromSource(source, PublicSharedResourceConfig.ChargePlayerForTestDriveVehicleAmount)
            end

            TriggerClientEvent("cdev_vehicleshop:onOverTestDrive", source, vehicleNetId)
        end
    end)
end