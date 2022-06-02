---driveVehicle
---@param pedId number
---@return boolean, number
---@public
function API_Ped:driveVehicle(pedId)
    local inVehicle = IsPedInAnyVehicle(pedId, false)
    if (not inVehicle) then
        return nil, nil
    end
    ---@type number
    local vehicleEntity = GetVehiclePedIsIn(pedId, false)
    local placeVeh = GetPedInVehicleSeat(vehicleEntity, -1)
    if (placeVeh == pedId) then
        return true, vehicleEntity
    end
    return false, nil
end
