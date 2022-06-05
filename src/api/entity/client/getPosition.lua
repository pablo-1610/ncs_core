---getPosition
---@param entityId number
---@return table<number, number, number>
---@public
function API_Entity:getPosition(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end
    
    return (GetEntityCoords(entityId))
end