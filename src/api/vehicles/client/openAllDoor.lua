---openAllDoor
---@param vehicleId number
---@param canBeClosed boolean
---@param instantly boolean
---@public
function API_Vehicles:openAllDoor(vehicleId, canBeClosed, instantly)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        for i = 0, 5 do
            SetVehicleDoorOpen(vehicleId, i, canBeClosed or false, instantly or false)
        end
    return
    end
    _NCS:die("vehicleEntity does not exists")
end