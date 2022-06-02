---getDistance
---@param pedId number
---@param coords table
---@return number
---@public
function API_Ped:getDistance(pedId, coords)
    if (not (DoesEntityExist(pedId)) or (not pedId)) then
        return _NCS:die("Target ped does not exists")
    end
    local distance <const> = #(API_Ped:getPosition(pedId) - coords)
    return (distance)
end
