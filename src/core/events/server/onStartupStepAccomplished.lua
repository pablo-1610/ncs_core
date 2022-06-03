local requiredStartupStepsToBoot = {}

for _, startupStep in pairs(_NCSEnum.RequiredStartupSteps) do
    requiredStartupStepsToBoot[startupStep] = false
end

local function isStartupStep(stepId)
    for _, startupStepId in pairs(_NCSEnum.RequiredStartupSteps) do
        if (startupStepId == stepId) then
            return (true)
        end
    end
    return (false)
end

local function alreadyAccomplished(stepId)
    return (requiredStartupStepsToBoot[stepId])
end

local function canStart()
    for _, stepId in pairs(_NCSEnum.RequiredStartupSteps) do
        if not (requiredStartupStepsToBoot[stepId]) then
            return (false)
        end
    end
    return (true)
end

local function start()
    _NCS.ready = true
    _NCS:coreTrace("The NCS ^2server^7 core is ready !")
    _NCS:triggerEvent("serverReady")
end

function _Internal:startupStepAccomplished(stepId)
    if (not (isStartupStep(stepId))) then
        return
    end
    if (alreadyAccomplished(stepId)) then
        return
    end
    requiredStartupStepsToBoot[stepId] = true
    if (canStart()) then
        start()
    end
end

_NCS:handleEvent("startupStepAccomplished", function(stepId)
    _Internal:startupStepAccomplished(stepId)
end)