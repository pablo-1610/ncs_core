---driveVehicle
---@param pedId number
---@return bool, number
---@public
function API_Ped:driveVehicle(pedId)
    local inVehicle = IsPedInAnyVehicle(pedId, false)
    if (inVehicle) then
        local Veh = GetVehiclePedIsIn(pedId, false)
        local PlaceVeh = GetPedInVehicleSeat(Veh, -1)
        if (PlaceVeh == pedId) then
            return true, (Veh)
        else return false end
    else return (inVehicle) end
end