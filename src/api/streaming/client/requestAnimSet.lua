---requestAnimSet
---@param animSet string
---@return any
---@public
function API_Streaming:requestAnimSet(animSet)
    if (HasAnimSetLoaded(animSet)) then
        return (animSet)
    end
    
    RequestAnimSet(animSet)
    while (not HasAnimSetLoaded(animSet)) do
        Wait(0)
    end
    return (animSet)
end
