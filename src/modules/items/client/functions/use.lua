---use
---@param self NCSItems
---@param name string
---@return function
---@public
function MOD_Items:use(name)
    if MOD_Items:getCanUse(name) then
        return self.usable[name].callback()
    else
        NCS:die(("Item <%s> can't be used."):format(name))
    end
end