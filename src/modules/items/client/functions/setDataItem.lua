---setDataItem
---@param itemName string
---@param data table
---@return void
---@public
function MOD_Items:setDataItem(itemName, inventoryName)
    if not self.list[itemName] then
        return NCS:die(("Item not found: %s"):format(itemName))
    end
    self.list[itemName].inventoryName = inventoryName
end