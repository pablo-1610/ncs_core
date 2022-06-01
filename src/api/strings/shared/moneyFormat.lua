---moneyFormat
---@param amount string
---@param stepper string
---@return string
---@public
function API_Strings:moneyFormat(amount, stepper)
	local left <const>, center <const>, right <const> = string.match(math.floor(amount), "^([^%d]*%d)(%d*)(.-)$")
	return (left .. string.reverse(string.gsub(string.reverse(center), "(%d%d%d)", "%1" .. (stepper or " "))) .. right)
end