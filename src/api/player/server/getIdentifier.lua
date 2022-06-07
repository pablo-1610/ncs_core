---getIdentifier
---@param playerSrc number
---@return table
---@public
function API_Player:getIdentifier(playerSrc)
    if (not playerSrc or playerSrc <= 0) then
        return NCS:die("Unable to find identifier : source is invalid")
    end
    return (self:getIdentifiers(playerSrc)[MOD_Config:getIdentificationType()])
end