---leaveVehicle
---@param pedId number
---@param instant boolean
---@public
function API_Ped:leaveVehicle(pedId, instant)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    if (instant) then
        TaskLeaveAnyVehicle(pedId, 0, 16)
    else
        TaskLeaveAnyVehicle(pedId, 0, 0)
    end
end