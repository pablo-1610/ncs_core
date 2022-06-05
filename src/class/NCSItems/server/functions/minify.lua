---minify
---@return table
---@public
---@param self NCSItems
function NCSItems.minify(self)
    return {
        name = self.name,
        label = self.label,
        weight = self.weight,
    }
end