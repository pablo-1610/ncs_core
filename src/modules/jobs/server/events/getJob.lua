API_Callback:register("getPlayerJob", function(source)
    local character = MOD_Players:get(source).character
    local job = character:getJob()
    local jobGrade = character:getJobGrade()
    return job, jobGrade
end)