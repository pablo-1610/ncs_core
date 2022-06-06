---indexUnformat
---@param tableToUnformat table
---@return table
---@public
function API_Tables:indexUnformat(tableToUnformat)
    local tableUnformat = {}
    for index, value in pairs(tableToUnformat) do
        tableUnformat[index] = value
    end
    return (tableUnformat)
end