---async_single
---@param query string
---@param parameters table
---@return table
---@public
function API_Database:async_single(query, parameters)
	return exports[GetCurrentResourceName()]:single_async(query, parameters)
end
