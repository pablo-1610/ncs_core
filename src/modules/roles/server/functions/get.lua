---get
---@param identifier string
---@return NCSRole
---@public
function MOD_Roles:get(identifier)
    return (self.list[identifier])
end