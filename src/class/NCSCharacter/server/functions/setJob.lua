---setJob
---@param self NCSCharacter
---@return string
---@public
function NCSCharacter:setJob(job)
    if not MOD_Jobs:exists(job) then
        return
    end
    self.job = job
    self.job_grade = MOD_Jobs:get(job).grades[1].nameGrade
    return (self.job)
end