---performDiscord
---@param method string
---@param endpoint string
---@param data table
---@param getCount boolean
---@public
---@return table
function NCSBot:performDiscord(method, endpoint, data, getCount)
    ---@type table
    local request = nil

    PerformHttpRequest(("https://discordapp.com/api/%s?with_counts=%s"):format(endpoint, getCount or false), function(errorCode, resultData, resultHeaders)
        request = { error = errorCode, result = resultData, headers = resultHeaders }
        NCS:trace(("Discord API Request: %s"):format(endpoint), NCSEnum.LogType.DEBUG)
    end, method, data and json.encode(data) or "", { ["Content-Type"] = "application/json", ["Authorization"] = ("Bot %s"):format(self.token) })

    while (not request) do
        Wait(0)
    end

    if (request.error ~= NCSEnum.DiscordErrorType.GOOD) then
        NCS:trace(("Discord API Error: %s"):format(NCSEnum._getDiscordErrorType(request.error)), NCSEnum.LogType.ERROR)
    end

    return (request.result)
end