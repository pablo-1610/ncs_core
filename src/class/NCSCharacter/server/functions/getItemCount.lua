---getItemCount
---@param itemName string
---@public
---@return number
function NCSCharacter:getItemCount(itemName)
    if (not MOD_Items:exists(itemName)) then
        return NCS:die(("The item ^3%s^7 does not exist !"):format(itemName or "INVALID"))
    end

    return (self:hasItem(itemName) and self.inventory.items[itemName].count or 0)
end