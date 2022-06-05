local requiredStartupStepsToBoot = {}

for _, startupStep in pairs(NCSEnum.RequiredStartupSteps) do
    requiredStartupStepsToBoot[startupStep] = false
end

local function isStartupStep(stepId)
    for _, startupStepId in pairs(NCSEnum.RequiredStartupSteps) do
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
    for _, stepId in pairs(NCSEnum.RequiredStartupSteps) do
        if not (requiredStartupStepsToBoot[stepId]) then
            return (false)
        end
    end
    return (true)
end

local function start()
    if (not (NCSInternal.OneSync)) then
        NCS:trace("OneSync is required to start NCS !", NCSEnum.LogType.ERROR)
        NCS:trace("Please enable OneSync in your server config file with the following line: \"^0set onesync on^7\"", NCSEnum.LogType.ERROR)
        return
    end
    NCS.ready = true
    NCS:trace("The NCS ^2server^7 core is ready !", NCSEnum.LogType.INFO)
    NCS:triggerEvent("serverReady")
end

function NCSInternal:startupStepAccomplished(stepId)
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

NCS:handleEvent("startupStepAccomplished", function(stepId)
    NCSInternal:startupStepAccomplished(stepId)
end)