---delete
---@param objectId number
---@return void
---@public
function API_Objects:delete(objectId)
    if (not (DoesEntityExist(objectId))) then
        return _NCS:die("Target entity does not exists")
    end    

    if IsEntityAnObject(objectId) then
        DeleteEntity(objectId)
    end
end