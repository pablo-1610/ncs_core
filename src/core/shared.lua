---@class _NCS
local _NCS = {}

---getVersion
---@return any
---@public
function _NCS:getVersion()
    return (GetResourceMetadata(GetCurrentResourceName(), "version"))
end

---checkIsUpdate
---@return void
---@public
function _NCS:checkIsUpdate()
    if GetConvarInt("ncs_allow_version_check", 1) > 0 then
        PerformHttpRequest("https://raw.githubusercontent.com/NextCitizens/ncs_core/main/fxmanifest.lua", function (_, resultData, _)
            local currentVersion <const> = _NCS:getVersion()
            local lines = {}

            for s in resultData:gmatch("[^\r\n]+") do
                lines[#lines + 1] = s
            end

            local ver <const> = API_Strings:split(lines[6], "'")[2]
            if (not (currentVersion == ver)) then
                _NCS:coreTrace("NCS Core has not up to date ^3please update -> https://github.com/NextCitizens/ncs_core ^7!", _NCSEnum.LogType.ERROR)
            else
                _NCS:coreTrace(("NCS Core is up to date ^7! (%s)"):format(currentVersion), _NCSEnum.LogType.INFO)
            end
        end)
    end
end

---trace
---@param message string
---@param logLevelIndex any
---@return void
---@public
function _NCS:trace(message, logLevelIndex)
    logLevelIndex = logLevelIndex or _NCSEnum.LogType.DEBUG
    local maxLogLevel <const> = _Internal.LogLevel or _NCSEnum.LogType.INFO
    local logLevelData = _NCSEnum._getLogTypeDisplayData(logLevelIndex)
    if (logLevelIndex > maxLogLevel) then
        return
    end
    print(("(^1NCS^7) [%s^7] %s"):format(("%s%s"):format(logLevelData.displayColor, logLevelData.displayName), message))
end

---nativeTrace
---@param message string
---@public
function _NCS:coreTrace(message)
    print(("(^1NCS^7) [^6CORE^7] %s"):format(message))
end

---die
---@param reason string
---@public
function _NCS:die(reason)
    error(("(NCS) %s"):format(reason))
end

local registeredEvents = {}

---registerNetEvent
---@param eventName string
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
---@public
function _NCS:handleEvent(eventName, callback)
    AddEventHandler(self:formatEvent(eventName), callback)
end

---triggerEvent
---@param eventName string
---@public
function _NCS:triggerEvent(eventName, ...)
    TriggerEvent(self:formatEvent(eventName), ...)
end

---onReady
---@param callback function
---@public
function _NCS:onReady(callback)
    self:handleEvent("ncs_core:loaded", callback)
end

---formatEvent
---@param eventName string
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
_G._NCSConstant = {}
