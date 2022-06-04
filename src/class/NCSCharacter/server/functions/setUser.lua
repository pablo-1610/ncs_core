---setUser
---@param user NCSPlayer
---@public
---@param self NCSCharacter
function NCSCharacter.setUser(self, user)
    self.user = user
    return (self)
end