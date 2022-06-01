---trim
---@param number number
---@return number
---@public
function API_Maths:trim(number)
    if (tonumber(number)) then
		return (string.gsub(number, "^%s*(.-)%s*$", "%1"))
	else
		return (_NCS:die("Not a number"))
	end
end