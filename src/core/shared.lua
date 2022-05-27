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
    logType = _NCSEnum._getLogTypeDisplayData(logType or _NCSEnum.LogType.DEBUG)
    print(("[%s^7] %s"):format(("%s%s"):format(logType.displayColor, logType.displayName), message))
end

---formatEvent
---@return void
---@param eventName string
---@public
function _NCS:formatEvent(eventName)
    return (("ncs:%s"):format(GetHashKey(eventName)))
end

AddEventHandler("ncs_core:trace", function(message, logType)
    _NCS:trace(message, logType)
end)

local registredEvents = {}
local function isEventRegistred(eventName)
    for k, v in pairs(registredEvents) do
        if (v == eventName) then
            return (true)
        end
    end
    return (false)
end
---registerNetEvent
---@param eventName string
---@return void
---@public
function _NCS:registerNetEvent(eventName, ...)
    if not isEventRegistred(eventName) then
        RegisterNetEvent(self:formatEvent(eventName), ...)
        registredEvents[eventName] = true
    end
end

---triggerEvent
---@param eventName string
---@return void
---@public
function _NCS:triggerEvent(eventName, ...)
    TriggerEvent(self:formatEvent(eventName), ...)
end

_G._NCS = _NCS
_G._NCSEnum = {}