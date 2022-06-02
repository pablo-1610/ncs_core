---elapsedTime
---@param firstTime number
---@param secondTime number
---@param format boolean
---@return any
---@public
function API_Maths:elapsedTime(firstTime, secondTime, format)
    if (not firstTime or not (secondTime)) then
        return 0
    end
    local elapsedTime <const> = (firstTime  - secondTime)
    if (format) then
        return (API_Maths:formatTime(elapsedTime))
    else
        return (elapsedTime)
    end
end
