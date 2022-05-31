---getVehicleStates
---@param vehicleEntity number
---@return table
---@public
function API_Vehicles:getStates(vehicleEntity)
    local vehicleState = {}
    if (GetVehiclePedIsIn(PlayerPedId()) ~= 0) then
        if (vehicleEntity ~= nil) then
            vehicleState.engineHealth = GetVehicleEngineHealth(vehicleEntity)
            vehicleState.vehicleBodyHealth = GetVehicleBodyHealth(vehicleEntity)
            vehicleState.dirtLevel = GetVehicleDirtLevel(vehicleEntity)
            if (GetIsVehicleEngineRunning(vehicleEntity) == 1) then
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
