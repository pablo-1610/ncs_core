---getVehicleStates
---@param vehicleEntity number
---@return table
---@public
function API_Vehicles:getStates(vehicleEntity)
    vehicleEntity = (vehicleEntity or 0) > 0 and vehicleEntity or GetVehiclePedIsIn(PlayerPedId())

    if (not (DoesEntityExist(vehicleEntity))) then
        return _NCS:trace("vehicleEntity does not exists or player is not in any vehicle", 5)
    end
    
    local vehicleState = {
        engineHealth = GetVehicleEngineHealth(vehicleEntity),
        vehicleBodyHealth = GetVehicleBodyHealth(vehicleEntity),
        dirtLevel = GetVehicleDirtLevel(vehicleEntity),
        engineState = (GetIsVehicleEngineRunning(vehicleEntity) == 1)
    }

    return (vehicleState)
end
