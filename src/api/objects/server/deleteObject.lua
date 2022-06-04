---deleteObject
---@param objectId number
---@return void
---@public
function API_Objects:deleteObject(objectId)
    if (not (DoesEntityExist(objectId))) then
        return NCS:die("Target object doesn't exist")
    end
    if (IsEntityAnObject(objectId)) then
        DeleteEntity(objectId)
    else
        return NCS:die("Target object doesn't exist (the entity isn't a object.")
    end
end