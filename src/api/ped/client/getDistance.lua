---getDistance
---@param pedId number
---@param coords table
---@return number
---@public
function API_Ped:getDistance(pedId, coords)
    local distance <const> = #(API_Ped:getPosition(pedId) - coords)
    return (distance)
end
