---setFuel
---@param vehicleId number
---@param fuel number
---@public
function API_Vehicles:setFuel(vehicleId, fuel)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    return SetVehicleFuelLevel(vehicleId, fuel)
end
