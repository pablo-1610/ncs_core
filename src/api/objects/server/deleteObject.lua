---deleteObject
---@param objectId number
---@return void
---@public
function API_Objects:deleteObject(objectId)
    if (not (DoesEntityExist(objectId))) then
        return NCS:die("Target entity does not exists")
    end
    if (IsEntityAnObject(objectId)) then
        DeleteEntity(objectId)
    end
end