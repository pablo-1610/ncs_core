---lockVehicle
---@param vehicleId number
---@return void
---@public
function API_Vehicles:lockVehicle(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        return SetVehicleDoorsLocked(vehicleId, 2)
    end
    NCS:die("vehicleEntity does not exists")
end