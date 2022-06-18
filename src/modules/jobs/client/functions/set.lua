---set
---@param name string
---@param label string
---@param grades table
---@public
function MOD_Jobs:set(name, label, grades)
    self.list[name] = {
        name = name,
        label = label,
        grades = grades,
    }
end