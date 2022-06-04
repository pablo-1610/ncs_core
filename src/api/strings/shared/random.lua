---randomString
---@param length number
---@return string
---@public
function API_Strings:randomString(length)
    local charset <const> = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    length = length or 10
    local randomString = ""
    for i = 1, length do
        local randomNumber <const> = math.random(1, #charset)
        randomString = randomString .. charset:sub(randomNumber, randomNumber)
    end
    return (randomString)
end