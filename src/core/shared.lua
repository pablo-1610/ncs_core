---@class NCS
local NCS = {}
NCS.ready = false
NCS.resourceName = GetCurrentResourceName()

local function getInvokingResource()
    return ((GetInvokingResource() == nil and NCS.resourceName or GetInvokingResource()):lower())
end

local function safePrint(text)
    print((("%s^7"):format(text)))
end

---getVersion
---@return any
---@public
function NCS:getVersion()
    return (GetResourceMetadata(GetCurrentResourceName(), "version"))
end

---checkIsUpdate
---@public
---@return void
function NCS:checkIsUpdate()
    PerformHttpRequest("https://raw.githubusercontent.com/NextCitizens/ncs_core/main/fxmanifest.lua", function(_, resultData, _)
        local currentVersion <const> = NCS:getVersion()
        local lines = {}
        for s in resultData:gmatch("[^\r\n]+") do
            lines[#lines + 1] = s
        end
        local ver <const> = API_Strings:split(lines[6], "'")[2]
        if (not (currentVersion == ver)) then
            NCS:trace("A new version of NCS is available, you can download it here: ^0https://github.com/NextCitizens/ncs_core ^7!", NCSEnum.LogType.WARNING)
        else
            NCS:trace(("Your version of NCS is up to date (^0v%s^7)"):format(currentVersion), NCSEnum.LogType.INFO)
        end
    end)
end

---trace
---@param message string
---@param logLevelIndex any
---@return void
---@public
function NCS:trace(message, logLevelIndex)
    local resName <const> = getInvokingResource()
    local resourceDisplay <const> = (resName == GetCurrentResourceName() and "^9" or "^5")
    if (logLevelIndex) then
        local maxLogLevel <const> = NCSInternal.LogLevel or NCSEnum.LogType.INFO
        local logLevelData = NCSEnum._getLogTypeDisplayData(logLevelIndex)
        if (not (logLevelData)) then
            return (self:die(("Attempt to log with an invalid log level index : %s"):format(tostring(logLevelIndex))))
        end
        if (logLevelIndex > maxLogLevel) then
            return
        end
        safePrint(("(%s^7) %s^7: %s"):format(("%s%s"):format(resourceDisplay, resName), ("%s%s"):format(logLevelData.displayColor, API_Strings:firstToUpper(logLevelData.displayName:lower())), message))
        return
    end
    safePrint(("(%s^7) %s"):format(("%s%s"):format(resourceDisplay, resName), message))
end

---traceError
---@param message string
---@return void
---@public
function NCS:traceError(message)
    self:trace(message, NCSEnum.LogType.ERROR)
end

---die
---@param reason string
---@return void
---@public
function NCS:die(reason)
    error(("(NCS) %s"):format(reason))
end

local registeredEvents = {}

---registerNetEvent
---@param eventName string
---@return void
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
---@return void
---@public
function NCS:handleEvent(eventName, callback)
    AddEventHandler(self:formatEvent(eventName), callback)
end

---triggerEvent
---@param eventName string
---@return void
---@public
function NCS:triggerEvent(eventName, ...)
    TriggerEvent(self:formatEvent(eventName), ...)
end

---formatEvent
---@param eventName string
---@return void
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
