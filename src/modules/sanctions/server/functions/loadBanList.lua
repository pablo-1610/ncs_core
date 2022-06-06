---loadBanList
---@public
function MOD_Sanctions:loadBanList()
    API_Database:query("SELECT * FROM ncs_bans", {}, function(result)
        for _, rows in pairs(result) do
            if (MOD_Sanctions.List.Bans[rows.license]) then
                return
            end
            MOD_Sanctions.List.Bans[rows.license] = {
                ["id"] = rows.id,
                ["license"] = rows.license,
                ["reason"] = rows.reason,
                ["time"] = rows.time
            }
        end
        NCSInternal:startupStepAccomplished(NCSEnum.RequiredStartupSteps.LOAD_BANS)
    end)
end