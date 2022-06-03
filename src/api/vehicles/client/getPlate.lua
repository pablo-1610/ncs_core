---getPlate
---@param vehicleId number
---@return string
---@public
function API_Vehicles:getPlate(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        local plate <const> = (GetVehicleNumberPlateText(vehicleId))
        return (plate)
    end
    NCS:die("vehicleEntity does not exists")
end

