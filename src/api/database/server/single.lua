---single
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function API_Database:single(query, parameters, cb)
	exports[GetCurrentResourceName()]:single(query, parameters, cb)
end
