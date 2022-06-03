---minify
---@return table
---@public
function NCSCharacter:minify()
    return {
        id = self.id,
        identity = self.identity,
        skin = self.skin,
        accounts = self.accounts,
        lastPosition = self.lastPosition,
        metadata = self.metadata
    }
end