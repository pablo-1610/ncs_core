---delete
---@param vehicleEntity number
---@public
function API_Vehicles:delete(vehicleEntity)
    if (not (DoesEntityExist(vehicleEntity))) then
        return _NCS:die("vehicleEntity does not exists")
    end

    SetEntityAsMissionEntity(vehicleEntity, 0, 1)
    DeleteVehicle(vehicleEntity)
end
