---sortAlphabetically
---@param tableToSort table
---@return table
---@public
function API_Tables:sortAlphabetically(tableToSort)
    local sortedTable = {}
    for _, value in pairs(tableToSort) do
        sortedTable[#sortedTable + 1] = value
    end
    table.sort(sortedTable)
    return (sortedTable)
end