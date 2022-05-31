---requestAnimDict
---@param animDict string
---@param callback function
---@return animDict
---@public
function API_Streaming:requestAnimDict(animDict)
    if (not HasAnimDictLoaded(animDict)) then
        RequestAnimDict(animDict)
        while (not HasAnimDictLoaded(animDict)) do
            Wait(0)
        end
        return (animDict)
    end
end