---getDistance
---@param pedId number
---@param coords table
---@return number
---@public
function API_Ped:getDistance(pedId, coords)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    local distance <const> = #(API_Entity:getPosition(pedId) - coords)
    return (distance)
end
