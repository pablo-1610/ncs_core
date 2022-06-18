---@field public name string
---@field public label string
---@field public grades table
---@class NCSJobs
NCSJobs = {}
NCSJobs.className = "NCSJobs"

local __instance = {
    __index = NCSJobs,
}

setmetatable(NCSJobs, {
    __call = function(_, name, label, grades)
        local self = setmetatable({}, __instance)

        self.name = name
        self.label = label
        self.grades = grades
        self.export = function()
            return (API_Tables:exportMetatable(self, function(job)
                return (MOD_Jobs:get(job.name))
            end))
        end

        API_Tables:exportMetatable(NCSJobs, self)

        return (self)
    end
})