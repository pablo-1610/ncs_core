---clean
---@param vehicleEntity number
---@return void
---@public
function API_Vehicles:clean(vehicleEntity)
    SetVehicleDirtLevel(vehicleEntity, 0.0)
    WashDecalsFromVehicle(vehicleEntity, 1.0)
end