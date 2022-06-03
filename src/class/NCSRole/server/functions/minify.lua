---minify
---@return table
---@public
function NCSRole:minify()
    return {
        identifier = self.identifier,
        label = self.label,
        powerIndex = self.powerIndex,
        permissions = self.permissions
    }
end