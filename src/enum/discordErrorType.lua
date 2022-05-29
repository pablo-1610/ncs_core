_NCSEnum.DiscordErrorType = {
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

function _NCSEnum._getDiscordErrorType(code)
    local codes = {
        [200] = "Good",
        [204] = "ErrorNoContent",
        [400] = "BadRequest",
        [401] = "Unauthorized",
        [403] = "Forbidden",
        [404] = "NotFound",
        [405] = "MethodNotAllowed",
        [429] = "TooManyRequests",
        [500] = "InternalError",
        [502] = "APIDown",
    }

    return (codes[code] or "Unknown")
end