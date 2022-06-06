---set
---@param name string
---@param label string
---@param weight number
---@public
function MOD_Items:set(name, label, weight)
    self.list[name] = {
        label = label,
        weight = weight,
    }
end