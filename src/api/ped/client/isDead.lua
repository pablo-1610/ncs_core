---isDead
---@param pedId number
---@return boolean
---@public
function API_Ped:isDead(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    return (API_Ped:getHealth(pedId) <= 0)
end