---async_query
---@param query string
---@param parameters table
---@return table
---@public
function API_Database:async_query(query, parameters)
	return exports[GetCurrentResourceName()]:query_async(query, parameters)
end
