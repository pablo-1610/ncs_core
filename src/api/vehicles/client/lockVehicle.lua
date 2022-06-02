---lockVehicle
---@param vehicleId number
---@public
function API_Vehicles:lockVehicle(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        return SetVehicleDoorsLocked(vehicleId, 2)
    end
    _NCS:die("vehicleEntity does not exists")
end