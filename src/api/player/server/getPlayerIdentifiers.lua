---getIdentifiers
---@param playerSrc number
---@return table
---@public
function API_Player:getIdentifiers(playerSrc)
	local identifiers = {}
	for _, v in pairs(GetPlayerIdentifiers(playerSrc)) do
		local splitted = _NCS.Strings:split(v, ":")

		identifiers[splitted[1]] = v
	end
	return identifiers
end
