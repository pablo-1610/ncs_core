---getModel
---@param vehicleId number
---@return string
---@public
function API_Vehicles:getModel(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    ---@type string
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleId))
    return (model)
end