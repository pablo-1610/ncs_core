---setLogos
---@param logos table
---@public
---@return NCSRichePresence
function NCSRichePresence:setLogos(logos)
    self.logos = logos or {}
    return (self)
end