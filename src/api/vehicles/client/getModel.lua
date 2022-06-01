---getModel
---@param vehicleId number
---@return string
---@public
function API_Vehicles:getModel(vehicleId)
    if (vehicleId) then
        ---@type string
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleId))
        return (model)
    end
    _NCS:trace('Unable to find vehicle', 1)
end