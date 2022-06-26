---hasItem
---@param itemName string
---@param count number
---@public
---@return boolean
function NCSCharacter:hasItem(itemName, count)
    if (not MOD_Items:exists(itemName)) then
        return NCS:die(("The item ^3%s^7 does not exist !"):format(itemName or "INVALID"))
    end

    return (not count and self.inventory.items[itemName] ~= nil or self.inventory.items[itemName] and self.inventory.items[itemName].count >= tonumber(count))
end