---setCharacter
---@param newCharacter NCSCharacter
---@param callback function
---@public
---@param self NCSPlayer
function NCSPlayer.setCharacter(self, newCharacter, callback)
    self.character = newCharacter

    if (callback) then
        callback(true)
    end
end