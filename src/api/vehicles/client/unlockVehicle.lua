---unlockVehicle
---@param vehicleId number
---@public
function API_Vehicles:unlockVehicle(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        return SetVehicleDoorsLocked(vehicleId, 1)
    end
    _NCS:die("vehicleEntity does not exists")
end