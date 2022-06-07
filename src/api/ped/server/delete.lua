---delete
---@param pedId number
---@return void
---@public
function API_Ped:delete(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end
    if (not IsEntityAPed(pedId)) then
        return NCS:die("Target ped doesn't exist")
    end
    DeleteEntity(pedId)
end