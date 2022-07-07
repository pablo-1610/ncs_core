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
    self.job_grade = MOD_Jobs:get(self.job).grades[job_grade] and job_grade or MOD_Jobs:get(job).grades[1].nameGrade
    NCS:triggerClientEvent("jobChange", source, job, self.job_grade )
    return (self.job)
end