---@class NCS
local NCS = {}
NCS.ready = false
NCS.resourceName = GetCurrentResourceName()

---getVersion
---@return any
---@public
function NCS:getVersion()
    return (GetResourceMetadata(GetCurrentResourceName(), "version"))
end

---checkIsUpdate
---@public
function NCS:checkIsUpdate()
    PerformHttpRequest("https://raw.githubusercontent.com/NextCitizens/ncs_core/main/fxmanifest.lua", function(_, resultData, _)
        local currentVersion <const> = NCS:getVersion()
        local lines = {}
        for s in resultData:gmatch("[^\r\n]+") do
            lines[#lines + 1] = s
        end
        local ver <const> = API_Strings:split(lines[6], "'")[2]
        if (not (currentVersion == ver)) then
            NCS:systemTrace("NCS Core is not up to date ^3please update -> https://github.com/NextCitizens/ncs_core ^7!", NCSEnum.LogType.ERROR)
        else
            NCS:systemTrace(("NCS Core is up to date ^7! (%s)"):format(currentVersion), NCSEnum.LogType.INFO)
        end
    end)
end

---trace
---@param message string
---@param logLevelIndex any
---@return void
---@public
function NCS:trace(message, logLevelIndex)
    logLevelIndex = logLevelIndex or NCSEnum.LogType.DEBUG
    local maxLogLevel <const> = NCSInternal.LogLevel or NCSEnum.LogType.INFO
    local logLevelData = NCSEnum._getLogTypeDisplayData(logLevelIndex)
    if (logLevelIndex > maxLogLevel) then
        return
    end
    print(("(^1NCS^7) [%s^7] %s"):format(("%s%s"):format(logLevelData.displayColor, logLevelData.displayName), message))
end

---traceError
---@param message string
---@public
function NCS:traceError(message)
    self:trace(message, NCSEnum.LogType.ERROR)
end

---nativeTrace
---@param message string
---@public
function NCS:systemTrace(message)
    print(("(^1%s^7) [^6SYSTEM^7] %s"):format(self.resourceName, message))
end

---die
---@param reason string
---@public
function NCS:die(reason)
    error(("(NCS) %s"):format(reason))
end

local registeredEvents = {}

---registerNetEvent
---@param eventName string
---@public
function NCS:registerNetEvent(eventName, ...)
    if not (registeredEvents[eventName]) then
        RegisterNetEvent(self:formatEvent(eventName), ...)
        registeredEvents[eventName] = true
    end
end

---handleEvent
---@param eventName string
---@param callback function
---@public
function NCS:handleEvent(eventName, callback)
    AddEventHandler(self:formatEvent(eventName), callback)
end

---triggerEvent
---@param eventName string
---@public
function NCS:triggerEvent(eventName, ...)
    TriggerEvent(self:formatEvent(eventName), ...)
end

---formatEvent
---@param eventName string
---@public
function NCS:formatEvent(eventName)
    return (("ncs:%s"):format(GetHashKey(eventName)))
end

AddEventHandler("ncs_core:trace", function(message, logType)
    NCS:trace(message, logType)
end)

_G.NCS = NCS
_G.NCSInternal = {}
_G.NCSEnum = {}
_G.NCSConstant = {}
