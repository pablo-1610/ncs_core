---setHeading
---@param entityId number
---@param heading number
---@return void
---@public
function API_Entity:setHeading(entityId, heading)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end
    
    SetEntityHeading(entityId, heading)
end