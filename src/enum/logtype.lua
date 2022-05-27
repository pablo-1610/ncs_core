_NCSEnum.LogType = {
    DEBUG = 1,
    SUCCESS = 2,
    INFO = 3,
    WARNING = 4,
    ERROR = 5,
}

_NCSEnum._getLogTypeDisplayData = function(logType)
    local displayByType = { [1] = { displayName = "DEBUG", displayColor = "^0" }, [2] = { displayName = "SUCCESS", displayColor = "^2" }, [3] = { displayName = "INFO", displayColor = "^4" }, [4] = { displayName = "WARNING", displayColor = "^3" }, [5] = { displayName = "ERROR", displayColor = "^1" } }
    return displayByType[logType]
end