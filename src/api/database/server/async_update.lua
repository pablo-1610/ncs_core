---async_update
---@param query string
---@param parameters table
---@return number
---@public
function API_Database:async_single(query, parameters)
	exports[GetCurrentResourceName()]:update_async(query, parameters)
end
