function GetVehiclesData(model)
    local default = {
       name = GetVehicleLabel_model(model),
       price = 0,
       category = 'Unknown',
       model = 'Unknown'
    }
    local self = {}
    if Config.VehiclesData.ENABLE and PriceData and PriceData[model] then
        self.name = PriceData[model].name or default.name
        self.price = PriceData[model].price or default.price
        self.category = PriceData[model].category or default.category
        self.model = PriceData[model].model or default.model
    else
        self.name = default.name
        self.price = default.price
        self.category = default.category
        self.model = default.model
    end
    return self
end

function GetReturnVehiclePrice(model)
    if Config.VehiclesData.ENABLE and Config.Return_Vehicle.ENABLE then
        if Config.Return_Vehicle.method == 'vehicles_data' and PriceData and PriceData[model] and PriceData[model].price then
            return Round(PriceData[model].price*0.01*Config.Return_Vehicle.vehiclesdata_price_multiplier)
        else
            return Config.Return_Vehicle.default_price
        end
    elseif Config.Return_Vehicle.ENABLE then
        return Config.Return_Vehicle.default_price
    else
        return nil
    end
end

function GetVehicleLabel(vehicle)
    local vehicleLabel = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        
    if vehicleLabel == 'null' or vehicleLabel == 'carnotfound' or vehicleLabel == 'NULL' then
        vehicleLabel = L('vehicle')
    end
    if vehicleLabel ~= 'null' or vehicleLabel ~= 'carnotfound' or vehicleLabel ~= 'NULL'then
        local text = GetLabelText(vehicleLabel)
        if text == nil or text == 'null' or text == 'NULL' then
            vehicleLabel = vehicleLabel
        else
            vehicleLabel = text
        end
    end
    return vehicleLabel
end

function GetVehicleLabel_model(model)
    local vehicleLabel = string.lower(GetDisplayNameFromVehicleModel(model))
        
    if vehicleLabel == 'null' or vehicleLabel == 'carnotfound' or vehicleLabel == 'NULL' then
        vehicleLabel = L('vehicle')
    end
    if vehicleLabel ~= 'null' or vehicleLabel ~= 'carnotfound' or vehicleLabel ~= 'NULL'then
        local text = GetLabelText(vehicleLabel)
        if text == nil or text == 'null' or text == 'NULL' then
            vehicleLabel = vehicleLabel
        else
            vehicleLabel = text
        end
    end
    return vehicleLabel
end