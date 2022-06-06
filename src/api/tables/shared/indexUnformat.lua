---indexUnformat
---@param tableToUnformat table
---@return table
---@public
function API_Tables:indexUnformat(tableToUnformat)
    TableUnformat = {}
    for index, value in pairs(tableToUnformat) do
        TableIndex[index] = value
    end
    return (TableUnformat)
end