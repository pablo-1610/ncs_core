---unlockVehicle
---@param vehicleId number
---@return void
---@public
function API_Vehicles:unlockVehicle(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        return SetVehicleDoorsLocked(vehicleId, 1)
    end
    NCS:die("vehicleEntity does not exists")
end