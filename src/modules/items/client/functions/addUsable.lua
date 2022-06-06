---addUsable
---@param itemName string
---@param callback function
---@return void
function MOD_Items:addUsable(itemName, callback)
    if MOD_Items.list[itemName] then
        MOD_Items.usable[itemName] = {
            callback = callback
        }
    else
        NCS:die(("Item <%s> does not exist."):format(itemName))
    end
end