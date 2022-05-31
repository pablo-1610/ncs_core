---setWalkToPosition
---@param pedId number
---@param coords table<number, number, number>
---@param speed number
---@param duration number
---@param heading number
---@param distanceToSlide number
---@return void
---@public
function API_Ped:setWalkToPosition(pedId, coords, speed, duration, heading, distanceToSlide)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end
    
    TaskGoStraightToCoord(pedId, coords, speed, duration, heading, distanceToSlide)
end
