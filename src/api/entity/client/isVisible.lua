---isVisible
---@param entityId number
---@return bool
---@public
function API_Entity:isVisible(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end
    
    return IsEntityVisible(entityId)
end
