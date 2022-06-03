---unformatTime
---@param tblTime table
---@return number
---@public
function API_Maths:unformatTime(tblTime)
    if (not tblTime) then
        return 0
    end

    local years <const> = tblTime.years or 0
    local months <const> = tblTime.months or 0
    local days <const> = tblTime.days or 0
    local hrs <const> = tblTime.hours or 0
    local min <const> = tblTime.minutes or 0
    local sec <const> = tblTime.seconds or 0

    return ((years * 31536000) + (months * 2592000) + (days * 86400) + (hrs * 3600) + (min * 60) + (sec))
end