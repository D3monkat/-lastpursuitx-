Roles = {
    EMPLOYEE = 0,
    BOSS = 100,
}

PublicSharedResourceConfig = {
    -- 🚗 The format and length used for vehicle plates (maximum 8 characters)
    -- 📣 N = number, L = letter, S = space, X = number or letter
    -- 📣 Example: NNNLLL could output "547EXW", XXXX XXX could output "8XA5 12E"
    PlateFormat = "XXXXXXXX",

    -- 🏢 Base dealership job details
    DealershipJob = {
        -- 📦 Stash weight capacity
        StashWeightCapacity = 1000,

        -- 📦 Stash slot count
        StashSlotCount = 50,

        -- ✅ Job role permissions for specific actions
        RoleRequirements = {
            OpenManagementMenu = Roles.EMPLOYEE,
            ManageStock = Roles.BOSS,
            ManageEmployees = Roles.BOSS,
            ManageSettings = Roles.BOSS,
            ManageVault = Roles.BOSS,
            OpenStash = Roles.EMPLOYEE,
            ManageShowroom = Roles.EMPLOYEE,
            ManageOrders = Roles.EMPLOYEE,
        },
    },

    -- 🏢 Automatic thumbnail generation in-game (mostly for imports)
    ThumbnailGenerator = {
        -- ⚙️ Whether or not to enable the thumbnail generator (customizable in public/client/thumbnail.lua)
        Enabled = true,
        -- 🚗 Vehicle position
        VehiclePosition = vector4(405.32, -968.45, -99.0, 180.29),
        -- Screenshot dependency
        ScreenshotDependency = "screenshot-basic",
    },

    -- 🚗 Whether or not to enable the test drive feature (customizable in public/client/api.lua)
    EnableTestDrive = true,

    -- ‍💨 Poof (disappear) test drive vehicle if it's not returned within the configured time
    PoofTestDriveVehicle = false,

    -- ⚙️ Kill engine and make test drive vehicle undriveable if it's not returned within the configured time
    KillTestDriveVehicleEngine = true,

    -- 💲 Charge the player if they don't return the test drive vehicle within the configured time
    ChargePlayerForTestDriveVehicle = false,

    -- 💲 Amount to charge the player if they don't return the test drive vehicle within the configured time
    ChargePlayerForTestDriveVehicleAmount = 1000,

    -- ⌛ Time in seconds before a test drive vehicle is poofed (if PoofTestDriveVehicle is true)
    TestDriveVehiclePoofTime = 60 * 5, -- 5 minutes

    -- 👮 Permission level for shop creator menu (see https://docs.cdev.shop/fivem/cdev-library under framework page)
    ShopCreatorPermissionLevel = PERMISSION_HIGH,

    -- ⌨️ Default controls for the shop creator menu (see https://docs.fivem.net/docs/game-references/controls)
    CreatorControls = {
        CONFIRM_ANY_ACTION = 38, -- E
        CANCEL_ANY_ACTION = 200, -- ESC
        GENERAL_SAVE = 201, -- Enter
        GENERAL_TOGGLE = 37, -- TAB
        GENERAL_ALTERNATE = 19, -- L. ALT
        INCREASE = 15, -- Scroll UP
        DECREASE = 14, -- Scroll DOWN
    },

    -- ⌨️ Default controls for drawtext shops if using any (see https://docs.fivem.net/docs/game-references/controls)
    DrawtextShopControls = {
        BROWSE_STOCK = 38, -- E
        MANAGEMENT = 38, -- E
        SHOWROOM = 38, -- E
    },

    -- 🔑 Give keys to dealership employee first instead of the customer when selling a vehicle
    GiveKeysToEmployeeFirst = false,

    -- 🧑 Allow shop owners to toggle free shop mode (no employee required to purchase vehicles)
    AllowFreeShop = true,

    -- 🚗 If test drive is enabled, whether or not free shops should have test drives
    EnableFreeShopTestDrive = true,

    -- 💲 Charge shop owners for ordering vehicles
    ChargeShopOwnersForOrder = true,

    -- 🧑 Enable automatic free shop (enable free shop automatically when there are no employees online, that also means free shop will only activate under that circumstance)
    -- 📣 AllowFreeShop must be true for this to work
    -- 📣 The individual free shop shop setting will be invisible if this is enabled
    EnableAutomaticFreeShop = false,

    -- 💲 Percentage Limit for how much margin dealerships can have for profit (-1 = Unlimited)
    ResaleMarginLimit = -1,

    -- 🚗 Require vehicles to be picked up before being added to the dealership stock
    EnableOrderedVehiclePickup = false,

    -- 🚗 Pickup vehicle specifications
    VehiclePickupOptions = {
        VehicleModel = "flatbed",
        AttachVehiclePosition = vector3(0, -2.2, 0.4),
        AttachVehicleBoneName = "bodyshell",
    },

    -- 💻 Use drawtext for showroom interactions (changing showroom vehicles) instead of target
    UseDrawtextForShowroom = false,

    -- 💲 Use bank money instead of cash money.
    UseBankInsteadOfCash = false,

    -- For development and support feedback only, do not use.
    WantDebug = false,

    -- 🚗 Locations where ordered vehicles can be picked up (x, y, z, heading)
    OrderedVehiclePickupLocations = {
        { coords = vector4(892.46997070312, -3126.1201171875, 5.1999998092651, 1.35) },
        { coords = vector4(896.38000488281, -3126.1298828125, 5.1999998092651, 0.26) },
        { coords = vector4(900.59002685547, -3126.0200195312, 5.1999998092651, 0.33) },
        { coords = vector4(904.57000732422, -3126.0300292969, 5.1999998092651, 359.91) },
        { coords = vector4(908.92999267578, -3125.8798828125, 5.1999998092651, 1.01) },
        { coords = vector4(912.65997314453, -3125.6000976562, 5.1999998092651, 359.89) },
        { coords = vector4(916.88000488281, -3126.1298828125, 5.1999998092651, 0.1) },
        { coords = vector4(920.89001464844, -3125.6599121094, 5.1999998092651, 0.61) },
        { coords = vector4(924.98999023438, -3125.8100585938, 5.1999998092651, 0.79) },
        { coords = vector4(928.80999755859, -3125.830078125, 5.1999998092651, 359.71) },
        { coords = vector4(932.97998046875, -3126.0300292969, 5.1999998092651, 358.91) },
        { coords = vector4(937.15997314453, -3126.3898925781, 5.1999998092651, 359.11) },
        { coords = vector4(941.41998291016, -3125.8701171875, 5.1999998092651, 1.05) },
        { coords = vector4(945.23999023438, -3125.6499023438, 5.1999998092651, 0.7) },
        { coords = vector4(949.39001464844, -3125.8798828125, 5.1999998092651, 0.45) },
        { coords = vector4(953.29998779297, -3125.6398925781, 5.1999998092651, 359.37) },
        { coords = vector4(957.42999267578, -3126.1398925781, 5.1999998092651, 0.34) },
        { coords = vector4(961.46997070312, -3126.1101074219, 5.1999998092651, 0.01) },
        { coords = vector4(965.58001708984, -3126.1398925781, 5.1999998092651, 0.74) },
        { coords = vector4(969.75, -3126.3200683594, 5.1999998092651, 1.27) },
        { coords = vector4(892.59002685547, -3158.2800292969, 5.1999998092651, 179.38) },
        { coords = vector4(896.59002685547, -3158.6298828125, 5.1999998092651, 181.37) },
        { coords = vector4(900.65997314453, -3158.580078125, 5.1999998092651, 180.14) },
        { coords = vector4(904.69000244141, -3158.8400878906, 5.1999998092651, 177.7) },
        { coords = vector4(908.73999023438, -3158.3898925781, 5.1999998092651, 178.83) },
        { coords = vector4(912.71997070312, -3158.4299316406, 5.1999998092651, 179.79) },
        { coords = vector4(916.79998779297, -3158.2800292969, 5.1999998092651, 179.41) },
        { coords = vector4(921.03002929688, -3158.2199707031, 5.1999998092651, 178.3) },
        { coords = vector4(924.82000732422, -3158.3200683594, 5.1999998092651, 180.3) },
        { coords = vector4(929.21997070312, -3158.3500976562, 5.1999998092651, 179.42) },
        { coords = vector4(933.21002197266, -3158.1201171875, 5.1999998092651, 179.38) },
        { coords = vector4(941.29998779297, -3158.3701171875, 5.1999998092651, 179.04) },
        { coords = vector4(945.39001464844, -3158.3601074219, 5.1999998092651, 179.28) },
        { coords = vector4(949.28002929688, -3158.4399414062, 5.1999998092651, 180.98) },
        { coords = vector4(953.34997558594, -3158.1101074219, 5.1999998092651, 179.55) },
        { coords = vector4(957.30999755859, -3158.169921875, 5.1999998092651, 180.7) },
        { coords = vector4(961.46997070312, -3157.7399902344, 5.1999998092651, 180.36) },
        { coords = vector4(965.58001708984, -3158.2299804688, 5.1999998092651, 180.18) },
        { coords = vector4(969.5, -3157.9699707031, 5.1999998092651, 179.21) },
        { coords = vector4(656.44000244141, -2939.3999023438, 5.3400001525879, 89.79) },
        { coords = vector4(657.71002197266, -2936.3999023438, 5.3400001525879, 89.79) },
        { coords = vector4(658.92999267578, -2933.5100097656, 5.3400001525879, 89.79) },
        { coords = vector4(659.84997558594, -2930.5200195312, 5.3400001525879, 89.79) },
        { coords = vector4(659.88000488281, -2927.3701171875, 5.3499999046326, 89.79) },
        { coords = vector4(659.86999511719, -2924.1899414062, 5.3600001335144, 89.79) },
        { coords = vector4(660.35998535156, -2921.5, 5.3600001335144, 89.79) },
        { coords = vector4(660.22998046875, -2918.2299804688, 5.3600001335144, 89.79) },
        { coords = vector4(660.0, -2915.1799316406, 5.3600001335144, 89.79) },
        { coords = vector4(660.39001464844, -2912.0700683594, 5.3600001335144, 91.12) },
        { coords = vector4(660.01000976562, -2909.4099121094, 5.3600001335144, 90.76) },
        { coords = vector4(660.36999511719, -2906.1000976562, 5.3600001335144, 89.79) },
        { coords = vector4(660.04998779297, -2903.25, 5.3600001335144, 89.78) },
        { coords = vector4(660.14001464844, -2900.1101074219, 5.3600001335144, 90.74) },
        { coords = vector4(659.95001220703, -2897.2199707031, 5.3600001335144, 89.78) },
        { coords = vector4(659.61999511719, -2894.3500976562, 5.3600001335144, 89.79) },
        { coords = vector4(660.16998291016, -2891.419921875, 5.3499999046326, 89.78) },
        { coords = vector4(608.85998535156, -2937.8000488281, 5.3400001525879, 89.41) },
        { coords = vector4(609.15002441406, -2933.580078125, 5.3400001525879, 89.41) },
        { coords = vector4(609.41998291016, -2929.2600097656, 5.3400001525879, 89.41) },
        { coords = vector4(609.15002441406, -2924.8798828125, 5.3400001525879, 89.41) },
        { coords = vector4(609.26000976562, -2920.6599121094, 5.3400001525879, 89.41) },
        { coords = vector4(609.47998046875, -2916.6201171875, 5.3400001525879, 89.41) },
        { coords = vector4(609.5, -2912.2900390625, 5.3400001525879, 89.41) },
        { coords = vector4(609.53997802734, -2907.8701171875, 5.3400001525879, 89.41) },
        { coords = vector4(609.71997070312, -2903.7399902344, 5.3400001525879, 89.41) },
        { coords = vector4(610.28997802734, -2899.4599609375, 5.3400001525879, 89.41) },
        { coords = vector4(610.76000976562, -2895.3798828125, 5.3400001525879, 89.41) },
        { coords = vector4(609.75, -2890.9699707031, 5.3400001525879, 89.41) },
        { coords = vector4(609.47998046875, -2886.4299316406, 5.3499999046326, 89.41) },
        { coords = vector4(674.22998046875, -2994.169921875, 5.3400001525879, 270.25) },
        { coords = vector4(674.53997802734, -2991.3400878906, 5.3400001525879, 270.25) },
        { coords = vector4(674.53002929688, -2988.3200683594, 5.3400001525879, 270.25) },
        { coords = vector4(674.33001708984, -2985.2600097656, 5.3400001525879, 270.25) },
        { coords = vector4(674.47998046875, -2982.3200683594, 5.3400001525879, 270.25) },
        { coords = vector4(674.64001464844, -2979.2299804688, 5.3499999046326, 270.25) },
        { coords = vector4(674.38000488281, -2976.2299804688, 5.3400001525879, 270.25) },
        { coords = vector4(674.42999267578, -2973.1201171875, 5.3400001525879, 270.25) },
        { coords = vector4(674.39001464844, -2970.0500488281, 5.3400001525879, 270.25) },
        { coords = vector4(592.58001708984, -2771.4899902344, 5.3600001335144, 148.87) },
        { coords = vector4(588.59002685547, -2769.3100585938, 5.3600001335144, 148.87) },
        { coords = vector4(580.71997070312, -2764.2700195312, 5.3600001335144, 148.87) },
        { coords = vector4(568.91998291016, -2758.1201171875, 5.3600001335144, 148.87) },
        { coords = vector4(560.89001464844, -2753.169921875, 5.3600001335144, 148.87) },
        { coords = vector4(557.19000244141, -2751.330078125, 5.3600001335144, 148.87) },
        { coords = vector4(545.84002685547, -2744.1999511719, 5.3600001335144, 148.87) },
        { coords = vector4(541.69000244141, -2742.0900878906, 5.3600001335144, 148.87) },
        { coords = vector4(537.89001464844, -2740.0100097656, 5.3600001335144, 148.87) },
        { coords = vector4(530.03997802734, -2735.5300292969, 5.3600001335144, 148.87) },
        { coords = vector4(518.85998535156, -2728.5600585938, 5.3600001335144, 148.87) },
        { coords = vector4(492.32000732422, -2717.830078125, 5.3600001335144, 148.87) },
        { coords = vector4(575.13000488281, -2727.0900878906, 5.3600001335144, 359.5) },
        { coords = vector4(571.96002197266, -2726.7900390625, 5.3600001335144, 359.5) },
        { coords = vector4(568.73999023438, -2726.3798828125, 5.3600001335144, 359.5) },
        { coords = vector4(818.27001953125, -3144.4699707031, 5.1999998092651, 182.25) },
        { coords = vector4(822.23999023438, -3144.9899902344, 5.1999998092651, 182.25) },
        { coords = vector4(826.36999511719, -3145.0400390625, 5.1999998092651, 182.25) },
        { coords = vector4(830.53002929688, -3145.0300292969, 5.1999998092651, 182.25) },
        { coords = vector4(834.42999267578, -3144.7700195312, 5.1999998092651, 182.25) },
        { coords = vector4(838.57000732422, -3144.8898925781, 5.1999998092651, 182.25) },
        { coords = vector4(842.61999511719, -3145.0100097656, 5.1999998092651, 182.25) },
        { coords = vector4(846.78997802734, -3145.0100097656, 5.1999998092651, 182.25) },
        { coords = vector4(850.78997802734, -3145.2399902344, 5.1999998092651, 182.25) },
        { coords = vector4(854.90002441406, -3145.2600097656, 5.1999998092651, 182.25) },
        { coords = vector4(859.04998779297, -3145.1398925781, 5.1999998092651, 182.25) },
        { coords = vector4(862.96997070312, -3145.1398925781, 5.1999998092651, 182.25) },
        { coords = vector4(867.02001953125, -3145.419921875, 5.2199997901917, 182.25) },
        { coords = vector4(818.34002685547, -3128.9799804688, 5.1999998092651, 0.19) },
        { coords = vector4(822.29998779297, -3128.9399414062, 5.1999998092651, 0.19) },
        { coords = vector4(826.57000732422, -3129.080078125, 5.1999998092651, 0.19) },
        { coords = vector4(830.51000976562, -3129.1899414062, 5.1999998092651, 0.19) },
        { coords = vector4(834.75, -3129.0900878906, 5.1999998092651, 0.19) },
        { coords = vector4(838.59002685547, -3129.2199707031, 5.1999998092651, 0.19) },
        { coords = vector4(842.78997802734, -3128.9799804688, 5.1999998092651, 0.19) },
        { coords = vector4(846.73999023438, -3129.25, 5.1999998092651, 0.19) },
        { coords = vector4(851.09002685547, -3129.3701171875, 5.1999998092651, 0.19) },
        { coords = vector4(854.72998046875, -3129.2199707031, 5.1999998092651, 0.19) },
        { coords = vector4(858.86999511719, -3129.169921875, 5.1999998092651, 0.19) },
        { coords = vector4(863.10998535156, -3128.8601074219, 5.1999998092651, 0.19) },
    },

    -- When using the /refreshsupply command any vehicle that is not in vehicles.lua will be removed
    RefreshSupplyCommandDeleteUnknownVehicles = true,
}
