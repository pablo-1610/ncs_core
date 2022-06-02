---getVehicleStates
---@param vehicleId number
---@return table
---@public
function API_Vehicles:getStates(vehicleId)
    vehicleId = (vehicleId or 0) > 0 and vehicleId or GetVehiclePedIsIn(PlayerPedId())

    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end
    
    local vehicleState = {
        engineHealth = GetVehicleEngineHealth(vehicleId),
        vehicleBodyHealth = GetVehicleBodyHealth(vehicleId),
        dirtLevel = GetVehicleDirtLevel(vehicleId),
        engineState = (GetIsVehicleEngineRunning(vehicleId) == 1)
    }

    return (vehicleState)
end
