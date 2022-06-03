---getModel
---@param vehicleId number
---@return string
---@public
function API_Vehicles:getModel(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    ---@type string
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleId))
    return (model)
end