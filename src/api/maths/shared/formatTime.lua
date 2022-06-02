---formatTime
---@param seconds number
---@return table
---@public
function API_Maths:formatTime(seconds)
    seconds = seconds or 0
    local hours <const> = math.floor(seconds/3600)
    local minutes <const> = math.floor((seconds/60)%60)
    seconds = math.floor(seconds%60)

    return { hours = hours, minutes = minutes, seconds = seconds}
end
