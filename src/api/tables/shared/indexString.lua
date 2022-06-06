---indexString
---@param tableIndexString table
---@return table
---@public
function API_Tables:indexString(tableToIndex)
    TableIndex = {}
    for index, value in pairs(tableToIndex) do
        TableIndex[index] = value
    end
    return (TableIndex)
end