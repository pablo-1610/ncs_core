---unformatTime
---@param tblTime table
---@return number
---@public
function API_Maths:unformatTime(tblTime)
    local years <const> = tblTime.years or 0
    local months <const> = tblTime.months or 0
    local days <const> = tblTime.days or 0
    local hours <const> = tblTime.hours or 0
    local minutes <const> = tblTime.minutes or 0
    local seconds <const> = tblTime.seconds or 0
    return (years * 31536000 + months * 2592000 + days * 86400 + hours * 3600 + minutes * 60 + seconds)
end