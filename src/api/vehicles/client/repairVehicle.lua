---repair
---@param vehicleId number
---@public
function API_Vehicles:repair(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    SetVehicleFixed(vehicleId)
    SetVehicleDirtLevel(vehicleId, 0.0)
    SetVehicleDeformationFixed(vehicleId)
 end
