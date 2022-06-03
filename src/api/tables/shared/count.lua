---count
---@param tableEntity table
---@return number
---@public
function API_Tables:count(tableEntity)
    local count = 0
    for _, _ in pairs(tableEntity) do
        count = (count + 1)
    end
    return (count)
end