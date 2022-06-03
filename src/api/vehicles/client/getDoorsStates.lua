---getDoorsStates
---@param vehicleId number
---@return number
---@public
function API_Vehicles:getDoorsStates(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    local state <const> = (GetVehicleDoorLockStatus(vehicleId))
    return (state)
end