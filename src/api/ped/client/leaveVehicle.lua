---leaveVehicle
---@param pedId number
---@param instant boolean
---@public
function API_Ped:leaveVehicle(pedId, instant)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    TaskLeaveAnyVehicle(pedId, 0, instant and 16 or 0)
end