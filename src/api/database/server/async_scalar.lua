---async_scalar
---@param query string
---@param parameters table
---@return table
---@public
function API_Database:async_scalar(query, parameters)
	return exports[GetCurrentResourceName()]:scalar_async(query, parameters)
end
