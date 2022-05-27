---delete
---@param vehicleEntity number
---@return void
---@public
function API_Vehicles:delete(vehicleEntity)
    SetEntityAsMissionEntity(vehicleEntity, 0, 1)
    DeleteVehicle(vehicleEntity)
end
