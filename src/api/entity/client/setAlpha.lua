---setAlpha
---@param entityId number
---@param value number
---@return void
---@public
function API_Entity:setAlpha(entityId, value)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    SetEntityAlpha(entityId, value, false)
end