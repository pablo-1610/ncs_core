---delete
---@param objectId number
---@return void
---@public
function API_Objects:delete(objectId)
    if (not (DoesEntityExist(objectId))) then
        return NCS:die("Target object doesn't exist")
    end
    if (not IsEntityAnObject(objectId)) then
        return NCS:die("Target object doesn't exist (the entity isn't a object.")
    end

    DeleteEntity(objectId)
end