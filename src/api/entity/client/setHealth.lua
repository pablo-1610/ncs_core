---setHealth
---@param entityId number
---@param value number
---@return void
---@public
function API_Entity:setHealth(entityId, value)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end

    SetEntityHealth(entityId, value)
end