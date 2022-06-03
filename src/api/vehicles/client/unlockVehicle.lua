---unlockVehicle
---@param vehicleId number
---@return void
---@public
function API_Vehicles:unlockVehicle(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    return SetVehicleDoorsLocked(vehicleId, 1)
end