---getHeading
---@param pedId number
---@return number
---@public
function API_Ped:getHeading(pedId)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    return (GetEntityHeading(PlayerPedId()))
end