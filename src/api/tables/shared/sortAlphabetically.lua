---sortAlphabetically
---@param table table
---@return table
---@public
function API_Tables:sortAlphabetically(table)
    local sortedTable = {}
    for key, _ in pairs(table) do
        table.insert(sortedTable, key)
    end
    table.sort(sortedTable)
    return (sortedTable)
end