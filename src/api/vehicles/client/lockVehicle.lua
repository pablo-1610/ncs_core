---lockVehicle
---@param vehicleId number
---@return void
---@public
function API_Vehicles:lockVehicle(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    return SetVehicleDoorsLocked(vehicleId, 2)
end