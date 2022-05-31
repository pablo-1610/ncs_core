---query
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function API_Database:query(query, parameters, cb)
    exports[GetCurrentResourceName()]:query(query, parameters, cb)
end