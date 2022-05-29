---getPosition
---@param pedId number
---@return table<number, number, number>
---@public
function API_Ped:getPosition(pedId)
    return GetEntityCoords(pedId)
end