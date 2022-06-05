---isClose
---@param self NCSCharacter
---@param position table
---@param distance number
---@return boolean
---@public
function NCSCharacter.isClose(self, position, distance)
    return (#(self:getPosition() - position) <= distance)
end