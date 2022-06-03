---addInput
---@param id string
---@param type string
---@param isRequired boolean
---@param label string
---@param placeholder string
function NCSAdaptiveCardBuilder:addInput(id, type, isRequired, label, placeholder)
    table.insert(self.payload.body, {
        type = type,
        id = id,
        isRequired = isRequired,
        label = label,
        placeholder = placeholder
    })
    return (self)
end