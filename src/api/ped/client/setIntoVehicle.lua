---setIntoVehicle
---@param pedId number
---@param vehicle number
---@return void
---@public
function API_Ped:setIntoVehicle(pedId, vehicleId, seat)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    TaskWarpPedIntoVehicle(pedId, vehicleId, seat or -1)
end