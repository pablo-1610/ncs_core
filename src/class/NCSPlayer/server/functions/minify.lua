---minify
---@return table
---@public
function NCSPlayer:minify()
    return {
        id = self.id,
        serverId = self.serverId,
        identifier = self.identifier,
        name = self.name,
        role = self.role:minify(),
        character = self.character:minify()
    }
end