NCS:handleEvent("databaseReady", function()
    API_Database:query("SELECT * FROM ncs_jobs", {}, function(rows)
        if (#rows <= 0) then
            NCS:die("You must have at least one job in your database")
            return
        end
        
        for _, row in pairs(rows) do
            local tableForGrade = {}
            API_Database:query("SELECT * FROM ncs_jobs_grades WHERE name = ?", {row.name}, function(grades)
                for _, data in pairs(grades) do
                    if not tableForGrade[data.name] then
                        tableForGrade[data.name] = grades
                    end
                end
                local job = NCSJobs(row.name, row.label, tableForGrade[row.name])
                MOD_Jobs:set(row.name, row.label, tableForGrade[row.name])
            end)
        end
        NCS:triggerClientEvent("receiveJobs", -1, MOD_Jobs:getAll())
    end)
end)