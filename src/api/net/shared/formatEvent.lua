---net_formatEvent
---@param eventName string
---@return void
---@public
function _NCS:net_formatEvent(eventName)
    return (("ncs:%s"):format(GetHashKey(eventName)))
end