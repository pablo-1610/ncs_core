---getDistance
---@param pedId number
---@param coords table
---@return distance
---@public
function API_Player:getDistance(pedId, coords)
    local distance <const> =  #(API_Ped:getPosition(pedId) - coords)
    return distance
end