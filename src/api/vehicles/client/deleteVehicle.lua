---delete
---@param vehicleId number
---@public
function API_Vehicles:delete(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    SetEntityAsMissionEntity(vehicleId, 0, 1)
    DeleteVehicle(vehicleId)
end
