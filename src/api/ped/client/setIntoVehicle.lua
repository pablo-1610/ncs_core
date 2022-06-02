---setIntoVehicle
---@param pedId number
---@param vehicle number
---@return void
---@public
function API_Ped:setIntoVehicle(pedId, vehicleId, seat)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end
    if (not (DoesEntityExist(vehicleId))) then
        return _NCS:die("Target vehicle does not exists")
    end

    TaskWarpPedIntoVehicle(pedId, vehicleId, seat or -1)
end