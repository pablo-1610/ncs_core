---repairVehicle
---@param vehicleEntity number
---@return void
---@public
function _NCS:repairVehicle(vehicleEntity)
    SetVehicleFixed(vehicleEntity)
    SetVehicleDirtLevel(vehicleEntity, 0.0)
    _NCS:trace("Vehicle Delete", 3)
end