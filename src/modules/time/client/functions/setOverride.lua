---setOverride
---@param minute number
---@param hour number
---@public
function MOD_Time:setOverride(minute, hour)
    NetworkOverrideClockTime(minute, hour)
    MOD_Time.isTimeOverride = { minute, hour }
end