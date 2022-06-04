NCSEnum.LogType = {
    DEBUG = 4,
    INFO = 3,
    WARNING = 2,
    ERROR = 1,
}

NCSEnum._getLogTypeDisplayData = function(logType)
    local displayByType = { [4] = { displayName = _Literals.TYPE_DEBUG, displayColor = "^0", clientColor = "~w~" }, [3] = { displayName = _Literals.TYPE_INFO, displayColor = "^5", clientColor = "~b~" }, [2] = { displayName = _Literals.TYPE_WARNING, displayColor = "^3", clientColor = "~y~" }, [1] = { displayName = _Literals.TYPE_ERROR, displayColor = "^1", clientColor = "~r~" } }
    return displayByType[logType]
end