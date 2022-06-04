---setButtons
---@param buttons table
---@public
---@return NCSRichePresence
function NCSRichePresence:setButtons(buttons)
    self.buttons = buttons or {}
    return (self)
end