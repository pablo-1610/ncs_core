---sortTable
---@param tableT table
---@param sortFunc function
---@return table
---@public
function API_Tables:sortTable(tableT, sortFunc)
    table.sort(tableT, sortFunc)
    return tableT
end