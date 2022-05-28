---getVehicleStates
---@param vehicle number
---@return table
---@public
function API_Vehicles:getStates(vehicle)
    local vehicleState = {}
    if (GetVehiclePedIsIn(PlayerPedId()) ~= 0) then
        if (vehicle ~= nil) then
            vehicleState.engineHealth = GetVehicleEngineHealth(vehicle)
            vehicleState.vehicleBodyHealth = GetVehicleBodyHealth(vehicle)
            vehicleState.dirtLevel = GetVehicleDirtLevel(vehicle)
            if (GetIsVehicleEngineRunning(vehicle) == 1) then
                vehicleState.engineState = true
            else
                vehicleState.engineState = false
            end
        else
            vehicleState.engineHealth = GetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId()))
            vehicleState.vehicleBodyHealth = GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId()))
            vehicleState.dirtLevel = GetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId()))
            if (GetIsVehicleEngineRunning(GetVehiclePedIsIn(PlayerPedId())) == 1) then
                vehicleState.engineState = true
            else
                vehicleState.engineState = false
            end
        end
        return vehicleState
    else
        return _NCS:trace("Player is not in any vehicle", 5)
    end
end
