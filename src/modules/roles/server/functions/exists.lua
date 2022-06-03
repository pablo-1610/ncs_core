---exists
---@param identifier string
---@return boolean
---@public
function MOD_Roles:exists(identifier)
    return (self.list[identifier] ~= nil)
end