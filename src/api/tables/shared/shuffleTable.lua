---printTable
---@param tableS table
---@return void
---@public
function API_Tables:shuffleTable(tableS)
    for i = #tableS, 2, -1 do
      local j = math.random(i)
      tableS[i], tableS[j] = tableS[j], tableS[i]
    end
    return tableS
end