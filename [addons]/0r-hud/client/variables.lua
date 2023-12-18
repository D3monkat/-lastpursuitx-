Koci           = {}
Koci.Framework = Utils.Functions:GetFramework()
Koci.Utils     = Utils.Functions
Koci.Callbacks = {}
Koci.Client    = {
    HUD = {
        data = {
            playerServerId = -1,
            isVisible = false,
            bars = {
                voice = {},
                health = nil,
                armor = nil,
                hunger = nil,
                thirst = nil,
                oxygen = nil,
                stamina = nil,
                stress = nil,
                terminal = nil,
                leaf = nil,
            },
            money = {
                bank = 0,
                cash = 0
            },
            vehicle = {
                thick = {
                    wait = 100
                },
                entity = nil,
                kmH = Config.Settings.VehicleHUD.kmH,
                show = false,
                isSeatbeltOn = false,
                isPassenger = false,
                cruiseControlStatus = nil,
                inVehicle = false,
                speed = 0,
                fuel = {
                    level = 0,
                    max_level = 0,
                },
                rpm = 0,
                gear = nil,
                miniMap = {
                    style = "square"
                },
                speedoMeter = {
                    fps = 30
                }
            }
        },
    }
}
