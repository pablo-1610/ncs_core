---roundNumber
---@param number number
---@return number
---@public
function _NCS:roundNumber(number)
    return (tonumber(math.floor(number + 0.5)));
end