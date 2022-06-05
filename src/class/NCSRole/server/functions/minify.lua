---minify
---@return table
---@public
---@param self NCSRole
function NCSRole.minify(self)
    return {
        identifier = self.identifier,
        label = self.label,
        powerIndex = self.powerIndex,
        permissions = self.permissions
    }
end