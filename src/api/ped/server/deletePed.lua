---deletePed
---@param pedId number
---@return void
---@public
function API_Ped:deletePed(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end
    if (IsEntityAPed(pedId)) then
        DeleteEntity(pedId)
    else
        return NCS:die("Target ped doesn't exist")
    end
end