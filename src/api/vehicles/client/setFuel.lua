---setFuel
---@param vehicleId number
---@param fuel number
---@public
function API_Vehicles:setFuel(vehicleId, fuel)
    if (vehicleId) then
        return SetVehicleFuelLevel(vehicleId, fuel)
    end
    _NCS:trace("Unable to find vehicle", 1)
end
