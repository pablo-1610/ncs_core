---printTable
---@param tableToPrint table
---@return void
---@public
function API_Tables:printTable(tableToPrint)
   for key, _ in pairs(tableToPrint) do
      print(key, _)
   end
end