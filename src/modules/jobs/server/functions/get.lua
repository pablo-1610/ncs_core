---get
---@param name string
---@return NCSJobs
---@public
function MOD_Jobs:get(name)
    return (self.list[name])
end