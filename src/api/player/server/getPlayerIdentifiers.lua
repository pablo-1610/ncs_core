---getIdentifiers
---@param playerSrc number
---@return table
---@public
function API_Player:getIdentifiers(playerSrc)
	if (not playerSrc or playerSrc <= 0) then
		return NCS:die('Unable to find identifiers : source is invalid')
	end
	local identifiers = {}
	for _, v in pairs(GetPlayerIdentifiers(playerSrc)) do
		local splitted <const> = NCS.Strings:split(v, ":")

		identifiers[splitted[1]] = v
	end
	return (identifiers)
end