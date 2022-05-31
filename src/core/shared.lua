---@class _NCS
local _NCS = {}

---getVersion
---@return string
---@public
function _NCS:getVersion()
    return (GetResourceMetadata(GetCurrentResourceName(), "version"))
end

---trace
---@param message string
---@param logLevelIndex? any
---@return void
---@public
function _NCS:trace(message, logLevelIndex)
    local maxLogLevel <const> = _Internal.LogLevel or _NCSEnum.LogType.INFO
    logLevelData = _NCSEnum._getLogTypeDisplayData(logLevelIndex or _NCSEnum.LogType.DEBUG)
    if (logLevelIndex > maxLogLevel) then
        return
    end
    print(("(^1NCS^7) [%s^7] %s"):format(("%s%s"):format(logLevelData.displayColor, logLevelData.displayName), message))
end

---nativeTrace
---@param message string
---@return void
---@public
function _NCS:coreTrace(message)
    print(("(^1NCS^7) [^6CORE^7] %s"):format(message))
end

---die
---@param reason string
---@return void
---@public
function _NCS:die(reason)
    error(("(NCS) %s"):format(reason))
end

local registeredEvents = {}

---registerNetEvent
---@param eventName string
---@return void
---@public
function _NCS:registerNetEvent(eventName, ...)
    if not (registeredEvents[eventName]) then
        RegisterNetEvent(self:formatEvent(eventName), ...)
        registeredEvents[eventName] = true
    end
end

---onReceive
---@param eventName string
---@param callback function
---@return void
---@public
function _NCS:handleEvent(eventName, callback)
    AddEventHandler(self:formatEvent(eventName), callback)
end

---triggerEvent
---@param eventName string
---@return void
---@public
function _NCS:triggerEvent(eventName, ...)
    TriggerEvent(self:formatEvent(eventName), ...)
end

---onReady
---@param callback function
---@return void
---@public
function _NCS:onReady(callback)
    self:handleEvent("ncs_core:loaded", callback)
end

---formatEvent
---@param eventName string
---@return void
---@public
function _NCS:formatEvent(eventName)
    return (("ncs:%s"):format(GetHashKey(eventName)))
end

AddEventHandler("ncs_core:trace", function(message, logType)
    _NCS:trace(message, logType)
end)

_NCS.Config = _Config

_G._NCS = _NCS
_G._Internal = {}
_G._Config = {}
_G._NCSEnum = {}
