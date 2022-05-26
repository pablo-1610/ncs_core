---@class _NCS
local _NCS = {}

---getVersion
---@return string
---@public
function _NCS:getVersion()
    return (GetResourceMetadata(GetCurrentResourceName(), "version"))
end

---trace
---@return void
---@param message string
---@param logType any
---@public
function _NCS:trace(message, logType)
    logType = logType or _NCSEnum.LogType.DEBUG
    print(("[%s^7] %s"):format(("%s%s"):format(logType.displayColor, logType.displayName), message))
end

---formatEvent
---@return void
---@param eventName string
---@public
function _NCS:formatEvent(eventName)
    return (("ncs:%s"):format(GetHashKey(eventName)))
end

_G._NCS = _NCS
_G._NCSEnum = {}