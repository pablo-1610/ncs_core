---getFuelLevel
---@param vehicleId number
---@public
function API_Vehicles:getFuelLevel(vehicleId)
    if (not (DoesEntityExist(vehicleId))) then
        return NCS:die("Target vehicle doesn't exist")
    end

    return GetVehicleFuelLevel(vehicleId)
end