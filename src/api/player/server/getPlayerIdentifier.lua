---getIdentifier
---@param playerSrc number
---@return table
---@public
function API_Player:getIdentifier(playerSrc)
    return (self:getIdentifiers(playerSrc)[MOD_Config:getIdentificationType()])
end