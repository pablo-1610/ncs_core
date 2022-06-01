---trim
---@param number number
---@return number
---@public
function API_Maths:trim(number)
    if (number) then
        return (string.gsub(number, "^%s*(.-)%s*$", "%1"))
    else
        return (nil)
    end
end