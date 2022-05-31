---requestAnimSet
---@param animSet string
---@return any
---@public
function API_Streaming:requestAnimSet(animSet)
    if (not HasAnimSetLoaded(animSet)) then
        RequestAnimSet(animSet)
        while (not HasAnimSetLoaded(animSet)) do
            Wait(0)
        end
        return (animSet)
    end
end
