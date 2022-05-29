---setPosition
---@param pedId number
---@param coords table<number, number, number>
---@return void
---@public
function API_Ped:setPosition(pedId, coords)
    SetEntityCoords(pedId, coords)
end
