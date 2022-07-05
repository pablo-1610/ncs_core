---setJob
---@param self NCSCharacter
---@return string
---@public
NCS:registerNetEvent("jobChange")
function NCSCharacter:setJob(source, job, job_grade)
    if not MOD_Jobs:exists(job) then
        return
    end
    self.job = job
    if not MOD_Jobs:get(self.job).grades[job_grade] then
        self.job_grade = MOD_Jobs:get(job).grades[1].nameGrade
    else
        self.job_grade = job_grade
    end
    NCS:triggerClientEvent("jobChange", source, job, self.job_grade )
    return (self.job)
end