---isDead
---@param pedId number
---@return boolean
---@public
function API_Ped:isDead(pedId)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    if (API_Ped:getHealth(pedId) <= 0) then
        return (true)
    end

    return (false)
end