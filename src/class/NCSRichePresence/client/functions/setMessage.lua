---setMessage
---@param message string
---@public
---@return NCSRichePresence
function NCSRichePresence:setMessage(message)
    self.message = message
    return (self)
end
