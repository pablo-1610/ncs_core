---getStates
---@param vehicleId number
---@return table
---@public
function API_Vehicles:getStates(vehicleId)

    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist or player is not in any vehicle")
    end

    vehicleId = (vehicleId or 0) > 0 and vehicleId or GetVehiclePedIsIn(PlayerPedId())
    
    local vehicleState = {
        engineHealth = GetVehicleEngineHealth(vehicleEntity),
        vehicleBodyHealth = GetVehicleBodyHealth(vehicleEntity),
        dirtLevel = GetVehicleDirtLevel(vehicleEntity),
        engineState = (GetIsVehicleEngineRunning(vehicleEntity) == 1)
    }

    return (vehicleState)
end
