---execFunctionWithVoidReturn
---@param scaleform_handle string
---@param func_name string
---@param params_list table
---@return void
---@public
function API_Scaleform:execFunctionWithVoidReturn(scaleform_handle, func_name, params_list)
    PushScaleformMovieFunction(scaleform_handle, func_name)
    for i,v in ipairs(params_list) do
        if v.type == "string" then
            PushScaleformMovieFunctionParameterString(tostring(v.value))
        elseif v.type == "int" then
            PushScaleformMovieFunctionParameterInt(tonumber(v.value))
        elseif v.type == "bool" then
            PushScaleformMovieFunctionParameterBool(v.value)
        elseif v.type == "float" then
            PushScaleformMovieFunctionParameterFloat(v.value)
        elseif v.type == 'txt_string' then
            ScaleformMovieMethodAddParamTextureNameString(tostring(v.value))
        end
    end
    PopScaleformMovieFunctionVoid()
end
