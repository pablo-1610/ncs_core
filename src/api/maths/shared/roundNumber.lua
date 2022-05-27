---round
---@param number number
---@param decimalPlace? number
---@return number
---@public
function API_Maths:round(number, decimalPlace)
    if (decimalPlace) then
        local numberPower = (10 ^ decimalPlace)
        return (tonumber(math.floor(numberPower * number + 0.5) / numberPower))
    end
    return (tonumber(math.floor(number + 0.5)))
end
