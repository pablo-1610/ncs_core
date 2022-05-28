---getModel
---@param vehicle number
---@return string
---@public

function API_Vehicles:getModel(vehicleId)
    if (vehicleId) then
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleId))
        return (model)
    end
    _NCS:trace('Unable to find vehicle', 1)
end