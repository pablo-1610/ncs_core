---resetAlpha
---@param pedId number
---@public
function API_Ped:resetAlpha(pedId)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    ResetEntityAlpha(pedId)
end