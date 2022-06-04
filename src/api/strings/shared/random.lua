---randomString
---@param length number
---@param randomTemplate string
---@return string
---@public
function API_Strings:randomString(length, randomTemplate)
    local charset <const> = (randomTemplate or "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    local randomString = ""
    for i = 1, (length or 10) do
        local randomNumber <const> = math.random(1, #charset)
        randomString = randomString .. charset:sub(randomNumber, randomNumber)
    end
    return (randomString)
end