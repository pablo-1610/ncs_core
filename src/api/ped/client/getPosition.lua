---getPosition
---@param ped number
---@return table
---@public
function API_Ped:getPosition(ped)
    return GetEntityCoords(ped)
end