---repair
---@param vehicleEntity number
---@param repairDeformation boolean
---@return void
---@public
function API_Vehicles:repair(vehicleEntity)
    SetVehicleFixed(vehicleEntity)
    SetVehicleDirtLevel(vehicleEntity, 0.0)
 
    SetVehicleDeformationFixed(vehicleEntity)
 end