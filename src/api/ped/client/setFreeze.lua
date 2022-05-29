---setFreeze
---@param ped number
---@param state boolean
---@return void
---@public
function API_Ped:setFreeze(ped, state)
    FreezeEntityPosition(ped, state)
end