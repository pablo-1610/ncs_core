---async_query
---@param query string
---@param parameters table
---@return table
---@public
function API_Database:async_query(query, parameters, cb)
    exports[GetCurrentResourceName()]:query_async(query, parameters, cb)
end