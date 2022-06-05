---addInfractionListener
---@param infractionType string
---@param handler function
---@return void
---@public
function MOD_AntiCheat:addInfractionListener(infractionType, handler)
    if (not (self.infractionsListeners[infractionType])) then
        self.infractionsListeners[infractionType] = {}
    end
    table.insert(self.infractionsListeners[infractionType], handler)
end