_NCS:registerNetEvent('executeFunction')
_NCS:handleEvent('executeFunction', function(funcName, ...)
    local func, error = API_Strings:findfunction(funcName)
    if func then
        func(...)
    else
        _NCS:coreTrace(error, _NCSEnum.LogType.ERROR)
    end
end)