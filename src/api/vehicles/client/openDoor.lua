---openDoor
---@param vehicleId number
---@param doorId number
---@param canBeClosed boolean
---@param instantly boolean
---@return void
---@public
function API_Vehicles:openDoor(vehicleId, doorId, canBeClosed, instantly)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    return SetVehicleDoorOpen(vehicleId, doorId, canBeClosed or false, instantly or false)
end