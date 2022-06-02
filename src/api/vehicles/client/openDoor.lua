---openDoor
---@param vehicleId number
---@param doorId number
---@param canBeClosed boolean
---@param instantly boolean
---@public
function API_Vehicles:openAllDoor(vehicleId, doorId, canBeClosed, instantly)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        SetVehicleDoorOpen(vehicleId, doorId, canBeClosed or false, instantly or false)
    end
    _NCS:die("vehicleEntity does not exists")
end