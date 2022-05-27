---vehicles_repairVehicle
---@param vehicleEntity number
---@return void
---@public
function _NCS:vehicles_repairVehicle(vehicleEntity)
    SetVehicleFixed(vehicleEntity)
    SetVehicleDirtLevel(vehicleEntity, 0.0)
end