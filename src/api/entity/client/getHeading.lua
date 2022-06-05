---getHeading
---@param entityId number
---@return number
---@public
function API_Entity:getHeading(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    return (GetEntityHeading(entityId))
end