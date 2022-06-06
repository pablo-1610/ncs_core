---getItem
---@param name string
---@return table
---@public
function MOD_Items:getItem(name)
    if (not (self.list[name])) then
        return NCS:die(("Item not found: %s"):format(name))
    end
    return self.list[name]
end

---getUsable
---@param name string
---@return function
---@public
function MOD_Items:getCanUse(name)
    return self.usable[name]
end