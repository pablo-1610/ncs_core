---printTable
---@param tableToPrint table
---@public
function API_Tables:printTable(tableToPrint)
   for key, _ in pairs(tableToPrint) do
      print(key, _)
   end
end