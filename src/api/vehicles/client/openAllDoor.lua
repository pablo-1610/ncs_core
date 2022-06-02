---openAllDoor
---@param vehicleId number
---@param canBeClosed boolean
---@param instantly boolean
---@return void
---@public
function API_Vehicles:openAllDoor(vehicleId, canBeClosed, instantly)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    for i = 0, 5 do
        SetVehicleDoorOpen(vehicleId, i, canBeClosed or false, instantly or false)
    end
    return
end