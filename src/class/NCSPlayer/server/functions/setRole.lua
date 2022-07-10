---setRole
---@return string
---@public
---@param self NCSPlayer
function NCSPlayer:setRole(role)
    if not MOD_Roles:exists(role) then
        return
    end
    self.role.identifier = role
    return self.role.identifier
end