NCS:registerNetEvent("receiveJobs", function(data)
    MOD_Jobs.list[data.name] = {
        name = data.name,
        label = data.label,
        grades = data.grades,
    }
end)