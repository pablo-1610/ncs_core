---clean
---@param vehicleEntity number
---@public
function API_Vehicles:clean(vehicleEntity)
    if (not (DoesEntityExist(vehicleEntity))) then
        return _NCS:die("vehicleEntity does not exists")
    end

    SetVehicleDirtLevel(vehicleEntity, 0.0)
    WashDecalsFromVehicle(vehicleEntity, 1.0)
end