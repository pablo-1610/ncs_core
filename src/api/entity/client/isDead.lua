---isDead
---@param entityId number
---@return boolean
---@public
function API_Entity:isDead(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    return IsEntityDead(entityId) == 1
end