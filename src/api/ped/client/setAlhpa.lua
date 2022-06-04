---setAlpha
---@param pedId number
---@param value number
---@return void
---@public
function API_Ped:setAlpha(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    SetEntityAlpha(pedId, value, false)
end