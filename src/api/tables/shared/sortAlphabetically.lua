---sortAlphabetically
---@param tableToSort table
---@return table
---@public
function API_Tables:sortAlphabetically(tableToSort)
    local sortedTable = {}
    for key, _ in pairs(tableToSort) do
        sortedTable[#sortedTable + 1] = _
    end
    table.sort(sortedTable)
    return (sortedTable)
end