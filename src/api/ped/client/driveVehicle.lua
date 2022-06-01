---driveVehicle
---@param pedId number
---@return boolean, number
---@public
function API_Ped:driveVehicle(pedId)
    local inVehicle = IsPedInAnyVehicle(pedId, false)
    if (inVehicle) then
        ---@type number
        local vehicleEntity = GetVehiclePedIsIn(pedId, false)
        local placeVeh = GetPedInVehicleSeat(vehicleEntity, -1)
        if (placeVeh == pedId) then
            return true, vehicleEntity
        else
            return false, nil
        end
    else
        return nil, nil
    end
end
