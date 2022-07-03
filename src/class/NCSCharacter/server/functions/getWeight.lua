---getWeight
---@public
---@return number
function NCSCharacter:getWeight()
    local weight = 0

    for _, item in pairs(self.inventory.items or {}) do
        weight = weight + (MOD_Items:get(item.name).weight or 0) * item.count
    end

    return (weight)
end