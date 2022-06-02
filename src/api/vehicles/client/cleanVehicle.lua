---clean
---@param vehicleId number
---@public
function API_Vehicles:clean(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    SetVehicleDirtLevel(vehicleId, 0.0)
    WashDecalsFromVehicle(vehicleId, 1.0)
end