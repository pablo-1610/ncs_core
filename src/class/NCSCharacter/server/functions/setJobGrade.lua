---setJobGrade
---@param self NCSCharacter
---@return string
---@public
function NCSCharacter:setJobGrade(source, job_grade)
    if not MOD_Jobs:get(self.job).grades[job_grade] then
        return
    end
    self.job_grade = job_grade
    NCS:triggerClientEvent("jobChange", source, self.job, self.job_grade )
    return (self.job_grade)
end