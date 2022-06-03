---unformatTime
---@param seconds number
---@return number
---@public
function API_Maths:addTimeToUnix(seconds)
    if (not seconds) then
        return 0
    end
    return (os.time() + seconds)
end
