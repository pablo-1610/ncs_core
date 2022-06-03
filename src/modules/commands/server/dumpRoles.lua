RegisterCommand("dumpRoles", function(_src)
    if (_src ~= 0) then
        return
    end
    local roles = MOD_Roles:getAll()
    table.sort(roles, function(a, b)
        return a.powerIndex < b.powerIndex
    end)
    ---@param role NCSRole
    for _, role in pairs(roles) do
        _NCS:trace(role)
    end
end)