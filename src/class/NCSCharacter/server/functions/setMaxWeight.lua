---setMaxWeight
---@public
---@return number
function NCSCharacter:setMaxWeight(maxWeight)
    self.inventory.maxWeight = maxWeight
    return (self.inventory.maxWeight)
end