NCS:handleEvent("databaseReady", function()
    API_Database:query("SELECT * FROM ncs_roles", {}, function(rows)
        if (#rows <= 0) then
            return (NCS:die("You must have at least one role in your database"))
        end
        for _, row in pairs(rows) do
            ---@type NCSRole
            local role = NCSRole(row.role_identifier, row.label, row.power_index)
            MOD_Roles:set(role.identifier, role)
        end
        NCSInternal:startupStepAccomplished(NCSEnum.RequiredStartupSteps.LOAD_RANKS)
    end)
end)