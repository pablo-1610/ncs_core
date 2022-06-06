---addListener
---@param handler function
---@return number
---@public
function MOD_InteractionKey:addListener(handler)
    return (table.insert(MOD_InteractionKey.listeners, handler))
end