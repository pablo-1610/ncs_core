---getDateByUnixTime
---@param unixTime number
---@return table
---@public
function API_Maths:getDateByUnixTime(unixTime)
    local date <const> = os.date("*t", (unixTime or 0))
    return (date)
end