---count
---@param tableToCount table
---@return number
---@public
function API_Tables:count(tableToCount)
    local count = 0
    for _, _ in pairs(tableToCount) do
        count = (count + 1)
    end
    return (count)
end