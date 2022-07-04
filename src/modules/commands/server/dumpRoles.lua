API_Commands:registerConsoleCommand("dumpRoles", function()
    local roles = MOD_Roles:getAll()
    table.sort(roles, function(a, b)
        return a.powerIndex < b.powerIndex
    end)
    ---@param role NCSRole
    for _, role in pairs(roles) do
        NCS:trace(role)
    end
end)