---randomTable
---@param tableR table
---@return value
---@public
function API_Tables:randomTable(tableR)
    if (not (tableR[1])) then
        return
    end
    local randM <const> = math.random(0, #tableR)
    if not (tableR[randM]) then
        return
    end
    return (tableR[randM])
end
