---use
---@param name string
---@return function
---@public
function MOD_Items:use(name)
    if MOD_Items:getCanUse(name) then
        return self.usable[name].callback()
    else
        NCS:die('Item <' .. name .. '> does not exist.')
    end
end