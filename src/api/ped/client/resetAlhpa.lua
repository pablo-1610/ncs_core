---resetAlpha
---@param pedId number
---@return void
---@public
function API_Ped:resetAlpha(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped does not exists")
    end

    ResetEntityAlpha(pedId)
end