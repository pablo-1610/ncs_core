---addListener
---@param handler function
---@return number
---@public
function MOD_InteractionKey:addListener(handler)
    MOD_InteractionKey.listeners[#MOD_InteractionKey.listeners + 1] = handler
end