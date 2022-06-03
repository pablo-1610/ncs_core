---repair
---@param vehicleId number
---@return void
---@public
function API_Vehicles:repair(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    SetVehicleFixed(vehicleId)
    SetVehicleDirtLevel(vehicleId, 0.0)
    SetVehicleDeformationFixed(vehicleId)
 end
