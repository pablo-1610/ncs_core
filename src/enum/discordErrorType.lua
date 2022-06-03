NCSEnum.DiscordErrorType = {
    GOOD = 200,
    ERROR_NO_CONTENT = 204,
    BAD_REQUEST = 400,
    UNAUTHORIZED = 401,
    FORBIDDEN = 403,
    NOT_FOUND = 404,
    METHOD_NOT_ALLOWED = 405,
    TOO_MANY_REQUESTS = 429,
    INTERNAL_ERROR = 500,
    API_DOWN = 502,
}

function NCSEnum._getDiscordErrorType(code)
    for key, value in pairs(NCSEnum.DiscordErrorType) do
        if value == code then
            return tostring(key)
        end
    end
    return 'Unknown'
end