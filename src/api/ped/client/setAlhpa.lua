---setAlpha
---@param pedId number
---@param value number
---@public
function API_Ped:setAlpha(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    SetEntityAlpha(pedId, value, false)
end