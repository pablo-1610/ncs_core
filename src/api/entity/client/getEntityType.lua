---getEntityType
---@param entityId number
---@return bool
---@public
function API_Entity:GetEntityType(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end
    
    return GetEntityType(entityId)
end