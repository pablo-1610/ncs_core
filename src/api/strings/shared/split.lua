---split
---@param str string
---@param delimiter string
---@return table
---@public
function API_Strings:split(str, delimiter)
	if (not (str)) then
		return {}
	end

	if (not (delimiter)) then
		return (NCS:die("argument 2, delimiter value invalid!"))
	end

	local result = {}
	for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return (result)
end
