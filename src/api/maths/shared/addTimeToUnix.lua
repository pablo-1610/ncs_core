---addTimeToUnix
---@param seconds number
---@return number
---@public
function API_Maths:addTimeToUnix(seconds)
    return (os.time() + (seconds or 0))
end
