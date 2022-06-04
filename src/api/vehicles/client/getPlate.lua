---getPlate
---@param vehicleId number
---@return string
---@public
function API_Vehicles:getPlate(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    local plate <const> = (GetVehicleNumberPlateText(vehicleId))
    return (plate)
end

