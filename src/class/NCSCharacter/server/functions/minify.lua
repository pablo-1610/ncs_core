---minify
---@return table
---@public
---@param self NCSCharacter
function NCSCharacter.minify(self)
    return {
        id = self.id,
        identity = self.identity,
        skin = self.skin,
        accounts = self.accounts,
        lastPosition = self.lastPosition,
        metadata = self.metadata
    }
end