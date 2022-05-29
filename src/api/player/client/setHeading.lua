---setHeading
---@param heading number
---@return void
---@public
function API_Player:setHeading(heading)
    SetEntityHeading(PlayerPedId(), heading)
end