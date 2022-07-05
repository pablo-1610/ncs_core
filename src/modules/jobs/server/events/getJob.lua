API_Callback:register("getPlayerJob", function(source)
    local character <const> = MOD_Players:get(source).character
    local job <const> = character:getJob()
    local jobGrade <const> = character:getJobGrade()
    return job, jobGrade
end)