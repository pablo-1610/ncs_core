---getPosition
---@param pedId number
---@return table
---@public
function API_Ped:getPosition(pedId)
    return GetEntityCoords(pedId)
end