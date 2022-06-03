---getDoorsStates
---@param vehicleId number
---@return number
---@public
function API_Vehicles:getDoorsStates(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        local state <const> = (GetVehicleDoorLockStatus(vehicleId))
        return (state)
    end
    NCS:die("vehicleEntity does not exists")
end