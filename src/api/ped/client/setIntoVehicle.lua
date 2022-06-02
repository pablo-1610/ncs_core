---setIntoVehicle
---@param pedId number
---@param vehicle number
---@public
function API_Ped:setIntoVehicle(pedId, vehicleId, seat)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    TaskWarpPedIntoVehicle(pedId, vehicleId, seat or -1)
end