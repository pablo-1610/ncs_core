---vehicles_deleteVehicle
---@param vehicleEntity number
---@return void
---@public
function _NCS:vehicles_deleteVehicle(vehicleEntity)
    SetEntityAsMissionEntity(vehicleEntity, 0, 1)
    DeleteVehicle(vehicleEntity)
end
