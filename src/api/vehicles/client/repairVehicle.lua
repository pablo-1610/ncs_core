---repair
---@param vehicleEntity number
---@public
function API_Vehicles:repair(vehicleEntity)
    if (not (DoesEntityExist(vehicleEntity))) then
        return _NCS:die("vehicleEntity does not exists")
    end

    SetVehicleFixed(vehicleEntity)
    SetVehicleDirtLevel(vehicleEntity, 0.0)
    SetVehicleDeformationFixed(vehicleEntity)
 end
