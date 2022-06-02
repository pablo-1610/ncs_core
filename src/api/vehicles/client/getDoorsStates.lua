---getDoorsStates
---@param vehicleId number
---@return number
---@public
function API_Vehicles:getDoorsStates(vehicleId)
    if (vehicleId) and (DoesEntityExist(vehicleId)) then
        ---@type number
        local state <const> = (GetVehicleDoorLockStatus(vehicleId))
        return (state)
    end
    _NCS:die("vehicleEntity does not exists")
end