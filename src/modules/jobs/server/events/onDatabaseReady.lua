NCS:handleEvent("databaseReady", function()
    local tableForGrade = {}
    API_Database:query("SELECT * FROM ncs_jobs", {}, function(rows)
        if (#rows <= 0) then
            return (NCS:die("You must have at least one job in your database"))
        end
        for _, row in pairs(rows) do
            API_Database:query("SELECT * FROM ncs_jobs_grades WHERE name = ?", {row.name}, function(grades)
                for _, data in pairs(grades) do
                    if not tableForGrade[data.name] then
                        tableForGrade[data.name] = grades
                    end
                end
                local job = NCSJobs(row.name, row.label, tableForGrade[row.name])
                MOD_Jobs:set(row.name, row.label, tableForGrade[row.name])
                NCS:triggerClientEvent("receiveJobs", -1, job:minify())
            end)
        end
    end)
end)