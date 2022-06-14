---execFunctionWithReturn
---@param scaleform_handle string
---@param func_name string
---@return int
---@public
function API_Scaleform:execFunctionWithReturn(scaleform_handle, func_name)
    BeginScaleformMovieMethod(scaleform_handle, func_name)
    local a = EndScaleformMovieMethodReturnValue()
    while not IsScaleformMovieMethodReturnValueReady(a) do
        Wait(0)
    end
    return GetScaleformMovieMethodReturnValueInt(a)
end
