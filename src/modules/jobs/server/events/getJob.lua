API_Callback:register("getPlayerJob", function(source)
    local job = MOD_Players:get(source).character:getJob()
    local jobGrade = MOD_Players:get(source).character:getJobGrade()
    return job, jobGrade
end)