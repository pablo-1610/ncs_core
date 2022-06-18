NCS:handleEvent("playerNowInGame", function(_src)
    API_Database:query("SELECT * FROM ncs_jobs_grades LEFT JOIN ncs_jobs ON ncs_jobs_grades.name COLLATE utf8mb4_unicode_ci = ncs_jobs.name", {}, function(rows)
        if (#rows <= 0) then
            return (NCS:die("You must have at least one job in your database"))
        end
        for _, row in pairs(rows) do
            local job = NCSJobs(row.name, row.label, {
                name = row.nameGrade,
                label = row.label,
            })
            MOD_Jobs:set(row.name, row.label, {
                name = row.nameGrade,
                label = row.label,
            })
            NCS:triggerClientEvent("receiveJobs", _src, job:minify())
        end
    end)
end)