---trim
---@param number number
---@return number
---@public
function API_Maths:trim(number)
if (not tonumber(number)) then
  return (_NCS:die("Argument 1, not a number"))
end
		return (string.gsub(number, "^%s*(.-)%s*$", "%1"))
	else
		return (_NCS:die("Not a number"))
	end
end