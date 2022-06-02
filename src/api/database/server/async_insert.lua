---async_insert
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function API_Database:async_insert(query, parameters, cb)
    exports[GetCurrentResourceName()]:insert_async(query, parameters, cb)
end