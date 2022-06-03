---openDoor
---@param vehicleId number
---@param doorId number
---@param canBeClosed boolean
---@param instantly boolean
---@return void
---@public
function API_Vehicles:openDoor(vehicleId, doorId, canBeClosed, instantly)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        return SetVehicleDoorOpen(vehicleId, doorId, canBeClosed or false, instantly or false)
    end
    NCS:die("vehicleEntity does not exists")
end