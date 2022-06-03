---setUser
---@param user NCSPlayer
---@public
function NCSCharacter:setUser(user)
    self.user = user
    return (self)
end