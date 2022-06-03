---setCharacter
---@param newCharacter NCSCharacter
---@param callback function
---@public
function NCSPlayer:setCharacter(newCharacter, callback)
    self.character = newCharacter

    if (callback) then
        callback(true)
    end
end