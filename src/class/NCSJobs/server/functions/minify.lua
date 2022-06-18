---minify
---@return table
---@public
---@param self NCSJobs
function NCSJobs.minify(self)
    return {
        name = self.name,
        label = self.label,
        grade = self.grades,
    }
end