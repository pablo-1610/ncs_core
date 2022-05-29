---setVisible
---@param pedId number
---@param state boolean
---@return void
---@public
function API_Ped:setVisible(pedId, state)
    SetEntityVisible(pedId, state)
end