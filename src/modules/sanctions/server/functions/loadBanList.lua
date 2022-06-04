---loadBanList
---return void
function MOD_Sanctions:loadBanList()
    API_Database:query("SELECT * FROM ncs_bans", {}, function(result)
        if (#result <= 0) then
            NCS.coreTrace(_,"No bans found in database.")
        else
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
            NCS.coreTrace(_,("%i Bans loaded from database."):format(#result))
        end
        NCSInternal:startupStepAccomplished(NCSEnum.RequiredStartupSteps.LOAD_BANS)
    end)
end