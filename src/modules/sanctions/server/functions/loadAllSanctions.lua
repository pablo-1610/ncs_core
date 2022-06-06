---loadAllSanctions
---@public
function MOD_Sanctions:loadAllSanctions()
    API_Database:query("SELECT * FROM ncs_bans", {}, function(result)
        for _, rows in pairs(result) do
            if (MOD_Sanctions.List.Bans[rows.license]) then
                return
            end
            MOD_Sanctions.List.Bans[rows.license] = {
                ["ban_id"] = rows.ban_id,
                ["license"] = rows.license,
                ["reason"] = rows.reason,
                ["time"] = rows.time
            }
        end
        NCSInternal:startupStepAccomplished(NCSEnum.RequiredStartupSteps.LOAD_BANS)
    end)

    API_Database:query("SELECT * FROM ncs_warns", {}, function(result)
        for _, rows in pairs(result) do
            if (MOD_Sanctions.List.Warns[rows.license]) then
                return
            end
            MOD_Sanctions.List.Warns[rows.license] = {
                ["warn_id"] = rows.warn_id,
                ["license"] = rows.license,
                ["reason"] = rows.reason
            }
        end
        NCSInternal:startupStepAccomplished(NCSEnum.RequiredStartupSteps.LOAD_WARNS)
    end)
end