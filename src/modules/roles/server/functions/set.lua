---set
---@param identifier string
---@param role NCSRole
function MOD_Roles:set(identifier, role)
    self.list[identifier] = role
end