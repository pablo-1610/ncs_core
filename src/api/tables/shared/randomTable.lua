---randomTable
---@param tableToRandom table
---@return table
---@public
function API_Tables:randomTable(tableToRandom)
    local randomIndex <const> = math.random(0, #tableToRandom)
    return (tableToRandom[randomIndex])
end
