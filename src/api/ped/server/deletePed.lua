---deletePed
---@param pedId number
---@return void
---@public
function API_Ped:deletePed(pedId)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end
    if (IsEntityAPed(pedId)) then
        DeleteEntity(pedId)
    end
end