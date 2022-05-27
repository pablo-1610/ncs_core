---deleteVehicle
---@param vehicle Vehicle
---@return void
---@public
function _NCS:deleteVehicle(vehicle)
    SetEntityAsMissionEntity(vehicle, 0, 1)
    DeleteVehicle(vehicle)
end
