---getPosition
---@param pedId number
---@return table<number, number, number>
---@public
function API_Ped:getPosition(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped does not exists")
    end    
    
    return (GetEntityCoords(pedId))
end