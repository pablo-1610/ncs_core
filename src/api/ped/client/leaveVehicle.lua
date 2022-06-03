---leaveVehicle
---@param pedId number
---@param instant boolean
---@return void
---@public
function API_Ped:leaveVehicle(pedId, instant)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    TaskLeaveAnyVehicle(pedId, 0, instant and 16 or 0)
end