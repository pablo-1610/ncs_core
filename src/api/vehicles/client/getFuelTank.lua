---getFuelTank
---@param vehicleId number
---@return number
---@public
function API_Vehicles:getFuelTank(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    ---@type number
    local fuel <const> = GetVehicleHandlingFloat(vehicleId, "CHandlingData", "fPetrolTankVolume")
    return (fuel)
end