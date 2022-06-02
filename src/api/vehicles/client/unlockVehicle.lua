---unlockVehicle
---@param vehicleId number
---@return void
---@public
function API_Vehicles:unlockVehicle(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end
    return SetVehicleDoorsLocked(vehicleId, 1)
end