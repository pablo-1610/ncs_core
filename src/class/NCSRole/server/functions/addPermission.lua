---addPermission
---@param permission string
---@return void
---@public
function NCSRole:addPermission(permission)
    if (self:hasPermission(permission)) then
        return
    end
    self.permissions[permission] = true
    API_Database:query("INSERT INTO ncs_roles_permissions (role_identifier, permission) VALUES (@role_identifier, @permission)", {
        ["role_identifier"] = self.identifier,
        ["permission"] = permission
    })
end