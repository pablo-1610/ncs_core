---setFuel
---@param vehicleId number
---@param fuel number
---@public
function API_Vehicles:setFuel(vehicleId, fuel)
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    return SetVehicleFuelLevel(vehicleId, fuel)
end
