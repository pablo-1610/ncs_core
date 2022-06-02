---getPlate
---@param vehicleId number
---@return string
---@public
function API_Vehicles:getPlate(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    local plate <const> = (GetVehicleNumberPlateText(vehicleId))
    return (plate)
end

