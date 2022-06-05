---setVisible
---@param entityId number
---@param state boolean
---@return void
---@public
function API_Entity:setVisible(entityId, state)
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity doesn't exist")
    end
    
    SetEntityVisible(entityId, state)
end