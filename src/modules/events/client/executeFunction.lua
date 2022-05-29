_NCS:registerNetEvent('API_Event:executeFunction')
_NCS:handleEvent('API_Event:executeFunction', function(funcName, ...)
    local func, error = API_Event:findfunction(funcName)
    if func then
        func(...)
    else
        _NCS:coreTrace(error, _NCSEnum.LogType.ERROR)
    end
end)