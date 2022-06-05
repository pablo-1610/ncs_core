NCS:handleEvent("playerNowInGame", function(_src)
    API_Database:query("SELECT * FROM ncs_items", {}, function(rows)
        if (#rows <= 0) then
            return (NCS:die("You must have at least one item in your database"))
        end
        for _, row in pairs(rows) do
            ---@type NCSItems
            local item = NCSItems(row.name, row.label, row.weight)
            MOD_Items:set(row.name, row.label, row.weight)
            NCS:triggerClientEvent("receiveItems", _src, item:minify())
        end
    end)
end)