---getDateByUnixTime
---@param unixTime number
---@return table
---@public
function API_Maths:getDateByUnixTime(unixTime)
    unixTime = unixTime or 0
    local t <const> = os.date("*t", unixTime)
    return (t)
end