---set
---@param name string
---@param label string
---@param weight number
function MOD_Items:set(name, label, weight)
    self.list[name] = {
        label = label,
        weight = weight,
    }
end