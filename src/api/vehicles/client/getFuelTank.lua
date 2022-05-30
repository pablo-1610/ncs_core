---getFuelTank
---@param vehicle number
---@return number
---@public

function API_Vehicles:getFuelTank(vehicleId)
    if (vehicleId) then
        local fuel <const> = GetVehicleHandlingFloat(vehicleId, "CHandlingData", "fPetrolTankVolume")
        return fuel
    end
    _NCS:trace('Unable to find vehicle', 1)
end