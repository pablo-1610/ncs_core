NCSEnum.LogType = {
    DEBUG = 4,
    INFO = 3,
    WARNING = 2,
    ERROR = 1,
}

NCSEnum._getLogTypeDisplayData = function(logType)
    local displayByType = { [4] = { displayName = "DEBUG", displayColor = "^0" }, [3] = { displayName = "INFO", displayColor = "^5" }, [2] = { displayName = "WARNING", displayColor = "^3" }, [1] = { displayName = "ERROR", displayColor = "^1" } }
    return displayByType[logType]
end