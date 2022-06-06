---getItem
---@param name string
---@return table
---@public
function MOD_Items:getItem(name)
    return self.list[name]
end

---getUsable
---@param name string
---@return function
---@public
function MOD_Items:getCanUse(name)
    return self.usable[name]
end