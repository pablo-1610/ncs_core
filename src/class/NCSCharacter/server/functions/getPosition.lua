---getPosition
---@param self NCSCharacter
---@return table
---@public
function NCSCharacter.getPosition(self)
    return (GetEntityCoords(self:getPed()))
end