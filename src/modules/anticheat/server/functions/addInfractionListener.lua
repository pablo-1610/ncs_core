---addInfractionListener
---@param infractionType string
---@param handler function
---@public
function MOD_AntiCheat:addInfractionListener(infractionType, handler)
    if (not (self.infractionsListeners[infractionType])) then
        self.infractionsListeners[infractionType] = {}
    end
    self.infractionsListeners[infractionType][#self.infractionsListeners[infractionType] + 1] = handler
end