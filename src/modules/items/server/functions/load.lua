---load
---@param triggerTo number
---@public
function MOD_Items:load(triggerTo)
  API_Database:query("SELECT * FROM ncs_items", {}, function(rows)
    if (#rows <= 0) then
        return (NCS:die("You must have at least one item in your database"))
    end
  
    local items <const> = {}
    for _, row in pairs(rows) do
        ---@type NCSItems
        local item = NCSItems(row.name, row.label, row.weight)
        MOD_Items:set(row.name, row.label, row.weight)
  
        items[row.name] = item:minify()
    end
    NCS:triggerClientEvent("receiveItems", triggerTo or -1, items)
  end)
end
