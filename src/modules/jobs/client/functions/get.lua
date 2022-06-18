---getJob
---@param name string
---@return table
---@public
function MOD_Jobs:getJob(name)
    if (not (self.list[name])) then
        return NCS:die(("Job not found: %s"):format(name))
    end
    return self.list[name]
end