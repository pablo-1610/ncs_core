---lockVehicle
---@param vehicleId number
---@return void
---@public
function API_Vehicles:lockVehicle(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    return SetVehicleDoorsLocked(vehicleId, 2)
end