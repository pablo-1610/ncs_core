---requestAnimDict
---@param animDict string
---@return any
---@public
function API_Streaming:requestAnimDict(animDict)
    if (HasAnimDictLoaded(animDict)) then
        return (animDict)
    end

    RequestAnimDict(animDict)
    while (not HasAnimDictLoaded(animDict)) do
        Wait(0)
    end
    return (animDict)
end