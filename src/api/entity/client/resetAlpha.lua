---resetAlpha
---@param entityId number
---@return void
---@public
function API_Entity:resetAlpha(entityId)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    ResetEntityAlpha(entityId)
end