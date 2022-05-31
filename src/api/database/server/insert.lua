---insert
---@param query string
---@param parameters table
---@param cb function
---@return void
---@public
function API_Database:insert(query, parameters, cb)
    export[GetCurrentResourceName()]:insert(query, parameters, cb)
end