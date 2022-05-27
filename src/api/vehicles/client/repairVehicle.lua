---repair
---@param vehicleEntity number
---@param repairDeformation boolean
---@return void
---@public
function API_Vehicles:repair(vehicleEntity, repairDeformation)
    SetVehicleFixed(vehicleEntity)
    SetVehicleDirtLevel(vehicleEntity, 0.0)

    if repairDeformation then
        SetVehicleDeformationFixed(vehicleEntity)
    end
end