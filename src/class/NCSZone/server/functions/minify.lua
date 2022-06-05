---minify
---@param self NCSZone
---@return table
function NCSZone.minify(self)
    return {
        id = self.id,
        position = self.position,
        helpText = self.helpText,
        drawDistance = self.drawDistance,
        interactDistance = self.interactDistance
    }
end