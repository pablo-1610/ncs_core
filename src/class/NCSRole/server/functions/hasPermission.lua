---hasPermission
---@param permission string
---@return boolean
---@public
---@param self NCSRole
function NCSRole.hasPermission(self, permission)
    return (self.permissions[permission] ~= nil)
end