---hasPermission
---@param permission string
---@return boolean
---@public
function NCSRole:hasPermission(permission)
    return (self.permissions[permission] ~= nil)
end